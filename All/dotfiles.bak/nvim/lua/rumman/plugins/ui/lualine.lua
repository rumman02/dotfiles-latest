local lualine = require("lualine")
local icons = require("rumman.lib.icons")
local utils = require("rumman.lib.utils")
local func = require("rumman.lib.func")
local colors = {
  yellow = '#ECBE7B',
  cyan = '#008080',
  darkblue = '#081633',
  green = '#98be65',
  orange = '#FF8800',
  violet = '#a9a1e1',
  magenta = '#c678dd',
  blue = '#51afef',
  red = '#ec5f67'
}

lualine.setup({
	options = {
		theme = utils.colorscheme,
		always_show_tabline = false,
		globalstatus = true,
		section_separators = {
			left = utils.ui.spearator.left,
			right = utils.ui.spearator.right,
		},
		component_separators = { left = icons.ui.PowerlineRightSlash, right = icons.ui.PowerlineLeftSlash },
		disabled_filetypes = {
			statusline = {
				"alpha",
				"snacks_dashboard",
				"neo-tree",
			},
			winbar = {},
		},
		ignore_focus = {
				"neo-tree",
				"TelescopePrompt",
				"fzf",
		},
		refresh = {
			tabline = 5,
			statusline = 5,
			winbar = 5,
		},
		always_divide_middle = true,
	},
	sections = {
		lualine_a = {
			{
				"mode",
				fmt = function(str) return icons.ui.Vim .. str end,
				-- separator = { right = icons.ui.PowerlineLeftSlantedReversed .. "🙼", left = "" },
			},
			{
				function()
					local reg = vim.fn.reg_recording()
					if reg == "" then return "" end -- not recording
					return icons.ui.CircleSmall .. "REC [ " .. reg .. " ]"
				end,
			},
		},
		lualine_b = {
			{
				"branch",
				icon = icons.ui.GitHub,
				padding = { left = 2, right = 1 }
			},
			{
				func.myFilename,
			},
		},
		lualine_c = {
			{
				"filename",
				path = 3,
				icons_enabled = false,
				colored = false,
				symbols = {
					modified = "",
					readonly = "",
					unnamed = "",
				},
			},
		},
		lualine_x = {
			{
				"lsp_progress",
				separators = {
					component = " ",
					progress = " | ",
					percentage = { pre = "", post = "%% " },
					title = { pre = "", post = ": " },
					lsp_client_name = { pre = "[", post = "]" },
					spinner = { pre = "", post = '' },
					message = { pre = "(", post = ")", commenced = "In Progress", completed = "Completed" },
				},
				colors = {
					percentage  = colors.cyan,
					title  = colors.cyan,
					message  = colors.cyan,
					spinner = colors.cyan,
					lsp_client_name = colors.magenta,
					use = true,
				},
				display_components = { "lsp_client_name", "spinner", { "title", "percentage", "message" } },
				timer = { progress_enddelay = 500, spinner = 1000, lsp_client_name_enddelay = 1000 },
				spinner_symbols = { "🌑 ", "🌒 ", "🌓 ", "🌔 ", "🌕 ", "🌖 ", "🌗 ", "🌘 " },
			},
			{
				 func.get_lsp_clients,
			},
			{
				require("lazy.status").updates,
				cond = require("lazy.status").has_updates,
			},
			{
				"encoding",
			},
			{
				func.filesize,
			},
			{
				"filetype",
			},
			"fileformat",
		},
		lualine_y = {
			{
				"diff",
				colored = true,
				symbols = {
					added = icons.git.Add,
					modified = icons.git.Mod,
					removed = icons.git.Remove,
				},
			},
			{
				"diagnostics",
				colored = true,
				sources = { "nvim_lsp", "nvim_diagnostic" },
				sections = { "error", "warn", "info", "hint" },
				symbols = {
					error = icons.diagnostics.Error,
					warn = icons.diagnostics.Warning,
					info = icons.diagnostics.Information,
					hint = icons.diagnostics.Hint
				},
			},
		},
		lualine_z = {
      {
        require("noice").api.status.command.get,
        cond = require("noice").api.status.command.has,
      },
			{
				func.scrollbar,
				padding = { left = 0, right = 0 },
			},
		},
	},
})

