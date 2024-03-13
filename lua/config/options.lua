-- turn off backups, swaps, etc
vim.o.swapfile = false
vim.bo.swapfile = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.autoread = true

-- 8 lines away from margin
vim.o.scrolloff = 8

-- indent guides
vim.o.tabstop = 4 -- maximum width of tab character (measured in spaces)
vim.bo.tabstop = 4
vim.o.shiftwidth = 4 	    -- size of indent (measured in spaces), should equal tabstop
vim.bo.shiftwidth = 4
vim.o.softtabstop = 4 	  -- should be the same as the other two above
vim.bo.softtabstop = 4
vim.o.expandtab = false    -- expand tabs to spaces
vim.bo.expandtab = false   -- expand tabs to spaces
vim.o.smartindent = true  -- smart indenting on new line for C-like programs
vim.bo.smartindent = true
vim.o.autoindent = true   -- copy the indentation from previous line
vim.bo.autoindent = true
vim.o.smarttab = true 	  -- tab infront of a line inserts blanks based on shiftwidth

-- show line numbers
vim.wo.number = true

vim.o.ignorecase = true -- Ignorecase when searching
vim.o.incsearch = true	-- start searching on each keystroke
vim.o.smartcase = true	-- ignore case when lowercase, match case when capital case is used
vim.o.hlsearch = true		-- highlight the search results

-- Copy paste between vim and everything else
vim.o.clipboard = "unnamedplus"

vim.opt.listchars = {
	eol = '⤶',
	trail = '✚',
	extends = '◀',
	precedes = '▶',
	tab = '>~'
}
vim.opt.list = true
vim.opt.termguicolors = true

vim.g.netrw_sort_by="name"
vim.g.netrw_sort_sequence='[\\/]$,\\<core\\%(\\.\\d\\+\\)\\=\\>'
vim.g.netrw_browse_split = 0
vim.g.netrw_keepdir = 0
