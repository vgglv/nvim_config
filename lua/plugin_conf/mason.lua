require("mason").setup()
require("mason-lspconfig").setup {
	ensure_installed = { "clangd", "lua_ls" }
}

require("lspconfig").clangd.setup {}
require("lspconfig").lua_ls.setup {}
