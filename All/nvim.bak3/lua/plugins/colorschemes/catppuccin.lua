return {
	"catppuccin/nvim",
	enabled = require("plugins.controller").colorscheme.catppuccin,
	name = "Catppuccin",
	lazy = false,
	priority = 1000,
	cmd = { "Colorscheme catppuccin" },
	opts = {},
	config = function()
		vim.cmd("colorscheme catppuccin")
	end,
}
