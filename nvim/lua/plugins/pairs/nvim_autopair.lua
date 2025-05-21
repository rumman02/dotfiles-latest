return {
	"windwp/nvim-autopairs",
	enabled = require("plugins.controller").pairs.nvim_autopairs,
	event = {
		"InsertEnter",
		"CmdlineEnter",
	},
	opts = {
		check_ts = true,
		disable_filetype = {
			"TelescopePrompt",
			"snacks_picker_input",
			"noice",
		},
	},
}
