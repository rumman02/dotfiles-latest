local which_key = require("which-key")

which_key.add({
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
