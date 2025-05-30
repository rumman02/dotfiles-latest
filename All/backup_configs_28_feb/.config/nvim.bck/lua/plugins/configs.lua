local M = {}
local icons = require("lib.icons")
local utils = require("lib.utils")

-------------------------------------------------------------------------------
-- tokyonight
-------------------------------------------------------------------------------
M.tokyonight = function()
	require("tokyonight").setup({
		style = "night",
		light_style = "day",
		styles = {
			comments = { italic = true },
			keywords = { italic = true },
			functions = { italic = false },
			variables = { italic = false },
			sidebars = "dark",
			floats = "transparent",
		},
		day_brightness = 0.3,
		dim_inactive = false,
		lualine_bold = true,
		cache = true,
	})
end

-------------------------------------------------------------------------------
-- gruvbox
-------------------------------------------------------------------------------
M.gruvbox = function()
	require("gruvbox").setup({
		contrast = "",
		overrides = {
			SignColumn = { bg = "none" },
			FlashLabel = { fg = "#fabd2f" },
			DiagnosticSignError = { fg = "#fb4934", bg = "none" },
			DiagnosticSignHint = { fg = "#8ec07c", bg = "none" },
			DiagnosticSignWarn = { fg = "#fabd2f", bg = "none" },
			MiniIndentscopeSymbol = { fg = "#fe8019", bg = "none" },
			WinSeparator = { fg = "#212121", bg = "none" },
			NeoTreeNormal = { fg = "none", bg = "#212121" },
			NeoTreeNormalNC = { fg = "none", bg = "#212121" },
			TelescopeTitle = { fg = "#665c54", bg = "none" },
			TelescopeResultsBorder = { fg = "#665c54", bg = "none" },
			TelescopePreviewBorder = { fg = "#665c54", bg = "none" },
			TelescopePromptBorder = { fg = "#665c54", bg = "none" },
			WhichKeyBorder = { fg = "#665c54", bg = "none" },
			WhichKeyNormal = { fg = "#665c54", bg = "none" },
			TroubleNormal = { fg = "none", bg = "#212121" },
			TroubleNormalNC = { fg = "none", bg = "#212121" },
			TroubleCount = { fg = "#b8bb26", bg = "#212121" },
			MarkSignNumHL = { fg = "#665c54", bg = "none" },
			Folded = { fg = "#665c54", bg = "none" },
			FoldColumn = { fg = "#665c54", bg = "none" },
			CursorLineFold = { fg = "#665c54", bg = "none" },
			RenderMarkdownH1Bg = { fg = "#000000", bg = "#b8bb26" },
			RenderMarkdownH2Bg = { fg = "#252508", bg = "#94961e" },
			RenderMarkdownH3Bg = { fg = "#4a4b0f", bg = "#6f7017" },
			RenderMarkdownH4Bg = { fg = "#6f7017", bg = "#4a4b0f" },
			RenderMarkdownH5Bg = { fg = "#94961e", bg = "#252508" },
			RenderMarkdownH6Bg = { fg = "#b9bb26", bg = "#000000" },
			NeoTreeFloatBorder = { fg = "none", bg = "#212121" },
			NeoTreeFloatTitle = { fg = "none", bg = "#212121" },
			NeoTreeFloatNormal = { bg = "#212121" },
			SnacksNormal = { bg = "#212121" },
			SnacksNormalNC = { bg = "#212121" },
			InclineNormal = { fg = "#fbf1c7", bg = "#504945" },
			CleverFChar = { bg = "#ff0000", fg = "#000000" },
		},
		dim_inactive = false,
		transparent_mode = utils.ui.transparent,
	})
end

