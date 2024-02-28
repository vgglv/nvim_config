local function on_attach(bufnr)
	local api = require('nvim-tree.api')

	local function opts(desc)
		return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
	vim.keymap.set('n', '<Tab>', api.node.open.preview, opts('Open Preview'))
	vim.keymap.set('n', 'R', api.tree.reload, opts('Refresh'))
	vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
	vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
	vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
	vim.keymap.set('n', 'x', api.fs.cut, opts('Cut'))
	vim.keymap.set('n', 'y', api.fs.copy.node, opts('Copy'))
	vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
	vim.keymap.set('n', '<', api.tree.change_root_to_parent, opts('Up'))
	vim.keymap.set('n', 'q', api.tree.close, opts('Close'))
end

return {
	"nvim-tree/nvim-tree.lua",
	opts = {
		disable_netrw       = true,
		hijack_netrw        = true,
		open_on_tab         = false,
		hijack_cursor       = false,
		update_cwd          = false,
		diagnostics = {
			enable = false,
			icons = {
				hint = "",
				info = "",
				warning = "",
				error = "",
			}
		},
		update_focused_file = {
			enable      = true,
			update_cwd  = true,
			ignore_list = {}
		},
		system_open = {
			cmd  = nil,
			args = {}
		},
		filters = {
			dotfiles = false,
			custom = {},
			git_ignored = false
		},
		view = {
			width = 40,
			side = 'left',
		},
		on_attach = on_attach
	}
}
