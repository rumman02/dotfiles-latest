local M = {}

M.servers = {
	"lua_ls",
	-- "ts_ls",
	-- "html"
}

M.default_handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}

M.nvim_capabilities = vim.lsp.protocol.make_client_capabilities()
M.nvim_capabilities.textDocument.completion.completionItem.snippetSupport = true


M.server_settings = {
	lua_ls = {
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT"
				},
				diagnostics = {
					globals = { "vim" }
				},
				-- workspace = {
				-- 	library = vim.api.nvim_get_runtime_file("", true)
				-- },
				telemetry = {
					enable = false
				}
			}
		}
	}
}

---@diagnostic disable-next-line: unused-local
M.on_attach = function (client, bufnr)
	-- if client.name == "ts_ls" then
	-- 	client.server_capabilities.documentFormattingProvider = true
	-- end
end

return M
