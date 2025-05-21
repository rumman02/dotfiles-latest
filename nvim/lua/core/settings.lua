local icons = require("lib.icons")
local utils = require("lib.utils")
local diagnostic = vim.diagnostic
local severity = diagnostic.severity

diagnostic.config({
	virtual_text = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = true,
		header = "",
		prefix = "",
	},
	signs = {
		text = {
			[severity.ERROR] = icons.diagnostics.error,
			[severity.WARN] = icons.diagnostics.warn,
			[severity.INFO] = icons.diagnostics.info,
			[severity.HINT] = icons.diagnostics.hint,
		},
	},
})
