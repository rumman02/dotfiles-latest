local indent_blankline = require("ibl")
local icons = require("rumman.lib.icons")

indent_blankline.setup({
	indent = {
		char = icons.ui.BorderLeft,
	},
	scope = {
		show_start = false,
		show_end = false,
		include = {
			node_type = { ["*"] = { "*" } },
		},
	},
})

local indentscope = require("mini.indentscope")

indentscope.setup({
	symbol = icons.ui.BorderLeft,
})

