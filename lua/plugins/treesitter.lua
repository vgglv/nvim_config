return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ':TSUpdate',
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	config = function ()
		require('nvim-treesitter.configs').setup({
			ensure_installed = { 'c', 'cpp', 'lua', 'vim' },
			sync_install = false,
			auto_install = true,
			--highlight = {
			--	enable = false
			--}
		})
	end,
}
