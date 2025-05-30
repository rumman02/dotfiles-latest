-- https://github.com/lukas-reineke/indent-blankline.nvim
return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	main = "ibl",
	opts = {
		indent = {
			char = "⏐",
		},
		scope = {
			show_start = false,
			show_end = false,
			include = {
				node_type = { ["*"] = { "*" } },
			}
		}
	}
}
