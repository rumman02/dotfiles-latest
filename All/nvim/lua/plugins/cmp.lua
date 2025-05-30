return {
	{
		"saghen/blink.cmp",
		enabled = require("plug_controller").cmp.blink_cmp,
		version = "1.*",
		event = {
			"InsertEnter",
			"CmdlineEnter",
		},
		dependencies = {
			"rafamadriz/friendly-snippets",
			{
				"Kaiser-Yang/blink-cmp-dictionary",
				dependencies = "nvim-lua/plenary.nvim",
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
	},

	{
		"hrsh7th/nvim-cmp",
		enabled = require("plug_controller").cmp.nvim_cmp,
		event = {
			"InsertEnter",
			"CmdlineEnter",
		},
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp",
			"brenoprata10/nvim-highlight-colors",
			"uga-rosa/cmp-dictionary",
			"hrsh7th/cmp-emoji",
			"chrisgrieser/cmp-nerdfont",
			"windwp/nvim-autopairs",
			{
				"saadparwaiz1/cmp_luasnip",
				dependencies = {
					"L3MON4D3/LuaSnip",
					version = "v2.*",
					build = "make install_jsregexp",
					dependencies = {
						"rafamadriz/friendly-snippets",
					},
					config = function()
						require("luasnip.loaders.from_vscode").lazy_load()
					end,
				},
			},
		},
		config = function()
			local cmp = require("cmp")
			local icons = require("lib.icons")
			local luasnip = require("luasnip")

			---@diagnostic disable-next-line
			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				view = {
					docs = {
						auto_open = false, -- disable auto open docs
					},
					entries = {
						follow_cursor = true, -- cmp window follow the cursor
					},
				},

				-- cmp window & documentation styles
				window = {
					completion = {
						border = "rounded",
						scrollbar = true,
						winblend = 0,
						winhighlight = "Normal:Normal,FloatBorder:CmpBorder",
					},
					documentation = {
						border = "rounded",
						scrollbar = true,
						winblend = 0,
						winhighlight = "Normal:Normal,FloatBorder:CmpDocBorder",
					},
				},

				-- Set completion behavior and options.
				completion = {
					completeopt = "menu,menuone,noinsert",
				},

				mapping = cmp.mapping.preset.insert({

					-- c-h for close cmp menu
					["<C-h>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.close()
						else
							fallback()
						end
					end, { "i", "c" }),

					-- c-l for shows available docs
					["<c-l>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							if cmp.visible_docs() then
								cmp.close_docs()
							else
								cmp.open_docs()
							end
						else
							fallback()
						end
					end, { "i", "c" }),

					-- c-j for choose below item (select)
					["<c-j>"] = cmp.mapping({
						i = function(fallback)
							if cmp.visible() then
								cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
							else
								fallback()
							end
						end,
						c = function(fallback)
							if cmp.visible() then
								cmp.select_next_item()
							else
								fallback()
							end
						end,
					}),

					-- c-space for toggle cmp menu
					["<c-space>"] = cmp.mapping(function()
						if cmp.visible() then
							cmp.close()
						else
							cmp.complete()
						end
					end, { "i", "c", "s" }),

					-- c-n for choose below item (insert)
					["<c-n>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
						else
							fallback()
						end
					end, { "i", "c" }),

					-- c-k for choose above item (select)
					["<c-k>"] = cmp.mapping({
						i = function(fallback)
							if cmp.visible() then
								cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
							else
								fallback()
							end
						end,
						c = function(fallback)
							if cmp.visible() then
								cmp.select_prev_item()
							else
								fallback()
							end
						end,
					}),

					-- c-p for choose above item (insert)
					["<c-p>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
						else
							fallback()
						end
					end, { "i", "c" }),

					-- scroll docs up and down (step 4)
					["<c-b>"] = cmp.mapping.scroll_docs(-4),
					["<c-f>"] = cmp.mapping.scroll_docs(4),

					-- Scroll docs up and down (step 2)
					["<c-u>"] = cmp.mapping.scroll_docs(-2),
					["<c-d>"] = cmp.mapping.scroll_docs(2),

					-- confirm selection in the completion menu (insert)
					["<c-cr>"] = cmp.mapping({
						i = function(fallback)
							if cmp.visible() then
								cmp.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert })
							else
								fallback()
							end
						end,
						c = function(fallback)
							if cmp.visible() then
								cmp.confirm({ select = true }) -- Confirm selection with Enter key
							else
								fallback()
							end
						end,
					}),

					-- Confirm selection in the completion menu (replace)
					["<s-cr>"] = cmp.mapping({
						i = function(fallback)
							if cmp.visible() then
								cmp.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace })
							else
								fallback()
							end
						end,
						c = function(fallback)
							if cmp.visible() then
								cmp.confirm({ select = true }) -- Confirm selection with Enter key
							else
								fallback()
							end
						end,
					}),

					-- handle Tab key for completion or snippet expansion
					["<tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.confirm({ select = true }) -- Confirm selection in the completion menu
						---@diagnostic disable-next-line: undefined-field
						elseif luasnip.expand_or_jumpable() then
							---@diagnostic disable-next-line: undefined-field
							luasnip.expand_or_jump() -- Expand or jump in snippet
						else
							fallback()
						end
					end, { "i", "s" }),
				}),

				formatting = {
					fields = { "abbr", "kind", "menu" }, --[[ values are : "kind", "abbr",
			"menu" and this is the format of cmp item showing style ]]
					format = function(entry, item)
						local label = item.abbr
						local ellipsis_char = "…"
						local max_label_width = 100
						local min_label_width = 1
						local mode = "symbol_text" --[[ Values are: "text", "text_symbol",
				"symbol_text", or "symbol" ]]
						local color_item = require("nvim-highlight-colors").format(entry, {
							kind = item.kind,
						})

						-- Define the kind icons
						local kind = icons.kind

						-- Define the menu items
						local menu = {}

						-- Truncate or pad the label
						local truncated_label = vim.fn.strcharpart(label, 0, max_label_width)
						if truncated_label ~= label then
							item.abbr = truncated_label .. ellipsis_char
						elseif string.len(label) < min_label_width then
							local padding = string.rep(" ", min_label_width - string.len(label))
							item.abbr = label .. padding
						end

						-- Apply `mode` formatting logic
						if mode == "symbol" then
							item.kind = kind[item.kind]
							if color_item.abbr_hl_group then
								item.kind_hl_group = color_item.abbr_hl_group
								item.kind = item.kind
							end
						elseif mode == "symbol_text" then
							item.kind = string.format(" %s %s", kind[item.kind], item.kind)
							if color_item.abbr_hl_group then
								item.kind_hl_group = color_item.abbr_hl_group
								item.kind = string.format("%s %s", item.kind, color_item.abbr)
							end
						elseif mode == "text_symbol" then
							item.kind = string.format(" %s %s ", item.kind, kind[item.kind])
							if color_item.abbr_hl_group then
								item.kind_hl_group = color_item.abbr_hl_group
								item.kind = string.format(" %s %s ", color_item.abbr, item.kind)
							end
						end

						-- Set the completion source in the menu
						item.menu = menu[entry.source.name]

						return item
					end,
				},
				experimental = {
					--[[ Enable ghost text, which shows a faded preview of the item being
			completed ]]
					ghost_text = true,
				},
				---@diagnostic disable-next-line: undefined-field
				sources = cmp.config.sources({
					{ name = "render-markdown" },
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "dictionary" },
					{
						name = "buffer",
						option = {
							get_bufnrs = function()
								local bufs = {}
								for _, win in ipairs(vim.api.nvim_list_wins()) do
									bufs[vim.api.nvim_win_get_buf(win)] = true
								end
								return vim.tbl_keys(bufs)
							end,
						},
					},
					{ name = "nvim_lua" },
					{ name = "path" },
					{ name = "emoji" },
					{ name = "nerdfont" },
				}),

				-- Setup for "/", "?" cmdline
				---@diagnostic disable-next-line: undefined-field
				cmp.setup.cmdline({ "/", "?" }, {
					sources = cmp.config.sources({
						{ name = "buffer" },
					}),
				}),

				-- Setup for ":" cmdline
				---@diagnostic disable-next-line: undefined-field
				cmp.setup.cmdline(":", {
					sources = cmp.config.sources({
						{ name = "path" },
						{ name = "cmdline" },
					}),
					matching = { disallow_symbol_nonprefix_matching = false },
				}),
			})

			cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
		end,
	},
}
