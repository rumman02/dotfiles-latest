return function()
	local icons = require("lib.icons")
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

	return {
		enabled = require("plugins.controller").snacks.dashboard,
		preset = {
			pick = nil,
			keys = {
				{
					key = "e",
					icon = "󰙅 ",
					desc = "Open explorer",
					action = function()
						-- Snacks.picker.explorer()
						-- check_existence("neo-tree.nvim", "Neotree", Snacks.picker.explorer)
						vim.cmd("Neotree")
					end,
				},
				{
					key = "f",
					icon = "󰱼 ",
					desc = "Find files",
					action = function()
						Snacks.picker.files()
						-- check_existence("fzf-lua", "FzfLua files", Snacks.picker.files)
					end,
				},
				{
					key = "w",
					icon = "󱎸 ",
					desc = "Find text",
					action = function()
						Snacks.picker.grep()
						-- check_existence("fzf-lua", "FzfLua live_grep", Snacks.picker.grep)
					end,
				},
				{
					key = "r",
					icon = "󱋡 ",
					desc = "Find recents",
					action = function()
						Snacks.picker.recent()
						-- check_existence("fzf-lua", "FzfLua oldfiles", Snacks.picker.recent)
					end,
				},
				{
					key = "s",
					icon = "󰑌 ",
					desc = "Restore session",
					action = function()
						-- check_existence("telescope.nvim", "Telescope session-lens", function()
						require("persistence").load()
						-- end)
					end,
				},
				{
					key = "S",
					icon = "󱈅 ",
					desc = "Find sessions",
					action = function()
						-- check_existence("auto-session", "SessionRestore", function()
						require("persistence").select()
						-- end)
					end,
				},
				{
					key = "p",
					icon = "󰐱 ",
					desc = "Plugin manager",
					action = "<cmd>Lazy<cr>",
					enabled = package.loaded.lazy ~= nil,
				},
				{ key = "m", icon = "󰇖 ", desc = "Server manager", action = "<cmd>Mason<cr>" },
				{
					key = "c",
					icon = "󰒓 ",
					desc = "Configs",
					action = function()
						Snacks.dashboard.pick("files", { cwd = vim.fn.stdpath("config") })
						-- check_existence(
						-- 	"neo-tree.nvim",
						-- 	require("neo-tree.command").execute({ dir = vim.fn.stdpath("config") }),
						-- 	Snacks.dashboard.pick("files", { cwd = vim.fn.stdpath("config") })
						-- )
					end,
				},
				{ key = "n", icon = "󰝒 ", desc = "New file", action = "<cmd>ene<Bar>startinsert<cr>" },
				{
					key = "'",
					icon = "󰍎 ",
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
				{ key = "q", icon = "󰍃 ", desc = "Quit", action = "<cmd>quit<cr>" },
			},
			header = "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗\n"
				.. "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║\n"
				.. "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║\n"
				.. "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║\n"
				.. "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║\n"
				.. "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝\n"
				.. nvim_version,
		},
		formats = {
			icon = function(item)
				if item.file then
					if item.icon == "file" then
						return { icons.filesystem.file.default, width = 2, hl = "icon" }
					elseif item.icon == "directory" then
						return { icons.filesystem.folder.default, width = 2, hl = "icon" }
					end
				end
				return { item.icon, width = 2, hl = "icon" }
			end,
		},
		sections = {
			{ section = "header" },
			{ section = "keys", gap = 0, padding = { 2, 0 } },
			{
				icon = icons.filesystem.folder.default,
				title = "Recent Files",
				section = "recent_files",
				indent = 2,
				padding = { 2, 0 },
				limit = 5,
			},
			{
				icon = icons.filesystem.folder.default,
				title = "Projects",
				section = "projects",
				indent = 2,
				padding = { 2, 0 },
				limit = 5,
			},
			{ icon = "󰉁 " .. " ", section = "startup" },
		},
	}
end
