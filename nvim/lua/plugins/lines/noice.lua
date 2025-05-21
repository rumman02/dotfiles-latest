return {
	"folke/noice.nvim",
	enabled = require("plugins.controller").lines.noice,
	event = {
		"VeryLazy",
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	opts = function()
		local icons = require("lib.icons")
		return {
			lsp = {
				progress = {
					enabled = false,
				},
			},
			messages = {
				-- NOTE: If you enable messages, then the cmdline is enabled automatically.
				-- This is a current Neovim limitation.
				enabled = false, -- enables the Noice messages UI
				view = "notify", -- default view for messages
				view_error = "notify", -- view for errors
				view_warn = "notify", -- view for warnings
				view_history = "messages", -- view for :messages
				view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
			},
			popupmenu = {
				enabled = true, -- enables the Noice popupmenu UI
				---@type 'nui'|'cmp'
				backend = "nui", -- backend to use to show regular cmdline completions
				---@type NoicePopupmenuItemKind|false
				-- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
				kind_icons = icons.kind, -- set to `false` to disable icons
			},
			redirect = {
				view = "popup",
				filter = { event = "msg_show" },
			},
			cmdline = {
				enabled = true, -- enables the Noice cmdline UI
				view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
				opts = {}, -- global options for the cmdline. See section on views
				format = {
					cmdline = { pattern = "^:", icon = " ", lang = "vim" },
					search_down = { kind = "search", pattern = "^/", icon = "  ", lang = "regex" },
					search_up = { kind = "search", pattern = "^%?", icon = "  ", lang = "regex" },
					filter = { pattern = "^:%s*!", icon = " ", lang = "bash" },
					lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = " ", lang = "lua" },
					help = { pattern = "^:%s*he?l?p?%s+", icon = " " },
					input = { view = "cmdline_input", icon = "󰲶 " },
				},
			},
		}
	end,
}
