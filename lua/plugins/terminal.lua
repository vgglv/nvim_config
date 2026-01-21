local toggleterm = require('toggleterm')
toggleterm.setup({
	size = 20,
	open_mapping = "<C-\\>",
	direction = 'float',
	float_opts = {
		border = 'curved'
	},
--	shell = [[C:\Program Files\Git\bin\bash.exe]],
--	shellcmdflag = "-lc"
})
