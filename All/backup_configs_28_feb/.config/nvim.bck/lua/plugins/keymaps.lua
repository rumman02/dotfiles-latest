local M = {};
local map = require("lib.func").map;

local bufferline_leader = "<leader>b";
local git_leader = "<leader>g";

-------------------------------------------------------------------------------
-- bufferline
-------------------------------------------------------------------------------
M.bufferline = function()
	return {
		map(1, { "n" }, bufferline_leader .. "xc", function() Snacks.bufdelete() end, { desc = "Current" }),
		map(1, { "n" }, bufferline_leader .. "xa", function() Snacks.bufdelete.all() end, { desc = "All" }),
		map(1, { "n" }, bufferline_leader .. "xo", function() Snacks.bufdelete.other() end, { desc = "Others" }),
		map(1, { "n" }, bufferline_leader .. "xh", function() vim.cmd("bprevious") Snacks.bufdelete() end, { desc = "Left" }),
		map(1, { "n" }, bufferline_leader .. "xl", function() vim.cmd("bnext") Snacks.bufdelete() end, { desc = "Right" }),
	};
end;

M.git = function()
	return {
		map(1, { "n" }, git_leader .. "ob", function() Snacks.gitbrowse() end, { desc = "In browser" }),
		map(1, { "n" }, git_leader .. "gg", function() Snacks.lazygit.open() end, { desc = "Lazygit" }),
		map(1, { "n" }, git_leader .. "gc", function() Snacks.lazygit.log_file() end, { desc = "Current log" }),
		map(1, { "n" }, git_leader .. "ga", function() Snacks.lazygit.log() end, { desc = "All log" }),

		map(1, { "n" }, "[g", "<cmd>Gitsigns next_hunk<cr>", { desc = "Git hunk" }),
		map(1, { "n" }, "]g", "<cmd>Gitsigns prev_hunk<cr>", { desc = "Git hunk" }),
		map(1, { "n" }, git_leader, "", { desc = "Git" }),
		map(1, { "n" }, git_leader .. "a", "", { desc = "Add(Stage)" }),
		map(1, { "n" }, git_leader .. "l", "", { desc = "List" }),
		map(1, { "n" }, git_leader .. "f", "", { desc = "Find" }),
		map(1, { "n" }, git_leader .. "u", "", { desc = "Undo" }),
		map(1, { "n" }, git_leader .. "h", "", { desc = "Hunk" }),
		map(1, { "n" }, git_leader .. "d", "", { desc = "Diff" }),
		map(1, { "n" }, git_leader .. "b", "", { desc = "Blame" }),
		map(1, { "n" }, git_leader .. "t", "", { desc = "Toggle" }),
		map(1, { "n" }, git_leader .. "B", "", { desc = "Base" }),
		map(1, { "n" }, git_leader .. "R", "", { desc = "Reset" }),
		map(1, { "n" }, git_leader .. "n", "<cmd>Gitsigns next_hunk<cr>", { desc = "Next" }),
		map(1, { "n" }, git_leader .. "p", "<cmd>Gitsigns prev_hunk<cr>", { desc = "Previous" }),

		map(1, { "n" }, git_leader .. "fc", "<cmd>Telescope git_commits<cr>", { desc = "All commits" }),
		map(1, { "n" }, git_leader .. "fC", "<cmd>Telescope git_bcommits<cr>", { desc = "Buffer commits" }),
		map(1, { "n" }, git_leader .. "fs", "<cmd>Telescope git_status<cr>", { desc = "Status" }),
		map(1, { "n" }, git_leader .. "fb", "<cmd>Telescope git_branches<cr>", { desc = "Branches" }),
		map(1, { "n" }, git_leader .. "ff", "<cmd>Telescope git_files<cr>", { desc = "Files" }),
		map(1, { "n" }, git_leader .. "fS", "<cmd>Telescope git_stash<cr>", { desc = "Stash" }),
		map(1, { "n" }, git_leader .. "fx", "<cmd>Telescope conflicts<cr>", { desc = "Conflicts" }),

		map(1, { "n" }, git_leader .. "ab", "<cmd>Gitsigns stage_buffer<cr>", { desc = "Buffer" }),
		map(1, { "n" }, git_leader .. "ah", "<cmd>Gitsigns stage_hunk<cr>", { desc = "Hunk" }),

		map(1, { "n" }, git_leader .. "S", "<cmd>Gitsigns show<cr>", { desc = "Show" }),
		map(1, { "n" }, git_leader .. "r", "<cmd>Gitsigns refresh<cr>", { desc = "Refresh" }),
		map(1, { "n" }, git_leader .. "G", "<cmd>Gitsigns get_actions<cr>", { desc = "Get actions" }),
		map(1, { "n" }, git_leader .. "dw", "<cmd>Gitsigns toggle_word_diff<cr>", { desc = "Word" }),

		map(1, { "n" }, git_leader .. "hu", "<cmd>Gitsigns undo_stage_hunk<cr>", { desc = "Undo" }),
		map(1, { "n" }, git_leader .. "hp", "<cmd>Gitsigns preview_hunk_inline<cr>", { desc = "Preview inline" }),
		map(1, { "n" }, git_leader .. "hP", "<cmd>Gitsigns preview_hunk<cr>", { desc = "Preview" }),
		map(1, { "n" }, git_leader .. "hr", "<cmd>Gitsigns reset_hunk<cr>", { desc = "Reset" }),
		map(1, { "n" }, git_leader .. "hs", "<cmd>Gitsigns select_hunk<cr>", { desc = "Select" }),
		map(1, { "n" }, git_leader .. "hg", "<cmd>Gitsigns get_hunks<cr>", { desc = "Get" }),
		map(1, { "n" }, git_leader .. "hv", "<cmd>Gitsigns nav_hunk<cr>", { desc = "Navigate" }),

		map(1, { "n" }, git_leader .. "dh", function() vim.cmd("Gitsigns diffthis") vim.cmd("wincmd L") end, { desc = "Left" }),
		map(1, { "n" }, git_leader .. "dj", function() vim.cmd("Gitsigns diffthis") vim.cmd("wincmd K") end, { desc = "Down" }),
		map(1, { "n" }, git_leader .. "dk", function() vim.cmd("set nosplitbelow") vim.cmd("Gitsigns diffthis") vim.cmd("wincmd J") end, { desc = "Up" }),
		map(1, { "n" }, git_leader .. "dl", function() vim.cmd("set splitright") vim.cmd("Gitsigns diffthis") vim.cmd("wincmd H") end, { desc = "Right" }),

		map(1, { "n" }, git_leader .. "bc", "<cmd>Gitsigns blame_line<cr>", { desc = "Current line" }),
		map(1, { "n" }, git_leader .. "be", "<cmd>Gitsigns toggle_current_line_blame<cr>", { desc = "Every line" }),
		map(1, { "n" }, git_leader .. "bs", "<cmd>Gitsigns blame<cr>", { desc = "Split view" }),
		map(1, { "n" }, git_leader .. "ts", "<cmd>Gitsigns toggle_signs<cr>", { desc = "Signs" }),
		map(1, { "n" }, git_leader .. "tl", "<cmd>Gitsigns toggle_linehl<cr>", { desc = "Line highlight" }),
		map(1, { "n" }, git_leader .. "tn", "<cmd>Gitsigns toggle_numhl<cr>", { desc = "Number highlight" }),
		map(1, { "n" }, git_leader .. "td", "<cmd>Gitsigns toggle_deleted<cr>", { desc = "Delete highlight" }),

		map(1, { "n" }, git_leader .. "Bc", "<cmd>Gitsigns change_base<cr>", { desc = "Change" }),
		map(1, { "n" }, git_leader .. "Br", "<cmd>Gitsigns reset_base<cr>", { desc = "Reset" }),

		map(1, { "n" }, git_leader .. "Ri", "<cmd>Gitsigns reset_buffer_index<cr>", { desc = "Buffer index" }),
		map(1, { "n" }, git_leader .. "Rb", "<cmd>Gitsigns reset_buffer<cr>", { desc = "Buffer" }),

		map(1, { "n" }, git_leader .. "ll", "<cmd>Gitsigns setloclist<cr>", { desc = "Loclist" }),
		map(1, { "n" }, git_leader .. "lq", "<cmd>Gitsigns setqflist<cr>", { desc = "Qflist" }),
	}
end;

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function ()

	end
})

return M;
