--return {
--    "catppuccin/nvim",
--    name = "catppuccin",
--    priority = 1000,
--    config = function(opts)
--        vim.cmd.colorscheme("catppuccin-latte")
--    end
--}
return {
	"Mofiqul/vscode.nvim",
	config = function()
		require("vscode").setup({
			style = "light",
			transparent = false,
			italic_comments = true,
			
			color_overrides = {
				vscLineNumber = "#CCCCCC"
			},
		})
		require("vscode").load()
	end,
	priority = 1000,
}
