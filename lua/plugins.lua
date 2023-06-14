
local packer = require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'drewtempelmeyer/palenight.vim'
	use 'folke/tokyonight.nvim'
	use 'nvim-treesitter/nvim-treesitter'
	use "nvim-lua/plenary.nvim"
	use {
  		'nvim-telescope/telescope.nvim', tag = '0.1.1',
  		requires = { 
			{'nvim-lua/plenary.nvim'} 
		}
	}
	use 'glepnir/galaxyline.nvim'
	use 'mhinz/vim-startify'
	use {
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function() require'nvim-tree'.setup {} end
  	}
	use 'nvim-tree/nvim-web-devicons'
	use 'lewis6991/gitsigns.nvim' 
	use 'romgrk/barbar.nvim'
	use 'lukas-reineke/indent-blankline.nvim'
	use 'RRethy/vim-illuminate'
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		run = ":MasonUpdate"
	}
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/vim-vsnip'
end)

require('plugin_conf/telescope')
require('plugin_conf/galaxyline')
require('plugin_conf/nvim-tree')
require('plugin_conf/barbar')
require('plugin_conf/mason')
require('plugin_conf/cmp')

return packer
