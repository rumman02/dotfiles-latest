local which_key = require("which-key")
local keymaps_fixes = require("keymap.custom")

which_key.add({
	{ "<localleader>to", "<cmd> terminal <cr>", desc  = "Open current" },
	{ "<localleader>tk", "<cmd> set nosplitbelow <Bar> split <Bar> terminal <cr>", desc  = "Open below" },
	{ "<localleader>tj", "<cmd> set splitbelow <Bar> split <Bar> terminal <cr>", desc  = "Open above" },
	{ "<localleader>tl", "<cmd> set splitright <Bar> vsplit <Bar> terminal <cr>", desc  = "Open left" },
	{ "<localleader>th", "<cmd> set nosplitright <Bar> vsplit <Bar> terminal <cr>",desc  = "Open right" },
	{ "<localleader>tc", function() keymaps_fixes.close_terminal_buffer() end, desc  = "Quit under cursor" },
	{ "<localleader>ta", function() keymaps_fixes.close_all_terminal_buffers() end, desc  = "Quit all" },
	{ "<esc>", "<c-\\><c-n>", desc  = "Exit insert mode", mode = { "t" } },
})
