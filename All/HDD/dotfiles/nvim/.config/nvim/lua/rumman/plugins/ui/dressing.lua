local dressing = require("dressing")

local icons = require("rumman.lib.icons")
local utils = require("rumman.lib.utils")

dressing.setup({
	title_pos = utils.ui.title_position,
	start_mode = utils.initial_mode,
	border = {
		icons.ui.BorderTopLeft,
		icons.ui.BorderTop,
		icons.ui.BorderTopRight,
		icons.ui.BorderRight,
		icons.ui.BorderBottomRight,
		icons.ui.BorderBottom,
		icons.ui.BorderBottomLeft,
		icons.ui.BorderLeft,
	},
	select = {
		nui = {
			border = {
				style = {
					icons.ui.BorderTopLeft,
					icons.ui.BorderTop,
					icons.ui.BorderTopRight,
					icons.ui.BorderRight,
					icons.ui.BorderBottomRight,
					icons.ui.BorderBottom,
					icons.ui.BorderBottomLeft,
					icons.ui.BorderLeft,
				},
			},
		},
		builtin = {
			border = {
				icons.ui.BorderTopLeft,
				icons.ui.BorderTop,
				icons.ui.BorderTopRight,
				icons.ui.BorderRight,
				icons.ui.BorderBottomRight,
				icons.ui.BorderBottom,
				icons.ui.BorderBottomLeft,
				icons.ui.BorderLeft,
			},
		},
	},
})

