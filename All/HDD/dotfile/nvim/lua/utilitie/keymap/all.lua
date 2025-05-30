local keymaps_fixes = require("utilitie.keymap.custom")
local which_key = require("which-key")

-- all groups
which_key.add({
	{ "s", group = "Jump"},
	{ "<c-w>o", group = "Open"},
	{ "<c-w>c", group = "Close"},
	{ "<c-w>p", group = "Position set"},
	{ "<c-w>s", group = "Swap"},
	{ "<leader>f", group = "File explorer" },
	{ "<leader>fe", group = "Explorer" },
	{ "<leader>feo", group = "Open" },
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


-- neo_tree
which_key.add({
	-- when in neo-tree buffer, without close before it's creates error, so better use first close neo-tree
	-- by <cmd> Neotree close <cr> first then, another command
	{ "<leader>feoh", "<cmd> Neotree close <cr> <bar> <cmd> Neotree left <cr>", desc = "Left"},
	{ "<leader>feoj", "<cmd> Neotree close <cr> <bar> <cmd> Neotree bottom <cr>", desc = "Down"},
	{ "<leader>feok", "<cmd> Neotree close <cr> <bar> <cmd> Neotree top <cr>", desc = "Up"},
	{ "<leader>feol", "<cmd> Neotree close <cr> <bar> <cmd> Neotree right <cr>", desc = "Right"},
	{ "<leader>feof", "<cmd> Neotree close <cr> <bar> <cmd> Neotree focus float <cr>", desc = "Float"},
	{ "<leader>feoc", "<cmd> Neotree reveal <cr>", desc = "Current"},
	{ "<leader>fec", "<cmd> Neotree close <cr>", desc = "Close" },
	{ "<leader>fef", "<cmd> Neotree focus <cr>", desc = "Focus" },
})

-- flash
which_key.add({
	{ "sf", function() require("flash").jump({ search = { forward = true, wrap = false, multi_window = false } }) end, desc = "[F]orward", mode = { "n", "x", "o" } },
	{ "sb", function() require("flash").jump({ search = { forward = false, wrap = false, multi_window = false } }) end, desc = "[B]ackward", mode = { "n", "x", "o" } },
	{ "sm", function() require("flash").jump() end, desc = "[M]ove", mode = { "n", "x", "o" } },
	{ "sl", function() require("flash").jump({ search = { mode = "search", max_length = 0 }, label = { after = { 0, 0 } }, pattern = "^" }) end, desc = "[L]ine", mode = { "n", "x", "o" } },
	{ "sc", function() require("flash").jump({ pattern = vim.fn.expand("<cword>") }) end, desc = "Under [C]ursor", mode = { "n", "x", "o" } },
	{ "sw", function() require("flash").jump({
		search = {
			mode = function(pattern)
				-- remove leading dot
				-- return word pattern and proper skip pattern
				return ([[\<%s\w*\>]]):format(pattern), ([[\<%s]]):format(pattern)
			end,
		},
		jump = { pos = "range" },
	}) end, desc = "[W]ord", mode = { "n", "x", "o" } },
	-- { "ss", function() require("flash").treesitter() end, desc = "Scope", mode = { "n", "x", "o" } },
	-- { "r", function() require("flash").remote() end, desc = "Flash remote", mode = { "o" } },
	-- { "R", function() require("flash").treesitter_search() end, desc = "Treesitter search", mode = { "x", "o" } },
	-- { "<c-s>s", function() require("flash").toggle() end, desc = "Toggle flash search", mode = { "n", "c" } },
})


-- buffer
which_key.add({
	{ "<a-h>", "<cmd> bnext <cr>" },
	{ "<a-l>", "<cmd> bprevious <cr>" },
})

which_key.add({
	{ "<a-k>", "<cmd> tabnext <cr>" },
	{ "<a-j>", "<cmd> tabprevious <cr>" },
})

-- auto_session
which_key.add({
	{ "<leader>sss", "<cmd> SessionSave <cr>", desc = "Save" },
	-- <cr><cr>: after restore session, shows prompt like press enter or type command 
	-- to continue. to avoid this, first <cr> is for execute command, second for press enter.
	{ "<leader>ssr", "<cmd> SessionRestore <cr><cr>", desc = "Restore" },
	{ "<leader>ssc", "<cmd> Autosession search <cr>", desc = "Search" },
	{ "<leader>ssd", "<cmd> Autosession delete <cr>", desc = "Delete" },
})

-- split_windows & smart_splits
which_key.add({
	{ "<c-h>", "<cmd> SmartCursorMoveLeft <cr>" },
	{ "<c-j>", "<cmd> SmartCursorMoveDown <cr>" },
	{ "<c-k>", "<cmd> SmartCursorMoveUp <cr>" },
	{ "<c-l>", "<cmd> SmartCursorMoveRight <cr>" },
	{ "<c-\\>", function() require("smart-splits").move_cursor_previous() end },

	{ "<c-w>r", "<cmd> SmartResizeMode <cr>", desc = "Resize mode"  },

	{ "<c-w>sh", "<cmd> SmartSwapLeft <cr>", desc = "Left"  },
	{ "<c-w>sj", "<cmd> SmartSwapDown <cr>", desc = "Down"  },
	{ "<c-w>sk", "<cmd> SmartSwapUp <cr>", desc = "Up"  },
	{ "<c-w>sl", "<cmd> SmartSwapRight <cr>", desc = "Right"  },

	{ "<c-w>oh", "<cmd> set splitright <bar> vsplit <cr>", desc = "Open Left" },
	{ "<c-w>oj", "<cmd> set nosplitbelow <bar> split <cr>", desc = "Open Down" },
	{ "<c-w>ok", "<cmd> set splitbelow <bar> split <cr>", desc = "Open Up" },
	{ "<c-w>ol", "<cmd> set nosplitright <bar> vsplit <cr>", desc = "Open Right" },

	{ "<c-w>pj", "<cmd> wincmd J <cr>", desc  = "Most Down" },
	{ "<c-w>pk", "<cmd> wincmd K <cr>", desc  = "Most Up" },
	{ "<c-w>ph", "<cmd> wincmd H <cr>", desc  = "Most Left" },
	{ "<c-w>pl", "<cmd> wincmd L <cr>", desc  = "Most Right" },
	{ "<c-w>t", "<c-w>T", desc  = "Open as tab" },
	{ "<c-w>m", "<c-w>|<c-w>_", desc  = "Maximize" },
	{ "<c-w>x", "<c-w>|", desc  = "Max width" },
	{ "<c-w>y", "<c-w>_", desc  = "Max height" },
	{ "<c-w>e", "<c-w>=", desc  = "Equal size" },

	{ "<c-w>ch", "<c-w>h <bar> <c-w>q", desc = "Close Left" },
	{ "<c-w>cj", "<c-w>j <bar> <c-w>q", desc = "Close Down" },
	{ "<c-w>ck", "<c-w>k <bar> <c-w>q", desc = "Close Up" },
	{ "<c-w>cl", "<c-w>l <bar> <c-w>q", desc = "Close Right" },
	{ "<c-w>cc", "<c-w>q", desc = "Current" },
	{ "<c-w>co", "<c-w>o", desc = "Others" },
})

-- terminal
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

-- options
which_key.add({
	{ "<localleader>olw", "<cmd> set wrap! <cr>", desc  = "Wrap" },
	{ "<localleader>ochl", "<cmd> set cursorline! <cr>", desc  = "Line" },
	{ "<localleader>ochc", "<cmd> set cursorcolumn! <cr>", desc  = "Column" },
	{ "<localleader>ocsx", function() keymaps_fixes.option_cursor_scrolloff() end, desc = "Middle line" },
	{ "<localleader>ocsy", function() keymaps_fixes.option_cursor_sidescrolloff() end, desc = "Middle Column" },
})

-- misc
which_key.add({
	-- normal usage and works well while word wrap
	{ "j", "gj" },
	{ "k", "gk" },
	{ "$", "g$" },
	{ "^", "g^" },
	{ "0", "g0" },

	-- fix q: its shows annoying command lists
	{ "q", function() keymaps_fixes.handle_q_colon_key() end },

	-- move text down & up
	-- { "<a-j>", ":m .+1<cr>==", mode = { "n" } },
	-- { "<a-k>", ":m .-2<cr>==", mode = { "n" } },
	-- { "<a-j>", ":m '>+1<cr>gv=gv", mode = {"v", "x"} },
	-- { "<a-k>", ":m '<-2<cr>gv=gv", mode = {"v", "x"} },

	-- fix: do not replace register when select and paste
	{ "p", '"_dP', mode = {"v", "x"} },
	{ "x", '"_x' },

	-- change number with + - 
	{ "+", "<c-a>" },
	{ "-", "<c-x>" },

	-- shows warning into checkhealth which-key
	{ "gc", "<Nop>" },

	-- keep visual mode while decrease indentation
	{ "<", "<gv", mode = {"v", "x"} },
	{ ">", ">gv", mode = {"v", "x"} },

	-- keep cursor center while next search result
	{ "n", "nzzzv" },
	{ "N", "Nzzzv" },

	-- copy into system clipboard
	{ "<c-y>", '"+ygv <esc>', mode = {"v", "x"} },
	{ "<c-y>", '"+y' },

	-- cursor will not jump where you started selection
	{ "y", "ygv <esc>", mode = {"v", "x"} },

	-- search "/"
	{ "//", "/", desc = "Up to down search" },
	{ "/c", "<cmd> nohlsearch <cr>", desc = "Clear" },
	{ "/r", ":%s/", desc = "Replace" },
	{ "/r", ":s/", desc = "Replace", mode = { "v", "x" } },

	-- search "?"
	{ "??", "?", desc = "Down to up search" },
	{ "?c", "<cmd> nohlsearch <cr>", desc = "Clear" },
	{ "?r", ":%s/", desc = "Replace" },
	{ "?r", ":s/", desc = "Replace", mode = { "v", "x" } },
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
