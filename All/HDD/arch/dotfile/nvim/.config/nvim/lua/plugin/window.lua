-- https://github.com/mrjones2014/smart-splits.nvim?tab=readme-ov-file#configuration
-- https://github.com/kwkarlwang/bufresize.nvim?tab=readme-ov-file#default-configuration
return {
	{
		"mrjones2014/smart-splits.nvim",
		event = { "WinEnter", "BufEnter" },
		dependencies = {
			"kwkarlwang/bufresize.nvim",
		},
		version = ">=1.0.0",
		config = function ()
			local smart_splits = require("smart-splits")
			local bufresize = require("bufresize")

			bufresize.setup({})
			smart_splits.setup({
				ignored_buftypes = {
					-- "neo-tree"
				},
				ignored_filetypes = {
					-- "neo-tree"
				},
				default_amout = 1,
				move_cursor_same_row = false,
				resize_mode = {
					quit_key = "<esc>",
					resize_keys = { "h", "j", "k", "l" },
					silent = false,
					hooks = {
						on_enter = function ()
						end,
						on_leave = function ()
							bufresize.register()
						end
					},
					ignored_events = {}
				}
			})
		end
	},
	{
		"anuvyklack/windows.nvim",
		cmd = {
			"WindowsToggleAutowidth",
			"WindowsMaximize",
			"WindowsMaximizeHorizontally",
			"WindowsMaximizeVertically",
			"WindowsEqualize"
		},
		dependencies = {
			"anuvyklack/middleclass",
			"anuvyklack/animation.nvim"
		},
		opts = {
			autowidth = {
				enable = true,
				winwidth = 5,
				filetype = {
					help = 2
				}
			},
			ignore = {
				buftype = {
					"quickfix"
				},
				filetype = {
					"NvimTree",
					"neo-tree",
					"undotree",
					"gundo"
				}
			},
			animation = {
				enable = true,
				duration = 300,
				fps = 60,
				easing = "in_out_sine"
			}
		}
	}
}
