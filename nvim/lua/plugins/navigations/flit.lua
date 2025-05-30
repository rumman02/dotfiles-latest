return {
	"ggandor/flit.nvim",
	enabled = require("plugins.controller").navigations.flit,
	dependencies = {
		"ggandor/leap.nvim",
		"tpope/vim-repeat",
	},
	opts = {
		keys = { f = "f", F = "F", t = "t", T = "T" },
		-- A string like "nv", "nvo", "o", etc.
		labeled_modes = "nvo",
		-- Repeat with the trigger key itself.
		clever_repeat = true,
		multiline = true,
		-- Like `leap`s similar argument (call-specific overrides).
		-- E.g.: opts = { equivalence_classes = {} }
		opts = {},
	},
}
