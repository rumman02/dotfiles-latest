local windows = require("windows")
local utils = require("rumman.lib.utils")

windows.setup({
	autowidth = {
		enable = false,
	},
	ignore = {
		buftype = {
			"terminal",
			"snacks_terminal",
		},
		filetype = {
			"NvimTree",
			"neo-tree",
			"undotree",
			"gundo",
		},
	},
	animation = {
		fps = utils.refresh_rate,
	},
})

