local M = {}

M.snacks_key = {
	["<leader>f"] = {
		desc = "[F]ind",
		a = { cmd = "<cmd>lua Snacks.picker()<cr>", desc = "[A]ll" },
		b = { cmd = "<cmd>lua Snacks.picker.buffers()<cr>", desc = "[B]uffers" },
		c = { cmd = "<cmd>lua Snacks.picker.commands()<cr>", desc = "[C]ommand" },
		C = { cmd = "<cmd>lua Snacks.picker.colorschemes()<cr>", desc = "[C]olorscheme" },
		d = { cmd = "<cmd>lua Snacks.picker.diagnostics()<cr>", desc = "[D]iagnostics" },
		f = { cmd = "<cmd>lua Snacks.picker.files()<cr>", desc = "[F]iles" },
		g = {
			desc = "[G]it",
			b = { cmd = "<cmd>lua Snacks.picker.git_branches()<cr>", desc = "[B]ranches" },
			d = { cmd = "<cmd>lua Snacks.picker.git_diff()<cr>", desc = "[D]iff" },
			f = { cmd = "<cmd>lua Snacks.picker.git_files()<cr>", desc = "[F]iles" },
			l = { cmd = "<cmd>lua Snacks.picker.git_log()<cr>", desc = "[L]og" },
			s = { cmd = "<cmd>lua Snacks.picker.git_status()<cr>", desc = "[S]tatus" },
			S = { cmd = "<cmd>lua Snacks.picker.git_stash()<cr>", desc = "[S]tash" },
			w = { cmd = "<cmd>lua Snacks.picker.git_grep()<cr>", desc = "[W]ord" },
		},
		h = { cmd = "<cmd>lua Snacks.picker.help()<cr>", desc = "[H]elp" },
		H = { cmd = "<cmd>lua Snacks.picker.highlights()<cr>", desc = "[H]ighlights" },
		i = { cmd = "<cmd>lua Snacks.picker.icons()<cr>", desc = "[I]cons" },
		j = { cmd = "<cmd>lua Snacks.picker.jumps()<cr>", desc = "[J]ump" },
		k = { cmd = "<cmd>lua Snacks.picker.keymaps()<cr>", desc = "[K]eymaps" },
		l = { cmd = "<cmd>lua Snacks.picker.loclist()<cr>", desc = "[L]ocation" },
		m = { cmd = "<cmd>lua Snacks.picker.marks()<cr>", desc = "[M]arks" },
		n = { cmd = "<cmd>lua Snacks.picker.noice()<cr>", desc = "[N]otification" },
		p = { cmd = "<cmd>lua Snacks.picker.projects()<cr>", desc = "[P]rojects" },
		w = { cmd = "<cmd>lua Snacks.picker.grep()<cr>", desc = "[W]ords" },
		r = { cmd = "<cmd>lua Snacks.picker.registers()<cr>", desc = "[R]egisters" },
		R = { cmd = "<cmd>lua Snacks.picker.resume()<cr>", desc = "[R]esume" },
		s = { cmd = "<cmd>lua Snacks.picker.spelling()<cr>", desc = "[S]pell" },
		t = { cmd = "<cmd>lua Snacks.picker.todo_comments()<cr>", desc = "[T]odo" },
		q = { cmd = "<cmd>lua Snacks.picker.qflist()<cr>", desc = "[Q]uickFix" },
		u = { cmd = "<cmd>lua Snacks.picker.undo()<cr>", desc = "[U]ndo" },
	},
	["<leader>f<leader>"] = {
		desc = "Extras",
		c = {
			desc = "[C]ommand",
			h = { cmd = "<cmd>lua Snacks.picker.command_history()<cr>", desc = "[H]istory" },
		},
		f = {
			desc = "[F]ile",
			c = {
				cmd = "<cmd>lua Snacks.picker.pick('files', { cwd = vim.fn.stdpath('config') }) <cr>",
				desc = "[C]onfig",
			},
			r = { cmd = "<cmd>lua Snacks.picker.recent()<cr>", desc = "[R]ecents" },
		},
		g = {
			desc = "[G]it",
			l = {
				desc = "[L]og",
				f = { cmd = "<cmd>lua Snacks.picker.git_log_file()<cr>", desc = "[F]ile" },
				l = { cmd = "<cmd>lua Snacks.picker.git_log_line()<cr>", desc = "[L]ine" },
			},
		},
		l = {
			desc = "[L]sp",
			d = {
				desc = "[D]iagnostics",
				c = { cmd = "<cmd>lua Snacks.picker.diagnostics_buffer()<cr>", desc = "[C]urrent" },
			},
			D = {
				desc = "[D]efinitions",
				d = { cmd = "<cmd>lua Snacks.picker.lsp_definitions()<cr>", desc = "[D]efinations" },
				t = { cmd = "<cmd>lua Snacks.picker.lsp_type_definitions()<cr>", desc = "[T]ype" },
			},
			e = { cmd = "<cmd>lua Snacks.picker.lsp_declarations()<cr>", desc = "D[E]clarations" },
			i = { cmd = "<cmd>lua Snacks.picker.lsp_implementations()<cr>", desc = "[I]mplementations" },
			r = { cmd = "<cmd>lua Snacks.picker.lsp_references()<cr>", desc = "[R]eferences" },
			s = {
				desc = "[S]ymbols",
				d = { cmd = "<cmd>lua Snacks.picker.lsp_symbols()<cr>", desc = "[D]ocument" },
				w = { cmd = "<cmd>lua Snacks.picker.lsp_workspace_symbols()<cr>", desc = "[W]orkspace" },
			},
		},
		j = { cmd = "<cmd>lua Snacks.picker.jumps()<cr>", desc = "[J]ump" },
		w = {
			desc = "[W]ords",
			c = { cmd = "<cmd>lua Snacks.picker.grep_buffers()<cr>", desc = "[C]urrent" },
			C = { cmd = "<cmd>lua Snacks.picker.grep_word()<cr>", desc = "[C]ursor" },
		},
		r = { cmd = "<cmd>lua Snacks.picker.registers()<cr>", desc = "[R]egisters" },
		R = { cmd = "<cmd>lua Snacks.picker.resume()<cr>", desc = "[R]esume" },
		s = { cmd = "<cmd>lua Snacks.picker.spelling()<cr>", desc = "[S]pell" },
		S = {
			desc = "[S]earch",
			h = { cmd = "<cmd>lua Snacks.picker.search_history()<cr>", desc = "[H]istory" },
		},
	},
}

M.hydra = {
	name = "[T]oggle",
	mode = "n",
	body = "<leader><leader>l",
	config = {
		color = "pink",
		hint = {
			type = "window",
			position = "bottom-right",
			invoke_on_body = true,
		},
	},
	hint = " _n_  [N]umber \n _r_  [R]elative ",
	heads = {
		{ "n", "<cmd>set number!<cr>", { desc = "Number" } },
		{ "r", "<cmd>set relativenumber!<cr>", { desc = "Relative" } },
	},
}

return M
