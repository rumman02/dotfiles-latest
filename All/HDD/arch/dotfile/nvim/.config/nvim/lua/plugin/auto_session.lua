-- https://github.com/rmagatti/auto-session
return {
  "rmagatti/auto-session",
	event = { "VimLeavePre" },
	cmd = { "SessionRestore", "SessionSave" },
  opts = {
		enabled = true,
		auto_save = true,
		auto_restore = false,
    suppressed_dirs = {},
		lazy_support = true,
		close_unsupported_windows = true,
		continue_restore_on_error =  true,
		session_lens = {
			load_on_setup = true,
			previewer = true,
			theme_conf = {
				layout_strategy = "flex",
				sorting_strategy = TELESCOPE_SORTING_STRATEGY,
				layout_config = {
					horizontal = {
						height = 0.95,
						preview_cutoff = 50,
						preview_width = 0.60,
						prompt_position = "bottom",
						width = 0.95
					},
					vertical = {
						height = 0.95,
						preview_cutoff = 40,
						prompt_position = "bottom",
						width = 0.95
					}
				},
				winblend = 5,
				prompt_prefix = "",
				selection_caret = " ",
				border = true,
				borderchars =  { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				results_title = "",
				prompt_title = "",
			},
			mappings = {
				delete_session = { "n", "d" },
				alternate_session = { "n", "s" },
				copy_session = { "n", "y" },
			},
		}
  }
}
