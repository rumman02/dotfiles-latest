-- how windows are place with positions
-- 						    topleft
--            				+---------+
-- 	leftabove	        	| New     |
-- 	+---------+---------+	  +---------+
--	| New     | Current | 	| Current |
-- 	+---------+---------+ 	+---------+
-- 						     botright
--            				+---------+
-- 	rightbelow       		| Current |
--  +---------+---------+  	+---------+
--  | Current | New     |  	| New     |
--  +---------+---------+  	+---------+
-- 						    horizontal
--              			+---------+
-- vertical     		    | Window1 |
-- +---------+---------+    +---------+
-- | Window1 | Window2 |    | Window2 |
-- +---------+---------+    +---------+

--      COMMANDS                    MODES ~
-- :map   :noremap  :unmap     Normal, Visual, Select, Operator-pending
-- :nmap  :nnoremap :nunmap    Normal
-- :vmap  :vnoremap :vunmap    Visual and Select
-- :smap  :snoremap :sunmap    Select
-- :xmap  :xnoremap :xunmap    Visual
-- :omap  :onoremap :ounmap    Operator-pending
-- :map!  :noremap! :unmap!    Insert and Command-line
-- :imap  :inoremap :iunmap    Insert
-- :lmap  :lnoremap :lunmap    Insert, Command-line, Lang-Arg
-- :cmap  :cnoremap :cunmap    Command-line
-- :tmap  :tnoremap :tunmap    Terminal

--          Mode  | Norm | Ins | Cmd | Vis | Sel | Opr | Term | Lang | ~
-- Command        +------+-----+-----+-----+-----+-----+------+------+ ~
-- [nore]map      | yes  |  -  |  -  | yes | yes | yes |  -   |  -   |
-- n[nore]map     | yes  |  -  |  -  |  -  |  -  |  -  |  -   |  -   |
-- [nore]map!     |  -   | yes | yes |  -  |  -  |  -  |  -   |  -   |
-- i[nore]map     |  -   | yes |  -  |  -  |  -  |  -  |  -   |  -   |
-- c[nore]map     |  -   |  -  | yes |  -  |  -  |  -  |  -   |  -   |
-- v[nore]map     |  -   |  -  |  -  | yes | yes |  -  |  -   |  -   |
-- x[nore]map     |  -   |  -  |  -  | yes |  -  |  -  |  -   |  -   |
-- s[nore]map     |  -   |  -  |  -  |  -  | yes |  -  |  -   |  -   |
-- o[nore]map     |  -   |  -  |  -  |  -  |  -  | yes |  -   |  -   |
-- t[nore]map     |  -   |  -  |  -  |  -  |  -  |  -  | yes  |  -   |
-- l[nore]map     |  -   | yes | yes |  -  |  -  |  -  |  -   | yes  |

--     COMMANDS				      MODES ~
-- 				       Normal  Visual+Select  Operator-pending ~
-- :map   :noremap   :unmap   :mapclear	 yes	    yes		   yes
-- :nmap  :nnoremap  :nunmap  :nmapclear	 yes	     -		    -
-- :vmap  :vnoremap  :vunmap  :vmapclear	  -	    yes		    -
-- :omap  :onoremap  :ounmap  :omapclear	  -	     -		   yes

-- CHAR	MODE	~
-- <Space>	Normal, Visual, Select and Operator-pending
-- n	Normal
-- v	Visual and Select
-- s	Select
-- x	Visual
-- o	Operator-pending
-- !	Insert and Command-line
-- i	Insert
-- l	":lmap" mappings for Insert, Command-line and Lang-Arg
-- c	Command-line
-- t	Terminal-Job

-- map-arguments
-- "<buffer>", "<nowait>", "<silent>", "<script>", "<expr>" and
-- "<unique>" can be used in any order.  They must appear right after the
-- command, before any other arguments.

local func = require("lib.functions")
local addKey = func.addKeys
local hydra = require("hydra")
local map = vim.keymap.set
local M, N = {}, {} -- M for general, N for hydra
--------------------
-- window keymaps
--------------------

