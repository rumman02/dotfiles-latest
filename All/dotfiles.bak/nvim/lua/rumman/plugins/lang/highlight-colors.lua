local nvim_highlight_colors = require("nvim-highlight-colors")

nvim_highlight_colors.setup({
	exclude_filetypes = {
		"noice",
		"notify",
		"Telescope",
		"TelescopePrompt",
		"neo-tree",
	},
	render = "background",
	virtual_symbol = " ",
})

