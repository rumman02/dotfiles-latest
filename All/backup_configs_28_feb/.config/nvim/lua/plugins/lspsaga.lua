local M = {}

M.opts = function()
	local icons = require("lib.icons")
	return {
		symbol_in_winbar = {
			enable = true,
			show_file = true,
		},
		ui = {
			code_action = icons.md_icons.diagnostics.hint,
		},
	}
end

M.config = function() end

return M
