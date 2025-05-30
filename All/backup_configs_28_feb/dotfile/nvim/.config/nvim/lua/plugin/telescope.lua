-- https://github.com/nvim-telescope/telescope.nvim
return {
	"nvim-telescope/telescope.nvim",
	cmd =  { "Telescope" },
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
    "debugloop/telescope-undo.nvim",
	},
	opts = function ()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.load_extension("undo")
		telescope.load_extension("noice")

	return {
		defaults = {
			layout_strategy = "flex",
			initial_mode = "normal",
			sorting_strategy = "ascending",
			layout_config = {
				horizontal = {
					height = TELESCOPE_HORIZONTAL_HEIGHT,
					preview_cutoff = TELESCOPE_HORIZONTAL_PREVIEW_CUTOFF,
					preview_width = TELESCOPE_HORIZONTAL_PREVIEW_WIDTH,
					prompt_position = TELESCOPE_HORIZONTAL_PROMPT_POSITION,
					width = TELESCOPE_HORIZONTAL_WIDTH
				},
				vertical = {
					height = TELESCOPE_VERTICAL_HEIGHT,
					preview_cutoff = TELESCOPE_VERTICAL_PREVIEW_CUTOFF,
					preview_width = TELESCOPE_VERTICAL_PREVIEW_WIDTH,
					prompt_position = TELESCOPE_VERTICAL_PROMPT_POSITION,
					width = TELESCOPE_VERTICAL_WIDTH
				}
			},
			winblend = 5,
			prompt_prefix = "",
			selection_caret = " ",
			border = true,
			borderchars = BORDERCHARS,
			-- path_display = { "smart" },
			results_title = "",
			prompt_title = "",
			file_ignore_patterns = {
				"%-lock"
			},
			default_mappings = {},
			mappings = {
				n = {
					["<esc>"] = actions.close,
					["<cr>"] = actions.select_default,
					["<tab>"] = actions.toggle_selection + actions.move_selection_worse,
					["<s-tab>"] = actions.toggle_selection + actions.move_selection_better,

					[BUFLEADER .. "foh"] = function(prompt_bufnr) vim.cmd("set nosplitright") actions.select_vertical(prompt_bufnr) end,
					[BUFLEADER .. "foj"] = function(prompt_bufnr) vim.cmd("set splitbelow") actions.select_horizontal(prompt_bufnr) end,
					[BUFLEADER .. "fok"] = function(prompt_bufnr) vim.cmd("set nosplitbelow") actions.select_horizontal(prompt_bufnr) end,
					[BUFLEADER .. "fol"] = function(prompt_bufnr) vim.cmd("set splitright") actions.select_vertical(prompt_bufnr) end,
					[BUFLEADER .. "fot"] = actions.select_tab,

					[BUFLEADER .."<tab>"] = actions.toggle_selection + actions.move_selection_worse,
					[BUFLEADER .."<s-tab>"] = actions.toggle_selection + actions.move_selection_better,
					[BUFLEADER ..	"aa"] = actions.send_to_qflist + actions.open_qflist,
					[BUFLEADER ..	"as"] = actions.send_selected_to_qflist + actions.open_qflist,

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
					["<c-j>"] = actions.move_selection_next,
					["<c-k>"] = actions.move_selection_previous,
				}
			}
		}
	}
	end
}
