return function()
	local icons = require("lib.icons")
	local utils = require("lib.utils")
	return {
		enabled = require("plugins.controller").snacks.picker,
		layout = {
			preset = "telescope",
			cycle = false,
			layout = {
				backdrop = utils.ui.float.backdrop,
				width = utils.ui.float.width,
				height = utils.ui.float.height - 0.05,
			},
		},
		icons = {
			files = {
				enabled = true,
				dir = "󰉋 ",
				dir_open = "󰝰 ",
				file = "󰈔 ",
			},
			tree = {
				vertical = "│ ",
				middle = "│ ", -- "├╴"
				last = "╰─", -- "└╴"
			},
			git = {
				enabled = true, -- show git icons
				commit = icons.git.commit, -- used by git log
				staged = icons.git.staged, -- staged changes. always overrides the type icons
				added = icons.git.added,
				deleted = icons.git.removed,
				ignored = icons.git.ignored,
				modified = icons.git.modified,
				renamed = icons.git.renamed,
				unmerged = icons.git.unstaged,
				untracked = icons.git.untracked,
			},
			diagnostics = {
				Info = icons.diagnostics.info,
				Error = icons.diagnostics.error,
				Warn = icons.diagnostics.warn,
				Hint = icons.diagnostics.hint,
			},
			kinds = icons.kind,
		},
		sources = {
			explorer = {
				tree = true,
				auto_close = false,
				win = {
					list = {
						keys = {
							["<"] = "explorer_up",
							["l"] = "confirm",
							["h"] = "explorer_close",
						},
					},
				},
			},
		},
	}
end
