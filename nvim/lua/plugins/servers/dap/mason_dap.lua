return {
	"jay-babu/mason-nvim-dap.nvim",
	enabled = require("plugins.controller").servers.dap.mason_dap,
	dependencies = {
		"mason-org/mason.nvim",
	},
	opts = {
		automatic_installation = false,
		ensure_installed = {
			"bash", -- bash
			"chrome",
			-- "python", -- python
			-- "delve", -- go
			"firefox",
			"node2", -- javascript, typescript, javascriptreact, typescriptreact
			"js", -- javascript, typescript
			-- "local-lua-debugger-vscode", -- lua
			"lua", -- lua
			-- "php", -- php
			"mock", -- markdown
			"javadbg", -- java
			"javatest",
		},
		handlers = {
			function(config)
				require("mason-nvim-dap").default_setup(config)
			end,
		},
	},
}
