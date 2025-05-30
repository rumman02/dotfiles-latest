return {
	{
		-- https://github.com/windwp/nvim-autopairs?tab=readme-ov-file#default-values
		"windwp/nvim-autopairs",
		event = { "InsertEnter", "CmdlineEnter" },
		opts = {
			disable_filetype = { "TelescopePrompt", "spectre_panel" },
			disable_in_replace_mode = true,
			map_bs = true, -- <BS>
			map_c_h = false, -- <c-h>
			map_c_w = false
		}
	},
	{
		-- https://github.com/altermo/ultimate-autopair.nvim
		"altermo/ultimate-autopair.nvim",
		event={ "InsertEnter", "CmdlineEnter" },
		branch="v0.6",
		opts = {
			extensions = {
				cmdtype = {
					skip = {
						"/", "?", "@", "-", ":"
					},
					p = 100
				}
			}
		}
	},
	{
		"windwp/nvim-ts-autotag",
		-- event = { "BufReadPre", "BufNewFile" },
		opts = {}
	}
}
