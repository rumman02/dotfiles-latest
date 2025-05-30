return {
	"rshkarin/mason-nvim-lint",
	enabled = require("plugins.controller").servers.linter.mason_lint,
	dependencies = {
		"mason-org/mason.nvim",
	},
	opts = {
		automatic_installation = false,
		ensure_installed = {
			"eslint_d",
			"luacheck",
			"pylint",
			"shellcheck",
		},
	},
}
