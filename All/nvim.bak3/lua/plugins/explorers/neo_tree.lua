return {
	"nvim-neo-tree/neo-tree.nvim",
	enabled = require("plugins.controller").explorers.neo_tree,
	branch = "v3.x",
	cmd = { "Neotree" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim",
	},

	keys = function()
		local keymap = require("plugins.explorers.keymap").neotree_key
		return require("lib.functions").convertKeys(keymap)
	end,
	opts = function(_, opts)
		local icons = require("lib.icons")
		local utils = require("lib.utils")

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

			["<localleader><space>"] = { "refresh", desc = "Refresh" },
			["<localleader>q"] = { "close_window", desc = "Quit" },
			["<localleader>P"] = { "toggle_preview", desc = "Toggle (preview)" },
			["<localleader>I"] = { "focus_preview", desc = "Focus (preview)" },

			["<localleader>f"] = { function() end, desc = "File", nowait = false },
			["<localleader>fo"] = { function() end, desc = "Open", nowait = false },
			["<localleader>foh"] = { "open_leftabove_vs", desc = "Left" },
			["<localleader>fol"] = { "open_vsplit", desc = "Right" },
			["<localleader>foj"] = { "open_split", desc = "Down" },
			["<localleader>fop"] = { function() end, desc = "Picker", nowait = false },
			["<localleader>fopc"] = { "open_with_window_picker", desc = "Current" },
			["<localleader>foph"] = { "split_with_window_picker", desc = "Horizontal" },
			["<localleader>fopv"] = { "vsplit_with_window_picker", desc = "Vertical" },
			["<localleader>fot"] = { function() end, desc = "As tab", nowait = false },
			["<localleader>fotn"] = { "open_tabnew", desc = "New" },
			["<localleader>fotd"] = { "open_tab_drop", desc = "Drop" },

			["<localleader>g"] = { function() end, desc = "Git", nowait = false },
			["<localleader>ga"] = { "git_add_file", desc = "Current" },
			["<localleader>gA"] = { "git_add_all", desc = "All" },
			["<localleader>gu"] = { "git_unstage_file", desc = "Unstage" },
			["<localleader>gr"] = { "git_revert_file", desc = "Revert" },
			["<localleader>gc"] = { "git_commit", desc = "Commit" },
			["<localleader>gp"] = { "git_push", desc = "Push" },
			["<localleader>gg"] = { "git_commit_and_push", desc = "Commit & push" },

			["<localleader>o"] = { function() end, desc = "Order by", nowait = false },
			["<localleader>oc"] = { "order_by_created", desc = "Created" },
			["<localleader>od"] = { "order_by_diagnostics", desc = "Diagnostics" },
			["<localleader>og"] = { "order_by_git_status", desc = "Git status" },
			["<localleader>om"] = { "order_by_modified", desc = "Modified" },
			["<localleader>on"] = { "order_by_name", desc = "Name" },
			["<localleader>os"] = { "order_by_size", desc = "Size" },
			["<localleader>ot"] = { "order_by_type", desc = "Type" },

			["<localleader>h"] = { "close_node", desc = "Node (close current)" },
			["<localleader>l"] = { "toggle_node", desc = "Node (expand current)" },
			["<localleader>S"] = { "close_all_subnodes", desc = "Node (close sub)" },
			["<localleader>C"] = { "close_all_nodes", desc = "Node (close all)" },
			["<localleader>E"] = { "expand_all_nodes", desc = "Node (expand all)" },

			["<localleader>i"] = { "show_file_details", desc = "Show details" },
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
			["<localleader>d"] = { "delete", desc = "File (delete) " },
			["<localleader>r"] = { "rename_basename", desc = "File (rename)" },
			["<localleader>R"] = { "rename", desc = "File (rename with ext)" },
			["<localleader>a"] = { "add", desc = "File (add)" },
			["<localleader>A"] = { "add_directory", desc = "Directory (add)" },

			["<localleader>p"] = { "paste_from_clipboard", desc = "Paste" },
			["<localleader>x"] = { "cut_to_clipboard", desc = "Cut" },
			["<localleader>y"] = { "copy_to_clipboard", desc = "Copy" },

			["<localleader>gp"] = { "prev_git_modified", desc = "Previous" },
			["<localleader>gn"] = { "next_git_modified", desc = "Next" },

			["<localleader><"] = { "navigate_up", desc = "Go back" },
			["<localleader>>"] = { "set_root", desc = "Go front" },
			["<localleader>H"] = { "toggle_hidden", desc = "Toggle (hidden)" },

			["<localleader>/"] = { "fuzzy_sorter", desc = "Fuzzy find" },
			["<localleader>f"] = { "fuzzy_finder", desc = "File" },
			["<localleader>F"] = { "fuzzy_finder_directory", desc = "Directory" },
		}

		local local_buffer_keymaps = {
			-- for buffer source window only in neotree buffer
			["d"] = "buffer_delete",
			["<"] = "navigate_up",
			[">"] = "set_root",
			["<localleader>d"] = { "buffer_delete", desc = "Buffer delete" },
		}

		local local_git_keymaps = {}

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
			popup_border_style = "rounded",
			use_image_nvim = true,
			source_selector = {
				winbar = false,
				statusline = false,
				content_layout = "center",
				tabs_layout = "equal",
			},
			default_component_configs = {
				indent = {
					indent_size = utils.indent.explorer,
					indent_marker = "│",
					last_indent_marker = "╰───",
				},
				icon = {
					folder_closed = icons.filesystem.folder.default,
					folder_open = icons.filesystem.folder.opened,
					folder_empty = icons.filesystem.folder.empty,
				},
				modified = {
					symbol = icons.filesystem.modified,
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
						-- Change type
						added = icons.git.added,
						deleted = icons.git.removed,
						modified = icons.git.modified,
						renamed = icons.git.renamed,
						-- Status type
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
	end,
}
