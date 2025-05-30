-- keys = {
-- 	{ mode = { "n" }, "[g", "<cmd>Gitsigns next_hunk<cr>", desc = "Git hunk" },
-- 	{ mode = { "n" }, "]g", "<cmd>Gitsigns prev_hunk<cr>", desc = "Git hunk" },
-- 	{ mode = { "n" }, "<leader>g", "", desc = "Git" },
-- 	{ mode = { "n" }, "<leader>ga", "", desc = "Add(Stage)" },
-- 	{ mode = { "n" }, "<leader>gl", "", desc = "List" },
-- 	{ mode = { "n" }, "<leader>gf", "", desc = "Find" },
-- 	{ mode = { "n" }, "<leader>gu", "", desc = "Undo" },
-- 	{ mode = { "n" }, "<leader>gh", "", desc = "Hunk" },
-- 	{ mode = { "n" }, "<leader>gd", "", desc = "Diff" },
-- 	{ mode = { "n" }, "<leader>gb", "", desc = "Blame" },
-- 	{ mode = { "n" }, "<leader>gt", "", desc = "Toggle" },
-- 	{ mode = { "n" }, "<leader>gB", "", desc = "Base" },
-- 	{ mode = { "n" }, "<leader>gR", "", desc = "Reset" },
-- 	{ mode = { "n" }, "<leader>gn", "<cmd>Gitsigns next_hunk<cr>", desc = "Next" },
-- 	{ mode = { "n" }, "<leader>gp", "<cmd>Gitsigns prev_hunk<cr>", desc = "Previous" },
--
-- 	{ mode = { "n" }, "<leader>gfc", "<cmd>Telescope git_commits<cr>", desc = "All commits" },
-- 	{ mode = { "n" }, "<leader>gfC", "<cmd>Telescope git_bcommits<cr>", desc = "Buffer commits" },
-- 	{ mode = { "n" }, "<leader>gfs", "<cmd>Telescope git_status<cr>", desc = "Status" },
-- 	{ mode = { "n" }, "<leader>gfb", "<cmd>Telescope git_branches<cr>", desc = "Branches" },
-- 	{ mode = { "n" }, "<leader>gff", "<cmd>Telescope git_files<cr>", desc = "Files" },
-- 	{ mode = { "n" }, "<leader>gfS", "<cmd>Telescope git_stash<cr>", desc = "Stash" },
-- 	{ mode = { "n" }, "<leader>gfx", "<cmd>Telescope conflicts<cr>", desc = "Conflicts" },
--
-- 	{ mode = { "n" }, "<leader>gab", "<cmd>Gitsigns stage_buffer<cr>", desc = "Buffer" },
-- 	{ mode = { "n" }, "<leader>gah", "<cmd>Gitsigns stage_hunk<cr>", desc = "Hunk" },
--
-- 	{ mode = { "n" }, "<leader>gS", "<cmd>Gitsigns show<cr>", desc = "Show" },
-- 	{ mode = { "n" }, "<leader>gr", "<cmd>Gitsigns refresh<cr>", desc = "Refresh" },
-- 	{ mode = { "n" }, "<leader>gG", "<cmd>Gitsigns get_actions<cr>", desc = "Get actions" },
-- 	{ mode = { "n" }, "<leader>gdw", "<cmd>Gitsigns toggle_word_diff<cr>", desc = "Word" },
--
-- 	{ mode = { "n" }, "<leader>ghu", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "Undo" },
-- 	{ mode = { "n" }, "<leader>ghp", "<cmd>Gitsigns preview_hunk_inline<cr>", desc = "Preview inline" },
-- 	{ mode = { "n" }, "<leader>ghP", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview" },
-- 	{ mode = { "n" }, "<leader>ghr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset" },
-- 	{ mode = { "n" }, "<leader>ghs", "<cmd>Gitsigns select_hunk<cr>", desc = "Select" },
-- 	{ mode = { "n" }, "<leader>ghg", "<cmd>Gitsigns get_hunks<cr>", desc = "Get" },
-- 	{ mode = { "n" }, "<leader>ghv", "<cmd>Gitsigns nav_hunk<cr>", desc = "Navigate" },
--
-- 	{
-- 		mode = { "n" },
-- 		"<leader>gdh",
-- 		function()
-- 			vim.cmd("Gitsigns diffthis")
-- 			vim.cmd("wincmd L")
-- 		end,
-- 		desc = "Left",
-- 	},
-- 	{
-- 		mode = { "n" },
-- 		"<leader>gdj",
-- 		function()
-- 			vim.cmd("Gitsigns diffthis")
-- 			vim.cmd("wincmd K")
-- 		end,
-- 		desc = "Down",
-- 	},
-- 	{
-- 		mode = { "n" },
-- 		"<leader>gdk",
-- 		function()
-- 			vim.cmd("set nosplitbelow")
-- 			vim.cmd("Gitsigns diffthis")
-- 			vim.cmd("wincmd J")
-- 		end,
-- 		desc = "Up",
-- 	},
-- 	{
-- 		mode = { "n" },
-- 		"<leader>gdl",
-- 		function()
-- 			vim.cmd("set splitright")
-- 			vim.cmd("Gitsigns diffthis")
-- 			vim.cmd("wincmd H")
-- 		end,
-- 		desc = "Right",
-- 	},
--
-- 	{ mode = { "n" }, "<leader>gbc", "<cmd>Gitsigns blame_line<cr>", desc = "Current line" },
-- 	{ mode = { "n" }, "<leader>gbe", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Every line" },
-- 	{ mode = { "n" }, "<leader>gbs", "<cmd>Gitsigns blame<cr>", desc = "Split view" },
-- 	{ mode = { "n" }, "<leader>gts", "<cmd>Gitsigns toggle_signs<cr>", desc = "Signs" },
-- 	{ mode = { "n" }, "<leader>gtl", "<cmd>Gitsigns toggle_linehl<cr>", desc = "Line highlight" },
-- 	{ mode = { "n" }, "<leader>gtn", "<cmd>Gitsigns toggle_numhl<cr>", desc = "Number highlight" },
-- 	{ mode = { "n" }, "<leader>gtd", "<cmd>Gitsigns toggle_deleted<cr>", desc = "Delete highlight" },
--
-- 	{ mode = { "n" }, "<leader>gBc", "<cmd>Gitsigns change_base<cr>", desc = "Change" },
-- 	{ mode = { "n" }, "<leader>gBr", "<cmd>Gitsigns reset_base<cr>", desc = "Reset" },
--
-- 	{ mode = { "n" }, "<leader>gRi", "<cmd>Gitsigns reset_buffer_index<cr>", desc = "Buffer index" },
-- 	{ mode = { "n" }, "<leader>gRb", "<cmd>Gitsigns reset_buffer<cr>", desc = "Buffer" },
--
-- 	{ mode = { "n" }, "<leader>gll", "<cmd>Gitsigns setloclist<cr>", desc = "Loclist" },
-- 	{ mode = { "n" }, "<leader>glq", "<cmd>Gitsigns setqflist<cr>", desc = "Qflist" },
-- },

local M = {}

M.general = {
	["<leader>g"] = {
		desc = "[G]it",
		a = { cmd = "<cmd>Gitsigns<cr>", desc = "[A]ll" },
		h = {
			desc = "[H]unk",
			g = { cmd = "<cmd>Gitsigns get_hunks<cr>", desc = "[G]et" },
			N = { cmd = "<cmd>Gitsigns nav_hunks<cr>", desc = "[N]av" },
			r = { cmd = "<cmd>Gitsigns reset_hunk<cr>", desc = "[R]eset" },
			s = { cmd = "<cmd>Gitsigns stage_hunk<cr>", desc = "[S]tage" },
			S = { cmd = "<cmd>Gitsigns select_hunk<cr>", desc = "[S]elect" },
			P = { cmd = "<cmd>Gitsigns preview_hunk<cr>", desc = "[P]review" },
			u = { cmd = "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "[U]ndo" },
		},
		s = {
			desc = "[S]tage",
			b = { cmd = "<cmd>Gitsigns stage_buffer<cr>", desc = "[B]uffer" },
			h = { cmd = "<cmd>Gitsigns stage_hunk<cr>", desc = "[H]unk" },
		},
	},
}

M.hydra = {
	name = "[H]unk",
	mode = "n",
	body = "<leader>gh",
	config = {
		color = "pink",
		hint = {
			type = "window",
			position = "bottom-right",
		},
	},
	hint = " _n_ / _j_  [N]ext \n _p_ / _k_  [P]revious ",
	heads = {
		{ "j", "<cmd>Gitsigns next_hunk<cr><bar>", { desc = "J 󰮼 [N]ext" } },
		{ "k", "<cmd>Gitsigns prev_hunk<cr><bar>", { desc = "K 󰮼 [P]revious" } },
		{ "n", "<cmd>Gitsigns next_hunk<cr><bar>", { desc = "[N]ext" } },
		{ "p", "<cmd>Gitsigns prev_hunk<cr><bar>", { desc = "[P]revious" } },
	},
}

return M
