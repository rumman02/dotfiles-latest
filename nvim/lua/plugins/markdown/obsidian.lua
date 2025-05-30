return {
	"epwalsh/obsidian.nvim",
	enabled = require("plugins.controller").markdown.obsidian,
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	ft = {
		"markdown",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			-- {
			-- 	name = "Personal",
			-- 	path = "~/notes/Personal",
			-- },
			-- {
			-- 	name = "Work",
			-- 	path = "~/notes/Work",
			-- },
		},
	},
}
