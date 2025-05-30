return {
	"romgrk/barbar.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	version = "^1.0.0", -- optional: only update when a new 1.x version is released
	config = function ()
		local barbar = require("barbar")
		barbar.setup({
			icons = {
				button = false,
				-- separator_at_end = false,
			}
		})
	end
}
