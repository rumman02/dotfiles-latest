return {
	"dracula/vim",
	enabled = require("plugins.controller").colorscheme.dracula,
	name = "Dracula",
	lazy = false,
	priority = 1000,
	cmd = { "Colorscheme dracula" },
	opts = {},
	config = function(_, opts)
		require("dracula").setup(opts)
		vim.cmd("colorscheme dracula")
	end,
}
