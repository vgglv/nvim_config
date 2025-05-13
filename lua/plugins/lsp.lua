local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

return {
    {
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
                    "clangd"
                },
                -- auto-install configured servers (with lspconfig)
                automatic_installation = true, -- not the same as ensure_installed
                automatic_enable = true,
            })

            local cmp = require("cmp")
            cmp.setup({
                mapping = {
                    ["<C-n>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<C-p>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<CR>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.confirm()
                            return
                        end
                        fallback()
                    end, {"i", "s"}),
                },
                -- sources for autocompletion
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "path" }, -- file system paths
                })
            })
        end,
    }
}
