local M = {}

M.opts = function()
	return {
		mappings = false,
		-- pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
	}
end

M.config = function() end

M.keys = function()
	local func = require("lib.func")
	local map = func.map
	local comment_leader1 = require("lib.keys").comment_leader1
	local comment_leader2 = require("lib.keys").comment_leader2
	return {
		map(1, { "n" }, comment_leader1, "<Plug>(comment_toggle_linewise)", { desc = "Comment (Line)" }),
		map(1, { "n" }, comment_leader1 .. "c", function() return vim.v.count == 0 and "<Plug>(comment_toggle_linewise_current)"  or "<Plug>(comment_toggle_linewise_count)" end, { desc = "Line", expr = true }),
		map(1, { "v" }, comment_leader1, "<Plug>(comment_toggle_linewise_visual)", { desc = "Comment (Line)" }),
		map(1, { "n" }, comment_leader1 .. "o", function() require("Comment.api").insert.linewise.below() end, { desc = "Below" }),
		map(1, { "n" }, comment_leader1 .. "O", function() require("Comment.api").insert.linewise.above() end, { desc = "Above" }),
		map(1, { "n" }, comment_leader1 .. "A", function() require("Comment.api").insert.linewise.eol() end, { desc = "End" }),

		map(1, { "n" }, comment_leader2, "<Plug>(comment_toggle_blockwise)", { desc = "Comment (Block)" }),
		map(1, { "n" }, comment_leader2 .. "b", function() return vim.v.count == 0 and "<Plug>(comment_toggle_blockwise_current)" or "<Plug>(comment_toggle_blockwise_count)" end, { desc = "Block", expr = true }),
		map(1, { "v" }, comment_leader2, "<Plug>(comment_toggle_blockwise_visual)", { desc = "Comment (Block)" }),
		map(1, { "n" }, comment_leader2 .. "o", function() require("Comment.api").insert.blockwise.below() end, { desc = "Below" }),
		map(1, { "n" }, comment_leader2 .. "O", function() require("Comment.api").insert.blockwise.above() end, { desc = "Above" }),
		map(1, { "n" }, comment_leader2 .. "A", function() require("Comment.api").insert.blockwise.eol() end, { desc = "End" }),
	}
end

return M
