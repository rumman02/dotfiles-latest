local M = {}

M.event = {
	"BufReadPre",
	"BufNewFile",
}

if pcall(require, "blink.cmp") == true then
	M.dependencies = {
		"saghen/blink.cmp",
		"williamboman/mason-lspconfig.nvim",
	}
elseif pcall(require, "cmp") == true then
	M.dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"williamboman/mason-lspconfig.nvim",
	}
end

M.config = function()
	local icons = require("lib.icons")
	local border = {
		icons.ui.border.top.left,
		icons.ui.border.horizontal,
		icons.ui.border.top.right,
		icons.ui.border.vertical,
		icons.ui.border.bottom.right,
		icons.ui.border.horizontal,
		icons.ui.border.bottom.left,
		icons.ui.border.vertical,
	}

	local servers = {
		lua_ls = {
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					diagnostics = {
						globals = {
							"vim",
							"Snacks",
						},
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
					},
					telemetry = {
						enable = false,
					},
				},
			},
		},
	}

	local lspconfig = require("lspconfig")

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
			border = border,
		}),
		["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
			border = border,
		}),
	}

	require("mason-lspconfig").setup({
		-- automatic_installation = true,
		handlers = {
			function(server_name)
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
	})

	vim.fn.sign_define("DiagnosticSignError", { text = icons.diagnostics.error, texthl = "DiagnosticSignError" })
	vim.fn.sign_define("DiagnosticSignWarn", { text = icons.diagnostics.warn, texthl = "DiagnosticSignWarn" })
	vim.fn.sign_define("DiagnosticSignInfo", { text = icons.diagnostics.info, texthl = "DiagnosticSignInfo" })
	vim.fn.sign_define("DiagnosticSignHint", { text = icons.diagnostics.hint, texthl = "DiagnosticSignHint" })

	vim.diagnostic.config({
		virtual_text = true,
		signs = false,
		underline = true,
		update_in_insert = false,
		severity_sort = false,
		float = {
			-- border = true,
			source = true,
			header = "",
			prefix = "",
		},
	})
end

return M
