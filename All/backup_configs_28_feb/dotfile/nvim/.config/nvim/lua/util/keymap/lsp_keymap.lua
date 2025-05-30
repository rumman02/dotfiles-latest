require("which-key").add({
		{ LSPLEADER, group = "Lsp" },
		{
			hidden = true,
			cond = true,
			{ "K", "<Nop>" }
		}
})

local function add_lsp_keymaps(hidden)
	require("which-key").add({
		hidden = hidden,
		{ LSPLEADER .. "c", desc = "Code" },
		{ LSPLEADER .. "ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Actions" },
		{ LSPLEADER .. "l", desc = "Lsp" },
		{ LSPLEADER .. "li", "<cmd>LspInfo<cr>", desc = "Info" },
		{ LSPLEADER .. "lI", "<cmd>LspInstall<cr>", desc = "Install" },
		{ LSPLEADER .. "lr", "<cmd>LspRestart<cr>", desc = "Restart" },
		{ LSPLEADER .. "ls", function()
			if #vim.lsp.get_clients() > 0 then
				vim.cmd("LspStop")
				vim.notify("Lsp stopped...")
			else
				vim.cmd("LspStart")
				vim.notify("Lsp started...")
			end
		end, desc = "Strat/Stop" },
		{ LSPLEADER .. "lc", "<cmd>lua =vim.lsp.get_clients()[1].server_capabilities<cr>", desc = "Server's capability" },
		{ LSPLEADER .. "r", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
		{ LSPLEADER .. "h", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover" },

		{ LSPLEADER .. "f", desc = "Find" },
		{ LSPLEADER .. "fr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
		{ LSPLEADER .. "fs", "<cmd>Telescope lsp_definitions<cr>", desc = "Definitions" },
		{ LSPLEADER .. "fi", "<cmd>Telescope lsp_implementations<cr>", desc = "Implementations" },
		{ LSPLEADER .. "ft", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Type definitions" },

		{ LSPLEADER .. "fd", desc = "Diagnostic" },
		{ LSPLEADER .. "fda", "<cmd>Telescope diagnostics<cr>", desc = "All" },
		{ LSPLEADER .. "fdc", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Current" },
		--
		-- { LSPLEADER .. "", "<cmd> lua vim.lsp.buf.declaration() <cr>", desc = "" },
		-- { LSPLEADER .. "", "<cmd> lua vim.lsp.buf.definition() <cr>", desc = "" },
		-- { LSPLEADER .. "", "<cmd> lua vim.diagnostics.open_float() <cr>", desc = "" },
		-- { LSPLEADER .. "", "<cmd> lua vim.diagnostics.goto_prev() <cr>", desc = "" },
		-- { LSPLEADER .. "", "<cmd> lua vim.diagnostics.goto_next() <cr>", desc = "" },
		-- { LSPLEADER .. "", "<cmd> lua vim.lsp.buf.implementation() <cr>", desc = "" },
		-- { LSPLEADER .. "", "<cmd> lua vim.lsp.buf.references() <cr>", desc = "" },
		-- { LSPLEADER .. "", "<cmd> lua vim.lsp.buf.format({ async = true }) <cr>", desc = "" },
		--
		-- { LSPLEADER .. "", "<cmd> lua vim.diagnostic.goto_next({buffer=0}) <cr>", desc = "" },
		-- { LSPLEADER .. "", "<cmd> lua vim.diagnostic.goto_next({ severity = vim.diagnostics.severity.warn }) <cr>", desc = "" },
		-- { LSPLEADER .. "", "<cmd> lua vim.diagnostic.goto_next({ severity = vim.diagnostics.severity.error }) <cr>", desc = "" },
		--
		-- { LSPLEADER .. "", "<cmd> lua vim.diagnostic.goto_prev({buffer=0}) <cr>", desc = "" },
		-- { LSPLEADER .. "", "<cmd> lua vim.diagnostic.goto_prev({ severity = vim.diagnostics.severity.error }) <cr>", desc = "" },
		-- { LSPLEADER .. "", "<cmd> lua vim.diagnostic.goto_prev({ severity = vim.diagnostics.severity.warn }) <cr>", desc = "" },
		--
		-- { LSPLEADER .. "", "<cmd> lua vim.lsp.buf.signature_help() <cr>", desc = "" },
		-- { LSPLEADER .. "", "<cmd> lua vim.diagnostic.setloclist() <cr>", desc = "" },
		--
		-- { LSPLEADER .. "", "<cmd> lua vim.diagnostics.open_float({ border = 'rounded' }) <cr>", desc = "" },
		-- { LSPLEADER .. "", "<cmd> lua vim.diagnostics.setqflist() <cr>", desc = "" },

		-- lsp_incoming_calls
		-- lsp_outgoing_calls
		-- lsp_document_symbols
		-- lsp_workspace_symbols
		-- lsp_dynamic_workspace_symbols

	})
	require("which-key").add({
		hidden = not hidden,
		{ LSPLEADER .. LSPLEADER, desc = "Lsp specific keymaps" },
	})
end

local lspattach_bufs = {}
vim.api.nvim_create_autocmd({ "LspAttach" }, {
	callback = function(lspattach)
		local current_buf = vim.api.nvim_get_current_buf()
		table.insert(lspattach_bufs, lspattach.buf)

		if current_buf == lspattach.buf then
			add_lsp_keymaps(false)
		end
	end
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	callback = function(bufenter)
		local found = false

		for _, value in ipairs(lspattach_bufs) do
			if bufenter.buf == value then
				found = true
				break
			end
		end

		add_lsp_keymaps(not found)
	end
})
