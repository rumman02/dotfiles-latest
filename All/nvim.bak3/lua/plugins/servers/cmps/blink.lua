return {
	"saghen/blink.cmp",
	enabled = require("plugins.controller").servers.cmps.blink,
	version = "1.*",
	event = {
		"InsertEnter",
		"CmdlineEnter",
	},
	dependencies = {
		"rafamadriz/friendly-snippets",
		{
			"Kaiser-Yang/blink-cmp-dictionary",
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
		},
	},
	opts = function()
		local icons = require("lib.icons")
		return {
			keymap = {
				preset = "none", -- disables all default keymaps

				["<c-j>"] = { "select_next", "fallback_to_mappings" },
				["<c-k>"] = { "select_prev", "fallback_to_mappings" },
				["<c-n>"] = {
					function(cmp)
						cmp.select_next({ auto_insert = true })
						return true
					end,
					"fallback",
				},
				["<c-p>"] = {
					function(cmp)
						cmp.select_prev({ auto_insert = true })
						return true
					end,
					"fallback",
				},

				["<c-h>"] = { "hide", "fallback" },
				["<c-l>"] = { "show_documentation", "hide_documentation", "fallback" },

				["<c-u>"] = { "scroll_documentation_up", "fallback" },
				["<c-d>"] = { "scroll_documentation_down", "fallback" },

				["<c-i>"] = { "show_signature", "hide_signature", "fallback" },

				["<c-space>"] = { "show", "hide", "fallback" },
				["<c-cr>"] = { "accept", "fallback" },

				["<tab>"] = { "snippet_forward", "fallback" },
				["<s-tab>"] = { "snippet_backward", "fallback" },
			},
			appearance = {
				-- kind_icons = icons.kind,
				nerd_font_variant = "mono",
				use_nvim_cmp_as_default = false,
			},
			completion = {
				keyword = {
					range = "prefix",
				},
				list = {
					selection = {
						auto_insert = false,
					},
				},
				documentation = {
					auto_show = false,
					window = {
						border = "rounded",
					},
				},
				menu = {
					min_width = 1,
					max_height = 15,
					border = "rounded",
					scrolloff = 0,
					draw = {
						align_to = "cursor",
						padding = 1, -- padding between border and contents
						gap = 2, -- padding between elements
						treesitter = { "lsp" },
						columns = { { "label", "label_description", gap = 2 }, { "kind_icon", "kind", gap = 2 } },

						-- components = {
						-- 	kind_icon = {
						-- 		ellipsis = false,
						-- 		text = function(ctx)
						-- 			return ctx.kind_icon .. ctx.icon_gap
						-- 		end,
						-- 		-- Set the highlight priority to 20000 to beat the cursorline's default priority of 10000
						-- 		highlight = function(ctx)
						-- 			return { { group = ctx.kind_hl, priority = 20000 } }
						-- 		end,
						--
						-- 		-- text = function(ctx)
						-- 		--   local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
						-- 		--   return kind_icon
						-- 		-- end,
						-- 		-- highlight = function(ctx)
						-- 		--   -- return (
						-- 		--     -- require("blink.cmp.completion.windows.render.tailwind").get_hl(ctx)
						-- 		--     -- or "BlinkCmpKind"
						-- 		--     -- ) .. ctx.kind
						-- 		--     local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
						-- 		--     return hl
						-- 		-- end,
						-- 	},
						-- 	kind = {
						-- 		ellipsis = true,
						-- 		width = { fill = true },
						-- 		text = function(ctx)
						-- 			return ctx.kind
						-- 		end,
						-- 		highlight = function(ctx)
						-- 			return ctx.kind_hl
						-- 		end,
						-- 	},
						-- },
					},
					-- Displays a preview of the selected item on the current line
				},
				ghost_text = {
					enabled = true,
					-- Show the ghost text when an item has been selected
					show_with_selection = true,
					-- Show the ghost text when no item has been selected, defaulting to the first item
					show_without_selection = false,
					-- Show the ghost text when the menu is open
					show_with_menu = true,
					-- Show the ghost text when the menu is closed
					show_without_menu = true,
				},
			},
			sources = {
				default = {
					"dictionary",
					"lsp",
					"path",
					"snippets",
					"buffer",
				},
				providers = {
					dictionary = {
						module = "blink-cmp-dictionary",
						name = "Dict",
						-- Make sure this is at least 2.
						-- 3 is recommended
						min_keyword_length = 3,
						opts = {},
					},
				},
			},
			signature = {
				enabled = false,
				window = {
					border = "rounded",
				},
			},
			cmdline = {
				keymap = {
					preset = "inherit",
					["<c-cr>"] = { "select_accept_and_enter", "fallback" },
				},
				completion = {
					menu = { auto_show = true },
					ghost_text = { enabled = true },
				},
			},
			term = {
				enabled = false,
				keymap = { preset = "inherit" }, -- Inherits from top level `keymap` config when not set
				sources = {},
				completion = {
					trigger = {
						show_on_blocked_trigger_characters = {},
						show_on_x_blocked_trigger_characters = nil, -- Inherits from top level `completion.trigger.show_on_blocked_trigger_characters` config when not set
					},
					-- Inherits from top level config options when not set
					list = {
						selection = {
							-- When `true`, will automatically select the first item in the completion list
							preselect = nil,
							-- When `true`, inserts the completion item automatically when selecting it
							auto_insert = nil,
						},
					},
					-- Whether to automatically show the window when new completion items are available
					menu = { auto_show = true },
					-- Displays a preview of the selected item on the current line
					ghost_text = { enabled = true },
				},
			},
		}
	end,
}
