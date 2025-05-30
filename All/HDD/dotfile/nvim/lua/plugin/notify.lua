return {
	"rcarriga/nvim-notify",
	cond = false,
	config = function ()
		local notify = require("notify")
		notify.setup({
			fps = 60,
			timeout = 1000,
		})
	end
}
