-- turn off backups, swaps, etc
vim.o.swapfile = false
vim.bo.swapfile = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.autoread = true

local opt = vim.opt
opt.autoindent = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = false

-- show line numbers
vim.wo.number = true

vim.o.ignorecase = true -- Ignorecase when searching
vim.o.incsearch = true  -- start searching on each keystroke
vim.o.smartcase = true  -- ignore case when lowercase, match case when capital case is used
vim.o.hlsearch = true   -- highlight the search results

-- Copy paste between vim and everything else
vim.o.clipboard = "unnamedplus"

vim.opt.listchars = {
	--eol = '⤶',
	trail = '·',
	extends = '❯',
	precedes = '❮',
	tab = '→ ', -- pretty arrow with a space
}
vim.opt.list = true
vim.opt.termguicolors = true

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})
