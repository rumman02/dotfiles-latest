local M = {}

M.opts = {}

M.config = function()
	local func = require("lib.func")
	local map = func.map
	map(0, { "n", "v" }, "<esc>", "<esc><Plug>(clever-f-reset)", { desc = "Reset" })
end

return M
