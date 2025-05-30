return {
	"nvim-telescope/telescope.nvim",
	enabled = require("plugins.controller").finders.telescope,
	branch = "0.1.x",
	tag = "0.1.8",
	cmd = { "Telescope" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- "Snikimonkd/telescope-git-conflicts.nvim",
		-- "nvim-telescope/telescope-media-files.nvim",
		"nvim-telescope/telescope-hop.nvim",
	},
	keys = function()
		local keymap = require("plugins.finders.keymap").telescope_key
		return require("lib.functions").convertKeys(keymap)
	end,
	opts = function()
		local utils = require("lib.utils")
		local actions = require("telescope.actions")
		local telescope = require("telescope")
		local border_chars = utils.ui.border

		return {
			defaults = {
				layout_strategy = utils.telescope.layout_strategy,
				initial_mode = utils.initial_mode,
				sorting_strategy = utils.telescope.sorting_strategy,
				layout_config = {
					horizontal = {
						height = utils.ui.height,
						preview_cutoff = utils.telescope.preview_cutoff,
						preview_width = utils.telescope.preview_width,
						prompt_position = utils.telescope.prompt_position,
						width = utils.ui.width,
					},
					vertical = {
						height = utils.ui.height,
						preview_cutoff = utils.telescope.preview_cutoff,
						preview_width = utils.telescope.preview_width,
						prompt_position = utils.telescope.prompt_position,
						width = utils.ui.width,
					},
				},
				winblend = utils.ui.window_blend,
				prompt_prefix = utils.telescope.prompt_prefix,
				selection_caret = utils.telescope.selection_caret,
				border = utils.telescope.border,
				borderchars = {
					border_chars[2],
					border_chars[4],
					border_chars[6],
					border_chars[8],
					border_chars[1],
					border_chars[3],
					border_chars[5],
					border_chars[7],
				},
				results_title = utils.telescope.results_title,
				prompt_title = utils.telescope.prompt_title,
				mappings = {
					n = {
						["<esc>"] = actions.close,
						["<cr>"] = actions.select_default,
						["<tab>"] = actions.toggle_selection + actions.move_selection_worse,
						["<s-tab>"] = actions.toggle_selection + actions.move_selection_better,

						["<localleader>foh"] = function(prompt_bufnr)
							vim.cmd("set nosplitright")
							actions.select_vertical(prompt_bufnr)
						end,

						["<localleader>foj"] = function(prompt_bufnr)
							vim.cmd("set splitbelow")
							actions.select_horizontal(prompt_bufnr)
						end,

						["<localleader>fok"] = function(prompt_bufnr)
							vim.cmd("set nosplitbelow")
							actions.select_horizontal(prompt_bufnr)
						end,

						["<localleader>fol"] = function(prompt_bufnr)
							vim.cmd("set splitright")
							actions.select_vertical(prompt_bufnr)
						end,

						["<localleader>fot"] = actions.select_tab,

						["<localleader><tab>"] = actions.toggle_selection + actions.move_selection_worse,
						["<localleader><s-tab>"] = actions.toggle_selection + actions.move_selection_better,
						["<localleader>A"] = actions.send_to_qflist + actions.open_qflist,
						["<localleader>a"] = actions.send_selected_to_qflist + actions.open_qflist,
						["si"] = telescope.extensions.hop.hop,

						["j"] = actions.move_selection_next,
						["k"] = actions.move_selection_previous,
						["H"] = actions.move_to_top,
						["M"] = actions.move_to_middle,
						["L"] = actions.move_to_bottom,
						["gg"] = actions.move_to_top,
						["G"] = actions.move_to_bottom,
						["<c-u>"] = actions.preview_scrolling_up,
						["<c-d>"] = actions.preview_scrolling_down,
						["<c-b>"] = actions.preview_scrolling_up,
						["<c-f>"] = actions.preview_scrolling_down,
					},
					i = {
						["<cr>"] = actions.select_default,
						["<c-cr>"] = actions.select_default,
						["<c-j>"] = actions.move_selection_next,
						["<c-k>"] = actions.move_selection_previous,
					},
				},
			},
			pickers = {
				colorscheme = {
					enable_preview = true,
				},
			},
			extensions = {
				media_files = {
					filetypes = { "png", "webp", "jpg", "jpeg", "mp4", "webm", "pdf" },
				},
				hop = {
					keys = {
						"a",
						"s",
						"d",
						"f",
						"g",
						"h",
						"j",
						"k",
						"l",
						"q",
						"w",
						"e",
						"r",
						"t",
						"y",
						"u",
						"i",
						"o",
						"p",
						"z",
						"x",
						"c",
						"v",
						"b",
						"n",
						"m",
						"A",
						"S",
						"D",
						"F",
						"G",
						"H",
						"J",
						"K",
						"L",
						"Q",
						"W",
						"E",
						"R",
						"T",
						"Y",
						"U",
						"I",
						"O",
						"P",
						"Z",
						"X",
						"C",
						"V",
						"B",
						"N",
						"M",
					},
					sign_hl = { "DiagnosticVirtualTextWarn" },
					clear_selection_hl = false,
					trace_entry = true,
					reset_selection = true,
				},
			},
		}
	end,
}
