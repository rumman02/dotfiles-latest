local M = {}

M.bufferline_key = {
	["<c-1>"] = { cmd = "<cmd>BufferLineGoToBuffer 1<cr>", desc = "Buffer 1" },
	["<c-2>"] = { cmd = "<cmd>BufferLineGoToBuffer 2<cr>", desc = "Buffer 2" },
	["<c-3>"] = { cmd = "<cmd>BufferLineGoToBuffer 3<cr>", desc = "Buffer 3" },
	["<c-4>"] = { cmd = "<cmd>BufferLineGoToBuffer 4<cr>", desc = "Buffer 4" },
	["<c-5>"] = { cmd = "<cmd>BufferLineGoToBuffer 5<cr>", desc = "Buffer 5" },
	["<c-6>"] = { cmd = "<cmd>BufferLineGoToBuffer 6<cr>", desc = "Buffer 6" },
	["<c-7>"] = { cmd = "<cmd>BufferLineGoToBuffer 7<cr>", desc = "Buffer 7" },
	["<c-8>"] = { cmd = "<cmd>BufferLineGoToBuffer 8<cr>", desc = "Buffer 8" },
	["<c-9>"] = { cmd = "<cmd>BufferLineGoToBuffer 9<cr>", desc = "Buffer 9" },
	["<c-0>"] = { cmd = "<cmd>BufferLineGoToBuffer 10<cr>", desc = "Buffer 10" },
	["<leader>b"] = {
		desc = "[B]ufferline",
		c = {
			desc = "[C]lose",
			l = { cmd = "<cmd>BufferLineCloseLeft<cr>", desc = "[L]eft" },
			r = { cmd = "<cmd>BufferLineCloseRight<cr>", desc = "[R]ight" },
		},
		-- a = { cmd = "", desc = "" },
		-- a = { cmd = "<cmd>lua Snacks.picker()<cr>", desc = "[A]ll" },
		-- b = { cmd = "<cmd>lua Snacks.picker.buffers()<cr>", desc = "[B]uffers" },
		-- c = {
		-- 	desc = "[C]ommand",
		-- 	c = { cmd = "<cmd>lua Snacks.picker.commands()<cr>", desc = "[C]ommand" },
		-- 	h = { cmd = "<cmd>lua Snacks.picker.command_history()<cr>", desc = "[H]istory" },
		-- },
		-- C = { cmd = "<cmd>lua Snacks.picker.colorschemes()<cr>", desc = "[C]olorscheme" },
		-- f = {
		-- 	desc = "[F]ile",
		-- 	f = { cmd = "<cmd>lua Snacks.picker.files()<cr>", desc = "[F]ile" },
		-- 	c = {
		-- 		cmd = "<cmd>lua Snacks.picker.pick('files', { cwd = vim.fn.stdpath('config') }) <cr>",
		-- 		desc = "[C]onfig",
		-- 	},
		-- 	r = { cmd = "<cmd>lua Snacks.picker.recent()<cr>", desc = "[R]ecents" },
		-- },
		-- g = {
		-- 	desc = "[G]it",
		-- 	b = { cmd = "<cmd>lua Snacks.picker.git_branches()<cr>", desc = "[B]ranches" },
		-- 	-- c = {
		-- 	-- 	desc = "[C]ommits",
		-- 	-- 	a = { cmd = "<cmd>lua Snacks.picker.git_commits<cr>", desc = "[A]ll" },
		-- 	-- 	c = { cmd = "<cmd>lua Snacks.picker.git_bcommits<cr>", desc = "[C]urrent" },
		-- 	-- },
		-- 	d = { cmd = "<cmd>lua Snacks.picker.git_diff()<cr>", desc = "[D]iff" },
		-- 	f = { cmd = "<cmd>lua Snacks.picker.git_files()<cr>", desc = "[F]iles" },
		-- 	l = {
		-- 		desc = "[L]og",
		-- 		a = { cmd = "<cmd>lua Snacks.picker.git_log()<cr>", desc = "[A]ll" },
		-- 		f = { cmd = "<cmd>lua Snacks.picker.git_log_file()<cr>", desc = "[F]ile" },
		-- 		l = { cmd = "<cmd>lua Snacks.picker.git_log_line()<cr>", desc = "[L]ine" },
		-- 	},
		-- 	s = { cmd = "<cmd>lua Snacks.picker.git_status()<cr>", desc = "[S]tatus" },
		-- 	S = { cmd = "<cmd>lua Snacks.picker.git_stash()<cr>", desc = "[S]tash" },
		-- 	w = { cmd = "<cmd>lua Snacks.picker.git_grep()<cr>", desc = "[W]ord" },
		-- },
		-- h = { cmd = "<cmd>lua Snacks.picker.help()<cr>", desc = "[H]elp" },
		-- H = { cmd = "<cmd>lua Snacks.picker.highlights()<cr>", desc = "[H]ighlights" },
		-- i = { cmd = "<cmd>lua Snacks.picker.icons()<cr>", desc = "[I]cons" },
		-- k = { cmd = "<cmd>lua Snacks.picker.keymaps()<cr>", desc = "[K]eymaps" },
		-- l = {
		-- 	desc = "[L]sp",
		-- 	d = {
		-- 		desc = "[D]iagnostics",
		-- 		a = { cmd = "<cmd>lua Snacks.picker.diagnostics()<cr>", desc = "[A]ll" },
		-- 		c = { cmd = "<cmd>lua Snacks.picker.diagnostics_buffer()<cr>", desc = "[C]urrent" },
		-- 	},
		-- 	D = {
		-- 		desc = "[D]efinitions",
		-- 		d = { cmd = "<cmd>lua Snacks.picker.lsp_definitions()<cr>", desc = "[D]efinations" },
		-- 		t = { cmd = "<cmd>lua Snacks.picker.lsp_type_definitions()<cr>", desc = "[T]ype" },
		-- 	},
		-- 	c = { cmd = "<cmd>lua Snacks.picker.lsp_declarations()<cr>", desc = "D[E]clarations" },
		-- 	-- c = {
		-- 	-- desc = "[C]alls",
		-- 	-- i = { cmd = "<cmd>Telescope lsp_incoming_calls<cr>", desc = "[I]ncoming" },
		-- 	-- o = { cmd = "<cmd>Telescope lsp_outgoing_calls<cr>", desc = "[O]utgoing" },
		-- 	-- },
		-- 	i = { cmd = "<cmd>lua Snacks.picker.lsp_implementations()<cr>", desc = "[I]mplementations" },
		-- 	r = { cmd = "<cmd>lua Snacks.picker.lsp_references()<cr>", desc = "[R]eferences" },
		-- 	s = {
		-- 		desc = "[S]ymbols",
		-- 		d = { cmd = "<cmd>lua Snacks.picker.lsp_symbols()<cr>", desc = "[D]ocument" },
		-- 		w = { cmd = "<cmd>lua Snacks.picker.lsp_workspace_symbols()<cr>", desc = "[W]orkspace" },
		-- 		-- D = { cmd = "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "[D]ynamic" },
		-- 	},
		-- },
		-- L = {
		-- 	desc = "[L]ist",
		-- 	j = { cmd = "<cmd>lua Snacks.picker.jumps()<cr>", desc = "[J]ump" },
		-- 	l = { cmd = "<cmd>lua Snacks.picker.loclist()<cr>", desc = "[L]ocation" },
		-- 	q = {
		-- 		desc = "[Q]uickFix",
		-- 		a = { cmd = "<cmd>lua Snacks.picker.qflist()<cr>", desc = "[A]ll" },
		-- 		-- h = { cmd = "<cmd>Telescope quickfixhistory<cr>", desc = "[H]istory" },
		-- 	},
		-- },
		-- m = { cmd = "<cmd>lua Snacks.picker.marks()<cr>", desc = "[M]arks" },
		-- -- M = { cmd = "<cmd>Telescope media_files<cr>", desc = "[M]edia" },
		-- n = { cmd = "<cmd>lua Snacks.picker.noice()<cr>", desc = "[N]otification" },
		-- p = { cmd = "<cmd>lua Snacks.picker.projects()<cr>", desc = "[P]rojects" },
		-- w = {
		-- 	desc = "[W]ords",
		-- 	c = { cmd = "<cmd>lua Snacks.picker.grep_buffers()<cr>", desc = "[C]urrent" },
		-- 	C = { cmd = "<cmd>lua Snacks.picker.grep_word()<cr>", desc = "[C]ursor" },
		-- 	w = { cmd = "<cmd>lua Snacks.picker.grep()<cr>", desc = "[W]ords" },
		-- },
		-- r = { cmd = "<cmd>lua Snacks.picker.registers()<cr>", desc = "[R]egisters" },
		-- R = { cmd = "<cmd>lua Snacks.picker.resume()<cr>", desc = "[R]esume", ft = "snacks_picker_input" },
		-- s = { cmd = "<cmd>lua Snacks.picker.spelling()<cr>", desc = "[S]pell" },
		-- S = {
		-- 	desc = "[S]earch",
		-- 	h = { cmd = "<cmd>lua Snacks.picker.search_history()<cr>", desc = "[H]istory" },
		-- },
		-- t = { cmd = "<cmd>lua Snacks.picker.todo_comments()<cr>", desc = "[T]odo" },
		-- u = { cmd = "<cmd>lua Snacks.picker.undo()<cr>", desc = "[U]ndo" },
		-- -- v = { cmd = "<cmd>Telescope vim_options<cr>", desc = "[V]im options" },
	},
	["<c-s-h>"] = { cmd = "<cmd>BufferLineCyclePrev<cr>", desc = "Previous" },
	["<c-s-l>"] = { cmd = "<cmd>BufferLineCycleNext<cr>", desc = "Next" },
}

M.bufferline_move_key_hydra = {
	name = "[M]ove",
	mode = "n",
	body = "<leader>bm",
	config = {
		color = "pink",
		hint = {
			type = "window",
			position = "bottom-right",
		},
	},
	hint = " _l_  [N]ext \n _h_  [P]revious ",
	heads = {
		{ "l", "<cmd>BufferLineMoveNext<cr>", { desc = "[N]ext" } },
		{ "h", "<cmd>BufferLineMovePrev<cr>", { desc = "[P]revious" } },
	},
}

return M
