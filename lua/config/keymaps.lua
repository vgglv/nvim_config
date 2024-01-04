vim.keymap.set("n", "<Space>", "<Nop>", {})
vim.keymap.set("n", "s", "<Nop>")
vim.g.mapleader = " " -- my mapleader is a space button

-- setting dd as delete
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', 'dd', '"_dd', opts)
vim.api.nvim_set_keymap('n', 'd', '"_d', opts)
vim.api.nvim_set_keymap('v', 'd', '"_d', opts)

-- toggle nvim tree
vim.api.nvim_set_keymap('n', '<C-b>', '<Cmd>NvimTreeToggle<CR>', opts)

-- nvim tree
vim.api.nvim_set_keymap('', '<M-Left>', '<Cmd>BufferPrevious<CR>', opts)
vim.api.nvim_set_keymap('', '<M-Right>', '<Cmd>BufferNext<CR>', opts)
