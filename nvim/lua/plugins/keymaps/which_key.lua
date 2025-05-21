return {
	"folke/which-key.nvim",
	enabled = require("plugins.controller").keymap.which_key,
	event = {
		"VeryLazy",
	},
	opts = function()
		local utils = require("lib.utils")
		return {
			preset = "helix",
			delay = utils.options.wk_popup, -- delay for showing popup
			triggers = {
				{ "<auto>", mode = "nicvxso" },
				{ "s", mode = "nv" },
			},
			replace = {
				key = {
					{ "<Space>", "󱁐" },
					{ "<Esc>", "󱊷" },
					{ "<BS>", "󱞳" },
				},
			},
			spec = {
				{ "<leader><leader>", "", desc = "More" },
			},
			win = {
				no_overlap = true,
				padding = { 0, 1 },
				border = "rounded",
				title_pos = "center",
			},
			layout = {
				spacing = 1,
			},
			-- sort = { "group", "alphanum" },
			expand = 0, -- expand groups when <= n mappings
			icons = {
				breadcrumb = "",
				separator = "",
				group = "",
				rules = false,
			},
			disable = {
				ft = {
					-- "alpha"
				},
			},
		}
	end,
}
