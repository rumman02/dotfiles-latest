local auto_session = require("auto-session")
local icons = require("rumman.lib.icons")
local utils = require("rumman.lib.utils")

auto_session.setup({
	enabled = true,
	auto_save = true,
	auto_restore = false,
	suppressed_dirs = {},
	lazy_support = true,
	use_git_branch = true,
	close_unsupported_windows = true,
	continue_restore_on_error = true,
	show_auto_restore_notif = false,
	session_lens = {
		load_on_setup = true,
		previewer = true,
		theme_conf = {
			layout_strategy = utils.telescope.layout_strategy,
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
			border = true,
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
			prompt_title = utils.telescope.prompt_prefix,
		},
		mappings = {
			delete_session = { "n", "d" },
			alternate_session = { "n", "s" },
			copy_session = { "n", "y" },
		},
	},
	pre_save_cmds = {
		"ScopeSaveState",
	},
	post_restore_cmds = {
		"ScopeLoadState",
	},
})