addKey({ -- window_key_disabled
	["<c-w>"] = {
		desc = "[W]indow",
		d = { cmd = "<nop>", desc = "Show diagnostics under the cursor", hidden = true },
		h = { cmd = "<nop>", desc = "Go to left window", hidden = true },
		j = { cmd = "<nop>", desc = "Go to down window", hidden = true },
		k = { cmd = "<nop>", desc = "Go to up window", hidden = true },
		l = { cmd = "<nop>", desc = "Go to right window", hidden = true },
		H = { cmd = "<nop>", desc = "Move window to far left", hidden = true },
		J = { cmd = "<nop>", desc = "Move window to far bottom", hidden = true },
		K = { cmd = "<nop>", desc = "Move window to far top", hidden = true },
		L = { cmd = "<nop>", desc = "Move window to far right", hidden = true },
		o = { cmd = "<nop>", desc = "Close all other windows", hidden = true },
		q = { cmd = "<nop>", desc = "Quit a window", hidden = true },
		s = { cmd = "<nop>", desc = "Split window", hidden = true },
		T = { cmd = "<nop>", desc = "Break out into a new tab", hidden = true },
		v = { cmd = "<nop>", desc = "Split window vertically", hidden = true },
		w = { cmd = "<nop>", desc = "Switch windows", hidden = true },
		x = { cmd = "<nop>", desc = "Swap current with next", hidden = true },
		["<c-d>"] = { cmd = "<nop>", desc = "Show diagnostics under the cursor", hidden = true },
		["+"] = { cmd = "<nop>", desc = "Increase height", hidden = true },
		["-"] = { cmd = "<nop>", desc = "Decrease height", hidden = true },
		["<"] = { cmd = "<nop>", desc = "Decrease width", hidden = true },
		["="] = { cmd = "<nop>", desc = "Equally height and wide", hidden = true },
		[">"] = { cmd = "<nop>", desc = "Increase width", hidden = true },
		["_"] = { cmd = "<nop>", desc = "Max out the height", hidden = true },
		["|"] = { cmd = "<nop>", desc = "Max out the width", hidden = true },
	},
})

addKey({ -- window_key
	["<c-w>"] = {
		desc = "[W]indow",
		o = { desc = "[O]pen" },
		x = {
			desc = "Close",
			-- o = { cmd = "<c-w>o", desc = "[O]thers" },
		},
		X = {
			desc = "Close (+Buffer)",
			o = { cmd = "<c-w>h<cmd>bd<cr><c-w>p", desc = "[O]thers" },
		},
		m = {
			desc = "[M]ove",
			h = { cmd = "<cmd>wincmd H<cr>", desc = "Left" },
			j = { cmd = "<cmd>wincmd J<cr>", desc = "Down" },
			k = { cmd = "<cmd>wincmd K<cr>", desc = "Up" },
			l = { cmd = "<cmd>wincmd L<cr>", desc = "Right" },
		},
		s = {
			desc = "[S]wap",
			s = { cmd = "<c-w>r", desc = "[S]wap" },
			r = { cmd = "<c-w>R", desc = "[R]everse" },
		},
		r = {
			desc = "[R]esize",
			e = { cmd = "<c-w>=", desc = "Equal" },
			x = { cmd = "<c-w>_", desc = "Max X" },
			y = { cmd = "<c-w>|", desc = "Max Y" },
		},
		t = { cmd = "<c-w>T", desc = "[T]ab" },
	},
})

hydra({ -- window_open_key
	name = "[O]pen",
	mode = "n",
	body = "<c-w>o",
	config = {
		color = "pink",
		hint = {
			type = "window",
			position = "bottom-right",
			invoke_on_body = true,
		},
	},
	hint = " _h_  Left \n _j_  Down \n _k_  Up \n _l_  Right ",
	heads = {
		{ "h", "<cmd>set nosplitbelow<bar>vsplit<cr>", { desc = "Left" } },
		{ "j", "<cmd>set nosplitbelow<bar>split<cr>", { desc = "Down" } },
		{ "k", "<cmd>set splitbelow<bar>split<cr>", { desc = "Up" } },
		{ "l", "<cmd>set nosplitbelow<bar>vsplit<cr><c-w>p", { desc = "Right" } },
	},
})

