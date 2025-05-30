local M = {}
local split_ratio = 3
local w_split_size = math.floor(vim.api.nvim_win_get_width(0) / split_ratio)
local h_split_size = math.floor(vim.api.nvim_win_get_height(0) / split_ratio)

M.colorscheme = "gruvbox"

M.completeopt = {
	behavior = "menu,menuone,noinsert",
	max_height = 10,
	max_width = 40,
	min_width = 40,
	scrollbar = true,
	transparency = 0,
	visible_time = 50,
}

M.indent_size = {
	editor = 4,
	explorer = 2,
}

M.ui = {
	backdrop = 50,
	h_split_size = h_split_size,
	height = 0.85,
	padding = {
		left = 0,
		right = 0,
		up = 0,
		down = 0,
	},
	refresh_rate = 120,
	title_position = "center",
	transparent_mode = false,
	w_split_size = w_split_size,
	width = 0.85,
	window_blend = 0,
}

M.option = {
	notification_timeout = 2500,
	timeoutlen = 0,
	wk_popup = 0,
	wrap = false, -- in ms
}

return M
