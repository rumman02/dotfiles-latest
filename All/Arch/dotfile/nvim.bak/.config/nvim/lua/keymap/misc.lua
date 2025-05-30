local which_key = require("which-key")
local keymaps_fixes = require("keymap.custom")

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