hydra({ -- window_close_key
	name = "Close",
	mode = "n",
	body = "<c-w>x",
	config = {
		color = "pink",
		hint = {
			type = "window",
			position = "bottom-right",
			invoke_on_body = true,
		},
	},
	hint = " _c_  [C]urrent \n _h_  Left \n _j_  Down \n _k_  Up \n _l_  Right ",
	heads = {
		{ "c", "<c-w>c", { desc = "[C]urrent" } },
		{ "h", "<c-w>h<c-w>c<c-w>p", { desc = "Left" } },
		{ "j", "<c-w>j<c-w>c<c-w>p", { desc = "Down" } },
		{ "k", "<c-w>k<c-w>c<c-w>p", { desc = "Up" } },
		{ "l", "<c-w>l<c-w>c<c-w>p", { desc = "Right" } },
	},
})

hydra({ -- window_resize_key
	name = "[R]esize",
	mode = "n",
	body = "<c-w>r",
	config = {
		color = "pink",
		hint = {
			type = "window",
			position = "bottom-right",
			invoke_on_body = true,
		},
	},
	hint = " _h_  Left \n _j_  Down \n _k_  Up \n _l_  Right ",
	heads = {

		{ "h", "<cmd>vertical resize -5<cr>", { desc = "Left" } },
		{ "j", "<cmd>resize -2<cr>", { desc = "Down" } },
		{ "k", "<cmd>resize +2<cr>", { desc = "Up" } },
		{ "l", "<cmd>vertical resize +5<cr>", { desc = "Right" } },
	},
})

--------------------
-- z keymaps
--------------------
addKey({ -- z_key_disabled
	z = {
		desc = "[Z]",
		a = { cmd = "<nop>", desc = "Toggle fold under cursor", hidden = true },
		A = { cmd = "<nop>", desc = "Toggle alls fold under cursor", hidden = true },
		b = { cmd = "<nop>", desc = "Bottom this line", hidden = true },
		c = { cmd = "<nop>", desc = "Close fold under cursor", hidden = true },
		C = { cmd = "<nop>", desc = "Close all folds under cursor", hidden = true },
		d = { cmd = "<nop>", desc = "Delete fold under cursor", hidden = true },
		D = { cmd = "<nop>", desc = "Delete all folds under cursor", hidden = true },
		e = { cmd = "<nop>", desc = "Right this line", hidden = true },
		E = { cmd = "<nop>", desc = "Delete all folds in file", hidden = true },
		f = { cmd = "<nop>", desc = "Create fold", hidden = true },
		g = { cmd = "<nop>", desc = "Add word to spell list", hidden = true },
		H = { cmd = "<nop>", desc = "Half screen to the left", hidden = true },
		i = { cmd = "<nop>", desc = "Toggle folding", hidden = true },
		L = { cmd = "<nop>", desc = "Half screen to the right", hidden = true },
		m = { cmd = "<nop>", desc = "Fold more", hidden = true },
		M = { cmd = "<nop>", desc = "Clsoe all folds", hidden = true },
		o = { cmd = "<nop>", desc = "Open fold under cursor", hidden = true },
		O = { cmd = "<nop>", desc = "Open all folds under cursor", hidden = true },
		r = { cmd = "<nop>", desc = "Fold less", hidden = true },
		R = { cmd = "<nop>", desc = "Open all folds", hidden = true },
		s = { cmd = "<nop>", desc = "Left this line", hidden = true },
		t = { cmd = "<nop>", desc = "Top this line", hidden = true },
		v = { cmd = "<nop>", desc = "Show cursor line", hidden = true },
		w = { cmd = "<nop>", desc = "Mark word as bad/misspelling", hidden = true },
		x = { cmd = "<nop>", desc = "Update folds", hidden = true },
		z = { cmd = "<nop>", desc = "Center this line", hidden = true },
		["<cr>"] = { cmd = "<nop>", desc = "Top this line", hidden = true },
		["="] = { cmd = "<nop>", desc = "Spelling suggestions", hidden = true },
	},
})

