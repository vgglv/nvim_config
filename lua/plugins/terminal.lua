if vim.fn.has("win32") == 1 then
  vim.o.shell = "C:/Program Files/Git/bin/bash.exe"
  vim.o.shellcmdflag = "-s"
  vim.o.shellquote = ""
  vim.o.shellxquote = ""
end


require("toggleterm").setup({
	size = 20,
	open_mapping = "<C-\\>",
	direction = 'tab', -- vertical, horizontal, tab, float
	float_opts = {
		border = 'curved'
	}
})
