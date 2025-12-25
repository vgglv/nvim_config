return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"williamboman/mason.nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"j-hui/fidget.nvim", -- lsp info on the bottom
	},
	config = function()
		require("mason").setup({})
		require("fidget").setup({})
		-- import mason-lspconfig
		require("mason-lspconfig").setup({
			-- list of servers for mason to install
			ensure_installed = {
				"lua_ls",
				"clangd",
				"pyright"
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
			automatic_enable = true,
		})

		local cmp = require("cmp")
		local cmp_select = { behavior = cmp.SelectBehavior.Select }
		cmp.setup({
			mapping = {
				['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
				['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
				['<CR>'] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }
			}, { name = 'buffer' })

		})
	end
}
