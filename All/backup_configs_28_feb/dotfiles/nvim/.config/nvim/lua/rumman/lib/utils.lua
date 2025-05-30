local icons = require("rumman.lib.icons")

return {
	alphabets = {
		"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o",
		"p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
		"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O",
		"P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
	},
	colorscheme = "gruvbox",
	completeopt = {
		behavior = "menu,menuone,noinsert",
		min_width = 40,
		max_width = 40,
		max_height = 10,
		scrollbar = true,
	},
	indent_size = {
		editor = 2,
		explorer = 2,
	},
	initial_mode = "insert",
	refresh_rate = 120,
	numbers = {
		"1", "2", "3", "4", "5", "6", "7", "8", "9", "0",
	},
	symbols = {
		"~", "`", "!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "-", "_", "+",
		"+", "[", "{", "]", "}", "\\", "|", ";", ":", "'", '"', ",", "<", ".", ">",
		"/", "?", "%", "^", "&", "*", "(", ")", "-", "_", "+",
	},
	telescope = {
		layout_strategy = "flex",
		preview_cutoff = 40,
		preview_width = 0.40,
		prompt_prefix = "",
		prompt_title = "",
		prompt_position = "bottom",
		results_title = "Results",
		selection_caret = " ",
		sorting_strategy = "descending",
	},
	ui = {
		backdrop = 60,
		height = 0.8,
		title_position = "center",
		transparent = false,
		width = 0.7,
		window_blend = 0,
		spearator = {
			left = icons.ui.PowerlineLeftSlantedReversed,
			right = icons.ui.PowerlineRightSlantedReversed
		},
		border = {
			icons.ui.BorderTopLeft,
			icons.ui.BorderTop,
			icons.ui.BorderTopRight,
			icons.ui.BorderRight,
			icons.ui.BorderBottomRight,
			icons.ui.BorderBottom,
			icons.ui.BorderBottomLeft,
			icons.ui.BorderLeft,
		}
	},
}

