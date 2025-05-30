return {
	"folke/which-key.nvim",
	event = { "VeryLazy" },
	config = function()
		local which_key = require("which-key")
		require("keymap.main")

		which_key.setup({
			preset = "classic",
			delay = 0,
			notify = true,
			triggers = {
				{ "<auto>", mode = "nicvxso" },
				{ "<leader>", mode = "nicvxso" },
				{ "s", mode = "nicvxso" },
				{ "\\", mode = "nicvxso" },
			},
			win = {
				no_overlap = false,
				border = "rounded",
				title_pos = "center",
			},
			replace = {
				key = {
					{ "<Space>", "Leader" },
				},
			},
			icons = {
				breadcrumb = " ",
				separator = " ",
				group = "+",
				rules = false, -- removes defaults icons
			},
			disable = {
				ft = {"alpha"},
			},
		})
	end
}
