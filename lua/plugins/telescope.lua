return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		telescope.setup({
			defaults = require("telescope.themes").get_ivy({}),
			extensions = {
				fzf = {}
			}
		})
		telescope.load_extension("fzf")

		local builtin = require('telescope.builtin')
		vim.keymap.set("n", "<Leader>sf", builtin.find_files)
		vim.keymap.set("n", "<Leader>sr", builtin.resume)
		vim.keymap.set("n", "<Leader><Leader>", builtin.buffers)

		require("config.telescope.multigrep").setup()
	end,
}
