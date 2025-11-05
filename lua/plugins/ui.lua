return {
	{ -- this stuff changes select and input to a floating windows
		"stevearc/dressing.nvim",
		lazy = true,
		enabled = true,
		init = function()
			vim.ui.select = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.select(...)
			end
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.input = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.input(...)
			end
		end
	},
	{ -- this shows a status bar at the bottom of editor
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require('lualine').setup({
				options = {
					icons_enabled = true,
					theme = 'tokyonight'
				},
				sections = {
					lualine_a = { 'mode' },
					lualine_b = { 'diagnostics' },
					lualine_c = { { 'filename', path = 1 } },
					lualine_x = { 'filetype' },
					lualine_y = {},
					lualine_z = { 'location' }
				}
			})
		end,
	}
}
