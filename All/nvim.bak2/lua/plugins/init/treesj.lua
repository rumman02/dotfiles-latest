local M = {}

M.dependencies = {
  "nvim-treesitter/nvim-treesitter",
}

M.opts = function()
  return {
	  use_default_keymaps = false,
	  max_join_length = 100000,
  }
end

M.keys = function()
	local map = require("lib.func").map
	local toggle_leader = require("lib.keys").leader.toggle

	return {
		map(1, { "n" }, toggle_leader .. toggle_leader, "<cmd>TSJToggle<cr>", { desc = "Split/Join blocks" }),
	}
end

return M
