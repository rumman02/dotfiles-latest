return {
	"numToStr/Comment.nvim",
	enabled = require("plugins.controller").comments.comment,
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	keys = require("plugins.comments.keymap").comment,
	config = function()
		require("Comment").setup({
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		})
	end,
}
