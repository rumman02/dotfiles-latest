return {
	"folke/tokyonight.nvim",
	enabled = require("plugins.controller").colorscheme.tokyonight,
	lazy = false,
	priority = 1000,
	cmd = { "Colorscheme tokyonight" },
	opts = {
		style = "night",
	},
	config = function(_, opts)
		require("tokyonight").setup(opts)
		vim.cmd("colorscheme tokyonight")
	end,
}
