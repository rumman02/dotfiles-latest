local M = {}

M.opts = {}

M.config = function()
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function()
			local func = require("lib.func")
			local map = func.map
			local trouble_leader = require("lib.keys").trouble_leader

			map(0, { "n" }, trouble_leader, "", { desc = "Trouble", buffer = true })
			map(0, { "n" }, trouble_leader .. "T", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Toggle (current)", buffer = true })
			map(0, { "n" }, trouble_leader .. "t", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Toggle (all)", buffer = true })
			map(0, { "n" }, trouble_leader .. "s", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols", buffer = true })
			map(0, { "n" }, trouble_leader .. "r", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "Lsp dev / ref", buffer = true })
			map(0, { "n" }, trouble_leader .. "l", "<cmd>Trouble loclist toggle<cr>", { desc = "Loc List", buffer = true })
			map(0, { "n" }, trouble_leader .. "q", "<cmd>Trouble qflist toggle<cr>", { desc = "Qf List", buffer = true })
		end
	})
end

M.keys = function()
	return {}
end


return M
