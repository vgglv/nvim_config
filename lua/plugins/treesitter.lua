return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost" },
	build = ':TSUpdate',
	opts = {
		ensure_installed = { 'c', 'cpp', 'lua', 'vim', 'go' },
		sync_install = false,
		auto_install = true,
		highlight = {
			enable = true
		},
		modules = {},
		ignore_install = {},
		indent = { enable = false }
	},
	config = function(_, opts)
		require('nvim-treesitter.configs').setup(opts)
	end,
}