-------------------------------------------------------------------------------
-- alpha
-------------------------------------------------------------------------------
M.alpha = function()
	local alpha = require("alpha")
	local dashboard = require("alpha.themes.dashboard")
	local lazy = require("lazy")
	local version = vim.version()

	local nvim_version = " " .. version.major .. "." .. version.minor .. "." .. version.patch

	-- header
	-- set header top space
	dashboard.opts.layout[1].val = 10

	-- set header logo
	dashboard.section.header.val = {
		"███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
		"████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
		"██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
		"██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
		"██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
		"╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
		"                                          " .. nvim_version,
	}

	-- set header below space
	dashboard.opts.layout[3].val = 2

	-- buttons
	-- Set menu with buttons
	local function new_button(...)
		local button = dashboard.button(...)
		button.opts.hl = { { "Special", 0, 6 } }
		return button
	end

	dashboard.section.buttons.val = {
		new_button("e", " " .. "󰙅  Open explorer", "<cmd>Neotree<cr>"),
		new_button("f", " " .. "󰱽  Find files", "<cmd>Telescope find_files<cr>"),
		new_button("w", " " .. "󱎸  Find words", "<cmd>Telescope live_grep<cr>"),
		new_button("r", " " .. "󱈅  Find recents", "<cmd>Telescope oldfiles<cr>"),
		new_button("S", " " .. "󱙈  Find sessions", "<cmd>Telescope session-lens<cr>"),
		new_button("s", " " .. "  Restore last session", "<cmd>SessionRestore<cr>"),
		new_button("p", " " .. "  Plugin manager", "<cmd>Lazy<cr>"),
		new_button("m", " " .. "  Server manager", "<cmd>Mason<cr>"),
		new_button(
			"c",
			" " .. "  Configs",
			"<cmd>e$MYVIMRC<Bar>lua require('neo-tree.command').execute({dir = vim.fn.stdpath('config')})<cr>"
		),
		new_button("n", " " .. "  New file", "<cmd>ene<Bar>startinsert<cr>"),
		new_button("'", " " .. "  Go marks (Line) ", function()
			local char = vim.fn.input("Mark: ")
			if char ~= "" then
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("'" .. char, true, false, true), "n", false)
			else
				vim.notify("No char inserted")
			end
		end),
		new_button("x", " " .. "  Close", "<cmd>quit<cr>"),
	}

	-- set button below space
	table.insert(dashboard.config.layout, 5, { type = "padding", val = 2 })

	-- footer
	-- footer set with date, time, lazy plugins count and loaded ms
	vim.api.nvim_create_autocmd("User", {
		pattern = "LazyVimStarted",
		callback = function()
			local stats = lazy.stats()
			local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)

			local datetime = os.date("  %d-%m-%Y    %I:%M:%S %p")
			local plugins_count = #vim.fn.glob(vim.fn.stdpath("data") .. "/lazy/*", false, 1)
			local plugin_loaded = "󰄴  " .. plugins_count .. " plugins in " .. ms .. " ms"

			dashboard.section.footer.val = {
				string.format("%s  %s", datetime, plugin_loaded),
			}
			-- dashboard.section.footer.opts.hl = "@alpha.footer" -- foother highlight
			pcall(vim.cmd.AlphaRedraw)
		end,
	})

	-- others
	-- disable folding on alpha buffer
	vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])

	-- set whole dashboard to alpha
	alpha.setup(dashboard.opts)

	-- disable other keys in only alpha
	-- Define the keys to exclude from <Nop>
	local exclude_keys = { "j", "k", ":" }

	-- Helper function to check if a key is in the exclude list
	local function is_excluded(key)
		for _, excluded_key in ipairs(exclude_keys) do
			if key == excluded_key then
				return true
			end
		end
		return false
	end

	vim.api.nvim_create_autocmd("FileType", {
		pattern = "alpha",
		callback = function(e)
			-- get the buffer number for alpha

			-- disable these keys in alpha buffer only
			local keys = {}
			for _, key in ipairs(utils.alphabets) do
				table.insert(keys, key)
			end
			for _, key in ipairs(utils.symbols) do
				table.insert(keys, key)
			end
			for _, key in ipairs(utils.numbers) do
				table.insert(keys, key)
			end

			for _, key in ipairs(keys) do
				if not is_excluded(key) then
					vim.keymap.set("n", key, "<Nop>", {
						buffer = e.buf,
						noremap = true,
						silent = true,
					})
				end
			end
		end,
	})

	--[[ fix: after install any plugins, the alpha dashboard will show after quit
	lazy ui]]
	if vim.o.filetype == "lazy" then
		vim.cmd.close()
		vim.api.nvim_create_autocmd("User", {
			pattern = "AlphaReady",
			callback = function()
				lazy.show()
			end,
		})
	end
