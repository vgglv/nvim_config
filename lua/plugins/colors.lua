return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require('rose-pine').setup({
				disable_background = true,
			})
			--vim.cmd("colorscheme rose-pine")
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
			vim.cmd("colorscheme vscode")
		end
	}
}
