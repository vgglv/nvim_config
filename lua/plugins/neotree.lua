local neotree = require("neo-tree")
neotree.setup({
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
		position = "right",
		--position = "left", -- left, right, top, bottom, float, current
		mapping_options = {
			noremap = true,
			nowait = true
		},
	},
})
vim.keymap.set("n", "<C-b>", "<Cmd>Neotree toggle<CR>", { noremap = true })
vim.keymap.set("n", "-", "<Cmd>Neotree position=current reveal_file=%:p<CR>", { noremap = true })
