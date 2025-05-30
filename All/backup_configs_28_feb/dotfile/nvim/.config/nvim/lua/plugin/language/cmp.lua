-- plugin: https://github.com/hrsh7th/nvim-cmp
-- plugin: https://github.com/hrsh7th/cmp-buffer
-- plugin: https://github.com/hrsh7th/cmp-nvim-lsp
-- plugin: https://github.com/hrsh7th/cmp-cmdline
-- plugin: https://github.com/dmitmel/cmp-cmdline-history
-- plugin: https://github.com/epwalsh/obsidian.nvim
-- plugin: https://github.com/uga-rosa/cmp-dictionary
-- plugin: https://github.com/hrsh7th/cmp-path
-- plugin: https://github.com/hrsh7th/cmp-emoji
-- plugin: https://github.com/chrisgrieser/cmp-nerdfont

-- plugin: https://github.com/windwp/nvim-autopairs
-- config: https://github.com/windwp/nvim-autopairs?tab=readme-ov-file#default-values

return {
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"dmitmel/cmp-cmdline-history",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-emoji",
		"chrisgrieser/cmp-nerdfont",
		"uga-rosa/cmp-dictionary",
		{
			"saadparwaiz1/cmp_luasnip",
			dependencies = {
				{
					"L3MON4D3/LuaSnip",
					version = "v2.*",
					build = "make install_jsregexp",
					dependencies = {
						"rafamadriz/friendly-snippets",
					}
				},
			},
		},
		{ "windwp/nvim-autopairs" },
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp_style = {
			border = CMP_BORDERCHARS,
			winblend = WINBLEND,
			scrollbar = true
		}

		-- Lazy load Luasnip snippets
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			snippet = {
				-- function to expand the snippet using LuaSnip when triggered.
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end
			},
			view = {
				docs = {
					auto_open = false -- disable auto open docs
				},
				entries = {
					follow_cursor = true -- cmp window follow the cursor
				}
			},
			-- cmp window & documentation styles
			window = {
				completion = {
					border = cmp_style.border,
					winhighlight = "Normal:Normal,FloatBorder:CmpBorder",  -- Highlight groups for normal and border
					winblend = cmp_style.winblend,  -- Window transparency for completion window
					scrollbar = cmp_style.scrollbar,  -- Enable scrollbar
				},
				documentation = {
					border = cmp_style.border,
					winhighlight = "Normal:Normal,FloatBorder:CmpDocBorder",  -- Highlight groups for normal and border
					winblend = cmp_style.winblend,  -- Window transparency for documentation window
					scrollbar = cmp_style.scrollbar,  -- Enable scrollbar
				},
			},
			-- Set completion behavior and options.
			completion = {
				completeopt = "menu,menuone,noinsert",  -- display menu
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
				["<C-l>"] = cmp.mapping(function(fallback)
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

				-- c-j & c-n for choose below item select and insert
				["<C-j>"] = cmp.mapping({
					i = function (fallback)
						if cmp.visible() then
							cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
						else
							fallback()
						end
					end,
					c = function (fallback)
						if cmp.visible() then
							cmp.select_next_item()
						else
							fallback()
						end
					end
				}),
				["<C-n>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
					else
						fallback()
					end
				end, { "i", "c" }),

				-- c-k & c-p for choose upper item select and insert
				["<C-k>"] = cmp.mapping({
					i = function (fallback)
						if cmp.visible() then
							cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
						else
							fallback()
						end
					end,
					c = function (fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						else
							fallback()
						end
					end
				}),
				["<C-p>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
					else
						fallback()
					end
				end, { "i", "c" }),


				-- scroll docs upper and lower
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-u>"] = cmp.mapping.scroll_docs(-2),
				["<C-d>"] = cmp.mapping.scroll_docs(2),

				-- Confirm selection in the completion menu insert and replace
				["<CR>"] = cmp.mapping({
					i = function(fallback)
						if cmp.visible() then
							cmp.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert })
						else
							fallback()
						end
					end,
					c = function(fallback)
						if cmp.visible() then
							cmp.confirm({ select = true })  -- Confirm selection with Enter key
						else
							fallback()  -- If no selection, fallback to default Enter behavior
						end
					end
				}),
				["<S-CR>"] = cmp.mapping({
					i = function(fallback)
						if cmp.visible() then
							cmp.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace })
						else
							fallback()
						end
					end,
					c = function(fallback)
						if cmp.visible() then
							cmp.confirm({ select = true })  -- Confirm selection with Enter key
						else
							fallback()  -- If no selection, fallback to default Enter behavior
						end
					end
				}),
				-- handle Tab key for completion or snippet expansion
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.confirm({ select = true }) -- Confirm selection in the completion menu
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump() -- Expand or jump in snippet
					else
						fallback() -- Fallback to default behavior
					end
				end, { "i", "s" }),

			}),

			formatting = {
				fields = { "abbr", "kind", "menu" }, -- values are : "kind", "abbr", "menu" and this is the format of cmp item showing style
				format = function(entry, item)
					local label = item.abbr
					local ellipsis_char = '…'
					local max_label_width = 40
					local min_label_width = 40
					local mode = "symbol_text" -- Values are: "text", "text_symbol", "symbol_text", or "symbol"
					local color_item = require("nvim-highlight-colors").format(entry, { kind = item.kind })

					-- Define the kind icons
					local kind = {
						Text = "󰉿 ",          -- Plain text
						Method = "󰆧 ",        -- Method
						Function = "󰊕 ",      -- Function
						Constructor = " ",   -- Constructor
						Field = " ",         -- Field
						Variable = "󰀫 ",      -- Variable
						Class = "󰠱 ",        -- Class
						Interface = " ",     -- Interface
						Module = " ",        -- Module
						Property = "󰜢 ",      -- Property
						Unit = "󰑭 ",         -- Unit
						Value = "󰎠 ",        -- Value
						Enum = " ",          -- Enum
						Keyword = "󰌋 ",      -- Keyword
						Snippet = " ",      -- Snippet
						Color = "󰏘 ",        -- Color
						File = "󰈙 ",         -- File
						Reference = " ",    -- Reference
						Folder = "󰉋 ",       -- Folder
						EnumMember = " ",   -- Enum Member
						Constant = "󰏿 ",    -- Constant
						Struct = "󰙅 ",      -- Struct
						Event = " ",        -- Event
						Operator = "󰆕 ",    -- Operator
						TypeParameter = "󰊄 ",-- Type Parameter
						Misc = " ",         -- Miscellaneous
					}

					-- Define the menu items
					local menu = {
						nvim_lsp = "[LSP]", -- LSP completions
						buffer = "[BUFF]",-- Buffer completions
						path = "[PATH]", -- Path completions
						luasnip = "[SNIP]",	-- LuaSnip completions
						cmdline = "[CMD]", -- Cmdline completions
						cmdline_history = "[HIST]", -- Cmdline history completions
						nvim_lua = "[LUA]", -- Cmdline history completions
						color_item = "[COL]" -- color highlight
					}

					-- Truncate or pad the label
					local truncated_label = vim.fn.strcharpart(label, 0, max_label_width)
					if truncated_label ~= label then
						item.abbr = truncated_label .. ellipsis_char
					elseif string.len(label) < min_label_width then
						local padding = string.rep(' ', min_label_width - string.len(label))
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
						item.kind = string.format(' %s %s', kind[item.kind], item.kind)
						if color_item.abbr_hl_group then
							item.kind_hl_group = color_item.abbr_hl_group
							item.kind = string.format('%s %s', item.kind, color_item.abbr)
						end
					elseif mode == "text_symbol" then
						item.kind = string.format(' %s %s ', item.kind, kind[item.kind])
						if color_item.abbr_hl_group then
							item.kind_hl_group = color_item.abbr_hl_group
							item.kind = string.format(' %s %s ', color_item.abbr, item.kind )
						end
					end

					-- Set the completion source in the menu
					item.menu = menu[entry.source.name]

					return item
				end,
			},
			experimental = {
				-- Enable ghost text, which shows a faded preview of the item being completed.
				ghost_text = true,
			},
			---@diagnostic disable-next-line: undefined-field
			sources = cmp.config.sources({
				{ name = "luasnip" },
				{ name = "nvim_lsp", keyword_length = 2 },
				{ name = "dictionary", keyword_length = 2},
				{
					name = "buffer",
					keyword_length = 2,
					option = {
						get_bufnrs = function()
							local bufs = {}
							for _, win in ipairs(vim.api.nvim_list_wins()) do
								bufs[vim.api.nvim_win_get_buf(win)] = true
							end
							return vim.tbl_keys(bufs)
						end,
					}
				},
				{ name = "nvim_lua" },
				{ name = "path" },
				{ name = "emoji" },
				{ name = "nerdfont" },
			}),
			-- Setup for "/", "?" cmdline
			cmp.setup.cmdline({ "/", "?" }, {
				---@diagnostic disable-next-line: undefined-field
				sources = cmp.config.sources({
					{ name = "buffer" },  -- Use buffer source for search in buffer
					{ name = "cmdline_history" },  -- Use history source for cmdline search
				}),
			}),
			-- Setup for ":" cmdline
			cmp.setup.cmdline(":", {
				---@diagnostic disable-next-line: undefined-field
				sources = cmp.config.sources({
					{ name = "cmdline" },  -- Use cmdline source for completion
					{ name = "cmdline_history" },  -- Use history source for command-line mode
					{ name = "path" }  -- Use path source for file paths
				}),
				matching = { disallow_symbol_nonprefix_matching = false }
			})
		})
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end
}
