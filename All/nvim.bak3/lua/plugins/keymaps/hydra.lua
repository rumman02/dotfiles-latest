return {
	"nvimtools/hydra.nvim",
	enabled = require("plugins.controller").keymap.hydra,
	event = {
		"VeryLazy",
	},
	config = function()
		require("hydra").setup({
			debug = false,
			exit = false,
			foreign_keys = nil,
			timeout = false,
			invoke_on_body = false,
			hint = {
				show_name = true,
				position = { "middle" },
				offset = 0,
				float_opts = {
					border = "rounded",
				},
			},
			on_enter = nil,
			on_exit = nil,
			on_key = nil,
		})
	end,
}