end
-------------------------------------------------------------------------------
-- snacks
-------------------------------------------------------------------------------
M.snacks = function()
	local version = vim.version()
	local nvim_version = " " .. version.major .. "." .. version.minor .. "." .. version.patch

	require("snacks").setup({
		-- all defaults here first
		--win----------------------------------------------------------------------
		--styles-------------------------------------------------------------------
		styles = {
			-- https://github.com/folke/snacks.nvim/blob/main/docs/styles.md
			blame_line = {},
			dashboard = {},
			float = {
				-- width = utils.ui.width,
				width = utils.ui.width,
				height = utils.ui.height,
				border = utils.ui.border,
				backdrop = utils.ui.backdrop,
			},
			help = {
				border = utils.ui.border,
				backdrop = utils.ui.backdrop,
			},
			input = {},
			lazygit = {
				border = utils.ui.border,
				backdrop = utils.ui.backdrop,
			},
			minimal = {},
			notification = {},
			notification_history = {
				width = utils.ui.width,
				height = utils.ui.height,
				border = utils.ui.border,
				backdrop = utils.ui.backdrop,
			},
			scratch = {
				width = utils.ui.width,
				height = utils.ui.height,
				border = utils.ui.border,
				backdrop = utils.ui.backdrop,
			},
			split = {
				height = utils.ui.h_split_size,
				width = utils.ui.w_split_size,
				border = utils.ui.border,
			},
			terminal = {
				enter = false,
				border = utils.ui.border,
				backdrop = utils.ui.backdrop,
				title = tostring(vim.v.count1),
				title_pos = utils.ui.title_position,
				file = vim.v.count1,
				wo = {
					-- winbar = "",
				},
			},
			zen = {
				border = utils.ui.border,
				backdrop = 0,
			},
			zoom_indicator = {},
		},
		--animate------------------------------------------------------------------
		-- animate are use mostly on scroll, indent, dim and others
		animate = {
			enabled = false,
			duration = { step = 1, total = 100 },
			fps = utils.ui.refresh_rate,
			easing = "outQuad",
			-- easing = "linear",
		},
		--toggle-------------------------------------------------------------------
		toggle = {
			map = vim.keymap.set, -- keymap.set function to use
			which_key = true, -- integrate with which-key to show enabled/disabled icons and colors
			notify = false, -- show a notification when toggling
			-- icons for enabled/disabled states
			icon = {
				enabled = " " .. icons.others.toggle_on .. " ",
				disabled = " " .. icons.others.toggle_off .. " ",
			},
			-- colors for enabled/disabled states
			color = {
				enabled = "green",
				disabled = "yellow",
			},
		},
		--health-------------------------------------------------------------------
		health = {
			enabled = true,
		},
		--layout-------------------------------------------------------------------
		layout = {
			enabled = true,
			width = utils.ui.width,
			height = utils.ui.height,
			zindex = 50,
		},

		--components are here
		--notify----------------------------------------------------------------------
		notify = {
			enabled = true,
		},
		--notifier----------------------------------------------------------------------
		notifier = {
			enabled = true,
			timeout = utils.options.notification_timeout,
			width = { min = 40, max = 0.4 },
			height = { min = 1, max = 0.6 },
			margin = { top = 0, right = 1, bottom = 0 },
			padding = true, -- add 1 cell of left/right padding to the notification window
			sort = { "level", "added" }, -- sort by level and time
			-- minimum log level to display. TRACE is the lowest
			-- all notifications are stored in history
			level = vim.log.levels.TRACE,
			icons = {
				error = icons.diagnostics.error,
				warn = icons.diagnostics.warn,
				info = icons.diagnostics.info,
				debug = icons.diagnostics.debug,
				trace = icons.diagnostics.trace,
			},
			keep = function(notif)
				return vim.fn.getcmdpos() > 0
			end,
			---@type snacks.notifier.style
			style = "compact",
			top_down = true,
			date_format = "%R",
			more_format = " ↓ %d lines ",
			refresh = 50, -- refresh at most every 50ms
			border = "rounded",
			zindex = 100,
			ft = "markdown",
			wo = {
				winblend = 5,
				wrap = false,
				conceallevel = 2,
				colorcolumn = "",
			},
			bo = { filetype = "snacks_notif" },
		},
		--dim----------------------------------------------------------------------
		dim = {
			enabled = true,
			scope = {
				min_size = 5,
				max_size = 20,
				siblings = false,
			},
			animate = {},
			-- what buffers to dim
			filter = function(buf)
				return vim.g.snacks_dim ~= false and vim.b[buf].snacks_dim ~= false and vim.bo[buf].buftype == ""
			end,
		},

		--git----------------------------------------------------------------------
		git = {
			enabled = true,
			width = utils.ui.width,
			height = utils.ui.height,
			border = utils.ui.border,
			title = " Git Blame ",
			title_pos = utils.ui.title_position,
			ft = "git",
		},

		--gitbrowse-------------------------------------------------------------------
		gitbrowse = {
			enabled = true,
		},

		--indent-------------------------------------------------------------------
		indent = {
			enabled = true,
			indent = {
				priority = 1,
				enabled = true, -- enable indent guides
				char = utils.ui.border[4],
				only_scope = false, -- only show indent guides of the scope
				only_current = false, -- only show indent guides in the current window
				hl = "SnacksIndent", ---@type string|string[] hl groups for indent guides
			},
			---@field style? "out"|"up_down"|"down"|"up"
			animate = {
				style = "out",
				duration = {
					step = 20, -- ms per step
					total = 500, -- maximum duration
				},
			},
			---@class snacks.indent.Scope.config: snacks.scope.config
			scope = {
				enabled = true, -- enable highlighting the current scope
				priority = 200,
				char = utils.ui.border[4],
				underline = false, -- underline the start of the scope
				only_current = false, -- only show scope in the current window
				hl = "SnacksIndentScope", ---@type string|string[] hl group for scopes
			},
			chunk = {
				-- when enabled, scopes will be rendered as chunks, except for the
				-- top-level scope which will be rendered as a scope.
				enabled = true,
				-- only show chunk scopes in the current window
				only_current = false,
				priority = 200,
				hl = "SnacksIndentChunk", ---@type string|string[] hl group for chunk scopes
				char = {
					corner_top = utils.ui.border[1],
					corner_bottom = utils.ui.border[7],
					horizontal = utils.ui.border[2],
					vertical = utils.ui.border[4],
					arrow = ">",
				},
			},
			-- filter for buffers to enable indent guides
			filter = function(buf)
				return vim.g.snacks_indent ~= false and vim.b[buf].snacks_indent ~= false and vim.bo[buf].buftype == ""
			end,
		},

		--input--------------------------------------------------------------------
		input = {
			enabled = false,
			icon = icons.ui.arrow_right,
			win = { style = "input" },
			border = utils.ui.border,
			title_pos = utils.ui.title_position,
			height = 1,
			width = 60,
			relative = "cursor",
			-- relative = "editor",
			bo = {
				filetype = "snacks_input",
				buftype = "prompt",
			},
			--- buffer local variables
			b = {
				completion = true,
			},
			keys = {
				n_esc = { "<esc>", { "cmp_close", "cancel" }, mode = "n", expr = true },
				i_esc = { "<esc>", { "cmp_close", "stopinsert" }, mode = "i", expr = true },
				i_cr = { "<cr>", { "cmp_accept", "confirm" }, mode = "i", expr = true },
				i_tab = { "<tab>", { "cmp_select_next", "cmp" }, mode = "i", expr = true },
				i_ctrl_w = { "<c-w>", "<c-s-w>", mode = "i", expr = true },
				i_up = { "<up>", { "hist_up" }, mode = { "i", "n" } },
				i_down = { "<down>", { "hist_down" }, mode = { "i", "n" } },
				q = "cancel",
			},
		},

		--lazygit------------------------------------------------------------------
		lazygit = {
			enabled = true,
			win = { style = "lazygit" },
		},

		--dashboard----------------------------------------------------------------
		dashboard = {
			enabled = true,
			win = {
				style = "dashboard",
			},
			bo = {
				filetype = "snacks_dashboard",
			},
			width = 60,
			row = nil, -- dashboard position. nil for center
			col = nil, -- dashboard position. nil for center
			pane_gap = 4, -- empty columns between vertical panes
			autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence
			preset = {
				---@type fun(cmd:string, opts:table)|nil
				pick = nil,
				keys = {
					{
						key = "e",
						icon = icons.documents.folder_tree,
						desc = "Open explorer",
						action = "<cmd>Neotree<cr>",
					},
					{
						key = "f",
						icon = icons.documents.file_find,
						desc = "Find files",
						action = function()
							Snacks.dashboard.pick("files")
						end,
					},
					{
						key = "w",
						icon = icons.documents.text_find,
						desc = "Find text",
						action = function()
							Snacks.dashboard.pick("live_grep")
						end,
					},
					{
						key = "r",
						icon = icons.documents.file_recent,
						desc = "Find recents",
						action = function()
							Snacks.dashboard.pick("oldfiles")
						end,
					},
					{
						key = "S",
						icon = icons.others.session_find,
						desc = "Find sessions",
						action = "<cmd>Telescope session-lens<cr>",
					},
					-- { key = "s", icon = icons.others.restore, desc = "Restore last session", action = "<cmd>SessionRestore<cr>", },
					{ key = "s", icon = icons.others.restore, desc = "Restore session", section = "session" },
					{
						key = "p",
						icon = icons.others.plugin,
						desc = "Plugin manager",
						action = "<cmd>Lazy<cr>",
						enabled = package.loaded.lazy ~= nil,
					},
					{ key = "m", icon = icons.others.server, desc = "Server manager", action = "<cmd>Mason<cr>" },
					{
						key = "c",
						icon = icons.others.setting,
						desc = "Configs",
						action = function()
							require("neo-tree.command").execute({ dir = vim.fn.stdpath("config") })
							Snacks.dashboard.pick("files", { cwd = vim.fn.stdpath("config") })
						end,
					},
					{
						key = "n",
						icon = icons.documents.file_add,
						desc = "New file",
						action = "<cmd>ene<Bar>startinsert<cr>",
					},
					{
						key = "'",
						icon = icons.others.mark,
						desc = "Go marks",
						action = function()
							local char = vim.fn.input("Mark: ")
							if char ~= "" then
								vim.api.nvim_feedkeys(
									vim.api.nvim_replace_termcodes("'" .. char, true, false, true),
									"n",
									false
								)
							else
								vim.notify("No char inserted")
							end
						end,
					},
					{ key = "q", icon = icons.ui.quit, desc = "Quit", action = "<cmd>quit<cr>" },
				},
				header = "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗\n"
					.. "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║\n"
					.. "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║\n"
					.. "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║\n"
					.. "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║\n"
					.. "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝\n"
					.. nvim_version,
			},
			-- item field formatters
			formats = {
				icon = function(item)
					if item.file then
						if item.icon == "file" then
							return { icons.documents.file, width = 2, hl = "icon" }
						elseif item.icon == "directory" then
							return { icons.documents.folder_closed, width = 2, hl = "icon" }
						end
					end
					return { item.icon, width = 2, hl = "icon" }
				end,
				footer = { "%s", align = "center" },
				header = { "%s", align = "center" },
				file = function(item, ctx)
					local fname = vim.fn.fnamemodify(item.file, ":~")
					fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
					if #fname > ctx.width then
						local dir = vim.fn.fnamemodify(fname, ":h")
						local file = vim.fn.fnamemodify(fname, ":t")
						if dir and file then
							file = file:sub(-(ctx.width - #dir - 2))
							fname = dir .. "/…" .. file
						end
					end
					local dir, file = fname:match("^(.*)/(.+)$")
					return dir and { { dir .. "/", hl = "dir" }, { file, hl = "file" } } or { { fname, hl = "file" } }
				end,
			},
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 0, padding = { 2, 0 } },
				{
					icon = icons.documents.file,
					title = "Recent Files",
					section = "recent_files",
					indent = 2,
					padding = { 2, 0 },
					limit = 5,
				},
				{
					icon = icons.documents.folder_closed,
					title = "Projects",
					section = "projects",
					indent = 2,
					padding = { 2, 0 },
					limit = 5,
				},
				{ icon = icons.others.flash .. " ", section = "startup" },
			},
		},

		--picker-------------------------------------------------------------------
		picker = {
			enabled = true,
		},

		--quickfile----------------------------------------------------------------
		quickfile = {
			enabled = true,
		},

		--scratch------------------------------------------------------------------
		scratch = {
			enabled = true,
			win = { style = "scratch" },
			win_by_ft = {
				lua = {
					keys = {
						["source"] = {
							"<cr>",
							function(self)
								local name = "scratch." .. vim.fn.fnamemodify(vim.api.nvim_buf_get_name(self.buf), ":e")
								Snacks.debug.run({ buf = self.buf, name = name })
							end,
							desc = "Source buffer",
							mode = { "n", "x" },
						},
						["reset"] = {
							"R",
							function(self)
								vim.api.nvim_buf_set_lines(0, 0, -1, false, {}) -- Clears the entire buffer
							end,
							desc = "Reset",
							mode = { "n" },
						},
					},
				},
				javascript = {
					keys = {
						["source"] = {
							"<cr>", -- This binds the Enter key
							function(self)
								vim.cmd("w !node")
							end,
							desc = "Source buffer", -- Description of the action
							mode = { "n", "x" }, -- The modes where this mapping is active (Normal and Visual)
						},
						["reset"] = {
							"R",
							function(self)
								vim.api.nvim_buf_set_lines(0, 0, -1, false, {}) -- Clears the entire buffer
							end,
							desc = "Reset",
							mode = { "n" },
						},
					},
				},
			},
		},

		--scroll-------------------------------------------------------------------
		scroll = {
			animate = {},
			animate_repeat = {},
			filter = function(buf)
				return vim.g.snacks_scroll ~= false
					and vim.b[buf].snacks_scroll ~= false
					and vim.bo[buf].buftype ~= "terminal"
			end,
		},

		--statuscolumn-------------------------------------------------------------
		statuscolumn = {
			enabled = true,
			left = { "mark", "sign" }, -- priority of signs on the left (high to low)
			right = { "fold", "git" }, -- priority of signs on the right (high to low)
			folds = {
				open = false, -- show open fold icons
				git_hl = false, -- use Git Signs hl for fold icons
			},
			git = {
				-- patterns to match Git signs
				patterns = { "GitSign", "MiniDiffSign" },
			},
			refresh = 1, -- refresh at most every 50ms
		},

		--terminal-----------------------------------------------------------------
		terminal = {
			enabled = true,
			win = { style = "terminal" },
		},

		--words--------------------------------------------------------------------
		words = {
			enabled = true,
			debounce = 200, -- time in ms to wait before updating
			notify_jump = false, -- show a notification when jumping
			notify_end = true, -- show a notification when reaching the end
			foldopen = true, -- open folds after jumping
			jumplist = true, -- set jump point before jumping
			modes = { "n", "i", "c" }, -- modes to show references
		},

		--zen----------------------------------------------------------------------
		zen = {
			enabled = true,
			win = { style = "zen" },
			toggles = {
				dim = false,
				git_signs = false,
				mini_diff_signs = false,
				diagnostics = false,
				inlay_hints = false,
			},
			show = {
				statusline = false, -- can only be shown when using the global status line
				tabline = false,
			},
			on_open = function() end,
			on_close = function() end,
		},
	})
