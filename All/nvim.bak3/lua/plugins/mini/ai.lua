return function()
	require("mini.ai").setup({
		mappings = {
			around = "a",
			inside = "i",

			around_next = "an",
			inside_next = "in",
			around_last = "al",
			inside_last = "il",

			goto_left = "g[",
			goto_right = "g]",
		},
	})
end
