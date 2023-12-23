
local packer = require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	-- main theme:
	use 'Mofiqul/dracula.nvim'

	-- for code highlighting:
	use 'nvim-treesitter/nvim-treesitter'

	-- for async lua code (coroutines) required by many
	use "nvim-lua/plenary.nvim"

	-- fuzzy finder, grep, find etc. (better with ripgrep and fd)
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		requires = {
			{'nvim-lua/plenary.nvim'}
		}
	}

	-- ui bar at the bottom of neovim
	use 'glepnir/galaxyline.nvim'

	-- used by nvim-tree and barbar, just an icons for stuff
	use 'nvim-tree/nvim-web-devicons'

	-- ui filesystem
	use {
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function() require'nvim-tree'.setup {} end
  	}

	-- required by barbar, and inside of buffers, to show git changes
	use 'lewis6991/gitsigns.nvim'

	-- ui buffers shows as tab at the top of nvim
	use 'romgrk/barbar.nvim'

	-- shows ui guidelines for indents
	use 'lukas-reineke/indent-blankline.nvim'

	-- highlight same text when hovered over
	use 'RRethy/vim-illuminate'

	-- main container of DAP, lsp
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig"
	}

	-- code completions
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'

	-- terminal inside of nvim
	use {
		'akinsho/toggleterm.nvim',
		tag = '*'
	}
end)

return packer
