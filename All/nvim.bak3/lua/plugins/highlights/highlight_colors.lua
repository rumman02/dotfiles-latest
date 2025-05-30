-- highlight_colors
return {
	"brenoprata10/nvim-highlight-colors",
	enabled = require("plugins.controller").highlights.highlight_colors,
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	opts = {},
}
