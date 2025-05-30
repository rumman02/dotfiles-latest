local which_key = require("which-key")

-- all groups
which_key.add({
	{ "s", group = "Jump"},
	{ "<c-w>o", group = "Open"},
	{ "<c-w>c", group = "Close"},
	{ "<c-w>p", group = "Position set"},
	{ "<c-w>s", group = "Swap"},
	{ "<leader>e", group = "Expolrer" },
	{ "<leader>f", group = "Find" },
	{ "<leader>fi", group = "Inside" },
	{ "<leader>s", group = "Session" },
	{ "<leader>ss", group = "Session"},
	{ "<localleader>", group = "Local Leader"},
	{ "<localleader>t", group = "Terminal" },
	{ "<localleader>o", group = "Options" },
	{ "<localleader>ol", group = "line" },
	{ "<localleader>oc", group = "Cursor" },
	{ "<localleader>och", group = "Highlight" },
	{ "<localleader>ocs", group = "Scrolloff" },
})

-- hidden some keymaps from which_key
which_key.add({
	hidden = true,
	{ "<c-w>d", desc = "Show diagnostics under the cursor"},
	{ "<c-w>q", desc = "Quit a window" },
	{ "<c-w>T", desc = "Break out into a new tab" },
	{ "<c-w>v", desc = "Split window vertically" },
	{ "<c-w>w", desc = "Switch windows" },
	{ "<c-w>x", desc = "Swap current with next" },
	{ "<c-w>+", desc = "Increase height" },
	{ "<c-w>-", desc = "Decrease height" },
	{ "<c-w><", desc = "Decrease width" },
	{ "<c-w>>", desc = "Increase width" },
	{ "<c-w>=", desc = "Equally high and wide" },
	{ "<c-w>_", desc = "Max out the height" },
	{ "<c-w>|", desc = "Max out the width" },
	{ "<c-w><c-D>", desc = "Show diagnostics under the cursor" },
})

-- require all keymaps here
require("keymap.auto_session")
require("keymap.buffer")
require("keymap.flash")
require("keymap.lsp")
require("keymap.misc")
require("keymap.neo_tree")
require("keymap.option")
require("keymap.smart_split")
require("keymap.tab")
require("keymap.telescope")
require("keymap.terminal")
require("keymap.window")
