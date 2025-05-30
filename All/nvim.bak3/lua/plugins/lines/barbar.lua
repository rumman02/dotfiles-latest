return {
	"romgrk/barbar.nvim",
	enabled = require("plugins.controller").lines.barbar,
	version = "^1.0.0", -- optional: only update when a new 1.x version is released
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	opts = {},
}
