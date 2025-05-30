-- local lspattach_bufs = {}
-- vim.api.nvim_create_autocmd({ "LspAttach" }, {
-- 	callback = function(lspattach)
-- 		local current_buf = vim.api.nvim_get_current_buf()
-- 		table.insert(lspattach_bufs, lspattach.buf)
--
-- 		if current_buf == lspattach.buf then
-- 			require("which-key").add({
-- 				hidden = false,
-- 				{ "<c-space>n", "", desc = "Local 1" },
-- 				{ "<c-space>m", "", desc = "Local 2" },
-- 			})
-- 			require("which-key").add({
-- 				hidden = true,
-- 				{ "<c-space><c-space>", "", desc = "Lsp keymaps" },
-- 			})
-- 		end
-- 	end
-- })
--
-- vim.api.nvim_create_autocmd({ "BufEnter" }, {
-- 	callback = function(bufenter)
-- 		local found = false
--
-- 		for _, value in ipairs(lspattach_bufs) do
-- 			if bufenter.buf == value then
-- 				found = true
-- 				require("which-key").add({
-- 					hidden = false,
-- 					{ "<c-space>n", "", desc = "Local 1" },
-- 					{ "<c-space>m", "", desc = "Local 2" },
-- 				})
-- 				require("which-key").add({
-- 					hidden = true,
-- 					{ "<c-space><c-space>", "", desc = "Lsp keymaps" },
-- 				})
-- 				break
-- 			end
-- 		end
--
-- 		if not found then
-- 				require("which-key").add({
-- 					hidden = true,
-- 					{ "<c-space>n", "", desc = "Local 1" },
-- 					{ "<c-space>m", "", desc = "Local 2" },
-- 				})
-- 				require("which-key").add({
-- 					hidden = false,
-- 					{ "<c-space><c-space>", "", desc = "Lsp keymaps" },
-- 				})
-- 		end
-- 	end

-- })

