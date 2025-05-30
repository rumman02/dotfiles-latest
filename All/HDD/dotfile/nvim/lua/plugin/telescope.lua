return {
	"nvim-telescope/telescope.nvim",
	cmd = { "Telescope" },
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim"
	},
	config = function ()
		local telescope = require("telescope")
		local telescope_themes = require("telescope.themes")
		telescope.setup({

			-- ui-select configs
			extensions = {
				["ui-select"] = {
					telescope_themes.get_dropdown({})
				}
			}
		})
		telescope.load_extension("ui-select")
	end
}
