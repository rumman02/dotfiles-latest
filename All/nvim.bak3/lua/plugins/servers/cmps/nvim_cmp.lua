return {
	"hrsh7th/nvim-cmp",
	enabled = require("plugins.controller").servers.cmps.nvim_cmp,
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
}
