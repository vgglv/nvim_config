return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require('rose-pine').setup({
				disable_background = true,
				styles = {
					italic = true,
					bold = true,
					transparency = true
				}
			})
			--vim.cmd.colorscheme "rose-pine"
		end
	},
	{
		"Mofiqul/vscode.nvim",
		name = "vscode",
		config = function()
			require('vscode').setup({
				transparent = true,
				italic_comments = false,
				group_overrides = {
					NeoTreeDimText = { bg = "NONE" },
				},
			})
			--vim.cmd.colorscheme "vscode"
		end
	},
	{
		"sainnhe/gruvbox-material",
		config = function()
			vim.g.gruvbox_material_foreground = 'original' -- [material,mix,original]
			vim.g.gruvbox_material_enable_italic = true
			vim.g.gruvbox_material_enable_bold = true
			vim.g.gruvbox_material_background = 'medium' -- [soft, hard, medium]
			vim.g.gruvbox_material_transparent_background = 0 -- 0,1,2

			vim.cmd.colorscheme "gruvbox-material"
		end
	}
}
