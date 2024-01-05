return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	config = function()
		local bufferline = require('bufferline')
		bufferline.setup {
			options = {
				mode = "buffers",
				separator_style = "slant",
				diagnostics = "nvim_lsp",
				always_show_bufferline = false,
				diagnostics_indicator = function(_, _, diag)
					local icons = require("lazyvim.config").icons.diagnostics
					local ret = (diag.error and icons.Error .. diag.error .. " " or "")
					.. (diag.warning and icons.Warn .. diag.warning or "")
					return vim.trim(ret)
				end,
			}
		}
		vim.keymap.set('n', '<C-l>', "<Cmd>BufferLineCycleNext<CR>", {noremap=true, desc = 'Res'})
		vim.keymap.set('n', '<C-h>', "<Cmd>BufferLineCyclePrev<CR>", {noremap=true, desc = 'Res'})
	end
}
