return {
	"rcarriga/nvim-notify",
	event = { "VeryLazy" },
	opts = {
		-- background_colour = "NotifyBackground",
		fps = 60,
		icons = {
      DEBUG = "",
      ERROR = "",
      INFO = "",
      TRACE = "✎",
      WARN = ""
		},
		minimum_width = 10,
		render = "compact",
		stages = "slide",
		time_formats = {
			notification = "%T",
			notification_history = "%FT%T"
		},
		timeout = 5000,
		animate = true,
	}
}
