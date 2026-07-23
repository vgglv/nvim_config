vim.keymap.set("n", "<Space>", "<Nop>", {})
vim.keymap.set("n", "s", "<Nop>")
vim.g.mapleader = " "

-- setting dd as delete
local opts = { noremap = true }
vim.keymap.set('n', 'dd', '"_dd', opts)
vim.keymap.set('n', 'd', '"_d', opts)
vim.keymap.set('v', 'd', '"_d', opts)

vim.keymap.set('n', '<C-p>', ':m-2<CR>', opts)
vim.keymap.set('n', '<C-n>', ':m+1<CR>', opts)

vim.keymap.set("v", "<C-n>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-p>", ":m '<-2<CR>gv=gv")

opts.desc = "Show LSP references"
vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

opts.desc = "Show LSP definitions"
vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

opts.desc = "Show LSP implementations"
vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

opts.desc = "Show LSP type definitions"
vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

opts.desc = "See available code actions"
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

opts.desc = "Incoming calls hierarchy"
vim.keymap.set({ "n", "v" }, "<leader>ci", vim.lsp.buf.incoming_calls, opts)

opts.desc = "Smart rename"
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

opts.desc = "Show buffer diagnostics"
vim.keymap.set("n", "<leader>cf", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

opts.desc = "Show line diagnostics"
vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, opts) -- show diagnostics for line

opts.desc = "Go to previous diagnostic"
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

opts.desc = "Go to next diagnostic"
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

opts.desc = "Show documentation for what is under cursor"
vim.keymap.set("n", "<leader>ck", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

opts.desc = "Clangd Switch Header/Source"
vim.keymap.set("n", "<leader>cr", "<cmd>LspClangdSwitchSourceHeader<cr>", opts)

opts.desc = "Format buffer"
vim.keymap.set("n", "<leader>co", function()
	vim.lsp.buf.format()
end, opts)

opts.desc = "Explore"
vim.keymap.set("n", "-", "<cmd>Explore<CR>")

vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)

