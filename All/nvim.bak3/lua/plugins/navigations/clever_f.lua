return {
	"rhysd/clever-f.vim",
	enabled = require("plugins.controller").navigations.clever_f,
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		vim.keymap.set({ "n", "v" }, "<esc>", "<esc><Plug>(clever-f-reset)", { desc = "Reset" })
	end,
}
