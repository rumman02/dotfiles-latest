return function()
	require("mini.clue").setup({
		window = {
			delay = 0,
			config = {
				border = "rounded",
			},
		},
		clues = {
			{ mode = "n", keys = "<leader>bsh", postkeys = "<leader>bs", { desc = "swap" } },
		},
		triggers = {
			{ mode = "n", keys = "<leader>" },
			{ mode = "n", keys = "<localleader>" },
			{ mode = "n", keys = "<c-w>" },
			{ mode = "n", keys = "g" },
			{ mode = "n", keys = "z" },
			{ mode = "n", keys = "s" },

			{ mode = "v", keys = "<leader>" },
			{ mode = "v", keys = "g" },

			{ mode = "x", keys = "<leader>" },
		},
	})
end
