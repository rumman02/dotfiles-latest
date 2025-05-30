local M = {}

M.event = {
  "VeryLazy",
}

M.dependencies = {
  "MunifTanjim/nui.nvim",
  "rcarriga/nvim-notify",
}

M.opts = function()
	local icons = require("lib.icons")
	return {
		cmdline = {
			enabled = true,
			view = "cmdline_popup",
			format = {
				-- cmdline = { icon = icons.ui.ArrowLongRight },
				-- search_down = { icon = icons.ui.Search .. icons.ui.ArrowDownRigth },
				-- search_up = {  icon = icons.ui.Search .. icons.ui.ArrowUpRigth },
				-- filter = { icon = icons.ui.Filter },
				-- lua = { icon = icons.lang.Lua },
				-- help = {  icon = icons.diagnostics.Help },
				-- input = {  icon = icons.ui.Keyboard },
			},
		},
		messages = {
			enabled = true,
			view_search = false,
		},
		lsp = {
			progress = {
				enabled = false,
				format = "lsp_progress",
				format_done = "lsp_progress_done",
				view = "mini",
			},
		},
		format = {
			level = {
				icons = {
					error = icons.diagnostics.error,
					warn = icons.diagnostics.warn,
					info = icons.diagnostics.info,
					hint = icons.diagnostics.hint,
				},
			},
		},
		notify = {
			enabled = false,
		},
	}
end

-- M.config = function(_, opts)
-- 	require("noice").setup(opts)
--
-- 	-- local func = require("lib.func")
-- 	-- local map = func.map
-- 	-- map(0, { "n" }, "<esc>", "<esc><cmd>NoiceDismiss<cr>", { desc = "Noice dismiss" })
-- end

return M

