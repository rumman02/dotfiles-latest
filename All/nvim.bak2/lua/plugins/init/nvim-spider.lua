local M = {}

M.event = {
  "BufReadPre",
  "BufNewFile",
}

M.keys = function()
	local map = require("lib.func").map

	return {
		map(1, { "n", "o", "x" }, "w", function() require("spider").motion('w') end, { desc = "Spider-w" }),
		map(1, { "n", "o", "x" }, "e", function() require("spider").motion('e') end, { desc = "Spider-e" }),
		map(1, { "n", "o", "x" }, "b", function() require("spider").motion('b') end, { desc = "Spider-b" }),
		map(1, { "n", "o", "x" }, "ge", function() require("spider").motion('ge') end, { desc = "Spider-ge" }),
	}
end

return M