--------------------
-- indent keymaps
--------------------
addKey({ -- indent_key_disabled
	["<"] = {
		desc = "[<]",
		["0"] = { cmd = "<nop>", desc = "Start of line", hidden = true },
		b = { cmd = "<nop>", desc = "Prev word", hidden = true },
		B = { cmd = "<nop>", desc = "Prev WORD", hidden = true },
		e = { cmd = "<nop>", desc = "Next end of word", hidden = true },
		E = { cmd = "<nop>", desc = "Next end of WORD", hidden = true },
		f = { cmd = "<nop>", desc = "Move to next char", hidden = true },
		F = { cmd = "<nop>", desc = "Move to prev char", hidden = true },
		G = { cmd = "<nop>", desc = "Last line", hidden = true },
		h = { cmd = "<nop>", desc = "Left", hidden = true },
		j = { cmd = "<nop>", desc = "Down", hidden = true },
		k = { cmd = "<nop>", desc = "Up", hidden = true },
		l = { cmd = "<nop>", desc = "Right", hidden = true },
		t = { cmd = "<nop>", desc = "Move before next char", hidden = true },
		T = { cmd = "<nop>", desc = "Move before prev char", hidden = true },
		w = { cmd = "<nop>", desc = "Next word", hidden = true },
		W = { cmd = "<nop>", desc = "Next WORD", hidden = true },
		["$"] = { cmd = "<nop>", desc = "End of line", hidden = true },
		["%"] = { cmd = "<nop>", desc = "Matching (){}[]", hidden = true },
		[","] = { cmd = "<nop>", desc = "Prev ftFT", hidden = true },
		["/"] = { cmd = "<nop>", desc = "Search forward", hidden = true },
		[";"] = { cmd = "<nop>", desc = "Next ftFt", hidden = true },
		["?"] = { cmd = "<nop>", desc = "Searh backward", hidden = true },
		["^"] = { cmd = "<nop>", desc = "Start of line (non ws)", hidden = true },
		["{"] = { cmd = "<nop>", desc = "Prev empty line", hidden = true },
		["}"] = { cmd = "<nop>", desc = "Next empty line", hidden = true },
		a = { cmd = "<nop>", desc = "Around textobject", hidden = true },
		g = { cmd = "<nop>", desc = "Not found", hidden = true },
		i = { cmd = "<nop>", desc = "Inside textobject", hidden = true },
		s = { cmd = "<nop>", desc = "Not found", hidden = true },
		["["] = { cmd = "<nop>", desc = "Not found", hidden = true },
		["]"] = { cmd = "<nop>", desc = "Not found", hidden = true },
	},
	[">"] = {
		desc = "[>]",
		["0"] = { cmd = "<nop>", desc = "Start of line", hidden = true },
		b = { cmd = "<nop>", desc = "Prev word", hidden = true },
		B = { cmd = "<nop>", desc = "Prev WORD", hidden = true },
		e = { cmd = "<nop>", desc = "Next end of word", hidden = true },
		E = { cmd = "<nop>", desc = "Next end of WORD", hidden = true },
		f = { cmd = "<nop>", desc = "Move to next char", hidden = true },
		F = { cmd = "<nop>", desc = "Move to prev char", hidden = true },
		G = { cmd = "<nop>", desc = "Last line", hidden = true },
		h = { cmd = "<nop>", desc = "Left", hidden = true },
		j = { cmd = "<nop>", desc = "Down", hidden = true },
		k = { cmd = "<nop>", desc = "Up", hidden = true },
		l = { cmd = "<nop>", desc = "Right", hidden = true },
		t = { cmd = "<nop>", desc = "Move before next char", hidden = true },
		T = { cmd = "<nop>", desc = "Move before prev char", hidden = true },
		w = { cmd = "<nop>", desc = "Next word", hidden = true },
		W = { cmd = "<nop>", desc = "Next WORD", hidden = true },
		["$"] = { cmd = "<nop>", desc = "End of line", hidden = true },
		["%"] = { cmd = "<nop>", desc = "Matching (){}[]", hidden = true },
		[","] = { cmd = "<nop>", desc = "Prev ftFT", hidden = true },
		["/"] = { cmd = "<nop>", desc = "Search forward", hidden = true },
		[";"] = { cmd = "<nop>", desc = "Next ftFt", hidden = true },
		["?"] = { cmd = "<nop>", desc = "Searh backward", hidden = true },
		["^"] = { cmd = "<nop>", desc = "Start of line (non ws)", hidden = true },
		["{"] = { cmd = "<nop>", desc = "Prev empty line", hidden = true },
		["}"] = { cmd = "<nop>", desc = "Next empty line", hidden = true },
		a = { cmd = "<nop>", desc = "Around textobject", hidden = true },
		g = { cmd = "<nop>", desc = "Not found", hidden = true },
		i = { cmd = "<nop>", desc = "Inside textobject", hidden = true },
		s = { cmd = "<nop>", desc = "Not found", hidden = true },
		["["] = { cmd = "<nop>", desc = "Not found", hidden = true },
		["]"] = { cmd = "<nop>", desc = "Not found", hidden = true },
	},
})

