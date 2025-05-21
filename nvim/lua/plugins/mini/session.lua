return function()
	require("mini.sessions").setup({
		autoread = false,
		autowrite = true,
		force = {
			read = false,
			write = true,
			delete = false,
		},
		verbose = {
			read = false,
			write = true,
			delete = true,
		},
	})
end
