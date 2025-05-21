return {
	"nvim-lualine/lualine.nvim",
	enabled = require("plugins.controller").lines.lualine,
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	opts = function()
		local icons = require("lib.icons")
		return {
			options = {
				-- component_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				-- section_separators = { left = "", right = ""},
				always_divide_middle = true,
				always_show_tabline = true,
				globalstatus = true,
				ignore_focus = {},
				refresh = {
					statusline = 10,
				},
			},
			sections = {
				lualine_a = {
					{
						"mode",
						fmt = function(str)
							return " " .. str
						end,
						separator = { right = "", left = "" },
					},
				},
				lualine_b = {
					{
						"branch",
						icon = " ",
					},
					{
						"diff",
						symbols = {
							added = icons.git.added,
							modified = icons.git.modified,
							removed = icons.git.removed,
						},
					},
					{
						"diagnostics",
						symbols = {
							info = icons.diagnostics.info,
							error = icons.diagnostics.error,
							warn = icons.diagnostics.warn,
							hint = icons.diagnostics.hint,
						},
					},
				},
				lualine_c = {
					{
						"filename",
						path = 1,
						symbols = {
							modified = icons.filesystem.modified,
							readonly = " ",
							unnammed = "? ",
							newfile = "󰐕 ",
						},
					},
					-- "searchcount",
				},
				lualine_x = {
					{
						require("lazy.status").updates,
						cond = require("lazy.status").has_updates,
					},
					{
						"lsp_status",
						icon = "",
						symbols = {
							spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
							done = "",
							separator = "󰐕",
						},
						ignore_lsp = {}, -- List of LSP names to ignore (e.g., `null-ls`):
					},
					"encoding",
					"filetype",
					"filesize",
					{
						"fileformat",
						symbols = {
							unix = " ",
							dos = " ",
							mac = " ",
						},
					},
				},
				lualine_y = {
					"progress",
				},
				lualine_z = {
					"location",
				},
			},
		}
	end,
}
