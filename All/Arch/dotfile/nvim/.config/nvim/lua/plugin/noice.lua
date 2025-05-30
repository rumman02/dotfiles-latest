-- https://github.com/folke/noice.nvim?tab=readme-ov-file#️-configuration
return {
  "folke/noice.nvim",
  event = { "VeryLazy" },
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
  opts = {
		cmdline = {
			view = "cmdline_popup",
			format = {
				cmdline = { icon = "" },
				search_down = { icon = " " },
				search_up = { icon = " " },
				filter = { icon = "$" },
				lua = { icon = "" },
				help = { icon = "" },
				input = { icon = "󰥻" },
			}
		},
		format = {
			level = {
				icons = {
					error = "✖",
					warn = "▼",
					info = "●",
				},
			},
		},
	}
}
