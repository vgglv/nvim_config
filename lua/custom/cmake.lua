local function scroll_to_bottom(buf)
	local win = vim.fn.bufwinid(buf)
	if win ~= -1 then
		vim.api.nvim_win_set_cursor(win, { vim.api.nvim_buf_line_count(buf), 0 })
	end
end

local function run_in_buffer(cmd)
	-- create scratch buffer
	local buf = vim.api.nvim_create_buf(false, true) -- listed = false, scratch = true
	vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")

	-- open buffer in a split
	vim.cmd("botright vsplit 20")
	vim.api.nvim_win_set_buf(0, buf)

	-- write header
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, { "$ " .. table.concat(cmd, " "), "" })

	-- start async job
	local job_id = vim.fn.jobstart(cmd, {
		stdout_buffered = false,
		stderr_buffered = false,

		on_stdout = function(_, data)
			if data then
				vim.api.nvim_buf_set_lines(buf, -1, -1, false, data)
				scroll_to_bottom(buf)
			end
		end,

		on_stderr = function(_, data)
			if data then
				vim.api.nvim_buf_set_lines(buf, -1, -1, false, data)
				scroll_to_bottom(buf)
			end
		end,

		on_exit = function(_, code)
			vim.api.nvim_buf_set_lines(buf, -1, -1, false, { "", "[Process exited: " .. code .. "]" })
			scroll_to_bottom(buf)
		end,
	})

	return job_id
end

vim.api.nvim_create_user_command("CMakeConf", function()
	run_in_buffer({
		"cmake",
		"-DCMAKE_BUILD_TYPE=Debug",
		"-DCMAKE_EXPORT_COMPILE_COMMANDS=True",
		"-S", vim.fn.getcwd(),
		"-B", vim.fn.getcwd() .. "/build",
		"-G", "Ninja"
	})
end, {})

vim.api.nvim_create_user_command("CMakeBuild", function()
	run_in_buffer({
		"cmake",
		"--build",
		"build",
	})
end, {})

local function get_cmake_targets()
	local handle = io.popen(
		"cmake --build build --target help 2>/dev/null"
	)

	if not handle then
		return {}
	end

	local result = handle:read("*a")
	handle:close()

	local targets = {}

	for line in result:gmatch("[^\r\n]+") do
		local target = line:match("%.%.%.%s+([%w%-%._]+)$")
		if target then
			table.insert(targets, target)
		end
	end

	table.sort(targets)
	return targets
end

vim.api.nvim_create_user_command("CMakeRun", function()
	local targets = get_cmake_targets()

	vim.ui.select(targets, {
		prompt = "Select executable:",
	}, function(choice)
		if not choice then
			return
		end

		run_in_buffer({
			"cmake",
			"--build",
			"build",
			"--target",
			choice,
		})
	end)
end, {})

vim.keymap.set("n", "<Leader>bc", "<cmd>CMakeConf<CR>")
vim.keymap.set("n", "<Leader>bb", "<cmd>CMakeBuild<CR>")
vim.keymap.set("n", "<Leader>br", "<cmd>CMakeRun<CR>")
