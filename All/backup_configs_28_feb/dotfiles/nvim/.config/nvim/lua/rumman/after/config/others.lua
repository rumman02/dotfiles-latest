local icons = require("rumman.lib.icons")

-- diagnostics
vim.fn.sign_define("DiagnosticSignError", { text = icons.diagnostics.Error, texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = icons.diagnostics.Warning, texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = icons.diagnostics.Information, texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = icons.diagnostics.Hint, texthl = "DiagnosticSignHint" })

vim.diagnostic.config({
	virtual_text = false,
	signs = false,
	underline = true,
	update_in_insert = false,
	severity_sort = false,
	float = {
		---@diagnostic disable-next-line: assign-type-mismatch
		border = {
			icons.ui.BorderTopLeft,
			icons.ui.BorderTop,
			icons.ui.BorderTopRight,
			icons.ui.BorderRight,
			icons.ui.BorderBottomRight,
			icons.ui.BorderBottom,
			icons.ui.BorderBottomLeft,
			icons.ui.BorderLeft,
		},
		source = true,
		header = "",
		prefix = "",
	},
})

-- dap
vim.fn.sign_define("DapBreakpoint", { text = icons.ui.CirclePause, texthl = "Changed", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = icons.ui.CirclePause, texthl = "Changed", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = icons.ui.CircleCross, texthl = "", linehl = "@comment.error", numhl = "" })
vim.fn.sign_define("DapStopped", { text = icons.ui.CircleRight, texthl = "", linehl = "@diff.plus", numhl = "" })

-- clever-f
vim.g.clever_f_smart_case = 1
vim.g.snacks_animate = true

-- visual multi
-- vim.g.VM_default_mappings = 0
-- vim.g.VM_mouse_mappings = 1