addKey({ -- equal_key_disabled
	["="] = {
		desc = "[=]",
		["0"] = { cmd = "<nop>", desc = "Start of line", hidden = true },
		b = { cmd = "<nop>", desc = "Prev word", hidden = true },
		B = { cmd = "<nop>", desc = "Prev WORD", hidden = true },
		e = { cmd = "<nop>", desc = "Next end of word", hidden = true },
		E = { cmd = "<nop>", desc = "Next end of WORD", hidden = true },
		f = { cmd = "<nop>", desc = "Move to next char", hidden = true },
		F = { cmd = "<nop>", desc = "Move to prev char", hidden = true },
		G = { cmd = "<nop>", desc = "Last line", hidden = true },
		h = { cmd = "<nop>", desc = "Left", hidden = true },
		j = { cmd = "<nop>", desc = "Down", hidden = true },
		k = { cmd = "<nop>", desc = "Up", hidden = true },
		l = { cmd = "<nop>", desc = "Right", hidden = true },
		t = { cmd = "<nop>", desc = "Move before next char", hidden = true },
		T = { cmd = "<nop>", desc = "Move before prev char", hidden = true },
		w = { cmd = "<nop>", desc = "Next word", hidden = true },
		W = { cmd = "<nop>", desc = "Next WORD", hidden = true },
		["$"] = { cmd = "<nop>", desc = "End of line", hidden = true },
		["%"] = { cmd = "<nop>", desc = "Matching (){}[]", hidden = true },
		[","] = { cmd = "<nop>", desc = "Prev ftFT", hidden = true },
		["/"] = { cmd = "<nop>", desc = "Search forward", hidden = true },
		[";"] = { cmd = "<nop>", desc = "Next ftFt", hidden = true },
		["?"] = { cmd = "<nop>", desc = "Searh backward", hidden = true },
		["^"] = { cmd = "<nop>", desc = "Start of line (non ws)", hidden = true },
		["{"] = { cmd = "<nop>", desc = "Prev empty line", hidden = true },
		["}"] = { cmd = "<nop>", desc = "Next empty line", hidden = true },
		a = { cmd = "<nop>", desc = "Around textobject", hidden = true },
		g = { cmd = "<nop>", desc = "Not found", hidden = true },
		i = { cmd = "<nop>", desc = "Inside textobject", hidden = true },
		s = { cmd = "<nop>", desc = "Not found", hidden = true },
		["["] = { cmd = "<nop>", desc = "Not found", hidden = true },
		["]"] = { cmd = "<nop>", desc = "Not found", hidden = true },
	},
})

