return {
    "nvim-lualine/lualine.nvim",
	event = { "BufReadPre", "BufNewFile" },
    dependencies = {
		"nvim-tree/nvim-web-devicons"
	},
	config = function()
		local lualine = require("lualine")

		local trouble = require("trouble")
		-- local symbols = trouble.statusline({
		-- 	mode = "lsp_document_symbols",
		-- 	groups = {},
		-- 	title = false,
		-- 	filter = { range = true },
		-- 	format = "{kind_icon}{symbol.name:Normal} >",
		-- 	-- hl_group = "lualine_c_normal",
		-- })
		local left_sep1 = ""
		local left_sep2 = ""
		local right_sep2 = "╱"
		local right_sep1 = ""

		lualine.setup({
			options = {
				theme = "gruvbox",
				globalstatus = true,
				component_separators = { left = left_sep2, right = right_sep2 },
				section_separators = { left = left_sep1, right = right_sep1 },
				disabled_filetypes = {
					statusline = {
						"alpha"
					}
				},
				ignore_focus = {
					"neo-tree",
					"TelescopePrompt"
				},
				refresh = {
					statusline = 250
				}
			},
			sections = {
				lualine_c = {
					"filename",
					-- {
					-- 	symbols.get,
					-- 	cond = symbols.has,
					-- }
				},
				lualine_x = {
					{
						require("lazy.status").updates,
						cond = require("lazy.status").has_updates,
						color = { fg = "#ff9e64" },
					},
					"encoding",
					"filetype",
					{
						"fileformat",
						symbols = {
							unix = vim.fn.has("macunix") and " " or " "
						}
					},
				}
			},

			-- table.insert(lualine.sections.lualine_c, )
		})
	end
}
