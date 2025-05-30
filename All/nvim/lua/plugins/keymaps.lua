return {
	{
		"folke/which-key.nvim",
		enabled = require("plug_controller").keymaps.which_key,
		event = "VeryLazy",
		opts = function()
			local utils = require("lib.utils")
			return {
				preset = "helix",
				delay = utils.delay.which_key,
				triggers = {
					{ "<auto>", mode = "nicvxso" },
					-- { "gc", mode = "o" },
				},
				replace = {
					key = {
						{ "<Space>", "󱁐" },
						{ "<Esc>", "󱊷" },
						{ "<BS>", "󱞳" },
					},
				},
				spec = {
					{ "<leader><leader>", "", desc = "More.." },
					{ "<localleader><localleader>", "", desc = "More.." },
				},
				layout = {
					spacing = 1,
				},
				icons = {
					breadcrumb = "",
					separator = "",
					group = "",
					rules = false,
				},
				disable = {
					ft = {
						alpha,
					},
				},
			}
		end,
	},
	{
		"nvimtools/hydra.nvim",
		enabled = require("plug_controller").keymaps.hydra,
		event = "VeryLazy",
		opts = {
			hint = {
				show_name = true,
				position = { "middle" },
				offset = 0,
				float_opts = {
					border = "rounded",
				},
			},
		},
		-- config = function()
		--     require("hydra").setup({
		--     })
		-- end,
	},
}
