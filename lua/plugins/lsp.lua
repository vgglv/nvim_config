require("mason").setup({})
require("fidget").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"clangd"
	},
	automatic_installation = true,
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
