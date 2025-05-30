local M = {};

M.keys = function()
  local func = require("lib.functions");
  local map = func.map;
  local requires = func.requires;
  local leader = require("lib.keys").explorer.globals;

  local neotree_reveal_cwd = function (is_enabled, is_leave_dir_opened)
		local config = requires("neo-tree").config or {}

		-- Ensure filesystem table exists
		config.filesystem = config.filesystem or {}

		config.filesystem.follow_current_file = {
			enabled = is_enabled,
			leave_dirs_open = is_leave_dir_opened,
		}

		-- Reapply the updated configuration
		requires("neo-tree").setup(config)

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
   	map(1, { "n" }, leader, "", { desc = "Explorer" }),
		map(1, { "n" }, leader .. "m", "", { desc = "Move" }),
		map(1, { "n" }, leader .. "r", "", { desc = "Reveal current" }),

		map(1, { "n" }, leader .. "f", "<cmd>Neotree focus<cr>", { desc = "Focus" }),
		map(1, { "n" }, leader .. "x", "<cmd>Neotree close<cr><cmd>Neotree close filesystem<cr><cmd>Neotree close buffers<cr><cmd>Neotree close git_status<cr>", { desc = "Close" }),

		map(1, { "n" }, leader .. "rx", function() neotree_reveal_cwd(false, false) end, { desc = "Off" }),
		map(1, { "n" }, leader .. "ro", function() neotree_reveal_cwd(true, true) end, { desc = "Leave files opened" }),
		map(1, { "n" }, leader .. "rc", function() neotree_reveal_cwd(true, false) end, { desc = "Leave files closed" }),

		map(1, { "n" }, leader .. "e", "<cmd>Neotree toggle<cr>", { desc = "Toggle" }),
		map(1, { "n" }, leader .. "g", "<cmd>Neotree git_status<cr>", { desc = "Git explorer" }),
		map(1, { "n" }, leader .. "b", "<cmd>Neotree buffers<cr>", { desc = "Buffers explorer" }),
		map(1, { "n" }, leader .. "mh", "<cmd>Neotree left<cr>", { desc = "Left" }),
		map(1, { "n" }, leader .. "mk", "<cmd>Neotree top<cr>", { desc = "Up" }),
		map(1, { "n" }, leader .. "ml", "<cmd>Neotree right<cr>", { desc = "Right" }),
		map(1, { "n" }, leader .. "mj", "<cmd>Neotree bottom<cr>", { desc = "Down" }),
		map(1, { "n" }, leader .. "mf", "<cmd>Neotree focus float<cr>", { desc = "Float" }),
		map(1, { "n" }, leader .. "c", "<cmd>Neotree reveal<cr>", { desc = "Reveal Current" }),
  };
end;

