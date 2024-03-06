vim.keymap.set("n", "<Space>", "<Nop>", {})
vim.keymap.set("n", "s", "<Nop>")
vim.g.mapleader = " " -- my mapleader is a space button

-- setting dd as delete
local opts = { noremap = true, silent = true }
vim.keymap.set('n', 'dd', '"_dd', opts)
vim.keymap.set('n', 'd', '"_d', opts)
vim.keymap.set('v', 'd', '"_d', opts)

vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)
vim.keymap.set('n', '<C-k>', ':m-2<CR>', opts)
vim.keymap.set('n', '<C-j>', ':m+1<CR>', opts)

vim.api.nvim_set_keymap('n', '<C-b>', '<Cmd>NvimTreeToggle<CR>', opts)

vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")
