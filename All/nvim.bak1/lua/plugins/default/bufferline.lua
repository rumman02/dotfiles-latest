local M = {};

M.opts = function ()
  local requires = require("lib.functions").requires;
	local icons = requires("lib.icons");
	local utils = requires("lib.utils");
	local bufferline = requires("bufferline");

	return {
		options = {
			mode = "buffers",
			style_preset = {
				bufferline.style_preset.default,
				bufferline.style_preset.no_italic,
				bufferline.style_preset.no_bold,
			},
			themable = true,
			indicator = {
				style = "none",
			},
			buffer_close_icon = " " .. icons.ui.close .. " ",
			modified_icon = " " .. icons.extras.modified .. " ",
			close_icon = icons.ui.close,
			left_trunc_marker = icons.ui.arrow.left,
			right_trunc_marker = icons.ui.arrow.right,
			diagnostics = "nvim_lsp",
			---@diagnostic disable-next-line: unused-local
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				local s = ""
				for e, n in pairs(diagnostics_dict) do
					local sym = e == "error" and  " " .. icons.diagnostics.error .. " "
					or (
					e == "warning" and " " .. icons.diagnostics.warn .. " "
					or " " .. icons.diagnostics.hint .. " "
					)
					s = s .. n .. sym
				end
				return s
			end,
			truncate_names = false, -- whether or not tab names should be truncated
			-- tab_size = 20,
			offsets = {
				{
					filetype = "neo-tree",
					text = "Explorer",
					text_align = utils.ui.title_position,
					separator = false,
					highlight = "Directory",
				},
			},
			color_icons = true,
			show_buffer_icons = true,
			show_buffer_close_icons = true,
			show_close_icon = false,
			show_tab_indicators = true,
			show_duplicate_prefix = true,
			persist_buffer_sort = true,
			move_wraps_at_ends = true,
			separator_style = "slope",
			enforce_regular_tabs = true,
			always_show_bufferline = true,
			auto_toggle_bufferline = true,
			close_command = function(n)
				Snacks.bufdelete(n)
			end,
			left_mouse_command = function(n)
				Snacks.bufdelete(n)
			end,
			right_mouse_command = nil,
			middle_mouse_command = nil,
			pick = {
				alphabet = "abdefghijklmpqrstuvwxyz",
			},
		},
	}
end

M.config = function() end

