local M = {}

M.event = {
	"BufReadPre",
	"BufNewFile",
}

M.dependencies = {
	"nvim-tree/nvim-web-devicons",
	-- "folke/noice.nvim", -- for showing pressed keys on lualine
}

M.opts = function()
	local icons = require("lib.icons")
	local utils = require("lib.utils")

	local myFilename = function()
		local fn = vim.fn
		local filepath = fn.expand("%:p") -- Get the full path
		local filename = fn.fnamemodify(filepath, ":t") -- Extract the filename
		local fileext = fn.fnamemodify(filepath, ":e") -- Get the file extension
		local fileicon = require("nvim-web-devicons").get_icon(filename, fileext) or "" -- Use file extension
		local icon = vim.bo.modified and " " .. icons.documents.modified or "  "

		-- Fallback for unnamed buffers
		if filename == "" then
			filename = "[No Name]"
		end

		return " " .. fileicon .. "  " .. filename .. icon
	end

	local get_lsp_clients = function()
		local replacements = {
			{ pattern = "_language_server$", replacement = "" },
			{ pattern = "tsserver$", replacement = "typescript" },
			{ pattern = "-tools$", replacement = "" },
			{ pattern = "_ls$", replacement = "" },
			{ pattern = "ls$", replacement = "" },
			{ pattern = "_+$", replacement = "" },
			{ pattern = "-+$", replacement = "" },
		}

		---@diagnostic disable-next-line: unused-local
		local sign = icons.others.settings .. " LSP"
		local result = ""
		local client_names = {}
		---@diagnostic disable-next-line: deprecated
		local clients = vim.lsp.get_active_clients()
		---@diagnostic disable-next-line: deprecated
		local buffer_filetype = vim.api.nvim_buf_get_option(0, "filetype")

		if next(clients) == nil then
			return result
		end

		for _, client in ipairs(clients) do
			---@diagnostic disable-next-line: undefined-field
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buffer_filetype) ~= -1 then
				local name = client.name
				for _, entry in ipairs(replacements) do
					name = name:gsub(entry.pattern, entry.replacement)
				end

				-- Exclude "null" and "null_ls"
				if name ~= "null" and name ~= "null_ls" then
					-- Capitalize the first letter of the client name
					name = name:gsub("^%l", string.upper)
					table.insert(client_names, name)
				end
			end
		end

		if #client_names > 0 then
			table.sort(client_names, function(a, b)
				return #a < #b
			end)
			result = icons.others.flash .. " " .. table.concat(client_names, " | ")
		end

		return result
	end

	-- shows current filesize in kb
	local filesize = function()
		local filepath = vim.fn.expand("%")
		local sizeInBytes = vim.fn.getfsize(filepath)
		if sizeInBytes <= 0 then
			return ""
		end
		local sizeInKb = sizeInBytes / 1024
		return string.format("%.2f", sizeInKb) .. " KB"
	end

	-- localtion with scrollbar
	local SCROLL_BAR = { "█", "▇", "▆", "▅", "▄", "▃", "▂", "▁", " " }
	local scrollbar = function()
		local curr_line = vim.api.nvim_win_get_cursor(0)[1]
		local lines = vim.api.nvim_buf_line_count(0)
		---@diagnostic disable-next-line: unused-local
		local i = math.floor((curr_line - 1) / lines * #SCROLL_BAR) + 1

		-- Calculate the highest column and line lengths
		local highest_col = 0
		for _, line in ipairs(vim.api.nvim_buf_get_lines(0, 0, -1, false)) do
			highest_col = math.max(highest_col, #line)
		end

		local highest_col_length = #tostring(highest_col)
		local highest_line_length = #tostring(lines)

		-- Helper function to pad numbers with spaces
		local function pad_num(num, max_length)
			local num_length = #tostring(num)
			return string.rep(" ", max_length - num_length) .. num
		end

		local current_col = vim.fn.col(".")
		local total_col = vim.fn.col("$")
		local current_line = vim.fn.line(".")
		local total_line = vim.fn.line("$")

		return " "
			.. pad_num(current_col, highest_col_length)
			.. ":"
			.. pad_num(total_col, highest_col_length)
			.. "|"
			.. pad_num(current_line, highest_line_length)
			.. ":"
			.. pad_num(total_line, highest_line_length)
			.. " "
		-- .. icons.separators.right_3
		-- .. SCROLL_BAR[i]
		-- .. icons.separators.left_3
	end

	return {
		options = {
			-- theme = utils.colorscheme,
			always_show_tabline = false,
			globalstatus = true,
			section_separators = {
				left = icons.separators.left.default,
				right = icons.separators.right.default,
			},
			component_separators = { left = icons.separators.left.secondary, right = icons.separators.right.secondary },
			disabled_filetypes = {
				statusline = {
					-- "alpha",
					-- "snacks_dashboard",
					-- "neo-tree",
				},
				winbar = {},
			},
			ignore_focus = {
				"neo-tree",
				-- "TelescopePrompt",
				-- "fzf",
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
					fmt = function(str)
						return icons.others.editor.vim .. " " .. str
					end,
					-- separator = { right = icons.separators.left_1 .. "🙼", left = "" },
				},
				{
					function()
						local reg = vim.fn.reg_recording()
						if reg == "" then
							return ""
						end -- not recording
						return icons.others.record .. "REC [ " .. reg .. " ]"
					end,
				},
			},
			lualine_b = {
				{
					"branch",
					icon = icons.git.logo .. " ",
					padding = { left = 2, right = 1 },
				},
				{
					myFilename,
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
					get_lsp_clients,
				},
				{
					require("lazy.status").updates,
					cond = require("lazy.status").has_updates,
				},
				{
					"encoding",
				},
				{
					filesize,
				},
				{
					"filetype",
					colored = true,
					icon = {
						align = "left",
					},
				},
				{
					"fileformat",
				},
			},
			lualine_y = {
				{
					"diff",
					colored = true,
					symbols = {
						added = icons.git.added .. " ",
						modified = icons.git.modified .. " ",
						removed = icons.git.removed .. " ",
					},
				},
				{
					"diagnostics",
					colored = true,
					sources = { "nvim_lsp", "nvim_diagnostic" },
					sections = { "error", "warn", "info", "hint" },
					symbols = {
						error = icons.diagnostics.error .. " ",
						warn = icons.diagnostics.warn .. " ",
						info = icons.diagnostics.info .. " ",
						hint = icons.diagnostics.hint .. " ",
					},
				},
			},
			lualine_z = {
				-- {
				-- 	require("noice").api.status.command.get,
				-- 	cond = require("noice").api.status.command.has,
				-- },
				{
					scrollbar,
					padding = { left = 0, right = 0 },
				},
				{
					"progress",
				},
			},
		},
		inactive_sections = {
			lualine_c = {},
			lualine_x = {},
		},
	}
end

return M
