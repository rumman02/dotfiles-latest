return {
	"dracula/vim",
	enabled = require("plugins.controller").colorscheme.dracula,
	name = "dracula",
	lazy = false,
	priority = 1000,
	cmd = { "Colorscheme dracula" },
	opts = {},
	config = function()
		vim.cmd("colorscheme dracula")
	end,
}
