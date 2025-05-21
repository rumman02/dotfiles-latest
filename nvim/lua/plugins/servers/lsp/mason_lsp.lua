return {
	"mason-org/mason-lspconfig.nvim",
	enabled = require("plugins.controller").servers.lsp.mason_lsp,
	dependencies = {
		"mason-org/mason.nvim",
	},
	opts = {
		automatic_installation = false,
		automatic_enable = true,
		ensure_installed = {
			"lua_ls", -- lua
			"ts_ls", -- typescript
			-- "tailwindcss", -- tailwindcss
			-- "emmet_ls", -- emmet html
			"html", -- html
			"cssls", -- css, lass, scss
			-- "jsonls", -- json
			"nil_ls", -- nix
			"jdtls", -- java
		},
		handlers = {
			function(server_name)
				-- local capabilities = require("blink.cmp").get_lsp_capabilities()
				local lspconfig = require("lspconfig")
				--
				-- lspconfig["lua_ls"].setup({ capabilities = capabilities })

				--
				local nvim_capabilities = vim.lsp.protocol.make_client_capabilities()
				nvim_capabilities.textDocument.completion.completionItem.snippetSupport = true
				nvim_capabilities.textDocument.foldingRange = {
					dynamicRegistration = false,
					lineFoldingOnly = true,
				}

				local on_attach = function(client, bufnr)
					if client.supports_method("textDocument/documentSymbol") then
						-- 	require("nvim-navic").attach(client, bufnr)
					end
				end

				local default_handlers = {
					["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
						border = "rounded",
					}),
					["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
						border = "rounded",
					}),
				}

				local servers = {}

				local server_configs = servers[server_name] or {}

				local cmp_capabilities
				if pcall(require, "blink.cmp") == true then
					cmp_capabilities = require("blink.cmp").get_lsp_capabilities()
				elseif pcall(require, "cmp") == true then
					cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()
				end

				lspconfig[server_name].setup({
					-- capabilities = vim.tbl_deep_extend("force", nvim_capabilities, require("blink.cmp").get_lsp_capabilities()), -- for blink cmp
					-- capabilities = vim.tbl_deep_extend( "force", nvim_capabilities, require("cmp_nvim_lsp").default_capabilities()), -- for nvim-cmp
					capabilities = vim.tbl_deep_extend("force", nvim_capabilities, cmp_capabilities), --
					on_attach = on_attach,
					settings = server_configs.settings,
					on_init = server_configs.on_init,
					autostart = server_configs.autostart,
					cmd = server_configs.cmd,
					filetypes = server_configs.filetypes,
					root_dir = server_configs.root_dir,
					handlers = vim.tbl_deep_extend("force", default_handlers, server_configs.handlers or {}),
				})
			end,
		},
	},
}
