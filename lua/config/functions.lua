local M = {}

local build_dir = "build"

local function cmake_build()
  local cmd = string.format("cmake --build %s", build_dir)
  vim.cmd("echo 'Building project...'")
  vim.fn.jobstart(cmd, {
    stdout_buffered = true,
    stderr_buffered = true,
    on_stdout = function(_, data)
      if data then
        vim.api.nvim_echo({{table.concat(data, "\n"), "Normal"}}, false, {})
      end
    end,
    on_stderr = function(_, data)
      if data then
        vim.api.nvim_echo({{table.concat(data, "\n"), "ErrorMsg"}}, false, {})
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
	vim.api.nvim_create_user_command("Cmakebuild", cmake_build, { desc = "cmake build" })
end

return M
