local fidget = require("fidget")
local icons = require("rumman.lib.icons")

fidget.setup({
	progress = {
		ignore_done_already = true,
		display = {
			done_icon = icons.ui.Check,
		}
	},
})

