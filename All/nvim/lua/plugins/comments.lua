local comment_key = {
	["g"] = {
		-- desc = "g",
		b = { cmd = "<Plug>(comment_toggle_blockwise)", desc = "Comment (block)" },
		b = { cmd = "<Plug>(comment_toggle_blockwise_count)", desc = "Comment (block)", mode = "v" },
		b = {
			-- desc = "Comment",
			A = {
				cmd = function()
					require("Comment.api").insert.blockwise.eol()
				end,
				desc = "End",
			},
			b = { cmd = "<Plug>(comment_toggle_blockwise_count)", desc = "Current" },
			o = {
				cmd = function()
					require("Comment.api").insert.blockwise.below()
				end,
				desc = "Below",
			},
			O = {
				cmd = function()
					require("Comment.api").insert.blockwise.above()
				end,
				desc = "Above",
			},
		},
		c = { cmd = "<Plug>(comment_toggle_linewise)", desc = "Comment (line)" },
		c = { cmd = "<Plug>(comment_toggle_linewise)", desc = "Comment (line)", mode = "v" },
		c = {
			-- desc = "Comment",
			A = {
				cmd = function()
					require("Comment.api").insert.linewise.eol()
				end,
				desc = "End",
			},
			c = { cmd = "<Plug>(comment_toggle_linewise_current)", desc = "Current" },
			o = {
				cmd = function()
					require("Comment.api").insert.linewise.below()
				end,
				desc = "Below",
			},
			O = {
				cmd = function()
					require("Comment.api").insert.linewise.above()
				end,
				desc = "Above",
			},
		},
	},
}

return {
	{
		"numToStr/Comment.nvim",
		enabled = require("plug_controller").comments.comment,
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		keys = require("lib.func").convertKeys(comment_key),
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},
	{
		"folke/todo-comments.nvim",
		enabled = require("plug_controller").comments.todo_comment,
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		dependencies = "nvim-lua/plenary.nvim",
		opts = {
			keywords = {
				FIX = {
					icon = " ", -- icon used for the sign, and in search results
					color = "error", -- can be a hex color, or a named color (see below)
					alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
					-- signs = false, -- configure signs for some keywords individually
				},
				TODO = {
					icon = " ",
					color = "info",
				},
				HACK = {
					icon = " ",
					color = "warning",
				},
				WARN = {
					icon = " ",
					color = "warning",
					alt = { "WARNING", "XXX" },
				},
				PERF = {
					icon = " ",
					alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" },
				},
				NOTE = {
					icon = " ",
					color = "hint",
					alt = { "INFO" },
				},
				TEST = {
					icon = "󰚭 ",
					color = "test",
					alt = { "TESTING", "PASSED", "FAILED" },
				},
			},
			gui_style = {
				fg = "NONE",
				bg = "BOLD",
			},
		},
	},
	{},
}
