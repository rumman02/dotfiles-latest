return {
	"ibhagwan/fzf-lua",
	enabled = require("plugins.controller").finders.fzf_lua,
	cmd = { "FzfLua" },
	dependencies = {},
	keys = function()
		local keymap = require("plugins.finders.keymap").fzf_key
		return require("lib.functions").convertKeys(keymap)
	end,
	opts = function()
		local utils = require("lib.utils")
		return {
			winopts = {
				height = utils.ui.float.height,
				width = utils.ui.float.width,
				border = utils.ui.border,
				preview = {
					border = utils.ui.border,
					wrap = utils.options.wrap,
					title_pos = utils.ui.title_position,
				},
			},
		}
	end,
	config = function(_, opts)
		local actions = require("fzf-lua.actions")
		require("fzf-lua").setup({
			keymap = {
				fzf = {
					["ctrl-a"] = "toggle-all",
				},
			},
			actions = {
				files = {
					["ctrl-q"] = actions.file_sel_to_qf,
				},
			},
		})
		require("fzf-lua").setup({
			keymap = {
				fzf = {
					["ctrl-q"] = "select-all+accept",
				},
			},
		})
	end,
}
