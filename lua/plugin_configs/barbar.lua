local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap('', '<M-Left>', '<Cmd>BufferPrevious<CR>', opts)
vim.api.nvim_set_keymap('', '<M-Right>', '<Cmd>BufferNext<CR>', opts)
vim.api.nvim_set_keymap('', '<M-w>', '<Cmd>BufferClose<CR>', opts)
