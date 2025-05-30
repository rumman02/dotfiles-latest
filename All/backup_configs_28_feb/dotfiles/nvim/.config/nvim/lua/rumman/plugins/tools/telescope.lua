local telescope = require("telescope")
local actions = require("telescope.actions")

local icons = require("rumman.lib.icons")
local utils = require("rumman.lib.utils")
local telescope_local_leader = require("rumman.lib.keys").telescope.leaders.locals

telescope.setup({
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
			icons.ui.BorderTop,
			icons.ui.BorderRight,
			icons.ui.BorderBottom,
			icons.ui.BorderLeft,
			icons.ui.BorderTopLeft,
			icons.ui.BorderTopRight,
			icons.ui.BorderBottomRight,
			icons.ui.BorderBottomLeft,
		},
		results_title = utils.telescope.results_title,
		prompt_title = utils.telescope.prompt_title,
		mappings = {
			n = {
				["<esc>"] = actions.close,
				["<cr>"] = actions.select_default,
				["<tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<s-tab>"] = actions.toggle_selection + actions.move_selection_better,

				[telescope_local_leader .. "foh"] = function(prompt_bufnr)
					vim.cmd("set nosplitright")
					actions.select_vertical(prompt_bufnr)
				end,

				[telescope_local_leader .. "foj"] = function(prompt_bufnr)
					vim.cmd("set splitbelow")
					actions.select_horizontal(prompt_bufnr)
				end,

				[telescope_local_leader .. "fok"] = function(prompt_bufnr)
					vim.cmd("set nosplitbelow")
					actions.select_horizontal(prompt_bufnr)
				end,

				[telescope_local_leader .. "fol"] = function(prompt_bufnr)
					vim.cmd("set splitright")
					actions.select_vertical(prompt_bufnr)
				end,

				[telescope_local_leader .. "fot"] = actions.select_tab,

				[telescope_local_leader .. "<tab>"] = actions.toggle_selection + actions.move_selection_worse,
				[telescope_local_leader .. "<s-tab>"] = actions.toggle_selection + actions.move_selection_better,
				[telescope_local_leader .. "A"] = actions.send_to_qflist + actions.open_qflist,
				[telescope_local_leader .. "a"] = actions.send_selected_to_qflist + actions.open_qflist,
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
	pickers ={
		colorscheme = {
			enable_preview = true,
		},
	},
	extensions = {
		media_files = {
      filetypes = {"png", "webp", "jpg", "jpeg", "mp4", "webm", "pdf"},
    },
		hop = {
			keys = {"a", "s", "d", "f", "g", "h", "j", "k", "l", "q", "w", "e", "r",
			"t", "y", "u", "i", "o", "p", "z", "x", "c", "v", "b", "n", "m", "A", "S",
			"D", "F", "G", "H", "J", "K", "L", "Q", "W", "E", "R", "T", "Y", "U", "I",
			"O", "P", "Z", "X", "C", "V", "B", "N", "M" },
			sign_hl = { "DiagnosticVirtualTextWarn" },
			clear_selection_hl = false,
			trace_entry = true,
			reset_selection = true,
		},
	},
})

telescope.load_extension("conflicts")
telescope.load_extension("media_files")
telescope.load_extension("hop")