end

-------------------------------------------------------------------------------
-- visual-multi
-------------------------------------------------------------------------------
M.visual_multi = function() end

-------------------------------------------------------------------------------
-- buffer line
-------------------------------------------------------------------------------
M.bufferline = function()
	local bufferline = require("bufferline")

	bufferline.setup({
		options = {
			groups = {
				items = {
					require("bufferline.groups").builtin.pinned:with({ icon = icons.others.pin }),
				},
			},
			mode = "buffers",
			style_preset = {
				bufferline.style_preset.default,
				bufferline.style_preset.no_italic,
				bufferline.style_preset.no_bold,
			},
			themable = true,
			indicator = {
				style = "none",
			},
			buffer_close_icon = icons.ui.close .. " ",
			modified_icon = icons.documents.modified .. " ",
			close_icon = icons.ui.close,
			left_trunc_marker = icons.ui.arrow_left,
			right_trunc_marker = icons.ui.arrow_right,
			diagnostics = "nvim_lsp",
			---@diagnostic disable-next-line: unused-local
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				local s = ""
				for e, n in pairs(diagnostics_dict) do
					local sym = e == "error" and icons.diagnostics.error .. " "
						or (e == "warning" and icons.diagnostics.warn .. " " or icons.diagnostics.hint .. " ")
					s = s .. n .. sym
				end
				return s
			end,
			truncate_names = false, -- whether or not tab names should be truncated
			tab_size = 20,
			offsets = {
				{
					filetype = "neo-tree",
					text = "Explorer",
					text_align = utils.ui.title_position,
					separator = false,
					highlight = "Directory",
				},
			},
			color_icons = true,
			show_buffer_icons = true,
			show_buffer_close_icons = true,
			show_close_icon = false,
			show_tab_indicators = true,
			show_duplicate_prefix = true,
			persist_buffer_sort = true,
			move_wraps_at_ends = true,
			separator_style = "slope",
			enforce_regular_tabs = true,
			always_show_bufferline = true,
			auto_toggle_bufferline = true,
			close_command = function(n)
				Snacks.bufdelete(n)
			end,
			left_mouse_command = function(n)
				Snacks.bufdelete(n)
			end,
			right_mouse_command = nil,
			middle_mouse_command = nil,
			pick = {
				alphabet = "abdefghijklmpqrstuvwxyz",
			},
		},
	})
