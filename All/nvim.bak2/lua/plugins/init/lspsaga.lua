local M = {}

M.event = {
  "LspAttach",
}

M.dependencies = {
	"nvim-treesitter/nvim-treesitter",
	"nvim-tree/nvim-web-devicons",
}

M.config = function()
	local icons = require("lib.icons")
	return {
		symbol_in_winbar = {
			enable = true,
			show_file = true,
		},
		ui = {
			code_action = icons.diagnostics.hint,
		},
	}
end

return M
