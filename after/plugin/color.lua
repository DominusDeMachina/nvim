vim.opt.termguicolors = true
local nightfox = require('nightfox')

nightfox.setup({
	option = {
		styles = {
			comments = 'italic',
			keywords = 'bold',
			types = 'italic,bold',
		}
	}
})

vim.cmd.colorscheme('nightfox')
