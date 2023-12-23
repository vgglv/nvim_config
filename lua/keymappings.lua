vim.keymap.set("n", "<Space>", "<Nop>", {})
vim.keymap.set("n", "s", "<Nop>")
vim.g.mapleader = " " -- my mapleader is a space button

--some LSP functionale
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', 'dd', '"_dd', opts)
vim.api.nvim_set_keymap('n', 'd', '"_d', opts)
vim.api.nvim_set_keymap('v', 'd', '"_d', opts)
