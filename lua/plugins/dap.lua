return {
	{
		"mfussenegger/nvim-dap",
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		opts = {
			ensure_installed = { "codelldb" },
			handlers = {}
		}
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"nvim-neotest/nvim-nio",
		},
		event = "VeryLazy",
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dap.defaults.fallback.exception_breakpoints = {'raised'}
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
			vim.keymap.set("n", '<F5>', function() dap.continue() end)
			vim.keymap.set("n", '<F10>', function() dap.step_over() end)
			vim.keymap.set("n", '<F11>', function() dap.step_into() end)
			vim.keymap.set("n", '<shift><F11>', function() dap.step_out() end)
			vim.keymap.set("n", '<leader>b', function() dap.toggle_breakpoint() end)
			vim.keymap.set("n", '<leader>dq', function() dapui.toggle() end)
			vim.keymap.set("n", '<leader>do', function() dapui.open() end)
			vim.keymap.set("n", '<leader>dc', function() dapui.close() end)

			dap.configurations.c = dap.configurations.cpp
		end
	},
}
