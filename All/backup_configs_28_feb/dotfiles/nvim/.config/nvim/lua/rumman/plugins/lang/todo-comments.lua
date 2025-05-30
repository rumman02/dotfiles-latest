local todo_comments = require("todo-comments")

local icons = require("rumman.lib.icons")

todo_comments.setup({
	keywords = {
		FIX = {
			icon = icons.ui.Bug, -- icon used for the sign, and in search results
			color = "error", -- can be a hex color, or a named color (see below)
			alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, --[[ a set of other
			keywords that all map to this FIX keywords ]]
		},
		TODO = {
			icon = icons.ui.Check,
			color = "info",
		},
		HACK = {
			icon = icons.ui.Fire,
			color = "warning",
		},
		WARN = {
			icon = icons.diagnostics.Warning,
			color = "warning",
			alt = { "WARNING", "XXX" },
		},
		PERF = {
			icon = icons.ui.SpeedMeter,
			alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
		NOTE = {
			icon = icons.ui.Note,
			color = "hint",
			alt = { "INFO" },
		},
		TEST = {
			icon = icons.ui.Test,
			color = "test",
			alt = { "TESTING", "PASSED", "FAILED" },
		},
	},
})

