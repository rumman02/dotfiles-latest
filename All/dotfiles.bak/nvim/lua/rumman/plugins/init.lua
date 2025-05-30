local func = require("rumman.lib.func")
local keys = require("rumman.lib.keys")
local utils = require("rumman.lib.utils")
local map = func.map
local split_ratio = 3 -- less is bigger window, higher is smaller window
local w_split_size = math.floor(vim.api.nvim_win_get_width(0) / split_ratio)
local h_split_size = math.floor(vim.api.nvim_win_get_height(0) / split_ratio)

local neotree_leader = keys.neotree.leaders.globals
local neotree_local_leader = keys.neotree.leaders.locals
local git_leader = keys.git.leaders.globals
local lsp_leader = keys.lsp.leaders.locals
local trouble_leader = keys.trouble.leaders.locals
local linter_leader = keys.linter.leaders.locals
local formatter_leader = keys.formatter.leaders.locals
local option_leader = keys.options.leaders.globals
local dap_leader = keys.dap.leaders.globals
local marks_leader = keys.marks.leaders.globals
local visual_multi_leader = keys.visual_multi.leaders.globals
local notification_leader = keys.notification.leaders.globals
local loc_qfix_list_leader = keys.loc_qfix_list_leader.leaders.globals
local folding_leader = keys.fold.leaders.globals
local session_leader = keys.session.leaders.globals
local navigation_leader1 = keys.navigation.leaders.globals1
local navigation_leader2 = keys.navigation.leaders.globals2
local lazygit_leader = keys.lazygit.leaders.globals
local bufferline_leader = keys.bufferline.leaders.globals
local windows_leader = keys.windows.leaders.globals
local tab_leader = keys.tab.leaders.globals
local undotree_leader = keys.undotree.leaders.globals
local undotree_local_leader = keys.undotree.leaders.globals
local telescope_leader = keys.telescope.leaders.globals
local telescope_local_leader = keys.telescope.leaders.locals
local toggleterm_leader = keys.toggleterm.leaders.globals
local comment_leader1 = keys.comment.leaders.globals1
local comment_leader2 = keys.comment.leaders.globals2
local yanky_leader = keys.yanky.leaders.globals
local surround_leader1 = keys.surround.leaders.globals1
local surround_leader2 = keys.surround.leaders.globals2
local fzf_leader = keys.fzf.leaders.globals

local load_config = function(config)
	return function()
		func.requires("rumman.plugins." .. config)
	end
end

-- Meanings of 0, 1, 2
-- 0 = vim.keymap.set()
-- 1 = plugins.keys = {}
-- 2 = which_key.add()

