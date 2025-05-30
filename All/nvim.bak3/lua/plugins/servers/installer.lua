return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	enabled = require("plugins.controller").servers.installer,
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	dependencies = {
		"williamboman/mason.nvim",
	},
	opts = {
		integrations = {
			["mason-lspconfig"] = true,
			["mason-conform"] = true,
			["mason-nvim-dap"] = true,
			["mason-nvim-lint"] = true,
		},
	},
}