M.opts = function()
  local requires = require("lib.functions").requires;
  local utils = requires("lib.utils");
  local icons = requires("lib.icons");
  local localleader = requires("lib.keys").explorer.locals;

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

		[localleader .. "<space>"] = { "refresh", desc = "Refresh" },
		[localleader .. "q"] = { "close_window", desc = "Quit" },
		[localleader .. "P"] = { "toggle_preview", desc = "Toggle (preview)" },
		[localleader .. "I"] = { "focus_preview", desc = "Focus (preview)" },

		[localleader .. "f"] = { function() end, desc = "File", nowait = false },
		[localleader .. "fo"] = { function() end, desc = "Open", nowait = false },
		[localleader .. "foh"] = { "open_leftabove_vs", desc = "Left" },
		[localleader .. "fol"] = { "open_vsplit", desc = "Right" },
		[localleader .. "foj"] = { "open_split", desc = "Down" },
		[localleader .. "fop"] = { function() end, desc = "Picker", nowait = false },
		[localleader .. "fopc"] = { "open_with_window_picker", desc = "Current" },
		[localleader .. "foph"] = { "split_with_window_picker", desc = "Horizontal" },
		[localleader .. "fopv"] = { "vsplit_with_window_picker", desc = "Vertical" },
		[localleader .. "fot"] = { function() end, desc = "As tab", nowait = false },
		[localleader .. "fotn"] = { "open_tabnew", desc = "New" },
		[localleader .. "fotd"] = { "open_tab_drop", desc = "Drop" },

		[localleader .. "g"] = { function() end, desc = "Git", nowait = false },
		[localleader .. "ga"] = { "git_add_file", desc = "Current" },
		[localleader .. "gA"] = { "git_add_all", desc = "All" },
		[localleader .. "gu"] = { "git_unstage_file", desc = "Unstage" },
		[localleader .. "gr"] = { "git_revert_file", desc = "Revert" },
		[localleader .. "gc"] = { "git_commit", desc = "Commit" },
		[localleader .. "gp"] = { "git_push", desc = "Push" },
		[localleader .. "gg"] = { "git_commit_and_push", desc = "Commit & push" },

		[localleader .. "o"] = { function() end, desc = "Order by", nowait = false },
		[localleader .. "oc"] = { "order_by_created", desc = "Created" },
		[localleader .. "od"] = { "order_by_diagnostics", desc = "Diagnostics" },
		[localleader .. "og"] = { "order_by_git_status", desc = "Git status" },
		[localleader .. "om"] = { "order_by_modified", desc = "Modified" },
		[localleader .. "on"] = { "order_by_name", desc = "Name" },
		[localleader .. "os"] = { "order_by_size", desc = "Size" },
		[localleader .. "ot"] = { "order_by_type", desc = "Type" },

		[localleader .. "h"] = { "close_node", desc = "Node (close current)" },
		[localleader .. "l"] = { "toggle_node", desc = "Node (expand current)" },
		[localleader .. "S"] = { "close_all_subnodes", desc = "Node (close sub)" },
		[localleader .. "C"] = { "close_all_nodes", desc = "Node (close all)" },
		[localleader .. "E"] = { "expand_all_nodes", desc = "Node (expand all)" },

		[localleader .. "i"] = { "show_file_details", desc = "Show details" },
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
		[localleader .. "d"] = { "delete", desc = "File (delete) " },
		[localleader .. "r"] = { "rename_basename", desc = "File (rename)" },
		[localleader .. "R"] = { "rename", desc = "File (rename with ext)" },
		[localleader .. "a"] = { "add", desc = "File (add)" },
		[localleader .. "A"] = { "add_directory", desc = "Directory (add)" },

		[localleader .. "p"] = { "paste_from_clipboard", desc = "Paste" },
		[localleader .. "x"] = { "cut_to_clipboard", desc = "Cut" },
		[localleader .. "y"] = { "copy_to_clipboard", desc = "Copy" },

		[localleader .. "gp"] = { "prev_git_modified", desc = "Previous" },
		[localleader .. "gn"] = { "next_git_modified", desc = "Next" },

		[localleader .. "<"] = { "navigate_up", desc = "Go back" },
		[localleader .. ">"] = { "set_root", desc = "Go front" },
		[localleader .. "H"] = { "toggle_hidden", desc = "Toggle (hidden)" },

		[localleader .. "/"] = { "fuzzy_sorter", desc = "Fuzzy find" },
		[localleader .. "f"] = { "fuzzy_finder", desc = "File" },
		[localleader .. "F"] = { "fuzzy_finder_directory", desc = "Directory" },
	}

	local local_buffer_keymaps = {
		-- for buffer source window only in neotree buffer
		["d"] = "buffer_delete",
		["<"] = "navigate_up",
		[">"] = "set_root",
		[localleader .. "d"] = { "buffer_delete", desc = "Buffer delete" },
	}

	local local_git_keymaps = {}

	--  -- snacks renaming file integration with neo-tree
	-- local function on_move(data)
	-- 	Snacks.rename.on_rename_file(data.source, data.destination)
	-- end

	-- local events = require("neo-tree.events")
	-- opts.event_handlers = opts.event_handlers or {}
	-- vim.list_extend(opts.event_handlers, {
	-- 	{ event = events.FILE_MOVED, handler = on_move },
	-- 	{ event = events.FILE_RENAMED, handler = on_move },
	-- })


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
    source_selector = {
      winbar = true,
      statusline = false,
      source = {
        {
          source = "filesystem",
          display_name = icons.documents.folder.closed .. " Folders",
        },
        {
          source = "buffers",
          display_name = icons.extras.buffers .. " Buffers",
        },
        {
          source = "git_status",
          display_name = icons.git.logo .. " Status",
        },
        content_layout == utils.ui.title_position,
        tabs_layout = "equal",
      },
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
        symbol = icons.extras.modified,
      },
      name = {
        use_git_status_colors = true,
      },
      git_status = {
        symbols = {
          added = icons.git.added,
          modified = icons.git.modified,
          deleted = icons.git.removed,
          renamed = icons.git.renamed,
          untracked = icons.git.untracked,
          ignored = icons.git.ignored,
          unstaged = icons.git.unstaged,
          staged = icons.git.staged,
          conflict = icons.git.conflict,
        },
      },
      diagnostics = {
        symbols = {
          hint = icons.diagnostics.hint,
          info = icons.diagnostics.info,
          warn = icons.diagnostics.warn,
          error = icons.diagnostics.error,
        },
      },
    },
    window = {
		  position = "left",
		  width = "30",
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
  };
end;

-- M.config = function(_, opts)
-- end;

return M;
