return {
	"epwalsh/obsidian.nvim",
	enabled = require("plugins.controller").markdown.obsidian,
	version = "*",
	ft = {
		"markdown",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "Vault",
				path = "~/Documents/Obsidian-vault",
			},
		},
		ui = { enable = false },
	},
}
