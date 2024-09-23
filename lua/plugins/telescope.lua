return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release" },
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
		vim.keymap.set('n', '<Leader>sf', builtin.find_files, {noremap=true, desc = 'Search files'})
		vim.keymap.set('n', '<Leader>sg', builtin.live_grep, {noremap=true, desc = 'Live grep'})
		vim.keymap.set('n', '<Leader><Leader>', builtin.buffers, {noremap=true, desc = 'Buffers'})
		vim.keymap.set('n', '<Leader>sr', builtin.resume, {noremap=true, desc='Resume last picker'})
	end,
}
