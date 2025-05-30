local split_ratio = 3
local w_split_size = math.floor(vim.api.nvim_win_get_width(0) / split_ratio)
local h_split_size = math.floor(vim.api.nvim_win_get_height(0) / split_ratio)
local M = {}

M.colorscheme = "gruvbox"

M.telescope = {
	layout_strategy = "flex",
	preview_cutoff = 40,
	preview_width = 0.45,
	prompt_prefix = "",
	prompt_title = "",
	prompt_position = "bottom",
	results_title = "Results",
	selection_caret = " ",
	sorting_strategy = "descending",
}

M.ui = {
	float = {
		width = 0.7,
		height = 0.8,
		window_blend = 0,
		backdrop = 60,
		padding = {
			left = 0,
			right = 0,
			up = 0,
			down = 0,
		},
	},
	split = {
		h_split_size = h_split_size,
		w_split_size = w_split_size,
	},
	title_position = "center",
	transparent = false,
	refresh_rate = 120,
	border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
}

M.indent = {
	editor = 2,
	explorer = 4,
}

M.options = {
	wrap = false,
	timeoutlen = 500,
	wk_popup = 0,
	notification_timeout = 2500, -- in ms
}

M.completion = {
	behavior = "menu,menuone,noinsert",
	min_width = 40,
	max_width = 40,
	max_height = 10,
	scrollbar = true,
}

M.input = {
	initial_mode = "insert",
}

return M
