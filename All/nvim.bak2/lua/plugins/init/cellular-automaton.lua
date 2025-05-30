-- this is a animation type plugin (ex: all codes a dropped like rain )
local M = {}

M.cmd = {
  "CellularAutomaton",
}

M.opts = function()
	local utils = require("lib.utils")
	return {
		fps = utils.ui.refresh_rate,
		name = "slide",
		update = function (grid)
			for i = 1, #grid do
				local prev = grid[i][#(grid[i])]
				for j = 1, #(grid[i]) do
					grid[i][j], prev = prev, grid[i][j]
				end
			end
			return true
		end
	}
end

return M
