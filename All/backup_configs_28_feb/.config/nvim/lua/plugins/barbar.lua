local M = {}

M.inti = function()
	vim.g.barbar_auto_setup = false
end

M.opts = function ()
	local icons = require("lib.icons")
	return {
		animation = true,
		sidebar_filetypes = {
			["neo-tree"] = { event = "BufWipeout", text = "Explorer", align = "center" },
		},
		icons = {
			diagnostics = {
				[vim.diagnostic.severity.ERROR] ={ enabled = true, icon = " " .. icons.md_icons.diagnostics.error },
				[vim.diagnostic.severity.WARN] = { enabled = true, icon = " " .. icons.md_icons.diagnostics.warn },
				[vim.diagnostic.severity.INFO] = { enabled = true, icon = " " .. icons.md_icons.diagnostics.info },
				[vim.diagnostic.severity.HINT] = { enabled = true, icon = " " .. icons.md_icons.diagnostics.hint },
			}
		}
	}
end

-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
-- animation = true,
-- insert_at_start = true,
-- …etc.

M.keys = function ()
	local func = require("lib.func")
	local map = func.map
	local bufferline_leader = require("lib.keys").bufferline_leader
	return {
		map(1, { "n" }, bufferline_leader, "", { desc = "Bufferline" }),
		map(1, { "n" }, bufferline_leader .. "x", "", { desc = "Close" }),
		map(1, { "n" }, bufferline_leader .. "g", "", { desc = "Group" }),
		map(1, { "n" }, bufferline_leader .. "S", "", { desc = "Sort" }),
		map(1, { "n" }, bufferline_leader .. "p", "", { desc = "Pick" }),
		map(1, { "n" }, bufferline_leader .. "s", "", { desc = "Swap" }),
		map(1, { "n" }, bufferline_leader .. "o", "", { desc = "Open" }),

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

		map(1, { "n" }, bufferline_leader .. "ol", "<cmd>enew<cr>", { desc = "Right" }),
		map(1, { "n" }, bufferline_leader .. "oh", "<cmd>enew<cr><cmd>BufferLineMovePrev<cr>", { desc = "Left" }),

		map(1, { "n" }, bufferline_leader .. "<c-s-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Go previous" }),
		map(1, { "n" }, bufferline_leader .. "<c-s-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Go next" }),
		map(1, { "n" }, bufferline_leader .. "1", "<cmd>BufferLineGoToBuffer 1<cr>", { desc = "Buffer 1" }),
		map(1, { "n" }, bufferline_leader .. "2", "<cmd>BufferLineGoToBuffer 2<cr>", { desc = "Buffer 2" }),
		map(1, { "n" }, bufferline_leader .. "3", "<cmd>BufferLineGoToBuffer 3<cr>", { desc = "Buffer 3" }),
		map(1, { "n" }, bufferline_leader .. "4", "<cmd>BufferLineGoToBuffer 4<cr>", { desc = "Buffer 4" }),
		map(1, { "n" }, bufferline_leader .. "5", "<cmd>BufferLineGoToBuffer 5<cr>", { desc = "Buffer 5" }),
		map(1, { "n" }, bufferline_leader .. "6", "<cmd>BufferLineGoToBuffer 6<cr>", { desc = "Buffer 6" }),
		map(1, { "n" }, bufferline_leader .. "7", "<cmd>BufferLineGoToBuffer 7<cr>", { desc = "Buffer 7" }),
		map(1, { "n" }, bufferline_leader .. "8", "<cmd>BufferLineGoToBuffer 8<cr>", { desc = "Buffer 8" }),
		map(1, { "n" }, bufferline_leader .. "9", "<cmd>BufferLineGoToBuffer 9<cr>", { desc = "Buffer 9" }),
		map(1, { "n" }, bufferline_leader .. "P", "<cmd>BufferLineTogglePin<cr>", { desc = "Toggle pin" }),
		map(1, { "n" }, bufferline_leader .. "t", "<cmd>ScopeMoveBuf<cr>", { desc = "To tab" }),

		map(1, { "n" }, bufferline_leader .. "s<c-s-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Go previous" }),
		map(1, { "n" }, bufferline_leader .. "s<c-s-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Go next" }),
		map(1, { "n" }, bufferline_leader .. "sh", "<cmd>BufferLineMovePrev<cr>", { desc = "Previous" }),
		map(1, { "n" }, bufferline_leader .. "sl", "<cmd>BufferLineMoveNext<cr>", { desc = "Next" }),
		map(1, { "n" }, bufferline_leader .. "po", function() vim.cmd("BufferLinePick") end, { desc = "Open" }),
		map(1, { "n" }, bufferline_leader .. "px", function() vim.cmd("BufferLinePickClose") end, { desc = "Close" }),

		map(1, { "n" }, bufferline_leader .. "St", "<cmd>BufferLineSortByTabs<cr>", { desc = "By tab" }),
		map(1, { "n" }, bufferline_leader .. "Sd", "<cmd>BufferLineSortByDirectory<cr>", { desc = "By directory" }),
		map(1, { "n" }, bufferline_leader .. "Se", "<cmd>BufferLineSortByExtension<cr>", { desc = "By extension" }),
		map( 1, { "n" }, bufferline_leader .. "Sr", "<cmd>BufferLineSortByRelativeDirectory<cr>", { desc = "By relative directory" }),

		map(1, { "n" }, bufferline_leader .. "gt", "<cmd>BufferLineGroupToggle<cr>", { desc = "Toggle" }),
		map(1, { "n" }, bufferline_leader .. "gd", "<cmd>BufferLineGroupClose<cr>", { desc = "Close" }),

		map(1, { "n" }, bufferline_leader .. "x<c-s-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Go previous" }),
		map(1, { "n" }, bufferline_leader .. "x<c-s-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Go next" }),
		map(1, { "n" }, bufferline_leader .. "xH", "<cmd>BufferLineCloseLeft<cr>", { desc = "All left" }),
		map(1, { "n" }, bufferline_leader .. "xL", "<cmd>BufferLineCloseRight<cr>", { desc = "All right" }),
		map(1, { "n" }, bufferline_leader .. "xo", "<cmd>BufferLineCloseOthers<cr>", { desc = "Others" }),
		map(1, { "n" }, window_leader .. "xO", "<cmd>BufferLineCloseOthers<cr>", { desc = "Others (With buffer)" }),
		map(1, { "n" }, bufferline_leader .. "xa", "<cmd>BufferLineCloseOthers<cr><cmd>bdelete<cr>", { desc = "All" }),
		map(1, { "n" }, bufferline_leader .. "xa", "<cmd>BufferLineCloseOthers<cr><cmd>bdelete<cr>", { desc = "All" }),
	}
end
return M