end

-------------------------------------------------------------------------------
-- fzf-lua
-------------------------------------------------------------------------------
M.fzf_lua = function()
	require("fzf-lua").setup({
		winopts = {
			height = utils.ui.height,
			width = utils.ui.width,
			border = utils.ui.border,
			backdrop = utils.ui.backdrop,
			treesitter = {
				enabled = true,
				fzf_colors = { ["hl"] = "-1:reverse", ["hl+"] = "-1:reverse" },
			},
			preview = {
				border = utils.ui.border,
				wrap = utils.options.wrap,
			},
		},
	})
end

-------------------------------------------------------------------------------
-- blink cmp
-------------------------------------------------------------------------------
M.blink = function()
	require("blink.cmp").setup({
		appearance = {
			use_nvim_cmp_as_default = false,
			-- kind_icons = {
			-- 	-- vscode like icons but it slows down blink cmp
			-- 	Text = icons.kind.text,
			-- 	Method = icons.kind.method,
			-- 	Function = icons.kind.functions,
			-- 	Constructor = icons.kind.constructor,
			--
			-- 	Field = icons.kind.field,
			-- 	Variable = icons.kind.variable,
			-- 	Property = icons.kind.property,
			--
			-- 	Class = icons.kind.class,
			-- 	Interface = icons.kind.interface,
			-- 	Struct = icons.kind.struct,
			-- 	Module = icons.kind.module,
			--
			-- 	Unit = icons.kind.unit,
			-- 	Value = icons.kind.value,
			-- 	Enum = icons.kind.enum,
			-- 	EnumMember = icons.kind.enumMember,
			--
			-- 	Keyword = icons.kind.keyword,
			-- 	Constant = icons.kind.constant,
			--
			-- 	Snippet = icons.kind.snippet,
			-- 	Color = icons.kind.color,
			-- 	File = icons.kind.file,
			-- 	Reference = icons.kind.reference,
			-- 	Folder = icons.kind.folder,
			-- 	Event = icons.kind.event,
			-- 	Operator = icons.kind.operator,
			-- 	TypeParameter = icons.kind.typeParameter,
			-- },
		},
		sources = {
			default = {
				"lsp",
				"path",
				"snippets",
				"buffer",
			},
			-- cmdline = {}, -- enables this will disable cmdline completion
		},
		completion = {
			menu = {
				-- border = utils.ui.border,
				draw = {
					-- columns = {
					-- 		-- like vs code style
					-- 		{ "label", "label_description" },
					-- 		{ "kind_icon", "kind",  gap = 1 },
					-- 	},
				},
			},
			documentation = { window = { border = utils.ui.border } },
		},
		signature = { enabled = true, window = { border = utils.ui.border } },
		keymap = {
			-- set to 'none' to disable the 'default' preset
			preset = "none",

			-- disable a keymap from the preset
			["<c-j>"] = {
				function(cmp)
					cmp.select_next({ auto_insert = false })
					return true
				end,
				"fallback",
			},
			["<c-k>"] = {
				function(cmp)
					cmp.select_prev({ auto_insert = false })
					return true
				end,
				"fallback",
			},
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

			-- cmdline = {},
		},
	})
