local M = {}

-- snacks opts
M.opts = function()
	local utils = require("lib.utils")
	local icons = require("lib.icons")

	local N = {}

	N.animate = {
		enabled = true,
		fps = utils.ui.refresh_rate,
	}

	N.bigfile = {
		enabled = false,
	}

	N.bufdelete = {
		enabled = true,
	}

	-- dashboard
	local version = vim.version()
	local nvim_version = " " .. version.major .. "." .. version.minor .. "." .. version.patch
	local check_existence = function(plugin_name, execute, execute_snacks)
		-- Directly check plugin existence using Lazy's plugin table
		if require("lazy.core.config").plugins[plugin_name] then
			if type(execute) == "string" then
				vim.cmd(execute)
			elseif type(execute) == "function" then
				execute()
			end
		else
			execute_snacks()
		end
	end

	N.dashboard = {
		preset = {
			---@type fun(cmd:string, opts:table)|nil
			pick = nil,
			keys = {
				{ key = "e", icon = icons.md_icons.documents.folder_tree, desc = "Open explorer", action = function()
						check_existence("neo-tree.nvim", "Neotree", Snacks.picker.explorer)
					end,
				},
				{ key = "f", icon = icons.md_icons.documents.file_find, desc = "Find files", action = function()
						check_existence("fzf-lua", "FzfLua files", Snacks.picker.files)
					end,
				},
				{ key = "w", icon = icons.md_icons.documents.text_find, desc = "Find text", action = function()
						check_existence("fzf-lua", "FzfLua live_grep", Snacks.picker.grep)
					end,
				},
				{ key = "r", icon = icons.md_icons.documents.file_recent, desc = "Find recents", action = function()
						check_existence("fzf-lua", "FzfLua oldfiles", Snacks.picker.recent)
					end,
				},

				-- { key = "S", icon = icons.md_icons.others.session_find, desc = "Find sessions", action = "<cmd>Telescope session-lens<cr>", },
				-- { key = "s", icon =icons.md_icons.others.restore, desc = "Restore last session", action = "<cmd>SessionRestore<cr>", },

				-- { key = "s", icon = icons.md_icons.others.restore, desc = "Restore session", section = "session" },
				-- { key = "S", icon = icons.md_icons.others.session_find, desc = "Find sessions", action = function() require("persistence").select() end },

				{ key = "s", icon = icons.md_icons.others.restore, desc = "Restore session", action = function()
						check_existence("telescope.nvim", "Telescope session-lens", function()
							require("persistence").load()
						end)
					end,
				},
				{ key = "S", icon = icons.md_icons.others.session_find, desc = "Find sessions", action = function()
						check_existence("auto-session", "SessionRestore", function()
							require("persistence").select()
						end)
					end,
				},
				{ key = "p", icon = icons.md_icons.others.plugin, desc = "Plugin manager", action = "<cmd>Lazy<cr>", enabled = package.loaded.lazy ~= nil, },
				{ key = "m", icon = icons.md_icons.others.server, desc = "Server manager", action = "<cmd>Mason<cr>" },
				{ key = "c", icon = icons.md_icons.others.setting, desc = "Configs", action = function()
						check_existence(
							"neo-tree.nvim",
							require("neo-tree.command").execute({ dir = vim.fn.stdpath("config") }),
							Snacks.dashboard.pick("files", { cwd = vim.fn.stdpath("config") })
						)
					end,
				},
				{ key = "n", icon = icons.md_icons.documents.file_add, desc = "New file", action = "<cmd>ene<Bar>startinsert<cr>", },
				{ key = "'", icon = icons.md_icons.others.mark, desc = "Go marks", action = function()
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
				{ key = "q", icon = icons.md_icons.ui.quit, desc = "Quit", action = "<cmd>quit<cr>" },
			},
			header =
			"███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗\n" ..
			"████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║\n" ..
			"██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║\n" ..
			"██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║\n" ..
			"██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║\n" ..
			"╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝\n" .. nvim_version,
		},
		formats = {
			icon = function(item)
				if item.file then
					if item.icon == "file" then
						return { icons.md_icons.documents.file, width = 2, hl = "icon" }
					elseif item.icon == "directory" then
						return { icons.md_icons.documents.folder_closed, width = 2, hl = "icon" }
					end
				end
				return { item.icon, width = 2, hl = "icon" }
			end,
		},
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 0, padding = { 2, 0 } },
				{ icon = icons.md_icons.documents.file, title = "Recent Files", section = "recent_files", indent = 2, padding = { 2, 0 }, limit = 5, },
				{ icon = icons.md_icons.documents.folder_closed, title = "Projects", section = "projects", indent = 2, padding = { 2, 0 }, limit = 5, },
				{ icon = icons.md_icons.others.flash .. " ", section = "startup" },
			},
	}

	N.debug = {
		enabled = false,
	}

	N.dim = {
		enabled = true,
	}

	N.explorer = {
		enabled = true,
	}

	N.git = {
		enabled = false,
	}

	N.gitbrowse = {
		enabled = false,
	}

	N.health = {
		enabled = false,
	}

	N.indent = {
		enabled = true,
		chunk = {
			enabled = true,
			char = {
				corner_top = utils.ui.border[1],
				corner_bottom = utils.ui.border[7],
			},
		},
	}

	-- N.init = {}

	N.input = {
		enabled = true,
	}

	-- N.layout = {}

	N.lazygit = {
		enabled = true,
	}

	-- N.meta = {}

	N.notifier = {
		enabled = true,
	}

	N.notify = {
		enabled = true,
	}

	N.picker = {
		enabled = true,
	}

	N.profiler = {
		enabled = false,
	}

	N.quickfile = {
		enabled = true,
	}

	N.rename = {
		enabled = true,
	}

	N.scope = {
		enabled = true,
	}

	N.scratch = {
		enabled = true,
		win_by_ft = {
			javascript = {
				keys = {
					["source"] = {
						"<cr>", -- This binds the Enter key
						function(self)
							local name = "scratch." .. vim.fn.fnamemodify(vim.api.nvim_buf_get_name(self.buf), ":w !node")
							Snacks.debug.run({ buf = self.buf, name = name })
							-- vim.cmd("w !node")
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
	}

	N.scroll = {
		enabled = false,
	}

	N.statuscolumn = {
		enabled = false,
	}

	N.styles = {
		enabled = true,
		-- blame_line = {},
		-- dashboard = {},
		float = {
			width = utils.ui.width,
			height = utils.ui.height,
			-- border = utils.ui.border,
			backdrop = utils.ui.backdrop,
		},
		-- help = {},
		-- input = {},
		-- lazygit = {},
		-- minimal = {},
		-- notification = {},
		notification_history = {
			width = utils.ui.width,
			height = utils.ui.height,
			border = utils.ui.border,
			backdrop = utils.ui.backdrop,
		},
		scratch = {},
		split = {},
		terminal = {},
		zen = {},
		zoom_indicator = {},
	}

	N.terminal = {
		enabled = true,
	}

	N.toggle = {
		enabled = true,
	}

	-- N.util = {}

	N.win = {
		enabled = true,
	}

	N.words = {
		enabled = false,
	}

	N.zen = {
		enabled = true,
	}

	return N
end


-- snacks configs
M.config = function(_, opts)
	require("snacks").setup(opts)

	local toggle = Snacks.toggle
	local terminal = Snacks.terminal.toggle
	local scratch = Snacks.scratch
	local notifier = Snacks.notifier
	local picker = Snacks.picker
	local explorer = Snacks.picker.explorer

	local map = require("lib.func").map
	local toggle_leader = require("lib.keys").toggle_leader
	local terminal_leader = require("lib.keys").terminal_leader
	local scratch_leader = require("lib.keys").scratch_leader
	local option_leader = require("lib.keys").option_leader
	local finder_leader = require("lib.keys").finder_leader
	local explorer_leader = require("lib.keys").explorer_leader

	-- options toggle
	map(0, { "n" }, option_leader, "", { desc = "Options" })
	map(0, { "n" }, option_leader .. "c", "", { desc = "Cursor" })
	map(0, { "n" }, option_leader .. "l", "", { desc = "Line" })

	toggle.option("cursorline", { name = "Line highlight" }):map(option_leader .. "cl") -- line highlight
	toggle.option("cursorcolumn", { name = "Column highlight" }):map(option_leader .. "cc") -- column highlight
	toggle.option("scrolloff", { off = vim.o.scrolloff > 0 and vim.o.scrolloff or 0, on = 999, name = "Middle row" }):map(option_leader .. "cx") -- stay cursor at middle row
	toggle.option("sidescrolloff", { off = vim.o.sidescrolloff > 0 and vim.o.sidescrolloff or 0, on = 999, name = "Middle column" }):map(option_leader .. "cy") -- stay cursor at middle column
	toggle.option("background", { off = "light", on = "dark", name = "Dark mode" }):map(option_leader .. " ") -- background dark light
	toggle.option("number", { name = "Number" }):map(option_leader .. "ln") -- line number
	toggle.option("relativenumber", { name = "Relative number" }):map(option_leader .. "lr") -- relative line number
	toggle.option("spell", { name = "Spelling" }):map(option_leader .. "p") -- word spelling
	toggle.option("wrap", { name = "Wrap" }):map(option_leader .. "lw") -- word wrap

	-- snacks own keymaps
	map(0, { "n" }, toggle_leader .. "a", "", { desc = "Animate" })
	toggle.animate():map(toggle_leader .. "aa") -- animate
	toggle.scroll():map(toggle_leader .. "as") -- animate scrolls

	map(0, { "n" }, toggle_leader .. "z", "", { desc = "Zen mode" })
	toggle.dim():map(toggle_leader .. "zd") -- scoped code dimming
	toggle.zen():map(toggle_leader .. "zz") -- zen mode
	toggle.zoom():map(toggle_leader .. "zZ") -- zoom mode/maximize

	toggle.treesitter():map(toggle_leader .. "t") -- treesitter
	toggle.words():map(toggle_leader .. "w") -- word highlight
	toggle.indent():map(toggle_leader .. "i") -- indentation
	if vim.lsp.inlay_hint then toggle.inlay_hints():map(toggle_leader .. "h") end -- lsp inlay hint
	toggle.diagnostics():map(toggle_leader .. "d") -- diagnostics
	-- toggle.profiler():map(toggle_leader .. "p") -- profiler
	-- toggle.profiler_highlights():map(toggle_leader .. "P") -- profiler highlight

	-- snacks scratch
	map(0, { "n" }, scratch_leader, "", { desc = "Scratch" })
	map(0, { "n" }, scratch_leader, "", { desc = "Scratch" })
	map(0, { "n" }, scratch_leader .. "ss", function() scratch() end, { desc = "Press 0-9 & Toggle" }) -- scratch
	map(0, { "n" }, scratch_leader .. "sl", function() scratch.list() end, { desc = "List" }) -- scratch list
	map(0, { "n" }, scratch_leader .. "se", function() scratch.select() end, { desc = "Select" }) -- scratch select

	-- snacks terminal
	map(0, { "n" }, terminal_leader, "", { desc = "Terminal" })
	map(0, { "n" }, terminal_leader .. "t", function() terminal() end, { desc = "Press 0-9 & Toggle" }) -- terminal toggle
	map(0, { "n" }, terminal_leader .. "h", function() terminal(nil, { win = { position = "left" } }) end, { desc = "Press 0-9 & Toggle left" }) -- terminal left
	map(0, { "n" }, terminal_leader .. "j", function() terminal(nil, { win = { position = "bottom" } }) end, { desc = "Press 0-9 & Toggle down" }) -- terminal bottom
	map(0, { "n" }, terminal_leader .. "k", function() terminal(nil, { win = { position = "top" } }) end, { desc = "Press 0-9 & Toggle up" }) -- terminal top
	map(0, { "n" }, terminal_leader .. "l", function() terminal(nil, { win = { position = "right" } }) end, { desc = "Press 0-9 & Toggle right" }) -- terminal right
	map(0, { "n" }, terminal_leader .. "f", function() terminal(nil, { win = { position = "float", enter = true, title = " Terminal " .. tostring(vim.v.count1) .. " " } }) vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "n", false) end, { desc = "Press 0-9 & Toggle float" }) -- terminal float

	-- snacks notifier
	map(0, { "n" }, "<esc>", "<esc><cmd>lua Snacks.notifier.hide()<cr>", { desc = "Dismiss all" }) -- dismiss all notifier
	map(0, { "n" }, toggle_leader .. "N", function() notifier.show_history() end, { desc = "Notification history" }) -- notification history

	-- if fzflua or telescope isn't active then these will works
	if vim.fn.exists(":FzfLua") == 0 and vim.fn.exists(":Telescope") == 0 then
		map(0, { "n" }, finder_leader, "", { desc = "Find" })
		map(0, { "n" }, finder_leader .. "b", function() picker.buffers() end, { desc = "Buffers" }) -- buffers
		-- map(0, { "n" }, finder_leader .. "c", "<cmd>FzfLua blines<cr>", { desc = "Current" })
		map(0, { "n" }, finder_leader .. "C", function() picker.commands() end, { desc = "Commands" }) -- commands
		map(0, { "n" }, finder_leader .. "f", function() picker.files() end, { desc = "Files" }) -- files
		map(0, { "n" }, finder_leader .. "F", function() picker.resume() end, { desc = "Resume" }) -- resume
		map(0, { "n" }, finder_leader .. "h", function() picker.help() end, { desc = "Helps" }) -- help tags
		map(0, { "n" }, finder_leader .. "m", function() picker.marks() end, { desc = "Marks" }) -- marks
		-- map(0, { "n" }, finder_leader .. "o", function() end, { desc = "Old files" }) -- old files/recent files
		map(0, { "n" }, finder_leader .. "r", function() picker.registers() end, { desc = "Registers" }) -- registers
		map(0, { "n" }, finder_leader .. "u", function() picker.undo() end, { desc = "Undo" }) -- undo
		map(0, { "n" }, finder_leader .. "w", function() picker.grep() end, { desc = "Words" }) -- words/chars
		map(0, { "n" }, finder_leader .. "l", function() picker.loclist() end, { desc = "Loclist" }) -- loclist
		map(0, { "n" }, finder_leader .. "q", function() picker.qflist() end, { desc = "Quickfix" }) -- qflist
		map(0, { "n" }, finder_leader .. "z", function() picker.colorschemes() end, { desc = "Colorscheme" }) -- colorschemes
	end

	-- if neo-tree isn't active then these will works
	if vim.fn.exists(":Neotree") == 0 then
		map(0, { "n" }, explorer_leader, "", { desc = "Explorer" })
		map(0, { "n" }, explorer_leader .. "e", function() explorer({ sources = { explorer = { hidden = false } } }) end, { desc = "Toggle" }) -- explorer without hidden files
		map(0, { "n" }, explorer_leader .. "E", function() explorer({ sources = { explorer = { hidden = true } } }) end, { desc = "Toggle (Hidden)" }) -- explorer with hidden files
	end

end

-- lsp progress shows by notifier
vim.api.nvim_create_autocmd("LspProgress", {
	---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
	callback = function(ev)
		local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
		vim.notify(vim.lsp.status(), "info", {
			id = "lsp_progress",
			title = "LSP Progress",
			opts = function(notif)
				notif.icon = ev.data.params.value.kind == "end" and " "
					or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
			end,
		})
	end,
})

return M
