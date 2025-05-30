-- https://github.com/folke/which-key.nvim
return {
	"folke/which-key.nvim",
	event = { "VeryLazy" },
	opts = {
		preset = "classic",
		delay = 0,
		notify = true,
		triggers = {
			{ "<auto>", mode = "nicvxso" },
			{ "<leader>", mode = "nicvxso" },
			{ "s", mode = "nicvxso" },
			{ "\\", mode = "nicvxso" },
		},
		win = {
			no_overlap = false,
			border = "rounded",
			title_pos = "center",
		},
		replace = {
			key = {
				{ "<Space>", "Leader" },
			},
		},
		icons = {
			breadcrumb = " ",
			separator = " ",
			group = "+",
			rules = false,
		},
		disable = {
			ft = {"alpha"},
		}
	}
}
