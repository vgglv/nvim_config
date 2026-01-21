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

vim.api.nvim_create_user_command("CMakeConfigure", function()
  run_in_buffer({
    "cmake",
    "-DCMAKE_EXPORT_COMPILE_COMMANDS=true",
    "-DCMAKE_BUILD_TYPE=Debug",
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
