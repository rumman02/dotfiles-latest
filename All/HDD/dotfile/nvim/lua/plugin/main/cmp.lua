return {
	"hrsh7th/nvim-cmp",	-- main cmp engine
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- lsp completions
		"hrsh7th/cmp-buffer", -- buffer completions
		"hrsh7th/cmp-path", -- path completions
		"hrsh7th/cmp-cmdline", -- command-line completions
		"dmitmel/cmp-cmdline-history", -- command-line history completions
		"hrsh7th/cmp-nvim-lua", -- lua completion
		"hrsh7th/cmp-emoji", -- emoji completions, get completions by writing ":"
		"chrisgrieser/cmp-nerdfont", -- nerd font completions, get completions by writing ":" 
		{
			"saadparwaiz1/cmp_luasnip",  -- luasnip completions
			dependencies = {
				{
					"L3MON4D3/LuaSnip",	-- luasnip engine
					version = "v2.*",
					build = "make install_jsregexp", -- brew install make
					dependencies = {
						"rafamadriz/friendly-snippets", -- Predefined snippets
					}
				},
			},
		},
		{
			"uga-rosa/cmp-dictionary",
			config = function ()
				local cmp_dictionary = require("cmp_dictionary")
				cmp_dictionary.setup({
					-- paths = {"/usr/share/dict/words"},
				})
			end
		},
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local luasnip_loaders = require("luasnip.loaders.from_vscode")
		local border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")

		-- Lazy load Luasnip snippets
		luasnip_loaders.lazy_load()

		---@diagnostic disable-next-line: redundant-parameter
		cmp.setup({
			snippet = {
				-- Function to expand the snippet using LuaSnip when triggered.
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
					border = border,
					winhighlight = "Normal:Normal,FloatBorder:CmpBorder",  -- Highlight groups for normal and border
					winblend = 15,  -- Window transparency for completion window
					scrollbar = true,  -- Enable scrollbar
				},
				documentation = {
					border = border,
					winhighlight = "Normal:Normal,FloatBorder:CmpDocBorder",  -- Highlight groups for normal and border
					winblend = 15,  -- Window transparency for documentation window
					scrollbar = true,  -- Enable scrollbar
				},
			},
			-- Set completion behavior and options.
			completion = {
				completeopt = "menu,menuone,noinsert",  -- display menu
			},

			mapping = cmp.mapping.preset.insert({
				-- c-h for close
				["<C-h>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.close()
					else
						fallback()
					end
				end, { "i", "c" }),


				-- c-k for choose upper item but not insert
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


				-- c-j for choose below item but not insert
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


				-- c-p for choose upper item and insert
				["<C-p>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					else
						fallback()
					end
				end, { "i", "c" }),


				-- c-p for choose below item and insert
				["<C-n>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					else
						fallback()
					end
				end, { "i", "c" }),


				-- scroll docs upper
				["<C-b>"] = cmp.mapping.scroll_docs(-4),


				-- scroll docs lower
				["<C-f>"] = cmp.mapping.scroll_docs(4),


				-- Confirm selection in the completion menu
				["<CR>"] = cmp.mapping({
					i = function(fallback)
						if cmp.visible() then
							cmp.confirm({select = true})
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
				format = function(entry, vim_item)
					local label = vim_item.abbr
					local ellipsis_char = '…'
					local max_label_width = 40
					local min_label_width = 40
					local mode = "symbol_text" -- Values are: "text", "text_symbol", "symbol_text", or "symbol"

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
						nvim_lsp = "[LSP]",    	-- LSP completions
						buffer = "[BUFF]",     	-- Buffer completions
						path = "[PATH]",       	-- Path completions
						luasnip = "[SNIP]",    	-- LuaSnip completions
						dictionary = "[DICT]", 	-- Dictionary completions
						cmdline = "[CMD]",		-- Cmdline completions
						cmdline_history = "[HIST]", -- Cmdline history completions
						nvim_lua = "[LUA]", -- Cmdline history completions
					}

					-- Truncate or pad the label
					local truncated_label = vim.fn.strcharpart(label, 0, max_label_width)
					if truncated_label ~= label then
						vim_item.abbr = truncated_label .. ellipsis_char
					elseif string.len(label) < min_label_width then
						local padding = string.rep(' ', min_label_width - string.len(label))
						vim_item.abbr = label .. padding
					end

					-- Apply `mode` formatting logic
					if mode == "symbol" then
						vim_item.kind = kind[vim_item.kind]
					elseif mode == "symbol_text" then
						vim_item.kind = string.format(' %s %s', kind[vim_item.kind], vim_item.kind)
					elseif mode == "text_symbol" then
						vim_item.kind = string.format(' %s %s ', vim_item.kind, kind[vim_item.kind])
					end

					-- Set the completion source in the menu
					vim_item.menu = menu[entry.source.name]

					return vim_item
				end,
			},
			experimental = {
				-- Enable ghost text, which shows a faded preview of the item being completed.
				ghost_text = true,
			},
			sources = cmp.config.sources({
				{ name = "luasnip", group_index = 1 },
				{ name = "nvim_lsp", group_index = 2 },
				{
					name = "buffer",
					keyword_length = 2,
					group_index = 3,
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
				{ name = "dictionary", keyword_length = 2, group_index = 4 },
				{ name = "nvim_lua", group_index = 8 },
				{ name = "path", group_index = 9 },
				{ name = "emoji", group_index = 10 },
				{ name = "nerdfont", group_index = 11 },
			}),
			-- Setup for "/", "?" cmdline
			cmp.setup.cmdline({ "/", "?" }, {
				sources = {
					{ name = "buffer" },  -- Use buffer source for search in buffer
					{ name = "cmdline_history" },  -- Use history source for cmdline search
				},
			}),
			-- Setup for ":" cmdline
			cmp.setup.cmdline(":", {

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
