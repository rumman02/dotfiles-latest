local M = {};

M.colorscheme = "gruvbox";

M.completeopt = {
	behavior = "menu,menuone,noinsert",
	min_width = 40,
	max_width = 40,
	max_height = 10,
	scrollbar = true,
	transparency = 0,
	visible_time = 300,
};

M.indent_size = {
	editor = 2,
	explorer = 2,
};

M.ui = {
	width = 0.7,
	height = 0.8,
	title_position = "center",
	refresh_rate = 120,
	backdrop = 60,
	transparent = false,
	window_blend = 0,
}

M.option = {
  wrap = false,
}

return M;
