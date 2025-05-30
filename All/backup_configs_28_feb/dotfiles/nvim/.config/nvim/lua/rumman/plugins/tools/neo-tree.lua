---@diagnostic disable: duplicate-set-field
local neo_tree = require("neo-tree")

local icons = require("rumman.lib.icons")
local utils = require("rumman.lib.utils")
local neotree_local_leader = require("rumman.lib.keys").neotree.leaders.locals

neo_tree.setup({
	use_default_mappings = false,
	close_if_last_window = true,
	popup_border_style = utils.ui.border,
	use_image_nvim = true,
	source_selector = {
		winbar = true,
		statusline = false,
		sources = {
			{
				source = "filesystem",
				display_name = " " .. icons.documents.Files .. " Files "
			},
			{
				source = "buffers",
				display_name = " " .. icons.ui.Tab .. " Buffers "
			},
			{
				source = "git_status",
				display_name = icons.git.Branch .. " Git "
			},
		},
		content_layout = utils.ui.title_position,
		tabs_layout = "equal",
	},
	default_component_configs = {
		indent = {
			indent_size = utils.indent_size.explorer,
			indent_marker = icons.ui.BorderLeft,
			last_indent_marker = icons.ui.BorderBottomLeft .. icons.ui.BorderBottom,
		},
		icon = {
			folder_closed = icons.documents.Folder,
			folder_open = icons.documents.OpenFolder,
			folder_empty = icons.documents.OpenFolderEmpty,
		},
		modified = {
			symbol = icons.ui.Edited,
		},
		diagnostics = {
			symbols = {
				hint = icons.diagnostics.Hint,
				info = icons.diagnostics.Information,
				warn = icons.diagnostics.Warning,
				error = icons.diagnostics.Error,
			},
		},
		name = {
			use_git_status_colors = false,
		},
		git_status = {
			symbols = {
				added = icons.git.Add,
				deleted = icons.git.Remove,
				modified = icons.git.Mod,
				renamed = icons.git.Rename,
				untracked = icons.git.Untrack,
				ignored = icons.git.Ignore,
				unstaged = icons.git.Unstage,
				staged = icons.git.Stage,
				conflict = icons.git.Conflict,
			},
		},
	},
	window = {
		position = "left",
		width = "18%",
		mappings = {
			-- remove some unwanted behavior keys from neotree
			["o"] = "none",
			["O"] = "none",
			["z"] = "none",
			["e"] = "none",
			["$"] = "none",

			-- for global source only in neotree buffer
			["<space>"] = "refresh",
			["i"] = "show_file_details",
			["E"] = "expand_all_nodes",
			["l"] = "toggle_node",
			["h"] = "close_node",
			["C"] = "close_all_nodes",
			["S"] = "close_all_subnodes",
			["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
			["I"] = "focus_preview",
			["<C-y>"] = { "scroll_preview", config = {direction = 1} },
			["<C-e>"] = { "scroll_preview", config = {direction = -1} },
			["<C-u>"] = { "scroll_preview", config = {direction = 10} },
			["<C-d>"] = { "scroll_preview", config = {direction = -10} },
			["<C-b>"] = { "scroll_preview", config = {direction = 30} },
			["<C-f>"] = { "scroll_preview", config = {direction = -30} },
			["q"] = "close_window",
			["<cr>"] = "open",
			["<c-s-l>"] = "next_source",
			["<c-s-h>"] = "prev_source",

			[neotree_local_leader .. "<space>"] = { "refresh", desc = "Refresh" },
			[neotree_local_leader .. "q"] = { "close_window", desc = "Quit" },
			[neotree_local_leader .. "P"] = { "toggle_preview", desc = "Toggle (preview)" },
			[neotree_local_leader .. "I"] = { "focus_preview", desc = "Focus (preview)" },

			[neotree_local_leader .. "f"] = { function() end, desc = "File", nowait = false },
			[neotree_local_leader .. "fo"] = { function() end, desc = "Open", nowait = false },
			[neotree_local_leader .. "foh"] = { "open_leftabove_vs", desc = "Left" },
			[neotree_local_leader .. "fol"] = { "open_vsplit", desc = "Right" },
			[neotree_local_leader .. "foj"] = { "open_split", desc = "Down" },
			[neotree_local_leader .. "fop"] = { function() end, desc = "Picker", nowait = false },
			[neotree_local_leader .. "fopc"] = { "open_with_window_picker", desc = "Current" },
			[neotree_local_leader .. "foph"] = { "split_with_window_picker", desc = "Horizontal" },
			[neotree_local_leader .. "fopv"] = { "vsplit_with_window_picker", desc = "Vertical" },
			[neotree_local_leader .. "fot"] = { function() end, desc = "As tab", nowait = false },
			[neotree_local_leader .. "fotn"] = { "open_tabnew", desc = "New" },
			[neotree_local_leader .. "fotd"] = { "open_tab_drop", desc = "Drop" },

			[neotree_local_leader .. "g"] = { function() end, desc = "Git", nowait = false },
			[neotree_local_leader .. "ga"] = { "git_add_file", desc = "Current" },
			[neotree_local_leader .. "gA"] = { "git_add_all", desc = "All" },
			[neotree_local_leader .. "gu"] = { "git_unstage_file", desc = "Unstage" },
			[neotree_local_leader .. "gr"] = { "git_revert_file", desc = "Revert" },
			[neotree_local_leader .. "gc"] = { "git_commit", desc = "Commit" },
			[neotree_local_leader .. "gp"] = { "git_push", desc = "Push" },
			[neotree_local_leader .. "gg"] = { "git_commit_and_push", desc = "Commit & push" },

			[neotree_local_leader .. "o"] = { function() end, desc = "Order by", nowait = false },
			[neotree_local_leader .. "oc"] = { "order_by_created", desc = "Created" },
			[neotree_local_leader .. "od"] = { "order_by_diagnostics", desc = "Diagnostics" },
			[neotree_local_leader .. "og"] = { "order_by_git_status", desc = "Git status" },
			[neotree_local_leader .. "om"] = { "order_by_modified", desc = "Modified" },
			[neotree_local_leader .. "on"] = { "order_by_name", desc = "Name" },
			[neotree_local_leader .. "os"] = { "order_by_size", desc = "Size" },
			[neotree_local_leader .. "ot"] = { "order_by_type", desc = "Type" },

			[neotree_local_leader .. "h"] = { "close_node", desc = "Node (close current)" },
			[neotree_local_leader .. "l"] = { "toggle_node", desc = "Node (expand current)" },
			[neotree_local_leader .. "S"] = { "close_all_subnodes", desc = "Node (close sub)" },
			[neotree_local_leader .. "C"] = { "close_all_nodes", desc = "Node (close all)" },
			[neotree_local_leader .. "E"] = { "expand_all_nodes", desc = "Node (expand all)" },

			[neotree_local_leader .. "i"] = { "show_file_details", desc = "Show details" },
		},
	},
	filesystem = {
		filtered_items = {
			hide_dotfiles = false,
			hide_gitignored = false,
			hide_hidden = false,
			hide_by_name = {
				"node_modules",
				".git",
			},
		},
		hijack_netrw_behavior = "open_current",
		use_libuv_file_watcher = true,
		window = {
			mappings = {
				-- for filesystem source window only in neotree buffer
				["a"] = "add",
				["A"] = "add_directory",
				["d"] = "delete",
				["R"] = "rename",
				["r"] = "rename_basename",
				["y"] = "copy_to_clipboard",
				["x"] = "cut_to_clipboard",
				["p"] = "paste_from_clipboard",
				["]g"] = "prev_git_modified",
				["[g"] = "next_git_modified",
				["<"] = "navigate_up",
				[">"] = "set_root",
				["H"] = "toggle_hidden",
				["/"] = "fuzzy_sorter",
				["f"] = "fuzzy_finder",
				["F"] = "fuzzy_finder_directory",

				-- remapping
				[neotree_local_leader .. "d"] = { "delete", desc = "File (delete) " },
				[neotree_local_leader .. "r"] = { "rename_basename", desc = "File (rename)" },
				[neotree_local_leader .. "R"] = { "rename", desc = "File (rename with ext)" },
				[neotree_local_leader .. "a"] = { "add", desc = "File (add)" },
				[neotree_local_leader .. "A"] = { "add_directory", desc = "Directory (add)" },

				[neotree_local_leader .. "p"] = { "paste_from_clipboard", desc = "Paste" },
				[neotree_local_leader .. "x"] = { "cut_to_clipboard", desc = "Cut" },
				[neotree_local_leader .. "y"] = { "copy_to_clipboard", desc = "Copy" },

				[neotree_local_leader .. "gp"] = { "prev_git_modified", desc = "Previous" },
				[neotree_local_leader .. "gn"] = { "next_git_modified", desc = "Next" },

				[neotree_local_leader .. "<"] = { "navigate_up", desc = "Go back" },
				[neotree_local_leader .. ">"] = { "set_root", desc = "Go front" },
				[neotree_local_leader .. "H"] = { "toggle_hidden", desc = "Toggle (hidden)" },

				[neotree_local_leader .. "/"] = { "fuzzy_sorter", desc = "Fuzzy find" },
				[neotree_local_leader .. "f"] = { "fuzzy_finder", desc = "File" },
				[neotree_local_leader .. "F"] = { "fuzzy_finder_directory", desc = "Directory" },
		},
			fuzzy_finder_mappings = {
				-- define keymaps for filter popup window in fuzzy_finder_mode
				["<c-n>"] = "move_cursor_down",
				["<c-p>"] = "move_cursor_up",
				["<c-j>"] = "move_cursor_down",
				["<c-k>"] = "move_cursor_up",
			},
		},
	},
	buffers = {
		window = {
			mappings = {
				-- for buffer source window only in neotree buffer
				["d"] = "buffer_delete",
				["<"] = "navigate_up",
				[">"] = "set_root",
				[neotree_local_leader .. "d"] = { "buffer_delete", desc = "Buffer delete" },
			},
		},
	},
	git_status = {
		window = {
			mappings = {
				-- for git source window only in neotree buffer
			},
		},
	},
})

