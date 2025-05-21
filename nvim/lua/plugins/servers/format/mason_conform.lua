return {
	"zapling/mason-conform.nvim",
	enabled = require("plugins.controller").servers.format.mason_conform,
	dependencies = {
		"mason-org/mason.nvim",
	},
	opts = {
		automatic_installation = false,
		ensure_installed = {
			"shfmt", -- bash / shell language formatter
			"stylua", -- lua language formatter
			"prettier", -- angular, css, flow, graphql, html, json, jsx, javascript, less, markdown, scss, typescript, vue, yaml
			-- "prettierd", --[[ angular, css, flow, graphql, html, json, jsx, javascript, less, markdown, scss, typescript,
			-- vue, yaml ]]
			"google-java-format", -- java
			"nixpkgs_fmt", -- nix language formatter
		},
	},
}
