local M = {}

M.lazy = false

M.priority = 1000

M.cmd = {
	"Colorscheme tokyonight",
}

M.opts = function()
	local utils = require("lib.utils")
	return {
		transparent = utils.ui.transparent_mode,
		style = "night",
		light_style = "day",
		styles = {
			comments = { italic = true },
			keywords = { italic = true },
			functions = { italic = false },
			variables = { italic = false },
			sidebars = "dark",
			floats = "transparent",
		},
		day_brightness = 0.3,
		dim_inactive = false,
		lualine_bold = true,
		cache = true,
	}
end

M.config = function(_, opts)
	require("tokyonight").setup(opts)
	vim.cmd("colorscheme tokyonight")
end

return M
