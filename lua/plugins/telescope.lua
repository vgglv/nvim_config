return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "truncate " },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
		})

		telescope.load_extension("fzf")
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<Leader>sf', builtin.find_files, {noremap=true})
		vim.keymap.set('n', '<Leader>sg', builtin.live_grep, {noremap=true})
		vim.keymap.set('n', '<Leader><Leader>', builtin.buffers, {noremap=true})
	end,
}
