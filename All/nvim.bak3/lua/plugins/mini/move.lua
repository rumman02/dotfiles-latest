return function()
	require("mini.move").setup({
		mappings = {
			-- for visual modes
			left = "<c-h>",
			right = "<c-l>",
			down = "<c-j>",
			up = "<c-k>",

			-- for normal mode
			line_left = "",
			line_right = "",
			line_down = "",
			line_up = "",
		},
	})
end
