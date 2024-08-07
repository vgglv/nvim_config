return {
	"ThePrimeagen/harpoon",
	branch="harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim"
	},
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, {desc = "Add to harpoon", noremap = true})
		vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {desc = "Open Harpoon menu", noremap = true})
		vim.keymap.set("n", "<C-[>", function()
			harpoon:list():prev()
		end, { noremap = true })
		vim.keymap.set("n", "<C-]>", function()
			harpoon:list():next()
		end, { noremap = true })
	end
}
