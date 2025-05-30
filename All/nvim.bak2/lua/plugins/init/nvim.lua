local M = {}

M.name = "Catppuccin"

M.priority = 1000

M.opts = function()
	local utils = require("lib.utils")
	return {

		no_italic = true,
		term_colors = true,
		transparent_background = false,
		styles = {
			comments = {},
			conditionals = {},
			loops = {},
			functions = {},
			keywords = {},
			strings = {},
			variables = {},
			numbers = {},
			booleans = {},
			properties = {},
			types = {},
		},
		color_overrides = {
			mocha = {
				base = "#000000",
				mantle = "#000000",
				crust = "#000000",
			},
		},
		integrations = {
			telescope = {
				enabled = true,
				style = "nvchad",
			},
			dropbar = {
				enabled = true,
				color_mode = true,
			},
		},
	}
end

M.config = function(_, opts)
	require("catppuccin").setup(opts)
	vim.cmd("colorscheme catppuccin")
end

return M
