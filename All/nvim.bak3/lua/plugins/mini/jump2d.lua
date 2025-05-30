return function()
	require("mini.jump2d").setup({
		view = {
			dim = false,
		},
		mappings = {
			start_jumping = ";",
		},
		silent = true,
	})
end
