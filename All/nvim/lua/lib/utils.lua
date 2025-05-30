local M = {}

M.options = {
    wrap = false,
}

M.delay = {
    which_key = 0,
    timeoutlen = 0,
}

M.indent = {
	editor = 4;
	explorer = 4;
    char = {
        line = "│",
        last = "╰",
    },
}

M.completion = {
	opt = {
		"menu",
		"menuone",
		"noinsert",
	},
	blend = 0,
	height = 10,
	width = 40,
	updatetime = 20
}

M.ui = {
    float = {
        width = 0.7,
        height = 0.8,
        window_blend = 0,
        backdrop = 60,
        padding = {
            left = 0,
            top = 0,
            right = 0,
            bottom = 0,
        },
    },
    title_pos = "center",
    transparency = false,
    refresh_rate = 120,
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
}

return M
