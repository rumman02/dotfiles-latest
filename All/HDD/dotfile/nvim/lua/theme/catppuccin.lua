return {
	"catppuccin/nvim",
	name = "catppuccin",
	-- cmd = { "Catppuccin" },
	priority = 1000,
	cond = false,
	config = function ()
		local catppuccin = require("catppuccin")
		catppuccin.setup({
			background = {
				light = "latte",
				dark = "mocha"
			},
			term_colors = true,
			transparent_background = false,
			integrations = {
				notify = true
			}
		})
	end
}
