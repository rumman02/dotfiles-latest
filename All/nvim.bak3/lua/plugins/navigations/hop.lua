return {
	"smoka7/hop.nvim",
	enabled = require("plugins.controller").navigations.hop,
	version = "*",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	keys = function()
		local keymap = require("plugins.navigations.keymap").hop_key
		return require("lib.functions").convertKeys(keymap)
	end,
	opts = {
		keys = "etovxqpdygfblzhckisuran",
		x_bias = 100,
		dim_unmatched = false,
		hint_type = "overlay",
		jump_on_sole_occurrence = false,
	},
}
