return {
	"echasnovski/mini.icons",
	enabled = require("plugins.controller").mini.icons,
	priority = 999,
	version = false,
	event = {
		"VeryLazy",
	},
	dependencies = {
		{
			"nvim-tree/nvim-web-devicons",
			opts = {},
		},
	},
	init = function()
		package.preload["nvim-web-devicons"] = function()
			require("mini.icons").mock_nvim_web_devicons()
			return package.loaded["nvim-web-devicons"]
		end
	end,
	opts = {},
}
