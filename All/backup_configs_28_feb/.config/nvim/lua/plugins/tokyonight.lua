local M = {}

M.opts = {
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

M.config = function(_, opts)
	require("tokyonight").setup(opts)
	vim.cmd("colorscheme tokyonight")
end

return M
