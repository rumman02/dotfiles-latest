return {
	"akinsho/bufferline.nvim",
	enabled = require("plugins.controller").lines.bufferline,
	version = "*",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	keys = function()
		local keymap = require("plugins.lines.keymap").bufferline_key
		return require("lib.functions").convertKeys(keymap)
	end,
	-- keys = function()
	-- 	return {
	--
	-- 		{
	-- 			mode = { "n" },
	-- 			"<tab>r",
	-- 			function()
	-- 				local char = vim.fn.input("Name: ")
	-- 				if char ~= "" then
	-- 					vim.cmd("BufferLineTabRename " .. char)
	-- 				else
	-- 					vim.notify("No name inserted")
	-- 				end
	-- 			end,
	-- 			desc = "Rename",
	-- 		},
	-- 		{
	-- 			mode = { "n" },
	-- 			"<tab>n",
	-- 			function()
	-- 				local char = vim.fn.input("Name: ")
	-- 				if char ~= "" then
	-- 					vim.cmd("tabnew")
	-- 					vim.cmd("BufferLineTabRename " .. char)
	-- 				else
	-- 					vim.notify("No name inserted")
	-- 				end
	-- 			end,
	-- 			desc = "Open named",
	-- 		},
	-- 		{ mode = { "n" }, "<leader>b", desc = "Bufferline" },
	-- 		{ mode = { "n" }, "<leader>bx", "", desc = "Close" },
	-- 		{ mode = { "n" }, "<leader>bg", "", desc = "Group" },
	-- 		{ mode = { "n" }, "<leader>bS", "", desc = "Sort" },
	-- 		{ mode = { "n" }, "<leader>bp", "", desc = "Pick" },
	-- 		{ mode = { "n" }, "<leader>bs", "", desc = "Swap" },
	-- 		{ mode = { "n" }, "<leader>bo", "", desc = "Open" },
	--
	-- 		{ mode = { "n" }, "<c-1>", "<cmd>BufferLineGoToBuffer 1<cr>", desc = "Buffer 1" },
	-- 		{ mode = { "n" }, "<c-2>", "<cmd>BufferLineGoToBuffer 2<cr>", desc = "Buffer 2" },
	-- 		{ mode = { "n" }, "<c-3>", "<cmd>BufferLineGoToBuffer 3<cr>", desc = "Buffer 3" },
	-- 		{ mode = { "n" }, "<c-4>", "<cmd>BufferLineGoToBuffer 4<cr>", desc = "Buffer 4" },
	-- 		{ mode = { "n" }, "<c-5>", "<cmd>BufferLineGoToBuffer 5<cr>", desc = "Buffer 5" },
	-- 		{ mode = { "n" }, "<c-6>", "<cmd>BufferLineGoToBuffer 6<cr>", desc = "Buffer 6" },
	-- 		{ mode = { "n" }, "<c-7>", "<cmd>BufferLineGoToBuffer 7<cr>", desc = "Buffer 7" },
	-- 		{ mode = { "n" }, "<c-8>", "<cmd>BufferLineGoToBuffer 8<cr>", desc = "Buffer 8" },
	-- 		{ mode = { "n" }, "<c-9>", "<cmd>BufferLineGoToBuffer 9<cr>", desc = "Buffer 9" },
	-- 		{ mode = { "n" }, "<c-0>", "<cmd>BufferLineGoToBuffer 10<cr>", desc = "Buffer 10" },
	--
	-- 		{ mode = { "n" }, "<leader>bol", "<cmd>enew<cr>", desc = "Right" },
	-- 		{ mode = { "n" }, "<leader>boh", "<cmd>enew<cr><cmd>BufferLineMovePrev<cr>", desc = "Left" },
	--
	-- 		{ mode = { "n" }, "<leader>b<c-s-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Go previous" },
	-- 		{ mode = { "n" }, "<leader>b<c-s-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Go next" },
	-- 		{ mode = { "n" }, "<leader>b1", "<cmd>BufferLineGoToBuffer 1<cr>", desc = "Buffer 1" },
	-- 		{ mode = { "n" }, "<leader>b2", "<cmd>BufferLineGoToBuffer 2<cr>", desc = "Buffer 2" },
	-- 		{ mode = { "n" }, "<leader>b3", "<cmd>BufferLineGoToBuffer 3<cr>", desc = "Buffer 3" },
	-- 		{ mode = { "n" }, "<leader>b4", "<cmd>BufferLineGoToBuffer 4<cr>", desc = "Buffer 4" },
	-- 		{ mode = { "n" }, "<leader>b5", "<cmd>BufferLineGoToBuffer 5<cr>", desc = "Buffer 5" },
	-- 		{ mode = { "n" }, "<leader>b6", "<cmd>BufferLineGoToBuffer 6<cr>", desc = "Buffer 6" },
	-- 		{ mode = { "n" }, "<leader>b7", "<cmd>BufferLineGoToBuffer 7<cr>", desc = "Buffer 7" },
	-- 		{ mode = { "n" }, "<leader>b8", "<cmd>BufferLineGoToBuffer 8<cr>", desc = "Buffer 8" },
	-- 		{ mode = { "n" }, "<leader>b9", "<cmd>BufferLineGoToBuffer 9<cr>", desc = "Buffer 9" },
	-- 		{ mode = { "n" }, "<leader>bP", "<cmd>BufferLineTogglePin<cr>", desc = "Toggle pin" },
	-- 		{ mode = { "n" }, "<leader>bt", "<cmd>ScopeMoveBuf<cr>", desc = "To tab" },
	--
	-- 		{ mode = { "n" }, "<leader>bs<c-s-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Go previous" },
	-- 		{ mode = { "n" }, "<leader>bs<c-s-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Go next" },
	-- 		{
	-- 			mode = { "n" },
	-- 			"<leader>bsh",
	-- 			"<cmd>BufferLineMovePrev<cr>",
	-- 			desc = "Previous",
	-- 		},
	-- 		{ mode = { "n" }, "<leader>bsl", "<cmd>BufferLineMoveNext<cr>", desc = "Next" },
	-- 		{
	-- 			mode = { "n" },
	-- 			"<leader>bpo",
	-- 			function()
	-- 				vim.cmd("BufferLinePick")
	-- 			end,
	-- 			desc = "Open",
	-- 		},
	-- 		{
	-- 			mode = { "n" },
	-- 			"<leader>bpx",
	-- 			function()
	-- 				vim.cmd("BufferLinePickClose")
	-- 			end,
	-- 			desc = "Close",
	-- 		},
	--
	-- 		{ mode = { "n" }, "<leader>bSt", "<cmd>BufferLineSortByTabs<cr>", desc = "By tab" },
	-- 		{ mode = { "n" }, "<leader>bSd", "<cmd>BufferLineSortByDirectory<cr>", desc = "By directory" },
	-- 		{ mode = { "n" }, "<leader>bSe", "<cmd>BufferLineSortByExtension<cr>", desc = "By extension" },
	-- 		{
	-- 			mode = { "n" },
	-- 			"<leader>bSr",
	-- 			"<cmd>BufferLineSortByRelativeDirectory<cr>",
	-- 			desc = "By relative directory",
	-- 		},
	--
	-- 		{ mode = { "n" }, "<leader>bgt", "<cmd>BufferLineGroupToggle<cr>", desc = "Toggle" },
	-- 		{ mode = { "n" }, "<leader>bgd", "<cmd>BufferLineGroupClose<cr>", desc = "Close" },
	--
	-- 		{ mode = { "n" }, "<leader>bx<c-s-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Go previous" },
	-- 		{ mode = { "n" }, "<leader>bx<c-s-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Go next" },
	-- 		{ mode = { "n" }, "<leader>bxH", "<cmd>BufferLineCloseLeft<cr>", desc = "All left" },
	-- 		{ mode = { "n" }, "<leader>bxL", "<cmd>BufferLineCloseRight<cr>", desc = "All right" },
	-- 		{ mode = { "n" }, "<leader>bxo", "<cmd>BufferLineCloseOthers<cr>", desc = "Others" },
	-- 		{ mode = { "n" }, "<leader>wxO", "<cmd>BufferLineCloseOthers<cr>", desc = "Others (With buffer)" },
	-- 		{ mode = { "n" }, "<leader>bxa", "<cmd>BufferLineCloseOthers<cr><cmd>bdelete<cr>", desc = "All" },
	-- 	}
	-- end,
	opts = function()
		local icons = require("lib.icons")
		local bufferline = require("bufferline")
		return {
			options = {
				mode = "buffers",
				style_preset = {
					bufferline.style_preset.default,
					bufferline.style_preset.no_italic,
					bufferline.style_preset.no_bold,
				},
				indicator = {
					icon = "▎",
					style = "icon",
				},
				buffer_close_icon = " ",
				modified_icon = icons.filesystem.modified,
				close_icon = " ",
				left_trunc_marker = " ",
				right_trunc_marker = " ",
				diagnostics = "nvim_lsp",
				separator_style = "slope",
				pick = {
					alphabet = "abcdefghijklmopqrstuvwxyz",
				},
			},
		}
	end,
	config = function(_, opts)
		require("bufferline").setup(opts)
		require("hydra")(require("plugins.lines.keymap").bufferline_move_key_hydra)
	end,
}
