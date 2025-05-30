return {
	"stevearc/dressing.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		input = {
			start_mode = "normal",
			border = "rounded",
			relative = "cursor",
			prefer_width = 40,
			width = nil
		}
	}
}