-- ============================================================================
-- addings rules
-- ----------------
-- config = plugins configuration
-- lazy = lazy loaded or not
-- enabled = disabled plugin & uninstalled
-- cond = disabled plugin
-- priority = force loading certain plugins first
-- version = version to use from the repository
-- branch = branch of the repository
-- tag = tag of the repository
-- name = custom name for the plugin
-- main = main module to use for config() and opts()
-- event = lazy load on event
-- ft = lazy load on filetypes
-- cmd = lazy load on command
-- build = executed when a plugin is installed or updated
-- dependencies = plugins are dependded on this plugins
-- keys = lazy load on keymaps
-- ============================================================================
return {
	----- ui -----
	{
		"ellisonleao/gruvbox.nvim",
		config = load_config("ui.gruvbox"),
		lazy = false,
		priority = 1000,
	},
	{
		"goolord/alpha-nvim",
		config = load_config("ui.alpha-nvim"),
		enabled = false,
		lazy = false,
	},
	{
		"stevearc/dressing.nvim",
		config = load_config("ui.dressing"),
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"nvim-lualine/lualine.nvim",
		config = load_config("ui.lualine"),
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"arkav/lualine-lsp-progress",
			-- "yavorski/lualine-lsp-client-name.nvim",
			{
				"SmiteshP/nvim-navic",
				enabled = false,
				dependencies = {
					"neovim/nvim-lspconfig"
				}
			}
		},
	},
	{
		"b0o/incline.nvim",
		config = load_config("ui.incline"),
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"akinsho/bufferline.nvim",
		config = load_config("ui.bufferline"),
		version = "*",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"tiagovla/scope.nvim",
		},
		keys = {
			map(1, { "n" }, tab_leader .. "r", function() local char = vim.fn.input("Name: ") if char ~= "" then vim.cmd("BufferLineTabRename " .. char) else vim.notify("No name inserted") end end, { desc = "Rename" }),
			map(1, { "n" }, tab_leader .. "n", function() local char = vim.fn.input("Name: ") if char ~= "" then vim.cmd("tabnew") vim.cmd("BufferLineTabRename " .. char) else vim.notify("No name inserted") end end, { desc = "Open named" }),
			map(1, { "n" }, bufferline_leader, "", { desc = "Bufferline" }),
			map(1, { "n" }, bufferline_leader .. "x", "", { desc = "Close" }),
			map(1, { "n" }, bufferline_leader .. "g", "", { desc = "Group" }),
			map(1, { "n" }, bufferline_leader .. "S", "", { desc = "Sort" }),
			map(1, { "n" }, bufferline_leader .. "p", "", { desc = "Pick" }),
			map(1, { "n" }, bufferline_leader .. "s", "", { desc = "Swap" }),
			map(1, { "n" }, bufferline_leader .. "o", "", { desc = "Open" }),

			map(1, { "n" }, "<c-1>", "<cmd>BufferLineGoToBuffer 1<cr>", { desc = "Buffer 1" }),
			map(1, { "n" }, "<c-2>", "<cmd>BufferLineGoToBuffer 2<cr>", { desc = "Buffer 2" }),
			map(1, { "n" }, "<c-3>", "<cmd>BufferLineGoToBuffer 3<cr>", { desc = "Buffer 3" }),
			map(1, { "n" }, "<c-4>", "<cmd>BufferLineGoToBuffer 4<cr>", { desc = "Buffer 4" }),
			map(1, { "n" }, "<c-5>", "<cmd>BufferLineGoToBuffer 5<cr>", { desc = "Buffer 5" }),
			map(1, { "n" }, "<c-6>", "<cmd>BufferLineGoToBuffer 6<cr>", { desc = "Buffer 6" }),
			map(1, { "n" }, "<c-7>", "<cmd>BufferLineGoToBuffer 7<cr>", { desc = "Buffer 7" }),
			map(1, { "n" }, "<c-8>", "<cmd>BufferLineGoToBuffer 8<cr>", { desc = "Buffer 8" }),
			map(1, { "n" }, "<c-9>", "<cmd>BufferLineGoToBuffer 9<cr>", { desc = "Buffer 9" }),
			map(1, { "n" }, "<c-0>", "<cmd>BufferLineGoToBuffer 10<cr>",{ desc = "Buffer 10" }),

			map(1, { "n" }, bufferline_leader .. "ol", "<cmd>enew<cr>", { desc = "Right" }),
			map(1, { "n" }, bufferline_leader .. "oh", "<cmd>enew<cr><cmd>BufferLineMovePrev<cr>", { desc = "Left" }),

			map(1, { "n" }, bufferline_leader .. "<c-s-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Go previous" }),
			map(1, { "n" }, bufferline_leader .. "<c-s-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Go next" }),
			map(1, { "n" }, bufferline_leader .. "1", "<cmd>BufferLineGoToBuffer 1<cr>", { desc = "Buffer 1" }),
			map(1, { "n" }, bufferline_leader .. "2", "<cmd>BufferLineGoToBuffer 2<cr>", { desc = "Buffer 2" }),
			map(1, { "n" }, bufferline_leader .. "3", "<cmd>BufferLineGoToBuffer 3<cr>", { desc = "Buffer 3" }),
			map(1, { "n" }, bufferline_leader .. "4", "<cmd>BufferLineGoToBuffer 4<cr>", { desc = "Buffer 4" }),
			map(1, { "n" }, bufferline_leader .. "5", "<cmd>BufferLineGoToBuffer 5<cr>", { desc = "Buffer 5" }),
			map(1, { "n" }, bufferline_leader .. "6", "<cmd>BufferLineGoToBuffer 6<cr>", { desc = "Buffer 6" }),
			map(1, { "n" }, bufferline_leader .. "7", "<cmd>BufferLineGoToBuffer 7<cr>", { desc = "Buffer 7" }),
			map(1, { "n" }, bufferline_leader .. "8", "<cmd>BufferLineGoToBuffer 8<cr>", { desc = "Buffer 8" }),
			map(1, { "n" }, bufferline_leader .. "9", "<cmd>BufferLineGoToBuffer 9<cr>", { desc = "Buffer 9" }),
			map(1, { "n" }, bufferline_leader .. "P", "<cmd>BufferLineTogglePin<cr>", { desc = "Toggle pin" }),
			map(1, { "n" }, bufferline_leader .. "t", "<cmd>ScopeMoveBuf<cr>", { desc = "To tab" }),

			map(1, { "n" }, bufferline_leader .. "s<c-s-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Go previous" }),
			map(1, { "n" }, bufferline_leader .. "s<c-s-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Go next" }),
			map(1, { "n" }, bufferline_leader .. "sh", "<cmd>BufferLineMovePrev<cr>", { desc = "Previous" }),
			map(1, { "n" }, bufferline_leader .. "sl", "<cmd>BufferLineMoveNext<cr>", { desc = "Next" }),
			map(1, { "n" }, bufferline_leader .. "po", function() vim.cmd("BufferLinePick") end, { desc = "Open" }),
			map(1, { "n" }, bufferline_leader .. "px", function() vim.cmd("BufferLinePickClose") end, { desc = "Close" }),

			map(1, { "n" }, bufferline_leader .. "St", "<cmd>BufferLineSortByTabs<cr>", { desc = "By tab" }),
			map(1, { "n" }, bufferline_leader .. "Sd", "<cmd>BufferLineSortByDirectory<cr>", { desc = "By directory" }),
			map(1, { "n" }, bufferline_leader .. "Se", "<cmd>BufferLineSortByExtension<cr>", { desc = "By extension" }),
			map(1, { "n" }, bufferline_leader .. "Sr", "<cmd>BufferLineSortByRelativeDirectory<cr>", { desc = "By relative directory" }),

			map(1, { "n" }, bufferline_leader .. "gt", "<cmd>BufferLineGroupToggle<cr>", { desc = "Toggle" }),
			map(1, { "n" }, bufferline_leader .. "gd", "<cmd>BufferLineGroupClose<cr>", { desc = "Close" }),

			map(1, { "n" }, bufferline_leader .. "x<c-s-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Go previous" }),
			map(1, { "n" }, bufferline_leader .. "x<c-s-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Go next" }),
			map(1, { "n" }, bufferline_leader .. "xH", "<cmd>BufferLineCloseLeft<cr>", { desc = "All left" }),
			map(1, { "n" }, bufferline_leader .. "xL", "<cmd>BufferLineCloseRight<cr>", { desc = "All right" }),
			map(1, { "n" }, bufferline_leader .. "xo", "<cmd>BufferLineCloseOthers<cr>", { desc = "Others" }),
			map(1, { "n" }, windows_leader .. "xO", "<cmd>BufferLineCloseOthers<cr>", { desc = "Others (With buffer)" }),
			map(1, { "n" }, bufferline_leader .. "xa", "<cmd>BufferLineCloseOthers<cr><cmd>bdelete<cr>", { desc = "All" }),
		},
	},
	{
		"folke/noice.nvim",
		config = load_config("ui.noice"),
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"MunifTanjim/nui.nvim",
			{
				"rcarriga/nvim-notify",
				config = load_config("ui.notify"),
			},
		},
	},
	{
		"eandrju/cellular-automaton.nvim",
		config = load_config("ui.cellular-automaton"),
		cmd = { "CellularAutomaton" },
	},
	{
		"rachartier/tiny-glimmer.nvim",
		config = load_config("ui.tiny-glimmer"),
		event = { "BufReadPre", "BufNewFile" },
	},

	----- tools -----
	{
		"rmagatti/auto-session",
		config = load_config("tools.auto-session"),
		event = { "VimLeavePre" },
		cmd = { "SessionRestore", "SessionSave" },
		keys = {
			map(1, { "n" }, session_leader, "", { desc = "Session" }),
			map(1, { "n" }, session_leader .. "s", "<cmd>SessionSave<cr>", { desc = "Save" }),
			map(1, { "n" }, session_leader .. "r", "<cmd>SessionRestorecr>", { desc = "Restore" }),
			map(1, { "n" }, session_leader .. "S", "<cmd>SessionSearch<cr>", { desc = "Search" }),
			map(1, { "n" }, session_leader .. "d", "<cmd>SessionDelete<cr>", { desc = "Delete" }),
			map(1, { "n" }, session_leader .. "t", "<cmd>SessionToggleAutoSave<cr>", { desc = "Toggle(autosave)" }),
			map(1, { "n" }, session_leader .. "d", "<cmd>SessionDisableAutoSave<cr>", { desc = "Disable(autosave)" }),
		}
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		config = load_config("tools.neo-tree"),
		branch = "v3.x",
		cmd = { "Neotree" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim",
			{
				"s1n7ax/nvim-window-picker",
				config = load_config("tools.window-picker"),
				version = "2.*",
				name = "window-picker",
			},
		},
		keys = {
			map(1, { "n" }, neotree_leader, "", { desc = "Explorer" }),
			map(1, { "n" }, neotree_leader .. "m", "", { desc = "Move" }),
			map(1, { "n" }, neotree_leader .. "r", "", { desc = "Reveal current" }),

			map(1, { "n" }, neotree_leader .. "f", "<cmd>Neotree focus<cr>", { desc = "Focus" }),
			map(1, { "n" }, neotree_leader .. "x", "<cmd>Neotree close<cr><cmd>Neotree close filesystem<cr><cmd>Neotree close buffers<cr><cmd>Neotree close git_status<cr>", { desc = "Close" }),

			map(1, { "n" }, neotree_leader .. "rx", function() func.neotree_reveal_cwd(false, false) end, { desc = "Off" }),
			map(1, { "n" }, neotree_leader .. "ro", function() func.neotree_reveal_cwd(true, true) end, { desc = "Leave files opened" }),
			map(1, { "n" }, neotree_leader .. "rc", function() func.neotree_reveal_cwd(true, false) end, { desc = "Leave files closed" }),

			map(1, { "n" }, neotree_leader .. "e", "<cmd>Neotree toggle<cr>", { desc = "Toggle" }),
			map(1, { "n" }, neotree_leader .. "g", "<cmd>Neotree git_status<cr>", { desc = "Git explorer" } ),
			map(1, { "n" }, neotree_leader .. "b", "<cmd>Neotree buffers<cr>", { desc = "Buffers explorer" }),
			map(1, { "n" }, neotree_leader .. "mh", "<cmd>Neotree left<cr>", { desc = "Left" }),
			map(1, { "n" }, neotree_leader .. "mk", "<cmd>Neotree top<cr>", { desc = "Up" }),
			map(1, { "n" }, neotree_leader .. "ml", "<cmd>Neotree right<cr>", { desc = "Right" }),
			map(1, { "n" }, neotree_leader .. "mj", "<cmd>Neotree bottom<cr>", { desc = "Down" }),
			map(1, { "n" }, neotree_leader .. "mf", "<cmd>Neotree focus float<cr>", { desc = "Float" }),
			map(1, { "n" }, neotree_leader .. "c", "<cmd>Neotree reveal<cr>", { desc = "Reveal Current" }),
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		config = load_config("tools.telescope"),
		branch = "0.1.x",
		tag = "0.1.8",
		cmd = { "Telescope" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"Snikimonkd/telescope-git-conflicts.nvim",
			"nvim-telescope/telescope-media-files.nvim",
			"nvim-telescope/telescope-hop.nvim",
		},
		keys = {
			map(1, { "n" }, telescope_leader, "", { desc = "Find" }),
			map(1, { "n" }, telescope_leader .. "a", "<cmd>Telescope builtin<cr>", { desc = "All" }),
			map(1, { "n" }, telescope_leader .. "b", "<cmd>Telescope buffers<cr>", { desc = "Buffers" }),
			map(1, { "n" }, telescope_leader .. "c", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Current" }),
			map(1, { "n" }, telescope_leader .. "C", "<cmd>Telescope commands<cr>", { desc = "Commands" }),
			map(1, { "n" }, telescope_leader .. "f", "<cmd>Telescope find_files<cr>", { desc = "Files" }),
			map(1, { "n" }, telescope_leader .. "F", "<cmd>Telescope resume<cr>", { desc = "Resume" }),
			map(1, { "n" }, telescope_leader .. "h", "<cmd>Telescope help_tags<cr>", { desc = "Helps" }),
			map(1, { "n" }, telescope_leader .. "m", "<cmd>Telescope marks<cr>", { desc = "Marks" }),
			map(1, { "n" }, telescope_leader .. "M", "<cmd>Telescope media_files<cr>", { desc = "Media" }),
			map(1, { "n" }, telescope_leader .. "o", "<cmd>Telescope oldfiles<cr>", { desc = "Old files" }),
			map(1, { "n" }, telescope_leader .. "r", "<cmd>Telescope registers<cr>", { desc = "Registers" }),
			map(1, { "n" }, telescope_leader .. "u", "<cmd>Telescope undo<cr>", { desc = "Undo" }),
			map(1, { "n" }, telescope_leader .. "w", "<cmd>Telescope live_grep<cr>", { desc = "Words" }),
			map(1, { "n" }, telescope_leader .. "s", "<cmd>Telescope spell_suggest<cr>", { desc = "Spell suggest" }),
			map(1, { "n" }, telescope_leader .. "l", "<cmd>Telescope loclist<cr>", { desc = "Loclist" }),
			map(1, { "n" }, telescope_leader .. "q", "<cmd>Telescope quickfix<cr>", { desc = "Quickfix" }),
			map(1, { "n" }, telescope_leader .. "z", "<cmd>Telescope colorscheme<cr>", { desc = "Colorscheme" }),
			map(1, { "n" }, navigation_leader1 .. "H", "<cmd>Telescope search_history<cr>", { desc = "Search history" }),
			map(1, { "n" }, notification_leader .. "f", "<cmd>Telescope noice<cr>", { desc = "Find (Noice)" }),
		},
	},
	{
		"anuvyklack/windows.nvim",
		config = load_config("tools.windows"),
		dependencies = {
			"anuvyklack/middleclass",
			"anuvyklack/animation.nvim",
		},
		keys = {
			map(1, { "n" }, windows_leader .. "rmm", "<cmd>WindowsMaximize<cr>", { desc = "Maximize" }),
			map(1, { "n" }, windows_leader .. "a", "<cmd>WindowsToggleAutowidth<cr>", { desc = "Toggle auto expand" }),
			map(1, { "n" }, windows_leader .. "re", "<cmd>WindowsEqualize<cr>", { desc = "Equal" }),
			map(1, { "n" }, windows_leader .. "rmh", "<cmd>WindowsMaximizeHorizontally<cr>", { desc = "Maximize horizontal" }),
			map(1, { "n" }, windows_leader .. "rml", "<cmd>WindowsMaximizeHorizontally<cr>", { desc = "Maximize horizontal" }),
			map(1, { "n" }, windows_leader .. "rmj", "<cmd>WindowsMaximizeVertically<cr>", { desc = "Maximize vertical" }),
			map(1, { "n" }, windows_leader .. "rmk", "<cmd>WindowsMaximizeVertically<cr>", { desc = "Maximize vertical" }),
		},
	},
	{
		"mrjones2014/smart-splits.nvim",
		config = load_config("tools.smart-splits"),
		version = ">=1.0.0",
		dependencies = {
			"kwkarlwang/bufresize.nvim",
		},
		keys = {
			map(1, { "n" }, windows_leader .. "o<c-h>", function() require("smart-splits").move_cursor_left() end, { desc = "Go Left" }),
			map(1, { "n" }, windows_leader .. "o<c-j>", function() require("smart-splits").move_cursor_down() end, { desc = "Go Down" }),
			map(1, { "n" }, windows_leader .. "o<c-k>", function() require("smart-splits").move_cursor_up() end, { desc = "Go Up" }),
			map(1, { "n" }, windows_leader .. "o<c-l>", function() require("smart-splits").move_cursor_right() end, { desc = "Go Right" }),
			map(1, { "n" }, windows_leader .. "o<c-p>", function() require("smart-splits").move_cursor_previous() end, { desc = "Go Right" }),

			map(1, { "n" }, windows_leader .. "x<c-h>", function() require("smart-splits").move_cursor_left() end, { desc = "Go Left" }),
			map(1, { "n" }, windows_leader .. "x<c-j>", function() require("smart-splits").move_cursor_down() end, { desc = "Go Down" }),
			map(1, { "n" }, windows_leader .. "x<c-k>", function() require("smart-splits").move_cursor_up() end, { desc = "Go Up" }),
			map(1, { "n" }, windows_leader .. "x<c-l>", function() require("smart-splits").move_cursor_right() end, { desc = "Go Right" }),
			map(1, { "n" }, windows_leader .. "x<c-l>", function() require("smart-splits").move_cursor_previous() end, { desc = "Go Right" }),

			map(1, { "n" }, windows_leader .. "m<c-h>", function() require("smart-splits").move_cursor_left() end, { desc = "Go Left" }),
			map(1, { "n" }, windows_leader .. "m<c-j>", function() require("smart-splits").move_cursor_down() end, { desc = "Go Down" }),
			map(1, { "n" }, windows_leader .. "m<c-k>", function() require("smart-splits").move_cursor_up() end, { desc = "Go Up" }),
			map(1, { "n" }, windows_leader .. "m<c-l>", function() require("smart-splits").move_cursor_right() end, { desc = "Go Right" }),
			map(1, { "n" }, windows_leader .. "m<c-p>", function() require("smart-splits").move_cursor_previous() end, { desc = "Go Right" }),

			map(1, { "n" }, windows_leader .. "sh", "<cmd>SmartSwapLeft<cr><c-w>h", { desc = "Left" }),
			map(1, { "n" }, windows_leader .. "sj", "<cmd>SmartSwapDown<cr><c-w>j", { desc = "Down" }),
			map(1, { "n" }, windows_leader .. "sk", "<cmd>SmartSwapUp<cr><c-w>k", { desc = "Up" }),
			map(1, { "n" }, windows_leader .. "sl", "<cmd>SmartSwapRight<cr><c-w>l", { desc = "Right" }),
			map(1, { "n" }, windows_leader .. "s<c-h>", function() require("smart-splits").move_cursor_left() end, { desc = "Go Left" }),
			map(1, { "n" }, windows_leader .. "s<c-j>", function() require("smart-splits").move_cursor_down() end, { desc = "Go Down" }),
			map(1, { "n" }, windows_leader .. "s<c-k>", function() require("smart-splits").move_cursor_up() end, { desc = "Go Up" }),
			map(1, { "n" }, windows_leader .. "s<c-l>", function() require("smart-splits").move_cursor_right() end, { desc = "Go Right" }),
			map(1, { "n" }, windows_leader .. "s<c-p>", function() require("smart-splits").move_cursor_previous() end, { desc = "Go Right" }),
		},
	},
	{
		"chrisgrieser/nvim-spider",
		config = load_config("tools.spider"),
		keys = {
			map(1, { "n", "o", "x" }, "w", function() require("spider").motion('w') end, { desc = "Spider-w" }),
			map(1, { "n", "o", "x" }, "e", function() require("spider").motion('e') end, { desc = "Spider-e" }),
			map(1, { "n", "o", "x" }, "b", function() require("spider").motion('b') end, { desc = "Spider-b" }),
			map(1, { "n", "o", "x" }, "ge", function() require("spider").motion('ge') end, { desc = "Spider-ge" }),
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		config = load_config("tools.gitsigns"),
		event = { "BufReadPre", "BufNewFile" },
		keys = {
			map(1, { "n" }, "[g", "<cmd>Gitsigns next_hunk<cr>", { desc = "Git hunk" }),
			map(1, { "n" }, "]g", "<cmd>Gitsigns prev_hunk<cr>", { desc = "Git hunk" }),
			map(1, { "n" }, git_leader, "", { desc = "Git" }),
			map(1, { "n" }, git_leader .. "a", "", { desc = "Add(Stage)" }),
			map(1, { "n" }, git_leader .. "l", "", { desc = "List" }),
			map(1, { "n" }, git_leader .. "f", "", { desc = "Find" }),
			map(1, { "n" }, git_leader .. "u", "", { desc = "Undo" }),
			map(1, { "n" }, git_leader .. "h", "", { desc = "Hunk" }),
			map(1, { "n" }, git_leader .. "d", "", { desc = "Diff" }),
			map(1, { "n" }, git_leader .. "b", "", { desc = "Blame" }),
			map(1, { "n" }, git_leader .. "t", "", { desc = "Toggle" }),
			map(1, { "n" }, git_leader .. "B", "", { desc = "Base" }),
			map(1, { "n" }, git_leader .. "R", "", { desc = "Reset" }),
			map(1, { "n" }, git_leader .. "n", "<cmd>Gitsigns next_hunk<cr>", { desc = "Next" }),
			map(1, { "n" }, git_leader .. "p", "<cmd>Gitsigns prev_hunk<cr>", { desc = "Previous" }),

			map(1, { "n" }, git_leader .. "fc", "<cmd>Telescope git_commits<cr>", { desc = "All commits" }),
			map(1, { "n" }, git_leader .. "fC", "<cmd>Telescope git_bcommits<cr>", { desc = "Buffer commits" }),
			map(1, { "n" }, git_leader .. "fs", "<cmd>Telescope git_status<cr>", { desc = "Status" }),
			map(1, { "n" }, git_leader .. "fb", "<cmd>Telescope git_branches<cr>", { desc = "Branches" }),
			map(1, { "n" }, git_leader .. "ff", "<cmd>Telescope git_files<cr>", { desc = "Files" }),
			map(1, { "n" }, git_leader .. "fS", "<cmd>Telescope git_stash<cr>", { desc = "Stash" }),
			map(1, { "n" }, git_leader .. "fx", "<cmd>Telescope conflicts<cr>", { desc = "Conflicts" }),

			map(1, { "n" }, git_leader .. "ab", "<cmd>Gitsigns stage_buffer<cr>", { desc = "Buffer" }),
			map(1, { "n" }, git_leader .. "ah", "<cmd>Gitsigns stage_hunk<cr>", { desc = "Hunk" }),

			map(1, { "n" }, git_leader .. "S", "<cmd>Gitsigns show<cr>", { desc = "Show" }),
			map(1, { "n" }, git_leader .. "r", "<cmd>Gitsigns refresh<cr>", { desc = "Refresh" }),
			map(1, { "n" }, git_leader .. "G", "<cmd>Gitsigns get_actions<cr>", { desc = "Get actions" }),
			map(1, { "n" }, git_leader .. "dw", "<cmd>Gitsigns toggle_word_diff<cr>", { desc = "Word" }),

			map(1, { "n" }, git_leader .. "hu", "<cmd>Gitsigns undo_stage_hunk<cr>", { desc = "Undo" }),
			map(1, { "n" }, git_leader .. "hp", "<cmd>Gitsigns preview_hunk_inline<cr>", { desc = "Preview inline" }),
			map(1, { "n" }, git_leader .. "hP", "<cmd>Gitsigns preview_hunk<cr>", { desc = "Preview" }),
			map(1, { "n" }, git_leader .. "hr", "<cmd>Gitsigns reset_hunk<cr>", { desc = "Reset" }),
			map(1, { "n" }, git_leader .. "hs", "<cmd>Gitsigns select_hunk<cr>", { desc = "Select" }),
			map(1, { "n" }, git_leader .. "hg", "<cmd>Gitsigns get_hunks<cr>", { desc = "Get" }),
			map(1, { "n" }, git_leader .. "hv", "<cmd>Gitsigns nav_hunk<cr>", { desc = "Navigate" }),

			map(1, { "n" }, git_leader .. "dh", function() vim.cmd("Gitsigns diffthis") vim.cmd("wincmd L") end, { desc = "Left" }),
			map(1, { "n" }, git_leader .. "dj", function() vim.cmd("Gitsigns diffthis") vim.cmd("wincmd K") end, { desc = "Down" }),
			map(1, { "n" }, git_leader .. "dk", function() vim.cmd("set nosplitbelow") vim.cmd("Gitsigns diffthis") vim.cmd("wincmd J") end, { desc = "Up" }),
			map(1, { "n" }, git_leader .. "dl", function() vim.cmd("set splitright") vim.cmd("Gitsigns diffthis") vim.cmd("wincmd H") end, { desc = "Right" }),

			map(1, { "n" }, git_leader .. "bc", "<cmd>Gitsigns blame_line<cr>", { desc = "Current line" }),
			map(1, { "n" }, git_leader .. "be", "<cmd>Gitsigns toggle_current_line_blame<cr>", { desc = "Every line" }),
			map(1, { "n" }, git_leader .. "bs", "<cmd>Gitsigns blame<cr>", { desc = "Split view" }),
			map(1, { "n" }, git_leader .. "ts", "<cmd>Gitsigns toggle_signs<cr>", { desc = "Signs" }),
			map(1, { "n" }, git_leader .. "tl", "<cmd>Gitsigns toggle_linehl<cr>", { desc = "Line highlight" }),
			map(1, { "n" }, git_leader .. "tn", "<cmd>Gitsigns toggle_numhl<cr>", { desc = "Number highlight" }),
			map(1, { "n" }, git_leader .. "td", "<cmd>Gitsigns toggle_deleted<cr>", { desc = "Delete highlight" }),

			map(1, { "n" }, git_leader .. "Bc", "<cmd>Gitsigns change_base<cr>", { desc = "Change" }),
			map(1, { "n" }, git_leader .. "Br", "<cmd>Gitsigns reset_base<cr>", { desc = "Reset" }),

			map(1, { "n" }, git_leader .. "Ri", "<cmd>Gitsigns reset_buffer_index<cr>", { desc = "Buffer index" }),
			map(1, { "n" }, git_leader .. "Rb", "<cmd>Gitsigns reset_buffer<cr>", { desc = "Buffer" }),

			map(1, { "n" }, git_leader .. "ll", "<cmd>Gitsigns setloclist<cr>", { desc = "Loclist" }),
			map(1, { "n" }, git_leader .. "lq", "<cmd>Gitsigns setqflist<cr>", { desc = "Qflist" }),

		},
	},
	{
		"kdheepak/lazygit.nvim",
		config = load_config("tools.lazygit"),
		cmd = { "LazyGit" },
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			map(1, { "n" }, lazygit_leader, "<cmd>LazyGit<cr>", { desc = "Lazygit" }),
		},
	},
	{
		"folke/flash.nvim",
		config = load_config("tools.flash"),
		keys = {
			map(1, { "n", "x", "o" }, navigation_leader1 .. "vt", function() require("flash").treesitter() end, { desc = "Select treesitter" }),
			map(1, { "n", "x", "o" }, navigation_leader1 .. "C", function() require("flash").jump({ pattern = vim.fn.expand("<cword>") }) end, { desc = "Cursor" }),
			map(1, { "n", "x", "o" }, navigation_leader1 .. "vw", function() require("flash").jump({ search = { mode = function(pattern) return ([[\<%s\w*\>]]):format(pattern), ([[\<%s]]):format(pattern) end, }, jump = { pos = "range" }, }) end, { desc = "Select word" }),
		},
	},
	{
		"akinsho/toggleterm.nvim",
		config = load_config("tools.toggleterm"),
		version = "*",
		cmd = { "ToggleTerm" },
		keys = {
		},
	},
	{
		"mbbill/undotree",
		config = load_config("tools.undotree"),
		cmd = { "Undotree" },
		keys = {
			map(1, { "n" }, undotree_leader, "", { desc = "Undotree" }),
			map(1, { "n" }, undotree_leader .. "m", "", { desc = "Move" }),
			map(1, { "n" }, undotree_leader .. "f", "<cmd>UndotreeShow<cr><cmd>UndotreeFocus<cr>", { desc = "Focus" }),
			map(1, { "n" }, undotree_leader .. "x", "<cmd>UndotreeHide<cr>", { desc = "Close" }),
			map(1, { "n" }, undotree_leader .. "u", "<cmd>UndotreeToggle<cr>", { desc = "Toggle" }),

			map(1, { "n" }, undotree_leader .. "mh", function () func.undotree_window("topleft vertical 30 new", "rightbelow new" ) end, { desc = "Left" }),
			map(1, { "n" }, undotree_leader .. "ml", function () func.undotree_window("botright vertical 30 new", "rightbelow new" ) end, { desc = "Right" }),
			map(1, { "n" }, undotree_leader .. "mk", function () func.undotree_window("leftabove horizontal 10 new", "rightbelow vertical new") end, { desc = "Up" }),
			map(1, { "n" }, undotree_leader .. "mj", function () func.undotree_window("botright horizontal 10 new", "rightbelow vertical new") end, { desc = "Down" }),

			map(1, { "n" }, undotree_leader .. "mH", function () func.undotree_window("topleft vertical 30 new", "botright 10 new") end, { desc = "Left + Down" }),
			map(1, { "n" }, undotree_leader .. "mJ", function () func.undotree_window("rightbelow vertical 30 new", "botright 10 new") end, { desc = "Right + Down" }),
			map(1, { "n" }, undotree_leader .. "mK", function () func.undotree_window("belowright vertical 30 new", "topleft 10 new") end, { desc = "Right + Up" }),
			map(1, { "n" }, undotree_leader .. "mL", function () func.undotree_window("topleft vertical 30 new", "topleft 10 new") end, { desc = "Left + Up" }),
		}
	},
	{
		"folke/snacks.nvim",
		config = load_config("tools.snacks"),
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons"
		},
		keys = {
			map(1, { "n" }, bufferline_leader .. "xc", function () Snacks.bufdelete() end, { desc = "Current" }),
			map(1, { "n" }, bufferline_leader .. "xh", function () vim.cmd("bprevious") Snacks.bufdelete() end, { desc = "Left" }),
			map(1, { "n" }, bufferline_leader .. "xl", function () vim.cmd("bnext") Snacks.bufdelete() end, { desc = "Right" }),

					-- vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(tostring(i+1) .. "<cmd>exe v:count1 . 'ToggleTerm direction=" .. toggleterm_direction .. "'<cr><c-w>=", true, false, true), "n", false)
			map(1, { "n" }, notification_leader .. "h", function() Snacks.notifier.show_history() end, { desc = "History (Snacks)" }),
			map(1, { "n" }, notification_leader .. "d", function() Snacks.notifier.hide() vim.cmd("NoiceDismiss") end, { desc = "Dismiss all" }),

			map(1, { "n" }, toggleterm_leader, "", { desc = "Terminal" }),
			map(1, { "n" }, toggleterm_leader .. "o", "", { desc = "Open" }),
			map(1, { "n" }, toggleterm_leader .. "t", "", { desc = "Toggle" }),
			map(1, { "n" }, toggleterm_leader .. "1", function () func.snacks_toggle_terminal_toggle("t", 1) end, { desc = "Toggle 1" }),
			map(1, { "n" }, toggleterm_leader .. "2", function () func.snacks_toggle_terminal_toggle("t", 2) end, { desc = "Toggle 2" }),
			map(1, { "n" }, toggleterm_leader .. "3", function () func.snacks_toggle_terminal_toggle("t", 3) end, { desc = "Toggle 3" }),
			map(1, { "n" }, toggleterm_leader .. "4", function () func.snacks_toggle_terminal_toggle("t", 4) end, { desc = "Toggle 4" }),
			map(1, { "n" }, toggleterm_leader .. "5", function () func.snacks_toggle_terminal_toggle("t", 5) end, { desc = "Toggle 5" }),
			map(1, { "n" }, toggleterm_leader .. "6", function () func.snacks_toggle_terminal_toggle("t", 6) end, { desc = "Toggle 6" }),
			map(1, { "n" }, toggleterm_leader .. "7", function () func.snacks_toggle_terminal_toggle("t", 7) end, { desc = "Toggle 7" }),
			map(1, { "n" }, toggleterm_leader .. "8", function () func.snacks_toggle_terminal_toggle("t", 8) end, { desc = "Toggle 8" }),
			map(1, { "n" }, toggleterm_leader .. "9", function () func.snacks_toggle_terminal_toggle("t", 9) end, { desc = "Toggle 9" }),
			map(1, { "n" }, toggleterm_leader .. "0", function () func.snacks_toggle_terminal_toggle("t", 10) end, { desc = "Toggle 10" }),

			map(1, { "n" }, toggleterm_leader .. "oh", function () func.snacks_toggle_terminal_toggle("h", 0) end, { desc = "Left" }),
			map(1, { "n" }, toggleterm_leader .. "oj", function () func.snacks_toggle_terminal_toggle("j", 0) end, { desc = "Bottom" }),
			map(1, { "n" }, toggleterm_leader .. "ok", function () func.snacks_toggle_terminal_toggle("k", 0) end, { desc = "Top" }),
			map(1, { "n" }, toggleterm_leader .. "ol", function () func.snacks_toggle_terminal_toggle("l", 0) end, { desc = "Right" }),
			map(1, { "n" }, toggleterm_leader .. "of", function () func.snacks_toggle_terminal_toggle("f", 0) end, { desc = "Float" }),

			map(1, { "n" }, toggleterm_leader .. "t", function () func.snacks_toggle_terminal_toggle("j", 11) end, { desc = "Toggle" }),
			map(1, { "n" }, toggleterm_leader .. "h", function () func.snacks_toggle_terminal_toggle("h", 12) end, { desc = "Left" }),
			map(1, { "n" }, toggleterm_leader .. "j", function () func.snacks_toggle_terminal_toggle("j", 13) end, { desc = "Bottom" }),
			map(1, { "n" }, toggleterm_leader .. "k", function () func.snacks_toggle_terminal_toggle("k", 14) end, { desc = "Top" }),
			map(1, { "n" }, toggleterm_leader .. "l", function () func.snacks_toggle_terminal_toggle("l", 15) end, { desc = "Right" }),
			map(1, { "n" }, toggleterm_leader .. "f", function () func.snacks_toggle_terminal_toggle("f", 16) end, { desc = "Float" }),
		}
	},
	{
		"MagicDuck/grug-far.nvim",
		config = load_config("tools.grugfar"),
		cmd = { "GrugFar" },
	},
	{
		"barrett-ruth/live-server.nvim",
		config = load_config("tools.live-server"),
		cmd = { "LiveServerStart", "LiveServerStop" },
		build = "pnpm add -g live-server", -- npm install pnpm
	},
	{
		"derektata/lorem.nvim",
		config = load_config("tools.lorem"),
		cmd = { "LoremIpsum" },
	},
	-- {
	-- 	"3rd/image.nvim",
	-- 	config = load_config("tools.image");
	-- 	ft = { "jpg", "png", "md", "jpeg", "webp", "svg", "gif", "bmp", "tiff" },
	-- },
	{
		"m4xshen/hardtime.nvim",
		config = load_config("tools.hardtime"),
		cmd = { "Hardtime" },
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},
	{
		"echasnovski/mini.ai",
		config = load_config("tools.mini"),
		version = "*",
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"mg979/vim-visual-multi",
		config = load_config("tools.visual-multi"),
		branch = "master",
		event = { "VeryLazy" },
		keys = {
			-- NOTE: Inside 
			-- Importent default keys are:
			-- mode | <key> | subkey
			-- nv mode | <c-n> = "Next match" | n = "select Next" N = "Select previous" q = "Skip next" Q = "Skip previous"
			-- n mode | <c-down> = "Cursor down" | Q = "Skip previous"
			-- n mode | <c-up> = "Cursor up" | Q = "Skip previous"
			-- n mode | <tab> = "Change mode(cursor & extend)"


			-- map(1, { "n" }, ";p", func.visual_multi_add_cursor_at_pos, { desc = "Add cursor position" }),
			-- map(1, { "n" }, ";d", func.visual_multi_add_cursor_down, { desc = "Add cursor down" }),

			-- map(1, { "n" }, ";p", "<Plug>(VM-Add-Cursor-At-Pos)", { desc = "Add cursor position" }),
			-- map(1, { "n" }, ";n", "<Plug>(VM-Find-Under)", { desc = "Find under" }),
			-- map(1, { "n" }, "<tab>", "<Plug>(VM-Toggle-Mappings)", { desc = "Toggle Visual multi" }),
			-- map(1, { "n" }, "<tab>", "<Plug>(VM-Toggle-Mappings)", { desc = "Toggle Visual multi" }),
			-- map(1, { "n" }, ";b", "<Plug>(VM-Toggle-Block)", { desc = "Toggle Visual multi" }),
			-- map(1, { "n" }, ";s", "<Plug>(VM-Toggle-Single-Region)", { desc = "Toggle Visual multi" }),
			-- map(1, { "n" }, ";m", "<Plug>(VM-Toggle-Multiline)", { desc = "Toggle Visual multi" }),
			--
			-- map(1, { "n" }, "<c-n>", "<Plug>(VM-Find-Subword-Under)", { desc = "Find subword under" }),
			-- map(1, { "n" }, visual_multi_leader .. "a", "<Plug>(VM-Select-All)", { desc = "Select all" }),
			-- map(1, { "n" }, ";a", "<Plug>(VM-Select-All)", { desc = "Select all" }),
			-- map(1, { "n" }, ",/", "<Plug>(VM-Start-Regex-Search)", { desc = "Regex search" }),
			-- map(1, { "n" }, ";d", "<Plug>(VM-Add-Cursor-Down)", { desc = "Add cursor down" }),
			-- map(1, { "n" }, ";u", "<Plug>(VM-Add-Cursor-Up)", { desc = "Add cursor up" }),
			-- map(1, { "n" }, "<c-p>", "<Plug>(VM-Add-Cursor-At-Pos)", { desc = "Add cursor position" }),

			-- map(1, { "n" }, ",/", "<Plug>(VM-Visual-Regex)", { desc = "Word" }), 
			-- map(1, { "n" }, ",A", "<Plug>(VM-Visual-All)", { desc = "Word" }), 
			-- map(1, { "n" }, ",a", "<Plug>(VM-Visual-Add)", { desc = "Word" }), 
			-- map(1, { "n" }, ",f", "<Plug>(VM-Visual-Find)", { desc = "Word" }), 
			-- map(1, { "n" }, ",c", "<Plug>(VM-Visual-Cursors)", { desc = "Word" }), 
			-- map(1, { "n" }, ",B", "<Plug>(VM-Select-Cursor-Down)", { desc = "Word" }), 
			-- map(1, { "n" }, ",C", "<Plug>(VM-Select-Cursor-Up)", { desc = "Word" }),
			--
			-- map(1, { "n" }, ",gr", "<Plug>(VM-Erase-Regions)", { desc = "Word" }),
			--
			-- map(1, { "n" }, "<c-leftmouse>", "<Plug>(VM-Mouse-Cursor)", { desc = "Word" }),
			-- map(1, { "n" }, "<c-rightmouse>", "<Plug>(VM-Mouse-Word)", { desc = "Word" }),
			-- map(1, { "n" }, "<m-c-rightmouse>", "<Plug>(VM-Mouse-Column)", { desc = "Word" }), 
			-- map(1, { "n" }, "<tab>", "<Plug>(VM-Switch-Mode)", { desc = "Word" }),
			--
			-- map(1, { "n" }, ";]", "<Plug>(VM-Find-Next)", { desc = "Word" }),
			-- map(1, { "n" }, ";[", "<Plug>(VM-Find-Prev)", { desc = "Word" }),
			-- map(1, { "n" }, "}", "<Plug>(VM-Goto-Next)", { desc = "Word" }),
			-- map(1, { "n" }, "{", "<Plug>(VM-Goto-Prev)", { desc = "Word" }),
			-- map(1, { "n" }, "<c-f>", "<Plug>(VM-Seek-Next)", { desc = "Word" }),
			-- map(1, { "n" }, "<c-b>", "<Plug>(VM-Seek-Prev)", { desc = "Word" }),
			-- map(1, { "n" }, "q", "<Plug>(VM-Skip-Region)", { desc = "Word" }),
			-- map(1, { "n" }, "Q", "<Plug>(VM-Remove-Region)", { desc = "Word" }),
			-- map(1, { "n" }, "o", "<Plug>(VM-Invert-Direction)", { desc = "Word" }),
			-- map(1, { "n" }, "m", "<Plug>(VM-Find-Operator)", { desc = "Word" }),
			-- map(1, { "n" }, "S", "<Plug>(VM-Surround)", { desc = "Word" }),
			-- map(1, { "n" }, "R", "<Plug>(VM-Replace-Pattern)", { desc = "Word" }),
			--
			-- map(1, { "n" }, ",`", "<Plug>(VM-Tools-Menu)", { desc = "Word" }),
			-- map(1, { "n" }, ",'", "<Plug>(VM-Show-Registers)", { desc = "Word" }),
			-- map(1, { "n" }, ",c", "<Plug>(VM-Case-Setting)", { desc = "Word" }),
			-- map(1, { "n" }, ",w", "<Plug>(VM-Toggle-Whole Word)", { desc = "Word" }),
			-- map(1, { "n" }, ",t", "<Plug>(VM-Transpose)", { desc = "Word" }),
			-- map(1, { "n" }, ",a", "<Plug>(VM-Align)", { desc = "Word" }),
			-- map(1, { "n" }, ",d", "<Plug>(VM-Duplicate)", { desc = "Word" }),
			-- map(1, { "n" }, ",r", "<Plug>(VM-Rewrite-Last-Search)", { desc = "Word" }),
			-- map(1, { "n" }, ",m", "<Plug>(VM-Merge-Regions)", { desc = "Word" }),
			-- map(1, { "n" }, ",s", "<Plug>(VM-Split-Regions)", { desc = "Word" }),
			-- map(1, { "n" }, ",q", "<Plug>(VM-Remove-Last-Region)", { desc = "Word" }),
			-- map(1, { "n" }, ",s", "<Plug>(VM-Visual-Subtract)", { desc = "Word" }),
			-- map(1, { "n" }, ",C", "<Plug>(VM-Case-Conversion-Menu)", { desc = "Word" }),
			-- map(1, { "n" }, ",S", "<Plug>(VM-Search-Menu)", { desc = "Word" }),
			--
			-- map(1, { "n" }, ",z", "<Plug>(VM-Run-Normal)", { desc = "Word" }),
			-- map(1, { "n" }, ",Z", "<Plug>(VM-Run-Last-Normal)", { desc = "Word" }),
			-- map(1, { "n" }, ",v", "<Plug>(VM-Run-Visual)", { desc = "Word" }),
			-- map(1, { "n" }, ",V", "<Plug>(VM-Run-Last-Visual)", { desc = "Word" }),
			-- map(1, { "n" }, ",x", "<Plug>(VM-Run-Ex)", { desc = "Word" }),
			-- map(1, { "n" }, ",X", "<Plug>(VM-Run-Last-Ex)", { desc = "Word" }),
			-- map(1, { "n" }, ",@", "<Plug>(VM-Run-Macro)", { desc = "Word" }),
			-- map(1, { "n" }, ",<", "<Plug>(VM-Align-Char)", { desc = "Word" }),
			-- map(1, { "n" }, ",>", "<Plug>(VM-Align-Regex)", { desc = "Word" }),
			-- map(1, { "n" }, ",n", "<Plug>(VM-Numbers)", { desc = "Word" }),
			-- map(1, { "n" }, ",N", "<Plug>(VM-Numbers-Append)", { desc = "Word" }),
			-- map(1, { "n" }, ",0n", "<Plug>(VM-Zero-Numbers)", { desc = "Word" }),
			-- map(1, { "n" }, ",0N", "<Plug>(VM-Zero-Numbers-Append)", { desc = "Word" }),
			-- map(1, { "n" }, ",-", "<Plug>(VM-Shrink)", { desc = "Word" }),
			-- map(1, { "n" }, ",+", "<Plug>(VM-Enlarge)", { desc = "Word" }),
			--
			-- map(1, { "n" }, ",<bs>", "<Plug>(VM-Toggle-Block)", { desc = "Word" }),
			-- map(1, { "n" }, ",<cr>", "<Plug>(VM-Toggle-Single-Region)", { desc = "Word" }),
			-- map(1, { "n" }, ",L", "<Plug>(VM-Toggle-Multiline)", { desc = "Word" }),





			-- map(1, { "n" }, visual_multi_leader .. "d", "<Plug>(VM-Select-Cursor-Down)", { desc = "Cursor down" }),
			-- map(1, { "n" }, visual_multi_leader .. "u", "<Plug>(VM-Select-Cursor-Up)", { desc = "Cursor up" }),
			-- map(1, { "n" }, visual_multi_leader .. "fu", "<Plug>(VM-Find-Under)", { desc = "Find under cursor" }),
			-- map(1, { "n" }, visual_multi_leader .. "fi", "<Plug>(VM-Find-Subword-Under)", { desc = "Find subword under cursor" }),
		}
	},
	{
		"michaelrommel/nvim-silicon",
		config = load_config("tools.silicon"),
		main = "nvim-silicon",
		cmd = "Silicon",
	},
	{
		"chentoast/marks.nvim",
		config = load_config("tools.marks"),
		event = { "VeryLazy" },
		keys = {
			map(1, { "n" }, "]m", "<Plug>(Marks-prev)", { desc = "Mark" }),
			map(1, { "n" }, "[m", "<Plug>(Marks-next)", { desc = "Mark" }),
			map(1, { "n" }, "m0", "<Plug>(Marks-set-bookmark0)", { desc = "Bookmar 0" }),
			map(1, { "n" }, "m1", "<Plug>(Marks-set-bookmark1)", { desc = "Bookmar 1" }),
			map(1, { "n" }, "m2", "<Plug>(Marks-set-bookmark2)", { desc = "Bookmar 2" }),
			map(1, { "n" }, "m3", "<Plug>(Marks-set-bookmark3)", { desc = "Bookmar 3" }),
			map(1, { "n" }, "m4", "<Plug>(Marks-set-bookmark4)", { desc = "Bookmar 4" }),
			map(1, { "n" }, "m5", "<Plug>(Marks-set-bookmark5)", { desc = "Bookmar 5" }),
			map(1, { "n" }, "m6", "<Plug>(Marks-set-bookmark6)", { desc = "Bookmar 6" }),
			map(1, { "n" }, "m7", "<Plug>(Marks-set-bookmark7)", { desc = "Bookmar 7" }),
			map(1, { "n" }, "m8", "<Plug>(Marks-set-bookmark8)", { desc = "Bookmar 8" }),
			map(1, { "n" }, "m9", "<Plug>(Marks-set-bookmark9)", { desc = "Bookmar 9" }),

			map(1, { "n" }, marks_leader, "", { desc = "Makrs" }),
			map(1, { "n" }, marks_leader .. "l", "", { desc = "List" }),
			map(1, { "n" }, marks_leader .. "q", "", { desc = "Quickfix list" }),
			map(1, { "n" }, marks_leader .. "x", "", { desc = "Close" }),
			map(1, { "n" }, marks_leader .. "t", "", { desc = "Toggle" }),
			map(1, { "n" }, marks_leader .. "s", "<Plug>(Marks-set)", { desc = "Set (manual)" }),

			map(1, { "n" }, marks_leader .. "i", "<Plug>(Marks-preview)", { desc = "Preview" }),
			map(1, { "n" }, marks_leader .. "xc", function () local char = vim.fn.input("Input marks to close: ") vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<cmd>delm " .. char .. "<cr>", true, false, true), "n", false) end, { desc = "Custom" }),

			map(1, { "n" }, marks_leader .. "0", "<Plug>(Marks-next-bookmark0)", { desc = "Next bookmark 10" }),
			map(1, { "n" }, marks_leader .. "1", "<Plug>(Marks-next-bookmark1)", { desc = "Next bookmark 1" }),
			map(1, { "n" }, marks_leader .. "2", "<Plug>(Marks-next-bookmark2)", { desc = "Next bookmark 2" }),
			map(1, { "n" }, marks_leader .. "3", "<Plug>(Marks-next-bookmark3)", { desc = "Next bookmark 3" }),
			map(1, { "n" }, marks_leader .. "4", "<Plug>(Marks-next-bookmark4)", { desc = "Next bookmark 4" }),
			map(1, { "n" }, marks_leader .. "5", "<Plug>(Marks-next-bookmark5)", { desc = "Next bookmark 5" }),
			map(1, { "n" }, marks_leader .. "6", "<Plug>(Marks-next-bookmark6)", { desc = "Next bookmark 6" }),
			map(1, { "n" }, marks_leader .. "7", "<Plug>(Marks-next-bookmark7)", { desc = "Next bookmark 7" }),
			map(1, { "n" }, marks_leader .. "8", "<Plug>(Marks-next-bookmark8)", { desc = "Next bookmark 8" }),
			map(1, { "n" }, marks_leader .. "9", "<Plug>(Marks-next-bookmark9)", { desc = "Next bookmark 9" }),

			map(1, { "n" }, marks_leader .. ")", "<Plug>(Marks-prev-bookmark0)", { desc = "Previous bookmark 10" }),
			map(1, { "n" }, marks_leader .. "!", "<Plug>(Marks-prev-bookmark1)", { desc = "Previous bookmark 1" }),
			map(1, { "n" }, marks_leader .. "@", "<Plug>(Marks-prev-bookmark2)", { desc = "Previous bookmark 2" }),
			map(1, { "n" }, marks_leader .. "#", "<Plug>(Marks-prev-bookmark3)", { desc = "Previous bookmark 3" }),
			map(1, { "n" }, marks_leader .. "$", "<Plug>(Marks-prev-bookmark4)", { desc = "Previous bookmark 4" }),
			map(1, { "n" }, marks_leader .. "%", "<Plug>(Marks-prev-bookmark5)", { desc = "Previous bookmark 5" }),
			map(1, { "n" }, marks_leader .. "^", "<Plug>(Marks-prev-bookmark6)", { desc = "Previous bookmark 6" }),
			map(1, { "n" }, marks_leader .. "&", "<Plug>(Marks-prev-bookmark7)", { desc = "Previous bookmark 7" }),
			map(1, { "n" }, marks_leader .. "*", "<Plug>(Marks-prev-bookmark8)", { desc = "Previous bookmark 8" }),
			map(1, { "n" }, marks_leader .. "(", "<Plug>(Marks-prev-bookmark9)", { desc = "Previous bookmark 9" }),

			map(1, { "n" }, marks_leader .. "S", "<Plug>(Marks-setnext)", { desc = "Set (next word)" }),
			map(1, { "n" }, marks_leader .. "ts", "<cmd>MarksToggleSigns<cr>", { desc = "Signs" }),
			map(1, { "n" }, marks_leader .. "tc", "<Plug>(Marks-toggle)", { desc = "Current" }),
			map(1, { "n" }, marks_leader .. "t0", "<Plug>(Marks-toggle-bookmark0)", { desc = "Bookmark 10" }),
			map(1, { "n" }, marks_leader .. "t1", "<Plug>(Marks-toggle-bookmark1)", { desc = "Bookmark 1" }),
			map(1, { "n" }, marks_leader .. "t2", "<Plug>(Marks-toggle-bookmark2)", { desc = "Bookmark 2" }),
			map(1, { "n" }, marks_leader .. "t3", "<Plug>(Marks-toggle-bookmark3)", { desc = "Bookmark 3" }),
			map(1, { "n" }, marks_leader .. "t4", "<Plug>(Marks-toggle-bookmark4)", { desc = "Bookmark 4" }),
			map(1, { "n" }, marks_leader .. "t5", "<Plug>(Marks-toggle-bookmark5)", { desc = "Bookmark 5" }),
			map(1, { "n" }, marks_leader .. "t6", "<Plug>(Marks-toggle-bookmark6)", { desc = "Bookmark 6" }),
			map(1, { "n" }, marks_leader .. "t7", "<Plug>(Marks-toggle-bookmark7)", { desc = "Bookmark 7" }),
			map(1, { "n" }, marks_leader .. "t8", "<Plug>(Marks-toggle-bookmark8)", { desc = "Bookmark 8" }),
			map(1, { "n" }, marks_leader .. "t9", "<Plug>(Marks-toggle-bookmark9)", { desc = "Bookmark 9" }),

			map(1, { "n" }, marks_leader .. "n", "<Plug>(Marks-next)", { desc = "Next mark" }),
			map(1, { "n" }, marks_leader .. "p", "<Plug>(Marks-prev)", { desc = "Previous mark" }),
			map(1, { "n" }, marks_leader .. "N", "<Plug>(Marks-next-bookmark)", { desc = "Next bookmark" }),
			map(1, { "n" }, marks_leader .. "P", "<Plug>(Marks-prev-bookmark)", { desc = "Previous bookmark" }),

			map(1, { "n" }, marks_leader .. "xa", "<cmd>delm a-z<cr>", { desc = "All (Lowercase)" }),
			map(1, { "n" }, marks_leader .. "xA", "<cmd>delm A-Z<cr>", { desc = "All (Uppercase)" }),
			map(1, { "n" }, marks_leader .. "xl", "<Plug>(Marks-deleteline)", { desc = "Line" }),
			map(1, { "n" }, marks_leader .. "xf", "<Plug>(Marks-deletebuf)", { desc = "File" }),
			map(1, { "n" }, marks_leader .. "xb", "<Plug>(Marks-delete-bookmark)", { desc = "Bookmark" }),
			map(1, { "n" }, marks_leader .. "x0", "<Plug>(Marks-delete-bookmark0)", { desc = "Bookmark 10" }),
			map(1, { "n" }, marks_leader .. "x1", "<Plug>(Marks-delete-bookmark1)", { desc = "Bookmark 1" }),
			map(1, { "n" }, marks_leader .. "x2", "<Plug>(Marks-delete-bookmark2)", { desc = "Bookmark 2" }),
			map(1, { "n" }, marks_leader .. "x3", "<Plug>(Marks-delete-bookmark3)", { desc = "Bookmark 3" }),
			map(1, { "n" }, marks_leader .. "x4", "<Plug>(Marks-delete-bookmark4)", { desc = "Bookmark 4" }),
			map(1, { "n" }, marks_leader .. "x5", "<Plug>(Marks-delete-bookmark5)", { desc = "Bookmark 5" }),
			map(1, { "n" }, marks_leader .. "x6", "<Plug>(Marks-delete-bookmark6)", { desc = "Bookmark 6" }),
			map(1, { "n" }, marks_leader .. "x7", "<Plug>(Marks-delete-bookmark7)", { desc = "Bookmark 7" }),
			map(1, { "n" }, marks_leader .. "x8", "<Plug>(Marks-delete-bookmark8)", { desc = "Bookmark 8" }),
			map(1, { "n" }, marks_leader .. "x9", "<Plug>(Marks-delete-bookmark9)", { desc = "Bookmark 9" }),

			map(1, { "n" }, marks_leader .. "la", "<cmd>MarksListAll<cr>", { desc = "All" }),
			map(1, { "n" }, marks_leader .. "lb", "<cmd>MarksListBuf<cr>", { desc = "Buffer" }),
			map(1, { "n" }, marks_leader .. "lg", "<cmd>MarksListGlobal<cr>", { desc = "Global" }),

			map(1, { "n" }, marks_leader .. "qa", "<cmd>MarksQFListAll<cr>", { desc = "All" }),
			map(1, { "n" }, marks_leader .. "qb", "<cmd>MarksQFListBuf<cr>", { desc = "Buffer" }),
			map(1, { "n" }, marks_leader .. "qg", "<cmd>MarksQFListGlobal<cr>", { desc = "Global" }),
		},
	},
	{
		"smoka7/hop.nvim",
		config = load_config("tools.hop"),
		version = "*",
		cmd = { "Hop" },
		keys = {
			map(1, { "" }, navigation_leader1 .. "h", function() func.hop_hint_anywhere_regex("[^ ]") require("hop").hint_anywhere({ direction = require("hop.hint").HintDirection.BEFORE_CURSOR, current_line_only = true }) end, { desc = "Horizontal left" }),
			map(1, { "" }, navigation_leader1 .. "j", function() require("hop").hint_vertical({ direction = require("hop.hint").HintDirection.AFTER_CURSOR }) end, { desc = "Vertical down" }),
			map(1, { "" }, navigation_leader1 .. "k", function() require("hop").hint_vertical({ direction = require("hop.hint").HintDirection.BEFORE_CURSOR }) end, { desc = "Vertical up" }),
			map(1, { "" }, navigation_leader1 .. "l", function() func.hop_hint_anywhere_regex("[^ ]") require("hop").hint_anywhere({ direction = require("hop.hint").HintDirection.AFTER_CURSOR, current_line_only = true }) end, { desc = "Horizontal left" }),

			map(1, { "" }, navigation_leader1 .. "f", function() require("hop").hint_char1({ current_line_only = true, direction = require("hop.hint").HintDirection.AFTER_CURSOR, hint_offset = 0 }) end, { desc = "Native f" }),
			map(1, { "" }, navigation_leader1 .. "F", function() require("hop").hint_char1({ current_line_only = true, direction = require("hop.hint").HintDirection.BEFORE_CURSOR, hint_offset = 0 }) end, { desc = "Native F" }),
			map(1, { "" }, navigation_leader1 .. "t", function() require("hop").hint_char1({ current_line_only = true, direction = require("hop.hint").HintDirection.AFTER_CURSOR, hint_offset = -1 }) end, { desc = "Native t" }),
			map(1, { "" }, navigation_leader1 .. "T", function() require("hop").hint_char1({ current_line_only = true, direction = require("hop.hint").HintDirection.BEFORE_CURSOR, hint_offset = 1 }) end, { desc = "Native T" }),

			map(1, { "" }, navigation_leader1 .. "c", function() require("hop").hint_camel_case({ current_line_only = true }) end, { desc = "Camel case" }),

			map(1, { "" }, navigation_leader1 .. "w", function() require("hop").hint_words({ current_line_only = true, direction = require("hop.hint").HintDirection.AFTER_CURSOR, hint_position = require'hop.hint'.HintPosition.BEGIN }) end, { desc = "Native w" }),
			map(1, { "" }, navigation_leader1 .. "b", function() require("hop").hint_words({ current_line_only = true, direction = require("hop.hint").HintDirection.BEFORE_CURSOR, hint_position = require'hop.hint'.HintPosition.BEGIN }) end, { desc = "Native b" }),
			map(1, { "" }, navigation_leader1 .. "e", function() require("hop").hint_words({ current_line_only = true,  direction = require("hop.hint").HintDirection.AFTER_CURSOR, hint_position = require'hop.hint'.HintPosition.END }) end, { desc = "Native e" }),
			map(1, { "" }, navigation_leader1 .. "ge", function() require("hop").hint_words({ current_line_only = true, direction = require("hop.hint").HintDirection.BEFORE_CURSOR, hint_position = require'hop.hint'.HintPosition.END }) end, { desc = "Native ge" }),

			map(1, { "" }, navigation_leader1 .. "I", function() require("hop").hint_lines({}) end, { desc = "Lines (Native 0)" }),
			map(1, { "" }, navigation_leader1 .. "i", function() require("hop").hint_lines_skip_whitespace({ }) end, { desc = "Lines (Native ^)" }),
			map(1, { "" }, navigation_leader1 .. "z", function() require("hop").hint_char2({ current_line_only = true }) end, { desc = "Char 2" }),
			map(1, { "" }, navigation_leader1 .. "u", function() require("hop").hint_patterns({ current_line_only = true }) end, { desc = "Pattern" }),

			map(1, { "" }, navigation_leader1 .. "y", function() require("hop") func.hop_hint_yank_inline() vim.cmd("HopYankChar1CurrentLine") end, { desc = "Native y (Inline)" }),
			map(1, { "" }, navigation_leader1 .. "Y", function() require("hop") func.hop_hint_yank() vim.cmd("HopYankChar1CurrentLine") end, { desc = "Native y" }),
			map(1, { "" }, navigation_leader1 .. "p", function() require("hop") vim.cmd("HopPasteChar1CurrentLine") end, { desc = "Native p" }),

			-- multi window only
			map(1, { "" }, navigation_leader2 .. "h", function() func.hop_hint_anywhere_regex("[^ ]") require("hop").hint_anywhere({ direction = require("hop.hint").HintDirection.BEFORE_CURSOR, current_line_only = false, multi_windows = true }) end, { desc = "Horizontal left" }),
			map(1, { "" }, navigation_leader2 .. "j", function() require("hop").hint_vertical({ direction = require("hop.hint").HintDirection.AFTER_CURSOR, multi_windows = true }) end, { desc = "Vertical down" }),
			map(1, { "" }, navigation_leader2 .. "k", function() require("hop").hint_vertical({ direction = require("hop.hint").HintDirection.BEFORE_CURSOR, multi_windows = true }) end, { desc = "Vertical up" }),
			map(1, { "" }, navigation_leader2 .. "l", function() func.hop_hint_anywhere_regex("[^ ]") require("hop").hint_anywhere({ direction = require("hop.hint").HintDirection.AFTER_CURSOR, current_line_only = false, multi_windows = true }) end, { desc = "Horizontal left" }),

			map(1, { "" }, navigation_leader2 .. "f", function() require("hop").hint_char1({ current_line_only = false, multi_windows = true, direction = require("hop.hint").HintDirection.AFTER_CURSOR, hint_offset = 0 }) end, { desc = "Native f" }),
			map(1, { "" }, navigation_leader2 .. "F", function() require("hop").hint_char1({ current_line_only = false, multi_windows = true, direction = require("hop.hint").HintDirection.BEFORE_CURSOR, hint_offset = 0 }) end, { desc = "Native F" }),
			map(1, { "" }, navigation_leader2 .. "t", function() require("hop").hint_char1({ current_line_only = false, multi_windows = true, direction = require("hop.hint").HintDirection.AFTER_CURSOR, hint_offset = -1 }) end, { desc = "Native t" }),
			map(1, { "" }, navigation_leader2 .. "T", function() require("hop").hint_char1({ current_line_only = false, multi_windows = true, direction = require("hop.hint").HintDirection.BEFORE_CURSOR, hint_offset = 1 }) end, { desc = "Native T" }),

			map(1, { "" }, navigation_leader2 .. "c", function() require("hop").hint_camel_case({ current_line_only = false, multi_windows = true }) end, { desc = "Camel case" }),

			map(1, { "" }, navigation_leader2 .. "w", function() require("hop").hint_words({ current_line_only = false, multi_windows = true, direction = require("hop.hint").HintDirection.AFTER_CURSOR, hint_position = require'hop.hint'.HintPosition.BEGIN }) end, { desc = "Native w" }),
			map(1, { "" }, navigation_leader2 .. "b", function() require("hop").hint_words({ current_line_only = false, multi_windows = true, direction = require("hop.hint").HintDirection.BEFORE_CURSOR, hint_position = require'hop.hint'.HintPosition.BEGIN }) end, { desc = "Native b" }),
			map(1, { "" }, navigation_leader2 .. "e", function() require("hop").hint_words({ current_line_only = false, multi_windows = true,  direction = require("hop.hint").HintDirection.AFTER_CURSOR, hint_position = require'hop.hint'.HintPosition.END }) end, { desc = "Native e" }),
			map(1, { "" }, navigation_leader2 .. "ge", function() require("hop").hint_words({ current_line_only = false, multi_windows = true, direction = require("hop.hint").HintDirection.BEFORE_CURSOR, hint_position = require'hop.hint'.HintPosition.END }) end, { desc = "Native ge" }),

			map(1, { "" }, navigation_leader2 .. "i", function() require("hop").hint_lines({ multi_windows = true }) end, { desc = "Lines (Native 0)" }),
			map(1, { "" }, navigation_leader2 .. "I", function() require("hop").hint_lines_skip_whitespace({ multi_windows = true }) end, { desc = "Lines (Native ^)" }),

			map(1, { "" }, navigation_leader2 .. "z", function() require("hop").hint_char2({ current_line_only = false, multi_windows = true }) end, { desc = "Char 2" }),
			map(1, { "" }, navigation_leader2 .. "u", function() require("hop").hint_patterns({ current_line_only = false, multi_windows = true }) end, { desc = "Pattern" }),

			map(1, { "" }, navigation_leader2 .. "y", function() require("hop") func.hop_hint_yank_inline() vim.cmd("HopYankChar1") end, { desc = "Native y (Inline)" }),
			map(1, { "" }, navigation_leader2 .. "Y", function() require("hop") func.hop_hint_yank() vim.cmd("HopYankChar1") end, { desc = "Native y" }),
			map(1, { "" }, navigation_leader2 .. "p", function() require("hop") vim.cmd("HopPasteChar1") end, { desc = "Native p" }),
		},
	},
	{
		"FeiyouG/commander.nvim",
		config = load_config("tools.commander"),
		dependencies = {
			"nvim-telescope/telescope.nvim"
		},
	},
	{
		"ryanmsnyder/toggleterm-manager.nvim",
		config = load_config("tools.toggleterm-manager"),
		dependencies = {
			"akinsho/nvim-toggleterm.lua",
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
			"akinsho/toggleterm.nvim",
		},
	},
	{
		"rhysd/clever-f.vim",
		config = load_config("tools.clever-f"),
		-- keys = { { "f" }, { "F" }, { "t" }, { "T" } },
		keys = {
			map(1, { "n" }, "f", "<Plug>(clever-f-f)", { desc = "Clever f" }),
			map(1, { "n" }, "F", "<Plug>(clever-f-F)", { desc = "Clever F" }),
			map(1, { "n" }, "t", "<Plug>(clever-f-t)", { desc = "Clever t" }),
			map(1, { "n" }, "T", "<Plug>(clever-f-T)", { desc = "Clever T" }),
			map(1, { "n" }, "<esc>", "<esc><Plug>(clever-f-reset)", { desc = "Reset" }),
			map(1, { "n" }, ";", "<Plug>(clever-f-repeat-forward)", { desc = "Repeat forward" }),
			map(1, { "n" }, ",", "<Plug>(clever-f-repeat-back)", { desc = "Repeat backward" }),
		},
	},
	{
		"gbprod/yanky.nvim",
		config = load_config("tools.yanky"),
		event = { "BufReadPre", "BufNewFile" },
		cmd = { "YankyRingHistory", "YankyClearHistory" },
		keys = {
			map(1, { "n" }, yanky_leader, "<cmd>YankyRingHistory<cr>", { desc = "Yank history" }),
		},
	},
	{
		"ggandor/leap-spooky.nvim",
		config = load_config("tools.leap-spooky"),
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"ggandor/leap.nvim"
		},
	},
	{
		"ibhagwan/fzf-lua",
		config = load_config("tools.fzf"),
		cmd = { "FzfLua" },
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"sharkdp/fd",
			"BurntSushi/ripgrep",
			"dandavison/delta",
			"nvim-treesitter/nvim-treesitter-context",
			"MeanderingProgrammer/render-markdown.nvim",
			"hpjansson/chafa",
			"atanunq/viu",
			"jstkdng/ueberzugpp",
		},
		keys = {
			map(1, { "n" }, fzf_leader, "", { desc = "Find" }),
			map(1, { "n" }, fzf_leader .. "a", "<cmd>FzfLua builtin<cr>", { desc = "All" }),
			map(1, { "n" }, fzf_leader .. "b", "<cmd>FzfLua buffers<cr>", { desc = "Buffers" }),
			map(1, { "n" }, fzf_leader .. "c", "<cmd>FzfLua blines<cr>", { desc = "Current" }),
			map(1, { "n" }, fzf_leader .. "C", "<cmd>FzfLua commands<cr>", { desc = "Commands" }),
			map(1, { "n" }, fzf_leader .. "f", "<cmd>FzfLua files<cr>", { desc = "Files" }),
			map(1, { "n" }, fzf_leader .. "F", "<cmd>FzfLua resume<cr>", { desc = "Resume" }),
			map(1, { "n" }, fzf_leader .. "h", "<cmd>FzfLua help_tags<cr>", { desc = "Helps" }),
			map(1, { "n" }, fzf_leader .. "m", "<cmd>FzfLua marks<cr>", { desc = "Marks" }),
			map(1, { "n" }, fzf_leader .. "o", "<cmd>FzfLua oldfiles<cr>", { desc = "Old files" }),
			map(1, { "n" }, fzf_leader .. "r", "<cmd>FzfLua registers<cr>", { desc = "Registers" }),
			map(1, { "n" }, fzf_leader .. "u", "<cmd>FzfLua undo<cr>", { desc = "Undo" }),
			map(1, { "n" }, fzf_leader .. "w", "<cmd>FzfLua live_grep<cr>", { desc = "Words" }),
			map(1, { "n", "v" }, fzf_leader .. "s", "<cmd>FzfLua spell_suggest<cr>", { desc = "Spell suggest" }),
			map(1, { "n" }, fzf_leader .. "l", "<cmd>FzfLua loclist<cr>", { desc = "Loclist" }),
			map(1, { "n" }, fzf_leader .. "q", "<cmd>FzfLua quickfix<cr>", { desc = "Quickfix" }),
			map(1, { "n" }, fzf_leader .. "z", "<cmd>FzfLua colorscheme<cr>", { desc = "Colorscheme" }),
			-- map(1, { "n" }, navigation_leader1 .. "H", "<cmd>FzfLua search_history<cr>", { desc = "Search history" }),
			-- map(1, { "n" }, notification_leader .. "f", "<cmd>Telescope noice<cr>", { desc = "Find (Noice)" }),
		},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		config = load_config("tools.render-markdown"),
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},

	----- lang -----
	{
		"hrsh7th/nvim-cmp",
		config = load_config("lang.cmp"),
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lua",
			"uga-rosa/cmp-dictionary",
			"hrsh7th/cmp-emoji",
			"chrisgrieser/cmp-nerdfont",
			{
				"saadparwaiz1/cmp_luasnip",
				dependencies = {
					{
						"L3MON4D3/LuaSnip",
						version = "v2.*",
						dependencies = {
							"rafamadriz/friendly-snippets",
						},
					},
				},
			},
			{
				"windwp/nvim-autopairs",
				config = load_config("lang.autopairs"),
				dependencies = {
					"altermo/ultimate-autopair.nvim",
					branch = "v0.6",
				},
			},
			{
				"brenoprata10/nvim-highlight-colors",
				config = load_config("lang.highlight-colors"),
			},
		},
	},

	-- mason start
	{
		"williamboman/mason.nvim",
		config = load_config("lang.mason"),
		cmd = { "Mason" },
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
		}
	},
	-- mason end

	-- lsp start
	{
		"neovim/nvim-lspconfig",
		config = load_config("lang.lsp"),
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{
				"williamboman/mason-lspconfig.nvim",
				dependencies = {
					"williamboman/mason.nvim"
				},
			},
			{
				"j-hui/fidget.nvim",
				config = load_config("lang.fidget"),
				enabled = false,
			}
		},
	},
	-- lsp end

	-- formatter start
	{
		"jay-babu/mason-null-ls.nvim",
		config = load_config("lang.formatter"),
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
			"stevearc/conform.nvim",
		},
	},
	-- formatter end

	-- linter start
	{
		"rshkarin/mason-nvim-lint",
		config = load_config("lang.linter"),
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-lint",
		},
	},
	-- linter end

	-- dap start
	{
		"mfussenegger/nvim-dap",
		config = load_config("lang.dap"),
		dependencies = {
			"Joakker/lua-json5",
			build = "./install.sh",
		},
		keys = {
			map(1, { "n" }, dap_leader, "", { desc = "Debug" }),
			map(1, { "n" }, dap_leader .. "L", "", { desc = "For lua" }),
			map(1, { "n" }, dap_leader .. "b", function() require("dap").toggle_breakpoint() end, { desc = "Breakpoint" }),
			map(1, { "n" }, dap_leader .. "B", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, { desc = "Breakpoint with condition" }),
			map(1, { "n" }, dap_leader .. "r", function() require("dap").continue() end, { desc = "Run" }),
			map(1, { "n" }, dap_leader .. "a", function() require("dap").continue({ before = get_args }) end, { desc = "Run With args" }),
			map(1, { "n" }, dap_leader .. "c", function() require("dap").run_to_cursor() end, { desc = "Run to cursor" }),
			map(1, { "n" }, dap_leader .. "l", function() require("dap").run_last() end, { desc = "Run last" }),
			map(1, { "n" }, dap_leader .. "o", function() require("dap").step_out() end, { desc = "Step out" }),
			map(1, { "n" }, dap_leader .. "v", function() require("dap").step_over() end,{ desc = "Step over" }),
			map(1, { "n" }, dap_leader .. "i", function() require("dap").step_into() end, { desc = "Step into" }),
			map(1, { "n" }, dap_leader .. "j", function() require("dap").down() end, { desc = "Go down" }),
			map(1, { "n" }, dap_leader .. "k", function() require("dap").up() end, { desc = "Go up" }),
			map(1, { "n" }, dap_leader .. "g", function() require("dap").goto_() end, { desc = "Go to Line (No Execute)" }),
			map(1, { "n" }, dap_leader .. "u", function() require("dapui").toggle({}) end, { desc = "Toggle dapui" }),
			map(1, { "n" }, dap_leader .. "e", function() require("dapui").eval() end, { desc = "Eval dapui" }),
			map(1, { "n" }, dap_leader .. "p", function() require("dap").pause() end, { desc = "Pause" }),
			map(1, { "n" }, dap_leader .. "R", function() require("dap").repl.toggle() end, { desc = "Toggle REPL" }),
			map(1, { "n" }, dap_leader .. "s", function() require("dap").session() end, { desc = "Session" }),
			map(1, { "n" }, dap_leader .. "w", function() require("dap.ui.widgets").hover() end, { desc = "Widgets" }),
			map(1, { "n" }, dap_leader .. "t", function() require("dap").terminate() end, { desc = "Terminate" }),
			map(1, { "n" }, dap_leader .. "Lp", function () require("osv").launch({port = 8086}) end, { desc = "Launch port" }),
			map(1, { "n" }, dap_leader .. "Lw", function () require("dap.ui.widgets").widgets.hover() end, { desc = "Lua widgets" }),
			map(1, { "n" }, dap_leader .. "Lf", function () local widgets = require("dap.ui.widgets") widgets.widgets.centered_float(widgets.frames) end, { desc = "Widgets float" }),
		},
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		cmd = {
			"DapToggleBreakpoint",
			"DapContinue",
		},
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		}
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio"
		}
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-treesitter/nvim-treesitter",
		},
	},
	{
		-- javascript based
		"mxsdev/nvim-dap-vscode-js",
		dependencies = {
			"mfussenegger/nvim-dap",
			{
				"microsoft/vscode-js-debug",
				version = "1.*",
			},
		},
	},
	{
		-- lua based
		"jbyuki/one-small-step-for-vimkind",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
	},
	-- dap end

	{
		"kylechui/nvim-surround",
		config = load_config("lang.surround"),
		version = "*",
		keys = {
			map(1, { "n" }, surround_leader1, 		   "<Plug>(nvim-surround-normal)", { desc = "Surround (Normal)" }),
			map(1, { "n" }, surround_leader1 .. "s", "<Plug>(nvim-surround-normal-cur)", { desc = "Surround (Cur_line)" }),
			map(1, { "n" }, surround_leader2, 			 "<Plug>(nvim-surround-normal-line)", { desc = "Surround (New_line)" }),
			map(1, { "n" }, surround_leader2 .. "S", "<Plug>(nvim-surround-normal-cur-line)", { desc = "Surround (Cur_line+New_line)" }),
			map(1, { "v" }, surround_leader1, 			 "<Plug>(nvim-surround-visual)", { desc = "Surround (Normal)" }),
			map(1, { "v" }, surround_leader2, 			 "<Plug>(nvim-surround-visual-line)", { desc = "Surround (New_line)" }),
			map(1, { "n" }, surround_leader1 .. "c", "<Plug>(nvim-surround-change)", { desc = "Surround (Normal)" }),
			map(1, { "n" }, surround_leader2 .. "C", "<Plug>(nvim-surround-change-line)", { desc = "Surround (New_line)" }),
			map(1, { "n" }, surround_leader1 .. "d", "<Plug>(nvim-surround-delete)", { desc = "Surround (Normal)" }),
			map(1, { "n" }, surround_leader2 .. "D", "<Plug>(nvim-surround-change-line)", { desc = "Surround (New_line)" }),
		},
	},
	{
		"mtrajano/tssorter.nvim",
		config = load_config("lang.tssorter"),
		version = "*",
		cmd = { "TSSort" },
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = load_config("lang.treesitter"),
		build = ":TSUpdate",
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},
	{
		"folke/todo-comments.nvim",
		config = load_config("lang.todo-comments"),
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"numToStr/Comment.nvim",
		config = load_config("lang.comment"),
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		keys = {
			map(1, { "n" }, comment_leader1, "<Plug>(comment_toggle_linewise)", { desc = "Comment (Line)" }),
			map(1, { "n" }, comment_leader2, "<Plug>(comment_toggle_blockwise)", { desc = "Comment (Block)" }),
			map(1, { "n" }, comment_leader1 .. "c", function() return vim.v.count == 0 and "<Plug>(comment_toggle_linewise_current)"  or "<Plug>(comment_toggle_linewise_count)" end, { desc = "Line", expr = true }),
			map(1, { "n" }, comment_leader2 .. "c", function() return vim.v.count == 0 and "<Plug>(comment_toggle_blockwise_current)" or "<Plug>(comment_toggle_blockwise_count)" end, { desc = "Block", expr = true }),
			map(1, { "v" }, comment_leader1, "<Plug>(comment_toggle_linewise_visual)", { desc = "Comment (Line)" }),
			map(1, { "v" }, comment_leader2, "<Plug>(comment_toggle_blockwise_visual)", { desc = "Comment (Block)" }),
			map(1, { "n" }, comment_leader1 .. "o", function() require("Comment.api").insert.linewise.below() end, { desc = "Below" }),
			map(1, { "n" }, comment_leader1 .. "O", function() require("Comment.api").insert.linewise.above() end, { desc = "Above" }),
			map(1, { "n" }, comment_leader1 .. "A", function() require("Comment.api").insert.linewise.eol() end, { desc = "End" }),
			map(1, { "n" }, comment_leader2 .. "o", function() require("Comment.api").insert.blockwise.below() end, { desc = "Below" }),
			map(1, { "n" }, comment_leader2 .. "O", function() require("Comment.api").insert.blockwise.above() end, { desc = "Above" }),
			map(1, { "n" }, comment_leader2 .. "A", function() require("Comment.api").insert.blockwise.eol() end, { desc = "End" }),
		},
	},
	{
		"folke/trouble.nvim",
		config = load_config("lang.trouble"),
		cmd = { "Trouble" },
	},
	{
		"kevinhwang91/nvim-ufo",
		config = load_config("lang.ufo"),
		-- event = { "BufReadPre", "BufNewFile" },
		event = { "VeryLazy" },
		dependencies = {
			"kevinhwang91/promise-async",
		},
		keys = {
			map(1, { "n" }, folding_leader .. "S", function() require("ufo").peekFoldedLinesUnderCursor() end, { desc = "Show inside" }),
			map(1, { "n" }, folding_leader .. "oa", function() require("ufo").openAllFolds() end, { desc = "All" }),
			map(1, { "n" }, folding_leader .. "ok", function() require("ufo").openFoldsExceptKinds() end, { desc = "Except kinds" }),
			map(1, { "n" }, folding_leader .. "ca", function() require("ufo").closeAllFolds() end, { desc = "All" }),
			map(1, { "n" }, folding_leader .. "cw", function () require("ufo").closeFoldsWith() end, { desc = "Folds with" }),
		},
	},
	{
		"Wansmer/treesj",
		config = load_config("lang.treesj"),
		cmd = { "TSJToggle", "TSJJoin", "TSJSplit" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter"
		},
		keys = {
			map(1, { "n" }, folding_leader .. "a", "<cmd>TSJToggle<cr>", { desc = "Split/Join blocks" }),
		}
	},
	{
		"nvimdev/lspsaga.nvim",
		config = load_config("lang.lspsaga"),
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
}

