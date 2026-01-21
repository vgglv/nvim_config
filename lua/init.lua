
local plugins_list = {
	"https://github.com/sainnhe/gruvbox-material",
	"https://github.com/nvim-neo-tree/neo-tree.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/nvim-telescope/telescope-fzf-native.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/williamboman/mason-lspconfig.nvim",
	"https://github.com/williamboman/mason.nvim",
	"https://github.com/hrsh7th/nvim-cmp",
	"https://github.com/hrsh7th/cmp-nvim-lsp",
	"https://github.com/j-hui/fidget.nvim",
	{ src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
	"https://github.com/akinsho/toggleterm.nvim",
}
vim.pack.add(plugins_list)

require('plugins.ui')
require('plugins.terminal')
require('plugins.telescope')
require('plugins.neotree')
require('plugins.colors')
require('plugins.lsp')
require("custom.multigrep").setup()
require("custom.cmake")