-- dry code of above code
local function add_lsp_keymaps(hidden)
	require("which-key").add({
		hidden = hidden,
			{ "<c-space>c", desc = "Code" },
			{ "<c-space>ca", "<cmd> lua vim.lsp.buf.code_action() <cr>", desc = "Actions" },
			{ "<c-space>l", desc = "Lsp" },
			{ "<c-space>li", "<cmd> LspInfo <cr>", desc = "Info" },
			{ "<c-space>lI", "<cmd> LspInstall <cr>", desc = "Install" },
			{ "<c-space>lr", "<cmd> LspRestart <cr>", desc = "Restart" },
			{ "<c-space>ls", function()
				if #vim.lsp.get_clients() > 0 then
					vim.cmd("LspStop")
					vim.notify("Lsp stopped...")
				else
					vim.cmd("LspStart")
					vim.notify("Lsp started...")
				end
			end, desc = "Strat/Stop" },

			{ "<c-space>lc", "<cmd> lua =vim.lsp.get_clients()[1].server_capabilities <cr>", desc = "Server's capability" },
			{ "<c-space>r", "<cmd> lua vim.lsp.buf.rename() <cr>", desc = "Rename" },
			{ "<c-space>h", "<cmd> lua vim.lsp.buf.hover() <cr>", desc = "Hover" },


			-- { "<c-space>a", "<cmd> Telescope lsp_references <cr>", desc = "" },
			-- { "<c-space>b", "<cmd> lua vim.lsp.buf.declaration() <cr>", desc = "" },
			-- { "<c-space>c", "<cmd> lua vim.lsp.buf.definition() <cr>", desc = "" },
			-- { "<c-space>d", "<cmd> Telescope lsp_definitions <cr>", desc = "" },
			-- { "<c-space>e", "<cmd> Telescope lsp_implementations <cr>", desc = "" },
			-- { "<c-space>f", "<cmd> Telescope lsp_type_definitions <cr>", desc = "" },
			-- { "<c-space>i", "<cmd> Telescope diagnostics bufnr=0 <cr>", desc = "" },
			-- { "<c-space>j", "<cmd> lua vim.diagnostics.open_float() <cr>", desc = "" },
			-- { "<c-space>k", "<cmd> lua vim.diagnostics.goto_prev() <cr>", desc = "" },
			-- { "<c-space>l", "<cmd> lua vim.diagnostics.goto_next() <cr>", desc = "" },
			-- { "<c-space>o", "<cmd> lua vim.lsp.buf.implementation() <cr>", desc = "" },
			-- { "<c-space>p", "<cmd> lua vim.lsp.buf.references() <cr>", desc = "" },
			-- { "<c-space>q", "<cmd> lua vim.lsp.buf.format({ async = true }) <cr>", desc = "" },
			-- { "<c-space>t", "<cmd> lua vim.diagnostic.goto_next({buffer=0}) <cr>", desc = "" },
			-- { "<c-space>u", "<cmd> lua vim.diagnostic.goto_prev({buffer=0}) <cr>", desc = "" },
			-- { "<c-space>v", "<cmd> lua vim.lsp.buf.signature_help() <cr>", desc = "" },
			-- { "<c-space>w", "<cmd> lua vim.diagnostic.setloclist() <cr>", desc = "" },
			-- { "<c-space>x", "<cmd> lua vim.diagnostic.goto_next({ severity = vim.diagnostics.severity.error }) <cr>", desc = "" },
			-- { "<c-space>y", "<cmd> lua vim.diagnostic.goto_prev({ severity = vim.diagnostics.severity.error }) <cr>", desc = "" },
			-- { "<c-space>z", "<cmd> lua vim.diagnostic.goto_next({ severity = vim.diagnostics.severity.warn }) <cr>", desc = "" },
			-- { "<c-space>A", "<cmd> lua vim.diagnostic.goto_prev({ severity = vim.diagnostics.severity.warn }) <cr>", desc = "" },
			-- { "<c-space>B", "<cmd> lua vim.diagnostics.open_float({ border = 'rounded' }) <cr>", desc = "" },
			-- { "<c-space>C", "<cmd> lua vim.diagnostics.setqflist() <cr>", desc = "" },
	})
	require("which-key").add({
		hidden = not hidden,
		{ "<c-space><c-space>", "", desc = "Lsp specific keymaps" },
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











-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
-- 	callback = function (args)
-- 		local opts = { buffer = args.buf }
--
-- 		require("which-key").add({
-- 			{ "<c-space>a", "<cmd> Telescope lsp_references <cr>", desc = "", opts },
-- 			{ "<c-space>b", "<cmd> lua vim.lsp.buf.declaration() <cr>", desc = "", opts },
-- 			{ "<c-space>c", "<cmd> lua vim.lsp.buf.definition() <cr>", desc = "", opts },
-- 			-- { "<c-space>d", "<cmd> Telescope lsp_definitions <cr>", desc = "", opts },
-- 			-- { "<c-space>e", "<cmd> Telescope lsp_implementations <cr>", desc = "", opts },
-- 			-- { "<c-space>f", "<cmd> Telescope lsp_type_definitions <cr>", desc = "", opts },
-- 			-- { "<c-space>g", "<cmd> lua vim.lsp.buf.code_action() <cr>", desc = "", opts },
-- 			-- { "<c-space>h", "<cmd> lua vim.lsp.buf.rename() <cr>", desc = "", opts },
-- 			-- { "<c-space>i", "<cmd> Telescope diagnostics bufnr=0 <cr>", desc = "", opts },
-- 			-- { "<c-space>j", "<cmd> lua vim.diagnostics.open_float() <cr>", desc = "", opts },
-- 			-- { "<c-space>k", "<cmd> lua vim.diagnostics.goto_prev() <cr>", desc = "", opts },
-- 			-- { "<c-space>l", "<cmd> lua vim.diagnostics.goto_next() <cr>", desc = "", opts },
-- 			-- { "<c-space>m", "<cmd> lua vim.lsp.buf.hover() <cr>", desc = "", opts },
-- 			-- { "<c-space>n", "<cmd> LspRestart <cr>", desc = "", opts },
-- 			-- { "<c-space>o", "<cmd> lua vim.lsp.buf.implementation() <cr>", desc = "", opts },
-- 			-- { "<c-space>p", "<cmd> lua vim.lsp.buf.references() <cr>", desc = "", opts },
-- 			-- { "<c-space>q", "<cmd> lua vim.lsp.buf.format({ async = true }) <cr>", desc = "", opts },
-- 			-- { "<c-space>r", "<cmd> LspInfo <cr>", desc = "", opts },
-- 			-- { "<c-space>s", "<cmd> LspInstallInfo <cr>", desc = "", opts },
-- 			-- { "<c-space>t", "<cmd> lua vim.diagnostic.goto_next({buffer=0}) <cr>", desc = "", opts },
-- 			-- { "<c-space>u", "<cmd> lua vim.diagnostic.goto_prev({buffer=0}) <cr>", desc = "", opts },
-- 			-- { "<c-space>v", "<cmd> lua vim.lsp.buf.signature_help() <cr>", desc = "", opts },
-- 			-- { "<c-space>w", "<cmd> lua vim.diagnostic.setloclist() <cr>", desc = "", opts },
-- 			-- { "<c-space>x", "<cmd> lua vim.diagnostic.goto_next({ severity = vim.diagnostics.severity.error }) <cr>", desc = "", opts },
-- 			-- { "<c-space>y", "<cmd> lua vim.diagnostic.goto_prev({ severity = vim.diagnostics.severity.error }) <cr>", desc = "", opts },
-- 			-- { "<c-space>z", "<cmd> lua vim.diagnostic.goto_next({ severity = vim.diagnostics.severity.warn }) <cr>", desc = "", opts },
-- 			-- { "<c-space>A", "<cmd> lua vim.diagnostic.goto_prev({ severity = vim.diagnostics.severity.warn }) <cr>", desc = "", opts },
-- 			-- { "<c-space>B", "<cmd> lua vim.diagnostics.open_float({ border = 'rounded' }) <cr>", desc = "", opts },
-- 			-- { "<c-space>C", "<cmd> lua vim.diagnostics.setqflist() <cr>", desc = "", opts },
-- 		})
-- 	end
-- })