addKey({ -- bracket_key
	["["] = {
		desc = "[[]",
		a = { cmd = "", desc = "previous", hidden = true },
		A = { cmd = "", desc = "rewind", hidden = true },
		b = { cmd = "", desc = "bprevious", hidden = true },
		B = { cmd = "", desc = "brewind", hidden = true },
		d = { cmd = "", desc = "Jump to the previous diagnostic in the current buffer", hidden = true },
		D = { cmd = "", desc = "Jump to the first diagnostic in the current buffer", hidden = true },
		i = { cmd = "", desc = "jump to top edge of scope", hidden = true },
		l = { cmd = "", desc = "lprevious", hidden = true },
		L = { cmd = "", desc = "lrewind", hidden = true },
		m = { cmd = "", desc = "Previous method start", hidden = true },
		M = { cmd = "", desc = "Previous method end", hidden = true },
		q = { cmd = "", desc = "cprevious", hidden = true },
		Q = { cmd = "", desc = "crewind", hidden = true },
		s = { cmd = "", desc = "Previous misspelled word", hidden = true },
		t = { cmd = "", desc = "tprevious", hidden = true },
		T = { cmd = "", desc = "trewind", hidden = true },
		["<c-l>"] = { cmd = "", desc = "lpfile", hidden = true },
		["<c-q>"] = { cmd = "", desc = "cpfile", hidden = true },
		["<c-t>"] = { cmd = "", desc = ":ptprevious", hidden = true },
		["%"] = { cmd = "", desc = "Previous unmatched group", hidden = true },
		["("] = { cmd = "", desc = "Previous (", hidden = true },
		["<"] = { cmd = "", desc = "Previous <", hidden = true },
		["{"] = { cmd = "", desc = "Previous {", hidden = true },
		[" "] = { cmd = "", desc = "Add empty line above cursor", hidden = true },
		["["] = { cmd = "", desc = "Jump to the previous section", hidden = true },
	},
	["]"] = {
		desc = "[]]",
		a = { cmd = "", desc = "next", hidden = true },
		A = { cmd = "", desc = "last", hidden = true },
		b = { cmd = "", desc = "bnext", hidden = true },
		B = { cmd = "", desc = "blast", hidden = true },
		d = { cmd = "", desc = "Jump to the next diagnostic in the current buffer", hidden = true },
		D = { cmd = "", desc = "Jump to the last diagnostic in the current buffer", hidden = true },
		i = { cmd = "", desc = "jump to bottom edge of scope", hidden = true },
		l = { cmd = "", desc = "lnext", hidden = true },
		L = { cmd = "", desc = "llast", hidden = true },
		m = { cmd = "", desc = "Next method start", hidden = true },
		M = { cmd = "", desc = "Next method end", hidden = true },
		q = { cmd = "", desc = "cnext", hidden = true },
		Q = { cmd = "", desc = "clast", hidden = true },
		s = { cmd = "", desc = "Next misspelled word", hidden = true },
		t = { cmd = "", desc = "tnext", hidden = true },
		T = { cmd = "", desc = "tlast", hidden = true },
		["<c-l>"] = { cmd = "", desc = "lnfile", hidden = true },
		["<c-q>"] = { cmd = "", desc = "cnfile", hidden = true },
		["<c-t>"] = { cmd = "", desc = "ptnext", hidden = true },
		["%"] = { cmd = "", desc = "Next unmatched group", hidden = true },
		["("] = { cmd = "", desc = "Next (", hidden = true },
		["<"] = { cmd = "", desc = "Next <", hidden = true },
		["{"] = { cmd = "", desc = "Next {", hidden = true },
		[" "] = { cmd = "", desc = "Add empty line below cursor", hidden = true },
		["]"] = { cmd = "", desc = "Jump to the next section", hidden = true },
	},
})

-- clipboard fix
map({ "x", "v" }, "p", '"_dP', { desc = "Paste without replace clipboard" })
map({ "n" }, "x", '"_x', { desc = "Cut single char without copy" })

