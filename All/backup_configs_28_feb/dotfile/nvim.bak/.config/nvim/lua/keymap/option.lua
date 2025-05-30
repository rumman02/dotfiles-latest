local which_key = require("which-key")
local keymaps_fixes = require("keymap.custom")

which_key.add({
	{ "<localleader>olw", "<cmd> set wrap! <cr>", desc  = "Wrap" },
	{ "<localleader>ochl", "<cmd> set cursorline! <cr>", desc  = "Line" },
	{ "<localleader>ochc", "<cmd> set cursorcolumn! <cr>", desc  = "Column" },
	{ "<localleader>ocsx", function() keymaps_fixes.option_cursor_scrolloff() end, desc = "Middle line" },
	{ "<localleader>ocsy", function() keymaps_fixes.option_cursor_sidescrolloff() end, desc = "Middle Column" },
})
