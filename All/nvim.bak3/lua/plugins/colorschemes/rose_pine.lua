return {
	"rose-pine/neovim",
	enabled = require("plugins.controller").colorscheme.rose_pine,
	name = "Rose pine",
	lazy = false,
	priority = 1000,
	cmd = { "Colorscheme rose-pine" },
	opts = {
		variant = "main",
	},
	config = function(_, opts)
		vim.cmd("colorscheme rose-pine")
	end,
}
