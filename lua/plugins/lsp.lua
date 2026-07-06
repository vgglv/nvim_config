require("mason").setup({})
require("fidget").setup({})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim" } },
			workspace = {
				library = {
					[vim.fn.expand "$VIMRUNTIME/lua"] = true,
					[vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
					[vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
					[vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
					[vim.fn.expand "${3rd}/love2d/library"] = true,
				}
			},
			telemetry = { enable = false },
		},
	},
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

require("mason-lspconfig").setup({
	automatic_enable = true,
})
