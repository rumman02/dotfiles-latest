return {
	"altermo/ultimate-autopair.nvim",
	enabled = require("plugins.controller").pairs.ultimate_autopair,
	branch = "v0.6",
	event = {
		"InsertEnter",
		"CmdlineEnter",
	},
	dependencies = {},
	opts = {},
	config = function(_, opts)
		require("ultimate-autopair").setup(opts)
	end,
}
