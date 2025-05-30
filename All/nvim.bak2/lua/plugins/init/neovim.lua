local M = {}

M.lazy = false

M.priority = 1000

M.cmd = {
	"Colorscheme rose-pine",
}

M.opts = function()
	local utils = require("lib.utils")
	return {
		styles = {
			bold = true,
			italic = true,
			transparency = utils.ui.transparency,
		},

		variant = "main",
		-- highlight_groups = {
		-- 	Comment = { fg = "foam" },
		-- 	StatusLine = { fg = "love", bg = "love", blend = 15 },
		-- 	VertSplit = { fg = "muted", bg = "muted" },
		-- 	Visual = { fg = "base", bg = "text", inherit = false },
		-- 	Normal = { bg = "none" },
		-- },
	}
end

M.config = function(_, opts)
	require("rose-pine").setup(opts)
	vim.cmd("colorscheme rose-pine")
end

return M
