local M = {}

M.opts = function()
	-- local icons = require("lib.icons")
	local utils = require("lib.utils")
	return {
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
				-- layout_strategy = utils.telescope.layout_strategy,
				-- sorting_strategy = utils.telescope.sorting_strategy,
				layout_config = {
					horizontal = {
						height = utils.ui.height,
						-- preview_cutoff = utils.telescope.preview_cutoff,
						-- preview_width = utils.telescope.preview_width,
						-- prompt_position = utils.telescope.prompt_position,
						width = utils.ui.width,
					},
					vertical = {
						height = utils.ui.height,
						-- preview_cutoff = utils.telescope.preview_cutoff,
						-- preview_width = utils.telescope.preview_width,
						-- prompt_position = utils.telescope.prompt_position,
						width = utils.ui.width,
					},
				},
				winblend = utils.ui.window_blend,
				-- prompt_prefix = utils.telescope.prompt_prefix,
				-- selection_caret = utils.telescope.selection_caret,
				border = true,
        borderchars = {
          icons.ui.border.top.left,
	        icons.ui.border.horizontal,
	        icons.ui.border.top.right,
	        icons.ui.border.vertical,
	        icons.ui.border.bottom.right,
	        icons.ui.border.horizontal,
	        icons.ui.border.bottom.left,
	        icons.ui.border.vertical,
        },
				-- results_title = utils.telescope.results_title,
				-- prompt_title = utils.telescope.prompt_prefix,
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
	}
end

M.keys = function()
	local func = require("lib.func")
	local map = func.map
	local session_leader = require("lib.keys").leader.session

	return {
		map(1, { "n" }, session_leader, "", { desc = "Session" }),
		map(1, { "n" }, session_leader .. "s", "<cmd>SessionSave<cr>", { desc = "Save" }),
		map(1, { "n" }, session_leader .. "r", "<cmd>SessionRestorecr>", { desc = "Restore" }),
		map(1, { "n" }, session_leader .. "S", "<cmd>SessionSearch<cr>", { desc = "Search" }),
		map(1, { "n" }, session_leader .. "d", "<cmd>SessionDelete<cr>", { desc = "Delete" }),
		map(1, { "n" }, session_leader .. "t", "<cmd>SessionToggleAutoSave<cr>", { desc = "Toggle(autosave)" }),
		map(1, { "n" }, session_leader .. "d", "<cmd>SessionDisableAutoSave<cr>", { desc = "Disable(autosave)" }),
	}
end

return M