end

-------------------------------------------------------------------------------
-- cmp
-------------------------------------------------------------------------------
M.cmp = function()
	local cmp = require("cmp")
	local luasnip = require("luasnip")

	-- Lazy load Luasnip snippets
	require("luasnip.loaders.from_vscode").lazy_load()

	cmp.setup({
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
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
				border = utils.ui.border,
				scrollbar = true,
				winblend = 0,
				winhighlight = "Normal:Normal,FloatBorder:CmpBorder",
			},
			documentation = {
				border = utils.ui.border,
				scrollbar = true,
				winblend = 0,
				winhighlight = "Normal:Normal,FloatBorder:CmpDocBorder",
			},
		},

		-- Set completion behavior and options.
		completion = {
			completeopt = utils.completeopt.behavior,
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
				elseif luasnip.expand_or_jumpable() then
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
				local max_label_width = utils.completeopt.max_width
				local min_label_width = utils.completeopt.min_width
				local mode = "symbol_text" --[[ Values are: "text", "text_symbol",
				"symbol_text", or "symbol" ]]
				local color_item = require("nvim-highlight-colors").format(entry, {
					kind = item.kind,
				})

				-- Define the kind icons
				local kind = {
					Class = icons.kind.class,
					Color = icons.kind.color,
					Constant = icons.kind.constant,
					Constructor = icons.kind.constructor,
					Enum = icons.kind.enum,
					EnumMember = icons.kind.enumMember,
					Event = icons.kind.event,
					Field = icons.kind.field,
					File = icons.kind.file,
					Folder = icons.kind.folder,
					Function = icons.kind.functions,
					Interface = icons.kind.interface,
					Keyword = icons.kind.keyword,
					Method = icons.kind.method,
					Misc = icons.kind.misc,
					Module = icons.kind.module,
					Operator = icons.kind.operator,
					Property = icons.kind.property,
					Reference = icons.kind.reference,
					Snippet = icons.kind.snippet,
					Struct = icons.kind.struct,
					Text = icons.kind.text,
					TypeParameter = icons.kind.typeParameter,
					Unit = icons.kind.unit,
					Value = icons.kind.value,
					Variable = icons.kind.variable,
				}

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
	-- cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
end

-------------------------------------------------------------------------------
-- which-key
-------------------------------------------------------------------------------
M.which_key = function()
	require("which-key").setup({
		preset = "helix",
		delay = utils.options.wk_popup,
		triggers = {
			{ "<auto>", mode = "nxso" },
			{ "<localleader>", mode = "nxso" },
		},
	})
end

-------------------------------------------------------------------------------
-- noice
-------------------------------------------------------------------------------
M.noice = function()
	require("noice").setup({
		cmdline = {
			enabled = true,
			view = "cmdline_popup",
			format = {
				-- cmdline = { icon = icons.ui.ArrowLongRight },
				-- search_down = { icon = icons.ui.Search .. icons.ui.ArrowDownRigth },
				-- search_up = {  icon = icons.ui.Search .. icons.ui.ArrowUpRigth },
				-- filter = { icon = icons.ui.Filter },
				-- lua = { icon = icons.lang.Lua },
				-- help = {  icon = icons.diagnostics.Help },
				-- input = {  icon = icons.ui.Keyboard },
			},
		},
		messages = {
			enabled = true,
			view_search = false,
		},
		lsp = {
			progress = {
				enabled = true,
				format = "lsp_progress",
				format_done = "lsp_progress_done",
				view = "mini",
			},
		},
		format = {
			level = {
				icons = {
					error = icons.diagnostics.Error,
					warn = icons.diagnostics.Warning,
					info = icons.diagnostics.Information,
					hint = icons.diagnostics.Hint,
				},
			},
		},
		notify = {
			enabled = false,
		},
	})
end

-------------------------------------------------------------------------------
-- nvim_surround
-------------------------------------------------------------------------------
M.nvim_surround = function()
	require("nvim-surround").setup({})
end

-------------------------------------------------------------------------------
-- persistence
-------------------------------------------------------------------------------
-- this is a session manager plugin
M.persistence = function()
	require("persistence").setup({})
end

-------------------------------------------------------------------------------
-- git
-------------------------------------------------------------------------------
-- this is a session manager plugin
M.git = function()
	require("gitsigns").setup({})
end

-------------------------------------------------------------------------------
-- lsp
-------------------------------------------------------------------------------
M.lsp = function()
	local nvim_capabilities = vim.lsp.protocol.make_client_capabilities()
	nvim_capabilities.textDocument.completion.completionItem.snippetSupport = true
	nvim_capabilities.textDocument.foldingRange = {
		dynamicRegistration = false,
		lineFoldingOnly = true,
	}

	local on_attach = function(client, bufnr)
		if client.supports_method("textDocument/documentSymbol") then
			-- 	require("nvim-navic").attach(client, bufnr)
		end
	end

	local server_settings = {
		lua_ls = {
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					diagnostics = {
						globals = { "vim", "Snacks" },
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
					},
					telemetry = {
						enable = false,
					},
				},
			},
		},
	}

	local default_handlers =
		{
			["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = utils.ui.border,
			}),
			["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
				border = utils.ui.border,
			}),
		}, 
require("mason").setup({
			ui = {
				icons = {
					package_installed = icons.others.loaded,
					package_pending = icons.others.pending,
					package_uninstalled = icons.others.not_loaded,
				},
				border = utils.ui.border,
				width = utils.ui.width,
				height = utils.ui.height,
			},
		})

	require("mason-lspconfig").setup({
		ensure_installed = {},
		automatic_installation = true,
		handlers = {
			function(server_name)
				local server_configs = server_settings[server_name] or {}

				require("lspconfig")[server_name].setup({
					capabilities = vim.tbl_deep_extend(
						"force",
						nvim_capabilities,
						require("blink.cmp").get_lsp_capabilities()
					), -- for blink cmp
					-- capabilities = vim.tbl_deep_extend( "force", nvim_capabilities, require("cmp_nvim_lsp").default_capabilities()), -- for nvim-cmp
					on_attach = on_attach,
					settings = server_configs.settings,
					on_init = server_configs.on_init,
					autostart = server_configs.autostart,
					cmd = server_configs.cmd,
					filetypes = server_configs.filetypes,
					root_dir = server_configs.root_dir,
					handlers = vim.tbl_deep_extend("force", default_handlers, server_configs.handlers or {}),
				})
			end,
		},
	})
end

return M
