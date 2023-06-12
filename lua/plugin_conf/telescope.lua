local builtin = require('telescope.builtin')
vim.keymap.set('n', '<Leader>sf', builtin.find_files, {noremap=true})
vim.keymap.set('n', '<Leader>sg', builtin.live_grep, {noremap=true})
vim.keymap.set('n', '<Leader><Leader>', builtin.buffers, {noremap=true})


require('telescope').setup {
	defaults = {
		file_ignore_patterns = {
			'build/.*'
		},
		display_path = true,
	}
}
