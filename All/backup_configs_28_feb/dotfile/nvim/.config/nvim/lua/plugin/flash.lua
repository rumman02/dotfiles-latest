return {
  "folke/flash.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
		search = {
			exclude = {
				"Telescope",
				"TelescopePrompt",
				"noice",
				"flash_prompt",
				"notify",
				-- function (win)
				-- 	---@diagnostic disable-next-line: undefined-field
				-- 	return not vim.api.nvim_win_get_width(win).focusable
				-- end
			}
		},
		modes = {
			char = {
				keys = {}
			}
		},
		prompt = {
			enabled = false,
			prefix = { { " " } },
		},
	},
}
