local M = {}

M.event = {
  "BufReadPre",
}

M.keys = function()
	local map = require("lib.func").map
	local session_leader = require("lib.keys").leader.session

	return {
		map(1, { "n" }, session_leader, "", { desc = "Session" }),
		map(1, { "n" }, session_leader .. "s", function() require("persistence").load() end, { desc = "Restore (cwd)" }),
		map(1, { "n" }, session_leader .. "l", function() require("persistence").select() end, { desc = "Select" }),
		map(1, { "n" }, session_leader .. "S", function() require("persistence").load({ last = true }) end, { desc = "Restore (last)" }),
		map(1, { "n" }, session_leader .. "q", function() require("persistence").stop() end, { desc = "Stop save on exit" }),
	}
end

return M
