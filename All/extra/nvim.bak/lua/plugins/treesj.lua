local M = {}

M.opts = {
	use_default_keymaps = false,
	max_join_length = 100000,
}

M.config = function()
end

M.keys = function()
	local func = require("lib.func")
	local map = func.map
	local toggle_leader = require("lib.keys").toggle_leader
	return {
		map(1, { "n" }, toggle_leader .. toggle_leader, "<cmd>TSJToggle<cr>", { desc = "Split/Join blocks" }),
	}
end

return M
