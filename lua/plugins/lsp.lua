
local keymap = vim.keymap -- for conciseness
local opts = { noremap = true, silent = true }
local on_attach = function(client, bufnr)
	opts.buffer = bufnr

	-- set keybinds
	opts.desc = "Show LSP references"
	keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

	opts.desc = "Go to declaration"
	keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

	opts.desc = "Show LSP definitions"
	keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

	opts.desc = "Show LSP implementations"
	keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

	opts.desc = "Show LSP type definitions"
	keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

	opts.desc = "See available code actions"
	keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

	opts.desc = "Smart rename"
	keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

	opts.desc = "Show buffer diagnostics"
	keymap.set("n", "<leader>cf", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

	opts.desc = "Show line diagnostics"
	keymap.set("n", "<leader>cd", vim.diagnostic.open_float, opts) -- show diagnostics for line

	opts.desc = "Go to previous diagnostic"
	keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

	opts.desc = "Go to next diagnostic"
	keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

	opts.desc = "Show documentation for what is under cursor"
	keymap.set("n", "<leader>ck", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

	opts.desc = "Clangd Switch Header/Source"
	keymap.set("n", "<leader>cr", "<cmd>ClangdSwitchSourceHeader<cr>", opts)
end

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/nvim-cmp",
			"williamboman/mason-lspconfig.nvim",
			"williamboman/mason.nvim",
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
			"hrsh7th/cmp-buffer", -- source for text in buffer
			"hrsh7th/cmp-path", -- source for file system paths
			"L3MON4D3/LuaSnip", -- snippet engine
			"saadparwaiz1/cmp_luasnip", -- for autocompletion
			"j-hui/fidget.nvim", -- for lsp info at the bottom screen
		},
		config = function()
			require("mason").setup({})
			require("fidget").setup({})
			-- import mason-lspconfig
			require("mason-lspconfig").setup({
				-- list of servers for mason to install
				ensure_installed = {
					"lua_ls",
					"clangd"
				},
				-- auto-install configured servers (with lspconfig)
				automatic_installation = true, -- not the same as ensure_installed
				handlers = {
					function(server_name) -- default handler (optional)
						local capabilities = require("cmp_nvim_lsp").default_capabilities()
						require("lspconfig")[server_name].setup {
							on_attach = on_attach,
							capabilities = capabilities
						}
					end,

					["lua_ls"] = function()
						local capabilities = require("cmp_nvim_lsp").default_capabilities()
						require("lspconfig").lua_ls.setup {
							capabilities = capabilities,
							on_attach = on_attach,
							settings = {
								Lua = {
									diagnostics = {
										globals = { "vim"},
									},
									workspace = {
										-- make language server aware of runtime files
										library = {
											[vim.fn.expand("$VIMRUNTIME/lua")] = true,
											[vim.fn.stdpath("config") .. "/lua"] = true,
										},
									}
								}
							}
						}
					end,
				}
			})

			local cmp = require("cmp")
			local luasnip = require("luasnip")
			cmp.setup({
				snippet = { -- configure how nvim-cmp interacts with snippet engine
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
				},
				mapping = cmp.mapping.preset.insert({
					['<Tab>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							local entry = cmp.get_selected_entry()
							if not entry then
								cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
							else
								cmp.confirm()
							end
						else
							fallback()
						end
					end, {"i", "s", "c",}),
				}),
				-- sources for autocompletion
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- snippets
					{ name = "buffer" }, -- text within current buffer
					{ name = "path" }, -- file system paths
				})
			})
		end,
	}
}
