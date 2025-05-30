local toggleterm = require("toggleterm")
local icons = require("rumman.lib.icons")
local utils = require("rumman.lib.utils")
local total_columns = vim.o.columns
local total_lines = vim.o.lines


toggleterm.setup({
	size = function(term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return 50
		end
	end,
	shade_terminals = true,
	start_in_insert = false,
	float_opts = {
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
		persist_size = false,
		persist_mode = false,-- if set to true (default) the previous terminal mode will be remembered
		width = math.floor(total_columns * utils.ui.width),
		height = math.floor(total_lines * utils.ui.height),
		winblend = utils.ui.window_blend,
		title_pos = utils.ui.title_position,
	},
	terminal_mappings = false,
	insert_mappings = false,
})

