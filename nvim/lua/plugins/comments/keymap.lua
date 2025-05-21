local M = {}

M.comment = {
	{ mode = { "n" }, "gc", "<Plug>(comment_toggle_linewise)", desc = "Comment (Line)" },
	{ mode = { "n" }, "gcc", "<Plug>(comment_toggle_linewise_current)", desc = "Line" },
	{ mode = { "v" }, "gc", "<Plug>(comment_toggle_linewise_visual)", desc = "Comment (Line)" },
	{
		mode = { "n" },
		"gco",
		function()
			require("Comment.api").insert.linewise.below()
		end,
		desc = "Below",
	},
	{
		mode = { "n" },
		"gcO",
		function()
			require("Comment.api").insert.linewise.above()
		end,
		desc = "Above",
	},
	{
		mode = { "n" },
		"gcA",
		function()
			require("Comment.api").insert.linewise.eol()
		end,
		desc = "End",
	},

	{ mode = { "n" }, "gb", "<Plug>(comment_toggle_blockwise)", desc = "Comment (Block)" },
	{ mode = { "n" }, "gbb", "<Plug>(comment_toggle_blockwise_count)", desc = "Block" },
	{ mode = { "n" }, "gbb", "<Plug>(comment_toggle_blockwise_count)", desc = "Block" },
	{ mode = { "v" }, "gb", "<Plug>(comment_toggle_blockwise_visual)", desc = "Comment (Block)" },
	{
		mode = { "n" },
		"gbo",
		function()
			require("Comment.api").insert.blockwise.below()
		end,
		desc = "Below",
	},
	{
		mode = { "n" },
		"gbO",
		function()
			require("Comment.api").insert.blockwise.above()
		end,
		desc = "Above",
	},
	{
		mode = { "n" },
		"gbA",
		function()
			require("Comment.api").insert.blockwise.eol()
		end,
		desc = "End",
	},
}

return M
