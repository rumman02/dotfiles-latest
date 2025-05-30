local notify = require("notify")
local utils = require("rumman.lib.utils")
local icons = require("rumman.lib.icons")

notify.setup({
	render = "minimal",
	icons = {
		DEBUG = " " .. icons.ui.Bug,
		ERROR = " " .. icons.diagnostics.Error,
		INFO = " " .. icons.diagnostics.Information,
		TRACE = " " .. icons.ui.LocationArrow,
		WARN = " " .. icons.diagnostics.Warning,
	},
	minimum_width = utils.completeopt.min_width,
	stages = "slide",
	time_formats = {
		notification = "%I:%M %p",
		notification_history = "%Y-%m-%d %I:%M %p",
	},
	fps = utils.refresh_rate,
	timeout = 2000,
	animate = true,
})

