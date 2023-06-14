require("mason").setup()
require("mason-lspconfig").setup {
	ensure_installed = { "clangd", "lua_ls" }
}

require("mason-lspconfig").setup_handlers {
	function(server_name)
		require("lspconfig")[server_name].setup {}
	end
}