M.keys = function()
	local func = require("lib.functions")
  local requires = func.requires;
	local map = func.map;
	local leader = requires("lib.keys").bufferline.globals
	local tab_leader = requires("lib.keys").tab_leader
	local window_leader = requires("lib.keys").window_leader

	return {
		-- map(1, { "n" }, tab_leader .. "r", function() local char = vim.fn.input("Name: ") if char ~= "" then vim.cmd("BufferLineTabRename " .. char) else vim.notify("No name inserted") end end, { desc = "Rename" }),
		-- map(1, { "n" }, tab_leader .. "n", function() local char = vim.fn.input("Name: ") if char ~= "" then vim.cmd("tabnew") vim.cmd("BufferLineTabRename " .. char) else vim.notify("No name inserted") end end, { desc = "Open named" }),
		map(1, { "n" }, leader, "", { desc = "Bufferline" }),
		map(1, { "n" }, leader .. "x", "", { desc = "Close" }),
		map(1, { "n" }, leader .. "g", "", { desc = "Group" }),
		map(1, { "n" }, leader .. "S", "", { desc = "Sort" }),
		map(1, { "n" }, leader .. "p", "", { desc = "Pick" }),
		map(1, { "n" }, leader .. "s", "", { desc = "Swap" }),
		map(1, { "n" }, leader .. "o", "", { desc = "Open" }),

		map(1, { "n" }, "<c-1>", "<cmd>BufferLineGoToBuffer 1<cr>", { desc = "Buffer 1" }),
		map(1, { "n" }, "<c-2>", "<cmd>BufferLineGoToBuffer 2<cr>", { desc = "Buffer 2" }),
		map(1, { "n" }, "<c-3>", "<cmd>BufferLineGoToBuffer 3<cr>", { desc = "Buffer 3" }),
		map(1, { "n" }, "<c-4>", "<cmd>BufferLineGoToBuffer 4<cr>", { desc = "Buffer 4" }),
		map(1, { "n" }, "<c-5>", "<cmd>BufferLineGoToBuffer 5<cr>", { desc = "Buffer 5" }),
		map(1, { "n" }, "<c-6>", "<cmd>BufferLineGoToBuffer 6<cr>", { desc = "Buffer 6" }),
		map(1, { "n" }, "<c-7>", "<cmd>BufferLineGoToBuffer 7<cr>", { desc = "Buffer 7" }),
		map(1, { "n" }, "<c-8>", "<cmd>BufferLineGoToBuffer 8<cr>", { desc = "Buffer 8" }),
		map(1, { "n" }, "<c-9>", "<cmd>BufferLineGoToBuffer 9<cr>", { desc = "Buffer 9" }),
		map(1, { "n" }, "<c-0>", "<cmd>BufferLineGoToBuffer 10<cr>", { desc = "Buffer 10" }),

		map(1, { "n" }, leader .. "ol", "<cmd>enew<cr>", { desc = "Right" }),
		map(1, { "n" }, leader .. "oh", "<cmd>enew<cr><cmd>BufferLineMovePrev<cr>", { desc = "Left" }),

		map(1, { "n" }, leader .. "<c-s-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Go previous" }),
		map(1, { "n" }, leader .. "<c-s-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Go next" }),
		map(1, { "n" }, leader .. "1", "<cmd>BufferLineGoToBuffer 1<cr>", { desc = "Buffer 1" }),
		map(1, { "n" }, leader .. "2", "<cmd>BufferLineGoToBuffer 2<cr>", { desc = "Buffer 2" }),
		map(1, { "n" }, leader .. "3", "<cmd>BufferLineGoToBuffer 3<cr>", { desc = "Buffer 3" }),
		map(1, { "n" }, leader .. "4", "<cmd>BufferLineGoToBuffer 4<cr>", { desc = "Buffer 4" }),
		map(1, { "n" }, leader .. "5", "<cmd>BufferLineGoToBuffer 5<cr>", { desc = "Buffer 5" }),
		map(1, { "n" }, leader .. "6", "<cmd>BufferLineGoToBuffer 6<cr>", { desc = "Buffer 6" }),
		map(1, { "n" }, leader .. "7", "<cmd>BufferLineGoToBuffer 7<cr>", { desc = "Buffer 7" }),
		map(1, { "n" }, leader .. "8", "<cmd>BufferLineGoToBuffer 8<cr>", { desc = "Buffer 8" }),
		map(1, { "n" }, leader .. "9", "<cmd>BufferLineGoToBuffer 9<cr>", { desc = "Buffer 9" }),
		map(1, { "n" }, leader .. "P", "<cmd>BufferLineTogglePin<cr>", { desc = "Toggle pin" }),
		map(1, { "n" }, leader .. "t", "<cmd>ScopeMoveBuf<cr>", { desc = "To tab" }),

		map(1, { "n" }, leader .. "s<c-s-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Go previous" }),
		map(1, { "n" }, leader .. "s<c-s-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Go next" }),
		map(1, { "n" }, leader .. "sh", "<cmd>BufferLineMovePrev<cr>", { desc = "Previous" }),
		map(1, { "n" }, leader .. "sl", "<cmd>BufferLineMoveNext<cr>", { desc = "Next" }),
		map(1, { "n" }, leader .. "po", function() vim.cmd("BufferLinePick") end, { desc = "Open" }),
		map(1, { "n" }, leader .. "px", function() vim.cmd("BufferLinePickClose") end, { desc = "Close" }),

		map(1, { "n" }, leader .. "St", "<cmd>BufferLineSortByTabs<cr>", { desc = "By tab" }),
		map(1, { "n" }, leader .. "Sd", "<cmd>BufferLineSortByDirectory<cr>", { desc = "By directory" }),
		map(1, { "n" }, leader .. "Se", "<cmd>BufferLineSortByExtension<cr>", { desc = "By extension" }),
		map(1, { "n" }, leader .. "Sr", "<cmd>BufferLineSortByRelativeDirectory<cr>", { desc = "By relative directory" }),

		map(1, { "n" }, leader .. "gt", "<cmd>BufferLineGroupToggle<cr>", { desc = "Toggle" }),
		map(1, { "n" }, leader .. "gd", "<cmd>BufferLineGroupClose<cr>", { desc = "Close" }),

		map(1, { "n" }, leader .. "x<c-s-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Go previous" }),
		map(1, { "n" }, leader .. "x<c-s-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Go next" }),
		map(1, { "n" }, leader .. "xH", "<cmd>BufferLineCloseLeft<cr>", { desc = "All left" }),
		map(1, { "n" }, leader .. "xL", "<cmd>BufferLineCloseRight<cr>", { desc = "All right" }),
		map(1, { "n" }, leader .. "xo", "<cmd>BufferLineCloseOthers<cr>", { desc = "Others" }),
		-- map(1, { "n" }, window_leader .. "xO", "<cmd>BufferLineCloseOthers<cr>", { desc = "Others (With buffer)" }),
		map(1, { "n" }, leader .. "xa", "<cmd>BufferLineCloseOthers<cr><cmd>bdelete<cr>", { desc = "All" }),
	}
end

return M;
