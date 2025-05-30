local M = {};

M.init = function()
	vim.g.barbar_auto_setup = false;
end

M.opts = function ()
  local requires = require("lib.functions").requires;
	local icons = requires("lib.icons");
	return {
		animation = true,
		sidebar_filetypes = {
			["neo-tree"] = { event = "BufWipeout", text = "Explorer", align = "center" },
		},
		icons = {
			diagnostics = {
				[vim.diagnostic.severity.ERROR] ={ enabled = true, icon = " " .. icons.diagnostics.error },
				[vim.diagnostic.severity.WARN] = { enabled = true, icon = " " .. icons.diagnostics.warn },
				[vim.diagnostic.severity.INFO] = { enabled = true, icon = " " .. icons.diagnostics.info },
				[vim.diagnostic.severity.HINT] = { enabled = true, icon = " " .. icons.diagnostics.hint },
			}
		}
	}
end

-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
-- animation = true,
-- insert_at_start = true,
-- …etc.

M.keys = function ()
	local func = require("lib.functions");
	local map = func.map;
  local requires = func.requires;
	local leader = requires("lib.keys").bufferline.globals;

	return {
		map(1, { "n" }, leader, "", { desc = "Bufferline" }),

		map(1, { "n" }, "<c-1>", "<cmd>BufferGoto 1<cr>", { desc = "Buffer 1" }),
		map(1, { "n" }, "<c-2>", "<cmd>BufferGoto 2<cr>", { desc = "Buffer 2" }),
		map(1, { "n" }, "<c-3>", "<cmd>BufferGoto 3<cr>", { desc = "Buffer 3" }),
		map(1, { "n" }, "<c-4>", "<cmd>BufferGoto 4<cr>", { desc = "Buffer 4" }),
		map(1, { "n" }, "<c-5>", "<cmd>BufferGoto 5<cr>", { desc = "Buffer 5" }),
		map(1, { "n" }, "<c-6>", "<cmd>BufferGoto 6<cr>", { desc = "Buffer 6" }),
		map(1, { "n" }, "<c-7>", "<cmd>BufferGoto 7<cr>", { desc = "Buffer 7" }),
		map(1, { "n" }, "<c-8>", "<cmd>BufferGoto 8<cr>", { desc = "Buffer 8" }),
		map(1, { "n" }, "<c-9>", "<cmd>BufferGoto 9<cr>", { desc = "Buffer 9" }),
		map(1, { "n" }, "<c-0>", "<cmd>BufferGoto 10<cr>", { desc = "Buffer 10" }),
		map(1, { "n" }, "<c-s-l>", "<cmd>BufferNext<cr>", { desc = "Buffer Next" }),
		map(1, { "n" }, "<c-s-h>", "<cmd>BufferPrevious<cr>", { desc = "Buffer Previous" }),
		-- map(1, { "n" }, "<c-s-h>", "<cmd>BufferFirst<cr>", { desc = "Buffer First" }),
		-- map(1, { "n" }, "<c-s-l>", "<cmd>BufferLast<cr>", { desc = "Buffer Last" }),

		map(1, { "n" }, leader .. "d", "<cmd>BufferDelete<cr>", { desc = "Delete" }),
		map(1, { "n" }, leader .. "w", "<cmd>BufferWipeout<cr>", { desc = "Wipeout" }),
		map(1, { "n" }, leader .. "P", "<cmd>BufferPin<cr>", { desc = "Pin" }),
		map(1, { "n" }, leader .. "r", "<cmd>BufferRestore<cr>", { desc = "Restore" }),

		map(1, { "n" }, leader .. "x", "", { desc = "Close" }),
		map(1, { "n" }, leader .. "xa", "<cmd>BufferCloseAllButCurrent<cr>", { desc = "All" }),
		map(1, { "n" }, leader .. "xc", "<cmd>BufferClose<cr>", { desc = "Current" }),
		map(1, { "n" }, leader .. "xA", "<cmd>BufferCloseAllButCurrentOrPinned<cr>", { desc = "All with pinned" }),
		map(1, { "n" }, leader .. "xp", "<cmd>BufferCloseAllButPinned<cr>", { desc = "Pinned" }),
		map(1, { "n" }, leader .. "xl", "<cmd>BufferCloseBuffersRight<cr>", { desc = "Right" }),
		map(1, { "n" }, leader .. "xh", "<cmd>BufferCloseBuffersLeft<cr>", { desc = "Left" }),

		map(1, { "n" }, leader .. "s", "", { desc = "Scroll" }),
		map(1, { "n" }, leader .. "sh", "<cmd>BufferScrollLeft<cr>", { desc = "Left" }),
		map(1, { "n" }, leader .. "sl", "<cmd>BufferScrollRight<cr>", { desc = "Right" }),

		map(1, { "n" }, leader .. "m", "", { desc = "Move" }),
		map(1, { "n" }, leader .. "ml", "<cmd>BufferMoveNext<cr>", { desc = "Next" }),
		map(1, { "n" }, leader .. "mh", "<cmd>BufferMovePrevious<cr>", { desc = "Previous" }),
		-- map(1, { "n" }, leader .. "mm", "<cmd>BufferMove<cr>", { desc = "Move" }),
		map(1, { "n" }, leader .. "ms", "<cmd>BufferMoveStart<cr>", { desc = "Start" }),

		map(1, { "n" }, leader .. "o", "", { desc = "Order" }),
		map(1, { "n" }, leader .. "ob", "<cmd>BufferOrderByBufferNumber<cr>", { desc = "Buf Number" }),
		map(1, { "n" }, leader .. "od", "<cmd>BufferOrderByDirectory<cr>", { desc = "Directory" }),
		map(1, { "n" }, leader .. "ol", "<cmd>BufferOrderByLanguage<cr>", { desc = "Language" }),
		map(1, { "n" }, leader .. "on", "<cmd>BufferOrderByName<cr>", { desc = "Name" }),
		map(1, { "n" }, leader .. "ow", "<cmd>BufferOrderByWindowNumber<cr>", { desc = "Win Number" }),

		map(1, { "n" }, leader .. "p", "", { desc = "Pick" }),
		map(1, { "n" }, leader .. "pp", "<cmd>BufferPick<cr>", { desc = "Go" }),
		map(1, { "n" }, leader .. "pd", "<cmd>BufferPickDelete<cr>", { desc = "Delete" }),
	};
end;

return M;
