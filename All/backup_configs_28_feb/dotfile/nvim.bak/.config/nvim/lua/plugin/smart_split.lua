return {
	"mrjones2014/smart-splits.nvim",
	event = { "VeryLazy" },
	dependencies = {
		"kwkarlwang/bufresize.nvim",
	},
	config = function()
		local smart_splits = require("smart-splits")
		local bufresize = require("bufresize")
		bufresize.setup({})
		smart_splits.setup({
			resize_mode = {
				quit_key = "<ESC>",
				resize_keys = { "h", "j", "k", "l" },
				silent = true,
				hooks = {
					on_enter = function()
						vim.notify("Entered resize mode")
					end,
					on_leave = function()
						bufresize.register()
						vim.notify("Leave reszie mode")
					end,
				}
			},
			default_amount = 2 -- sets resize window as 2 lenght
		})
	end
}
