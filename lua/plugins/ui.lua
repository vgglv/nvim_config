
return {
	{ -- this stuff changes select and input to a floating windows
		"stevearc/dressing.nvim",
		lazy = true,
		enabled = true,
		init = function()
			vim.ui.select = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.select(...)
			end
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.input = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.input(...)
			end
		end
	},
	{ -- this stuff highlights indentation lines
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			indent = {
				char = "│",
				tab_char = "│",
			},
			scope = { enabled = false },
			exclude = {
				filetypes = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
			},
		},
		main = "ibl",
	},
	{ -- this shows a status bar at the bottom of editor
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = true,
		options = {
			theme = 'gruvbox'
		}
	},
	{ -- this highlights all the similar texts inside an editor
		"RRethy/vim-illuminate",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			delay = 200,
			large_file_cutoff = 2000,
			large_file_overrides = {
				providers = { "lsp" },
			},
		},
		config = function(_, opts)
			require("illuminate").configure(opts)

			local function map(key, dir, buffer)
				vim.keymap.set("n", key, function()
					require("illuminate")["goto_" .. dir .. "_reference"](false)
				end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
			end

			map("]]", "next")
			map("[[", "prev")

			-- also set it after loading ftplugins, since a lot overwrite [[ and ]]
			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					local buffer = vim.api.nvim_get_current_buf()
					map("]]", "next", buffer)
					map("[[", "prev", buffer)
				end,
			})
		end,
		keys = {
			{ "]]", desc = "Next Reference" },
			{ "[[", desc = "Prev Reference" },
		},
	},
--	{
--		"folke/which-key.nvim",
--		event = "VeryLazy",
--		enabled = true,
--		init = function()
--			vim.o.timeout = true
--			vim.o.timeoutlen = 300
--		end,
--		opts = {
--			-- your configuration comes here
--			-- or leave it empty to use the default settings
--			-- refer to the configuration section below
--		}
--	},
--	{
--		"rcarriga/nvim-notify",
--		enabled = false,
--		opts = {
--			timeout = 3000,
--			max_height = function()
--				return math.floor(vim.o.lines * 0.75)
--			end,
--			max_width = function()
--				return math.floor(vim.o.columns * 0.75)
--			end,
--			on_open = function(win)
--				vim.api.nvim_win_set_config(win, { zindex = 100 })
--			end,
--		}
--	},
--	{
--		"folke/noice.nvim",
--		event = "VeryLazy",
--		enabled = false,
--		opts = {
--			lsp = {
--				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
--				override = {
--					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
--					["vim.lsp.util.stylize_markdown"] = true,
--					["cmp.entry.get_documentation"] = true,
--				},
--			},
--			-- you can enable a preset for easier configuration
--			presets = {
--				bottom_search = true, -- use a classic bottom cmdline for search
--				command_palette = true, -- position the cmdline and popupmenu together
--				long_message_to_split = true, -- long messages will be sent to a split
--				inc_rename = false, -- enables an input dialog for inc-rename.nvim
--				lsp_doc_border = false, -- add a border to hover docs and signature help
--			},
--		},
--		dependencies = {
--			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
--			"MunifTanjim/nui.nvim",
--			-- OPTIONAL:
--			--   `nvim-notify` is only needed, if you want to use the notification view.
--			--   If not available, we use `mini` as the fallback
--			"rcarriga/nvim-notify",
--		}
--	}
}
