local M = {}

local keys = require("lib.keys")

M.brach = "v3.x"

M.cmd = {
  "Neotree",
}

M.dependencies = {
	"nvim-lua/plenary.nvim",
	"nvim-tree/nvim-web-devicons",
	"MunifTanjim/nui.nvim",
	-- "3rd/image.nvim",
}

M.opts = function(_, opts)
	local icons = require("lib.icons")
	local utils = require("lib.utils")
	local explorer_local_leader = keys.localleader.explorer

	local local_global_keymaps = {
		-- remove some unwanted behavior keys from neotree
		["o"] = "none",
		["O"] = "none",
		["z"] = "none",
		["e"] = "none",
		["$"] = "none",
		["<space>"] = "none",

		-- for global source only in neotree buffer
		["R"] = "refresh",
		["i"] = "show_file_details",
		["E"] = "expand_all_nodes",
		["l"] = "toggle_node",
		["h"] = "close_node",
		["C"] = "close_all_nodes",
		["S"] = "close_all_subnodes",
		["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
		["I"] = "focus_preview",
		["<C-y>"] = { "scroll_preview", config = { direction = 1 } },
		["<C-e>"] = { "scroll_preview", config = { direction = -1 } },
		["<C-u>"] = { "scroll_preview", config = { direction = 10 } },
		["<C-d>"] = { "scroll_preview", config = { direction = -10 } },
		["<C-b>"] = { "scroll_preview", config = { direction = 30 } },
		["<C-f>"] = { "scroll_preview", config = { direction = -30 } },
		["q"] = "close_window",
		["<cr>"] = "open",
		["<c-s-l>"] = "next_source",
		["<c-s-h>"] = "prev_source",

		[explorer_local_leader .. "<space>"] = { "refresh", desc = "Refresh" },
		[explorer_local_leader .. "q"] = { "close_window", desc = "Quit" },
		[explorer_local_leader .. "P"] = { "toggle_preview", desc = "Toggle (preview)" },
		[explorer_local_leader .. "I"] = { "focus_preview", desc = "Focus (preview)" },

		[explorer_local_leader .. "f"] = { function() end, desc = "File", nowait = false },
		[explorer_local_leader .. "fo"] = { function() end, desc = "Open", nowait = false },
		[explorer_local_leader .. "foh"] = { "open_leftabove_vs", desc = "Left" },
		[explorer_local_leader .. "fol"] = { "open_vsplit", desc = "Right" },
		[explorer_local_leader .. "foj"] = { "open_split", desc = "Down" },
		[explorer_local_leader .. "fop"] = { function() end, desc = "Picker", nowait = false },
		[explorer_local_leader .. "fopc"] = { "open_with_window_picker", desc = "Current" },
		[explorer_local_leader .. "foph"] = { "split_with_window_picker", desc = "Horizontal" },
		[explorer_local_leader .. "fopv"] = { "vsplit_with_window_picker", desc = "Vertical" },
		[explorer_local_leader .. "fot"] = { function() end, desc = "As tab", nowait = false },
		[explorer_local_leader .. "fotn"] = { "open_tabnew", desc = "New" },
		[explorer_local_leader .. "fotd"] = { "open_tab_drop", desc = "Drop" },

		[explorer_local_leader .. "g"] = { function() end, desc = "Git", nowait = false },
		[explorer_local_leader .. "ga"] = { "git_add_file", desc = "Current" },
		[explorer_local_leader .. "gA"] = { "git_add_all", desc = "All" },
		[explorer_local_leader .. "gu"] = { "git_unstage_file", desc = "Unstage" },
		[explorer_local_leader .. "gr"] = { "git_revert_file", desc = "Revert" },
		[explorer_local_leader .. "gc"] = { "git_commit", desc = "Commit" },
		[explorer_local_leader .. "gp"] = { "git_push", desc = "Push" },
		[explorer_local_leader .. "gg"] = { "git_commit_and_push", desc = "Commit & push" },

		[explorer_local_leader .. "o"] = { function() end, desc = "Order by", nowait = false },
		[explorer_local_leader .. "oc"] = { "order_by_created", desc = "Created" },
		[explorer_local_leader .. "od"] = { "order_by_diagnostics", desc = "Diagnostics" },
		[explorer_local_leader .. "og"] = { "order_by_git_status", desc = "Git status" },
		[explorer_local_leader .. "om"] = { "order_by_modified", desc = "Modified" },
		[explorer_local_leader .. "on"] = { "order_by_name", desc = "Name" },
		[explorer_local_leader .. "os"] = { "order_by_size", desc = "Size" },
		[explorer_local_leader .. "ot"] = { "order_by_type", desc = "Type" },

		[explorer_local_leader .. "h"] = { "close_node", desc = "Node (close current)" },
		[explorer_local_leader .. "l"] = { "toggle_node", desc = "Node (expand current)" },
		[explorer_local_leader .. "S"] = { "close_all_subnodes", desc = "Node (close sub)" },
		[explorer_local_leader .. "C"] = { "close_all_nodes", desc = "Node (close all)" },
		[explorer_local_leader .. "E"] = { "expand_all_nodes", desc = "Node (expand all)" },

		[explorer_local_leader .. "i"] = { "show_file_details", desc = "Show details" },
	}

	local local_filesystem_keymaps = {
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
		[explorer_local_leader .. "d"] = { "delete", desc = "File (delete) " },
		[explorer_local_leader .. "r"] = { "rename_basename", desc = "File (rename)" },
		[explorer_local_leader .. "R"] = { "rename", desc = "File (rename with ext)" },
		[explorer_local_leader .. "a"] = { "add", desc = "File (add)" },
		[explorer_local_leader .. "A"] = { "add_directory", desc = "Directory (add)" },

		[explorer_local_leader .. "p"] = { "paste_from_clipboard", desc = "Paste" },
		[explorer_local_leader .. "x"] = { "cut_to_clipboard", desc = "Cut" },
		[explorer_local_leader .. "y"] = { "copy_to_clipboard", desc = "Copy" },

		[explorer_local_leader .. "gp"] = { "prev_git_modified", desc = "Previous" },
		[explorer_local_leader .. "gn"] = { "next_git_modified", desc = "Next" },

		[explorer_local_leader .. "<"] = { "navigate_up", desc = "Go back" },
		[explorer_local_leader .. ">"] = { "set_root", desc = "Go front" },
		[explorer_local_leader .. "H"] = { "toggle_hidden", desc = "Toggle (hidden)" },

		[explorer_local_leader .. "/"] = { "fuzzy_sorter", desc = "Fuzzy find" },
		[explorer_local_leader .. "f"] = { "fuzzy_finder", desc = "File" },
		[explorer_local_leader .. "F"] = { "fuzzy_finder_directory", desc = "Directory" },
	}

	local local_buffer_keymaps = {
		-- for buffer source window only in neotree buffer
		["d"] = "buffer_delete",
		["<"] = "navigate_up",
		[">"] = "set_root",
		[explorer_local_leader .. "d"] = { "buffer_delete", desc = "Buffer delete" },
	}

	local local_git_keymaps = {}


	-- snacks renaming file integration with neo-tree
	local function on_move(data)
		Snacks.rename.on_rename_file(data.source, data.destination)
	end

	local events = require("neo-tree.events")
	opts.event_handlers = opts.event_handlers or {}
	vim.list_extend(opts.event_handlers, {
		{ event = events.FILE_MOVED, handler = on_move },
		{ event = events.FILE_RENAMED, handler = on_move },
	})

	return {
	use_default_mappings = false,
	close_if_last_window = true,
	popup_border_style = {
    icons.ui.border.top.left,
	  icons.ui.border.horizontal,
	  icons.ui.border.top.right,
	  icons.ui.border.vertical,
	  icons.ui.border.bottom.right,
	  icons.ui.border.horizontal,
	  icons.ui.border.bottom.left,
	  icons.ui.border.vertical,
  },
	use_image_nvim = true,
	source_selector = {
		winbar = true,
		statusline = false,
		sources = {
			{
				source = "filesystem",
				display_name = " " .. icons.documents.folder.closed .. " Folders",
			},
			{
				source = "buffers",
				display_name = " " .. icons.others.buffers .. " Buffers",
			},
			{
				source = "git_status",
				display_name = icons.git.logo .. " Status",
			},
		},
		content_layout = utils.ui.title_position,
		tabs_layout = "equal",
	},
	default_component_configs = {
		indent = {
			indent_size = utils.indent_size.explorer,
			indent_marker = icons.indent_line.default,
			last_indent_marker = icons.indent_line.last .. icons.indent_line.bottom,
		},
		icon = {
			folder_closed = icons.documents.folder.closed,
			folder_open = icons.documents.folder.opened,
			folder_empty = icons.documents.folder.empty,
		},
		modified = {
			symbol = icons.documents.modified,
		},
		diagnostics = {
			symbols = {
				hint = icons.diagnostics.hint,
				info = icons.diagnostics.info,
				warn = icons.diagnostics.warn,
				error = icons.diagnostics.error,
			},
		},
		name = {
			use_git_status_colors = false,
		},
		git_status = {
			symbols = {
				added = icons.git.added,
				deleted = icons.git.deleted,
				modified = icons.git.modified,
				renamed = icons.git.renamed,
				untracked = icons.git.untracked,
				ignored = icons.git.ignored,
				unstaged = icons.git.unstaged,
				staged = icons.git.staged,
				conflict = icons.git.conflict,
			},
		},
	},
	window = {
		position = "left",
		width = "40",
		mappings = local_global_keymaps,
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
			mappings = local_filesystem_keymaps,
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
			mappings = local_buffer_keymaps,
		},
	},
	git_status = {
		window = {
			-- for git source window only in neotree buffer
			mappings = local_git_keymaps,
		},
	},
}
end

