return {
	"nvim-neo-tree/neo-tree.nvim",
	cmd = { "Neotree" },
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"3rd/image.nvim", -- for image support
		{
			's1n7ax/nvim-window-picker',
			version = '2.*',
			config = function()
				require 'window-picker'.setup({
					filter_rules = {
						include_current_win = false,
						autoselect_one = true,
						bo = {
							filetype = { 'neo-tree', "neo-tree-popup", "notify" },
							buftype = { 'terminal', "quickfix" },
						},
					},
				})
			end,
		},
	},
	config = function ()
		local neo_tree = require("neo-tree")
		neo_tree.setup({
			close_if_last_window = true,
			popup_border_style = "rounded",
			enable_git_status = true,
			enable_diagnostics = true,
			open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
			sort_case_insensitive = false,
			sort_function = nil ,
			source_selector = {
				winbar = true,
				sources = {
					{ source = "filesystem", display_name = "  Files " },
					{ source = "buffers", display_name = " 󰓩 Buffers " },
					{ source = "git_status", display_name = "  Git " },
				},
				content_layout = "center",
				tabs_layout = "equal",
			},
			default_component_configs = {
				container = {
					enable_character_fade = true
				},
				indent = {
					indent_size = 3,
					padding = 2,
					with_markers = true,
					indent_marker = "│",
					last_indent_marker = "└",
					highlight = "NeoTreeIndentMarker",
					with_expanders = nil,
					expander_collapsed = "",
					expander_expanded = "",
					expander_highlight = "NeoTreeExpander",
				},
				icon = {
					folder_closed = " 󰉋 ",
					folder_open = " 󰝰 ",
					folder_empty = " 󰉖 ",
					---@diagnostic disable-next-line: unused-local
					provider = function(icon, node, state)
						if node.type == "file" or node.type == "terminal" then
							local success, web_devicons = pcall(require, "nvim-web-devicons")
							local name = node.type == "terminal" and "terminal" or node.name
							if success then
								local devicon, hl = web_devicons.get_icon(name)
								icon.text = devicon or icon.text
								icon.highlight = hl or icon.highlight
							end
						end
					end,
					default = "*",
					highlight = "NeoTreeFileIcon"
				},
				modified = {
					symbol = " ",
					highlight = "NeoTreeModified",
				},
				diagnostics = {
					symbols = {
						hint = " ",
						info = " ",
						warn = " ",
						error = " ",
					}
				},
				highlights = {
					hint = "DiagnosticSignHint",
					info = "DiagnosticSignInfo",
					warn = "DiagnosticSignWarn",
					error = "DiagnosticSignError",
				},
				name = {
					trailing_slash = false,
					use_git_status_colors = true,
					highlight = "NeoTreeFileName",
				},
				git_status = {
					symbols = {
						added     = " ",
						modified  = "󱗝 ",
						deleted   = "󱋯 ",
						renamed   = " ",
						untracked = " ",
						ignored  = " ",
						unstaged = " ",
						staged = " ",
						conflict = " ",
					}
				},
				file_size = {
					enabled = true,
					required_width = 64,
				},
				type = {
					enabled = true,
					required_width = 122,
				},
				last_modified = {
					enabled = true,
					required_width = 88,
				},
				created = {
					enabled = true,
					required_width = 110,
				},
				symlink_target = {
					enabled = false,
				},
			},
			commands = {},
			window = {
				position = "left",
				width = 40,
				mapping_options = {
					noremap = true,
					nowait = true,
				},
				mappings = {
					-- for easy access common keys
					["a"] = { "add", desc = "Add file" },
					["A"] = "add_directory",
					["d"] = "delete",
					["r"] = "rename",
					["R"] = "refresh",
					["y"] = "copy_to_clipboard",
					["x"] = "cut_to_clipboard",
					["p"] = "paste_from_clipboard",
					["q"] = "close_window",
					["i"] = "show_file_details",
					["<a-l>"] = "next_source",
					["<a-h>"] = "prev_source",

					-- disable some keymaps
					["c"] = "none",
					["f"] = "none",
					["e"] = "none",
					["j"] = "none",
					["k"] = "none",
					["m"] = "none",
					["o"] = "none",
					["oc"] = "none",
					["od"] = "none",
					["og"] = "none",
					["om"] = "none",
					["on"] = "none",
					["os"] = "none",
					["ot"] = "none",
					["s"] = "none",
					["t"] = "none",
					["w"] = "none",
					["z"] = "none",
					["P"] = "none",
					["C"] = "none",
					["D"] = "none",
					["H"] = "none",
					["S"] = "none",
					["[g"] = "none",
					["]g"] = "none",
					["<space>"] = "none",
					["<esc>"] = "none",
					["<bs>"] = "none",
					["<2-leftmouse>"] = "none",
					["#"] = "none",
					["."] = "none",
					["?"] = "none",

					-- remapping 
					["\\fpo"] = {"toggle_preview", desc = "Open", config = {use_float = true, use_image_nvim = true}},
					["\\fpf"] = {"focus_preview", desc = "Focus"},

					["\\foh"] = {"open_leftabove_vs", desc = "Left"},
					["\\fol"] = {"open_vsplit", desc = "Right"},
					["\\foj"] = {"open_split", desc = "Down"},

					["\\fopc"] = {"open_with_window_picker", desc = "Current"},
					["\\foph"] = {"split_with_window_picker", desc = "Horizontal"},
					["\\fopv"] = {"vsplit_with_window_picker", desc = "Vertical"},

					["\\fotn"] = {"open_tabnew", desc = "New"},
					["\\fotd"] = {"open_tab_drop", desc = "Drop"},

					["\\fd"] = {"delete", desc = "Delete" },
					["\\fr"] = {"rename", desc = "Rename" },
					["\\fa"] = { "add", desc = "Add" },
					["\\da"] = {"add_directory", desc = "Add" },

					["\\cc"] = {"close_node", desc = "Current node"},
					["\\cs"] = {"close_all_subnodes", desc = "Sub & current nodes"},
					["\\ca"] = {"close_all_nodes", desc = "All nodes"},
					["\\ea"] = {"expand_all_nodes", desc = "All nodes"},

					["\\i"] = {"show_file_details", desc = "Show details" },
					["\\r"] = {"refresh", desc = "Refresh" },
					["\\p"] = {"paste_from_clipboard", desc = "Paste" },
					["\\q"] = {"close_window",desc = "Quit" },
					["\\x"] = {"cut_to_clipboard", desc = "Cut" },
					["\\y"] = {"copy_to_clipboard", desc = "Copy" },
				}
			},
			nesting_rules = {},
			filesystem = {
				filtered_items = {
					visible = false,
					hide_dotfiles = false,
					hide_gitignored = true,
					hide_hidden = false,
					hide_by_name = {},
					hide_by_pattern = {},
					always_show = {},
					always_show_by_pattern = {},
					never_show = {},
					never_show_by_pattern = {},
				},
				follow_current_file = {
					enabled = false,
					leave_dirs_open = false,
				},
				group_empty_dirs = false,
				hijack_netrw_behavior = "open_default",
				use_libuv_file_watcher = false,
				window = {
					mappings = {
						-- for easy access common keys
						["<"] = "navigate_up",
						[">"] = "set_root",
						["/"] = "fuzzy_finder",

						-- remapping 
						["\\<"] = {"navigate_up", desc = "Go back"},
						["\\>"] = {"set_root", desc = "Go front"},
						["\\h"] = {"toggle_hidden", desc = "Show hidden"},
						["\\ff"] = {"fuzzy_finder", desc = "Find" }, -- fuzzy sorting using the fzy algorithm
						["\\df"] = {"fuzzy_finder_directory", desc = "Find"},
						["\\gmp"] = {"prev_git_modified", desc = "Previous" },
						["\\gmn"] = {"next_git_modified", desc = "Next" },
						["\\oc"] = { "order_by_created", desc = "Created" },
						["\\od"] = { "order_by_diagnostics", desc = "Diagnostics" },
						["\\og"] = { "order_by_git_status", desc = "Git status" },
						["\\om"] = { "order_by_modified", desc = "Modified" },
						["\\on"] = { "order_by_name", desc = "Name" },
						["\\os"] = { "order_by_size", desc = "Size" },
						["\\ot"] = { "order_by_type", desc = "Type" },
					},
					fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
						["<c-n>"] = "move_cursor_down",
						["<c-p>"] = "move_cursor_up",
						["<c-j>"] = "move_cursor_down",
						["<c-k>"] = "move_cursor_up",
					},
				},
				commands = {}
			},
			buffers = {
				follow_current_file = {
					enabled = true,
					leave_dirs_open = false,
				},
				group_empty_dirs = true,
				show_unloaded = true,
				window = {
					mappings = {
						-- for easy access common keys
						["<"] = "navigate_up",
						[">"] = "set_root",
						["d"] = "buffer_delete",

						-- remapping 
						["\\<"] = { "navigate_up", desc = "Go back"},
						["\\>"] = { "set_root", desc = "Go front"},
						["\\bd"] = { "buffer_delete", desc = "Delete"},
						["\\bo"] = { function() end, desc = "Order", nowait = false },
						["\\boc"] = { "order_by_created", desc = "Created" },
						["\\bod"] = { "order_by_diagnostics", desc = "Diagnostics" },
						["\\bog"] = { "order_by_git_status", desc = "Git status" },
						["\\bom"] = { "order_by_modified", desc = "Modified" },
						["\\bon"] = { "order_by_name", desc = "Name" },
						["\\bos"] = { "order_by_size", desc = "Size" },
						["\\bot"] = { "order_by_type", desc = "Type" },
					}
				},
			},
			git_status = {
				window = {
					-- position = "float",
					mappings = {
						["\\ga"] = { function() end, desc = "Add", nowait = false },
						["\\gaa"] = { "git_add_all", desc = "All" },
						["\\gac"] = { "git_add_file", desc = "Current" },
						["\\gu"] = { "git_unstage_file", desc = "Unstage" },
						["\\gr"] = { "git_revert_file", desc = "Revert" },
						["\\gc"] = { "git_commit", desc = "Commit" },
						["\\gp"] = { "git_push", desc = "Push" },
						["\\gg"] = { "git_commit_and_push", desc = "Commit & push" },
						["\\goc"] = { "order_by_created", desc = "Created" },
						["\\god"] = { "order_by_diagnostics", desc = "Diagnostics" },
						["\\gog"] = { "order_by_git_status", desc = "Git status" },
						["\\gom"] = { "order_by_modified", desc = "Modified" },
						["\\gon"] = { "order_by_name", desc = "Name" },
						["\\gos"] = { "order_by_size", desc = "Size" },
						["\\got"] = { "order_by_type", desc = "Type" },
					}
				}
			}
		})

		-- vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
		-- vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", {italic = false})
		-- vim.api.nvim_set_hl(0, "NeoTreeGitUnstaged", {italic = false})
		-- vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "#151515",})
		-- vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "#151515",})
	end,

	add_labels_in_which_key = function ()
		return {
			{"\\b", desc = "Buffer"},
			{"\\c", desc = "Close"},
			{"\\d", desc = "Directory"},
			{"\\e", desc = "Expand"},
			{"\\f", desc = "File"},
			{"\\fo", desc = "Open"},
			{"\\fp", desc = "Preview"},
			{"\\fop", desc = "Pick window"},
			{"\\fot", desc = "Tab"},
			{"\\g", desc = "Git"},
			{"\\ga", desc = "Add"},
			{"\\gm", desc = "Modified"},
			{"\\h", desc = "Show hidden"},
			{"\\i", desc = "Show details"},
			{"\\o", desc = "Sort by"},
			{"\\p", desc = "Paste"},
			{"\\y", desc = "Copy"},
			{"\\x", desc = "Cut"},
			{"\\q", desc = "Quit"},
			{"\\r", desc = "Refresh"},
		}
	end
}
