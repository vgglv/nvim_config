vim.keymap.set("n", "<Space>", "<Nop>", {})
vim.keymap.set("n", "s", "<Nop>")
vim.g.mapleader = " " -- my mapleader is a space button

-- setting dd as delete
local opts = { noremap = true, silent = true }
vim.keymap.set('n', 'dd', '"_dd', opts)
vim.keymap.set('n', 'd', '"_d', opts)
vim.keymap.set('v', 'd', '"_d', opts)
vim.api.nvim_set_keymap('n', '<C-b>', '<Cmd>Neotree toggle<CR>', opts)

vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)

vim.keymap.set('n', '<C-p>', ':m-2<CR>', opts)
vim.keymap.set('n', '<C-n>', ':m+1<CR>', opts)

vim.keymap.set("v", "<C-n>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-p>", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "-", "<Cmd>Rex<CR>", opts)
