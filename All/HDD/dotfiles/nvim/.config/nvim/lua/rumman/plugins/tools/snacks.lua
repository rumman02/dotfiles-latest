local snacks = require("snacks")
local icons = require("rumman.lib.icons")
local utils = require("rumman.lib.utils")
local version = vim.version()
local nvim_version = " " .. version.major .. "." .. version.minor .. "." .. version.patch

snacks.setup({
	dashboard = {
		bo = {
			filetype = "snacks_dashboard"
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
				{ key = "e", icon = "󰙅 ", desc = "Open explorer", action = "<cmd>Neotree<cr>" },
				{ key = "f", icon = "󰱽 ", desc = "Find files", action = function() Snacks.dashboard.pick("files") end },
				{ key = "w", icon = "󱎸 ", desc = "Find text", action = function() Snacks.dashboard.pick("live_grep") end },
				{ key = "r", icon = "󱈅 ", desc = "Find recents", action = function() Snacks.dashboard.pick("oldfiles") end },
				{ key = "S", icon = "󱙈 ", desc = "Find sessions", action = "<cmd>Telescope session-lens<cr>" },
				{ key = "s", icon = " ", desc = "Restore last session", action = "<cmd>SessionRestore<cr>" },
				-- { key = "s", icon = " ", desc = "Restore last session", section = "session"  },
				{ key = "p", icon = " ", desc = "Plugin manager", action = "<cmd>Lazy<cr>", enabled = package.loaded.lazy ~= nil },
				{ key = "m", icon = " ", desc = "Server manager", action = "<cmd>Mason<cr>" },
				{ key = "c", icon = " ", desc = "Configs", action = "<cmd>e$MYVIMRC<Bar>lua require('neo-tree.command').execute({dir = vim.fn.stdpath('config')})<cr>" },
				{ key = "c", icon = " ", desc = "Configs", action = function() require("neo-tree.command").execute({dir = vim.fn.stdpath("config")}) Snacks.dashboard.pick("files", { cwd = vim.fn.stdpath("config") }) end },
				{ key = "n", icon = " ", desc = "New file", action = "<cmd>ene<Bar>startinsert<cr>" },
				{ key = "'", icon = " ", desc =  "Go marks", action = function () local char = vim.fn.input("Mark: ") if char ~= "" then vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("'" .. char, true, false, true), "n", false) else vim.notify("No char inserted") end end },
				{ key = "x", icon = " ", desc = "Close", action = "<cmd>quit<cr>" },
			},
			-- Used by the `header` section
			header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
                                           ]] .. nvim_version,
		},
		-- item field formatters
		formats = {
			icon = function(item)
				if item.file then
					if item.icon == "file" then
						return { icons.ui.NewFile, width = 2, hl = "icon"}
					elseif item.icon == "directory" then
						return { icons.documents.OpenFolder, width = 2, hl = "icon" }
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
    { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = { 2, 0 } },
    { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 2 },
    { section = "startup" },
		},
	},
	animate = {
		fps = utils.refresh_rate,
		duration = 100,
	},
	styles = {
		float = {
			backdrop = utils.ui.backdrop,
		},
	},
	indent = {
		enabled = true,
		char = icons.ui.BorderLeft,
		chunk = {
			char = {
				corner_top = icons.ui.BorderTopLeft,
				corner_bottom = icons.ui.BorderBottomLeft,
				horizontal = icons.ui.BorderTop,
				vertical = icons.ui.BorderLeft,
				arrow = icons.ui.Arrow,
			},
		},
	},
	input = { enabled = true },
	notifier = {
		enabled = false,
		timeout = 2000,
		icons = {
			error = icons.diagnostics.Error,
			warn = icons.diagnostics.Warning,
			info = icons.diagnostics.Information,
			debug = icons.ui.Debug,
			trace = icons.ui.Trace,
		},
	},
	rename = { enabled = true },
	scroll = { enabled = false },
	statuscolumn = {
		enabled = false,
		left = { "mark", "sign" },
		right = { "fold", "git" },
		folds = {
			open = false,
			git_hl = true,
		},
	},
	terminal = {
		bo = {
			filetype = "snacks_terminal",
		},
		win = {
			style = "terminal",
			border = {
				icons.ui.BorderTopLeft,
				icons.ui.BorderTop,
				icons.ui.BorderTopRight,
				icons.ui.BorderRight,
				icons.ui.BorderBottomRight,
				icons.ui.BorderBottom,
				icons.ui.BorderBottomLeft,
				icons.ui.BorderLeft,
			},
			enter = false,
			on_buf = function()
			end,
			on_win = function()
			end,
			on_close = function()
			end,
			resize = true,
			-- height = utils.ui.height,
			-- width = utils.ui.width,
		},
		wo = {},
		keys = {
			q = "hide",
			gf = function(self)
				local f = vim.fn.findfile(vim.fn.expand("<cfile>"), "**")
				if f == "" then
					Snacks.notify.warn("No file under cursor")
				else
					self:hide()
					vim.schedule(function()
						vim.cmd("e " .. f)
					end)
				end
			end,
			term_normal = {
				"<esc>",
				function(self)
					self.esc_timer = self.esc_timer or (vim.uv or vim.loop).new_timer()
					if self.esc_timer:is_active() then
						self.esc_timer:stop()
						vim.cmd("stopinsert")
					else
						self.esc_timer:start(200, 0, function() end)
						return "<esc>"
					end
				end,
				mode = "t",
				expr = true,
				desc = "Double escape to normal mode",
			},
		},
	},
	win = { enabled = true },
	words = { enabled = true },
	zen = { enabled = true },
})

