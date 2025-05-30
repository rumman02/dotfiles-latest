return function()
	local keymap = require("mini.keymap")
	local map_combo = keymap.map_combo
	local mode = { "i", "c", "x", "s" }

	keymap.setup()

	map_combo(mode, "jk", "<bs><bs><esc>")
	map_combo(mode, "kj", "<bs><bs><esc>")
	map_combo(mode, "jk", "<bs><bs><c-\\><c-n>")
	map_combo(mode, "kj", "<bs><bs><c-\\><c-n>")
end
