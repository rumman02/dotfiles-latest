local cellular_automaton = require("cellular-automaton")
local utils = require("rumman.lib.utils")

cellular_automaton.register_animation({
	fps = utils.refresh_rate,
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
})