-- remake existing keys useful
-- map({ "n" }, "<c-d>", "<c-d>zz", { desc = "Move down in buffer with cursor centered" })
-- map({ "n" }, "<c-u>", "<c-u>zz", { desc = "Move up in buffer with cursor centered" })
-- map({ "n" }, "n", "nzzzv", { desc = "Next search item show with cursor centered" })
-- map({ "n" }, "N", "Nzzzv", { desc = "Previous search item show with cursor centered" })

-- movements -- using mini.move
-- map({ "v" }, "J", ":m '>+0<CR>gv=gv", { desc = "Moves lines down" })
-- map({ "v" }, "K", ":m '<-2<CR>gv=gv", { desc = "Moves lines up" })
-- map({ "v" }, "<", "<gv", { desc = "Decrease indentation" })
-- map({ "v" }, ">", ">gv", { desc = "Increase indentation" })

-- fix some annoying keymaps
map({ "n" }, "q", func.handle_q_colon_key, { desc = "Native q" })

-- keymaps hacks
map({ "n" }, "gcy", "", { desc = "Copy and comment", remap = true })
map({ "n" }, "gcyk", "yypgcc", { desc = "Up", remap = true })
map({ "n" }, "gcyj", "yyPgcc", { desc = "Down", remap = true })

-- cursor navigations
map({ "i" }, "<c-h>", "<left>", { desc = "Left" })
map({ "i" }, "<c-l>", "<right>", { desc = "Right" })
map({ "i" }, "<c-k>", "<up>", { desc = "Up" })
map({ "i" }, "<c-j>", "<down>", { desc = "Down" })
map({ "i" }, "<c-s-h>", " ", { desc = "Left" })
map({ "i" }, "<c-s-j>", "<esc>O", { desc = "Down" })
map({ "i" }, "<c-s-k>", "<esc>o", { desc = "Up" })
map({ "i" }, "<c-s-l>", " <left>", { desc = "Right" })

-- miscs
map({ "v" }, "<c-y>", '"+y')
map({ "n" }, "<c-esc>", "<cmd>nohlsearch<cr>")

-- window management
map({ "n" }, "<c-h>", "<c-w>h", { desc = "Left" })
map({ "n" }, "<c-l>", "<c-w>l", { desc = "Right" })
map({ "n" }, "<c-k>", "<c-w>k", { desc = "Up" })
map({ "n" }, "<c-j>", "<c-w>j", { desc = "Down" })
map({ "t" }, "<c-h>", "<c-\\><c-n><c-w>h", { desc = "Left" })
map({ "t" }, "<c-l>", "<c-\\><c-n><c-w>j", { desc = "Right" })
map({ "t" }, "<c-k>", "<c-\\><c-n><c-w>k", { desc = "Up" })
map({ "t" }, "<c-j>", "<c-\\><c-n><c-w>l", { desc = "Down" })

addKey({
	["["] = {
		desc = "Next",
		a = { cmd = "", desc = "" },
		b = { cmd = "", desc = "" },
		c = { cmd = "", desc = "" },
		d = { cmd = "", desc = "" },
		e = { cmd = "", desc = "" },
		f = { cmd = "", desc = "" },
		g = { cmd = "", desc = "" },
		h = { cmd = "", desc = "" },
		i = { cmd = "", desc = "" },
		j = { cmd = "", desc = "" },
		k = { cmd = "", desc = "" },
		l = { cmd = "", desc = "" },
		m = { cmd = "", desc = "" },
		n = { cmd = "", desc = "" },
		o = { cmd = "", desc = "" },
		p = { cmd = "", desc = "" },
		q = { cmd = "", desc = "" },
		r = { cmd = "", desc = "" },
		s = { cmd = "", desc = "" },
		t = { cmd = "", desc = "" },
		u = { cmd = "", desc = "" },
		v = { cmd = "", desc = "" },
		w = { cmd = "", desc = "" },
		x = { cmd = "", desc = "" },
		y = { cmd = "", desc = "" },
		z = { cmd = "", desc = "" },
	},
})
