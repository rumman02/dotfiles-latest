return {
	"MeanderingProgrammer/render-markdown.nvim",
	enabled = require("plugins.controller").markdown.render_markdown,
	ft = {
		"markdown",
	},
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"saghen/blink.cmp",
		"neovim/nvim-lspconfig",
	},
	opts = {
		preset = "obsidian",
		render_modes = { "n", "c", "t" },
		heading = {
			icons = {
				" 󰲠 ",
				"  󰲢 ",
				"   󰲤 ",
				"    󰲦 ",
				"     󰲨 ",
				"      󰲪 ",
			},
		},
		completions = {
			blink = { enabled = true },
			lsp = { enabled = true },
		},
		code = {
			style = "full",
			position = "right",
			width = "block",
			border = "thick",
			left_margin = 0,
			left_pad = 5,
			right_pad = 5,
			inline_pad = 1,
		},
	},
}