-- M.config = function() end

M.keys = function()
	local map = require("lib.func").map
	local explorer_leader = keys.leader.explorer

	local neotree_reveal_cwd = function (is_enabled, is_leave_dir_opened)
		local config = require("neo-tree").config or {}

		-- Ensure filesystem table exists
		config.filesystem = config.filesystem or {}

		config.filesystem.follow_current_file = {
			enabled = is_enabled,
			leave_dirs_open = is_leave_dir_opened,
		}

		-- Reapply the updated configuration
		require("neo-tree").setup(config)

		-- Notify the user
		if is_enabled and is_leave_dir_opened then
			vim.notify("Neotree: Reveal current file enabled,\n(Leave directory opened)")
		elseif is_enabled and not is_leave_dir_opened then
			vim.notify("Neotree: Reveal current file enabled,\n(Leave directory closed)")
		else
			vim.notify("Neotree: Reveal current file disabled")
		end

		vim.cmd("Neotree close")
		vim.cmd("Neotree")
	end

	return {
		map(1, { "n" }, explorer_leader, "", { desc = "Explorer" }),
		map(1, { "n" }, explorer_leader .. "m", "", { desc = "Move" }),
		map(1, { "n" }, explorer_leader .. "r", "", { desc = "Reveal current" }),

		map(1, { "n" }, explorer_leader .. "f", "<cmd>Neotree focus<cr>", { desc = "Focus" }),
		map(1, { "n" }, explorer_leader .. "x", "<cmd>Neotree close<cr><cmd>Neotree close filesystem<cr><cmd>Neotree close buffers<cr><cmd>Neotree close git_status<cr>", { desc = "Close" }),

		map(1, { "n" }, explorer_leader .. "rx", function() neotree_reveal_cwd(false, false) end, { desc = "Off" }),
		map(1, { "n" }, explorer_leader .. "ro", function() neotree_reveal_cwd(true, true) end, { desc = "Leave files opened" }),
		map(1, { "n" }, explorer_leader .. "rc", function() neotree_reveal_cwd(true, false) end, { desc = "Leave files closed" }),

		map(1, { "n" }, explorer_leader .. "e", "<cmd>Neotree toggle<cr>", { desc = "Toggle" }),
		map(1, { "n" }, explorer_leader .. "g", "<cmd>Neotree git_status<cr>", { desc = "Git explorer" }),
		map(1, { "n" }, explorer_leader .. "b", "<cmd>Neotree buffers<cr>", { desc = "Buffers explorer" }),
		map(1, { "n" }, explorer_leader .. "mh", "<cmd>Neotree left<cr>", { desc = "Left" }),
		map(1, { "n" }, explorer_leader .. "mk", "<cmd>Neotree top<cr>", { desc = "Up" }),
		map(1, { "n" }, explorer_leader .. "ml", "<cmd>Neotree right<cr>", { desc = "Right" }),
		map(1, { "n" }, explorer_leader .. "mj", "<cmd>Neotree bottom<cr>", { desc = "Down" }),
		map(1, { "n" }, explorer_leader .. "mf", "<cmd>Neotree focus float<cr>", { desc = "Float" }),
		map(1, { "n" }, explorer_leader .. "c", "<cmd>Neotree reveal<cr>", { desc = "Reveal Current" }),
	}
end

return M
