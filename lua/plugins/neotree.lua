return {
	"nvim-neo-tree/neo-tree.nvim",
	enabled = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_hidden = false
				},
				follow_current_file = {
					enabled = true
				},
				hijack_netrw_behavior = "open_current"
			},
			window = {
				position = "right"
			}
		})
		vim.keymap.set("n", "<C-b>", "<Cmd>Neotree toggle<CR>", { noremap = true })
		vim.keymap.set("n", "-", "<Cmd>Neotree position=current reveal_file=%:p<CR>", { noremap = true })
	end
}
