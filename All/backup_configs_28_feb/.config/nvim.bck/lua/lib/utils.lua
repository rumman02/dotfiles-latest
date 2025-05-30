local M = {};
local split_ratio = 3;
local w_split_size = math.floor(vim.api.nvim_win_get_width(0) / split_ratio)
local h_split_size = math.floor(vim.api.nvim_win_get_height(0) / split_ratio)

M.ui = {
	border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
	title_position = "center",
	backdrop = 50,
	width = 0.85,
	height = 0.85,
	h_split_size = h_split_size,
	w_split_size = w_split_size,
	padding = {
		left = 0,
		right = 0,
		up = 0,
		down = 0,
	},
	refresh_rate = 120,
};

M.colorscheme = "tokyonight";

M.options = {
	wrap = false,
	indent_size = 2,
	timeoutlen = 0,
	wk_popup = 0,
	notification_timeout = 2500, -- in ms
};

M.git = {

};

M.paths = {
	keymaps = "configs.keymaps"
};

return M;
