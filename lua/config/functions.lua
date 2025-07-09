local M = {}

local function get_project_root()
	local root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
	if vim.v.shell_error ~= 0 or not root or root == "" then
		return vim.fn.getcwd()
	end
	return root
end

function M.cmake_build()
	local build_dir = get_project_root() .. "/build"
	local cmd = string.format("cmake --build %s", build_dir)
	vim.cmd("echo 'Building project...'")
	vim.fn.jobstart(cmd, {
		stdout_buffered = true,
		stderr_buffered = true,
		on_stdout = function(_, data)
			if data then
				vim.api.nvim_echo({ { table.concat(data, "\n"), "Normal" } }, false, {})
			end
		end,
		on_stderr = function(_, data)
			if data then
				vim.api.nvim_echo({ { table.concat(data, "\n"), "ErrorMsg" } }, false, {})
			end
		end,
		on_exit = function(_, code)
			if code == 0 then
				vim.notify("Build completed successfully!", vim.log.levels.INFO)
			else
				vim.notify("Build failed!", vim.log.levels.ERROR)
			end
		end
	})
end

M.setup = function()
	vim.keymap.set("n", "<leader>csb", function()
		M.cmake_build()
	end, opts)
end

return M
