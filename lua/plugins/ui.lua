local lualine = require('lualine')

lualine.setup({
	options = {
		icons_enabled = true,
		theme = 'auto'
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'diagnostics' },
		lualine_c = { { 'filename', path = 1 } },
		lualine_x = { 'filetype' },
		lualine_y = {},
		lualine_z = { 'location' }
	}
})

local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, {desc = "Add to harpoon", noremap = true})
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {desc = "Open Harpoon menu", noremap = true})
vim.keymap.set("n", "<C-[>", function() harpoon:list():prev() end, { noremap = true })
vim.keymap.set("n", "<C-]>", function() harpoon:list():next() end, { noremap = true })
