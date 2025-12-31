return {
	{ -- this shows a status bar at the bottom of editor
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require('lualine').setup({
				options = {
					icons_enabled = true,
					theme = 'auto'
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
