local M = {}

M.config = function()
	local map = require("lib.func").map

	map(0, { "n", "v" }, "<esc>", "<esc><Plug>(clever-f-reset)", { desc = "Reset" })
end

return M
