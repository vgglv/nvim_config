vim.api.nvim_create_augroup("neotree", {})
vim.api.nvim_create_autocmd("BufEnter", {
	desc = "Open Neotree automatically",
	group = "neotree",
	callback = function()
		if vim.fn.argc() == 0 then
			vim.cmd "Neotree toggle"
		end
	end,
})
