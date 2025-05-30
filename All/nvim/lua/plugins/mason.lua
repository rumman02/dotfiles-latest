return {
	{
		"mason-org/mason.nvim",
		enabled = require("plug_controller").mason.mason,
		cmd = "Mason",
		opts = function()
			local icons = require("lib.icons")
			return {
				ui = {
					icons = {
						package_installed = icons.plugin.loaded,
						package_pending = icons.plugin.pending,
						package_uninstalled = icons.plugin.not_loaded,
					},
				},
			}
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		enabled = require("plug_controller").mason.tool_installer,
		event = "VeryLazy",
		dependencies = "williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"lua-language-server",
				"typescript-language-server",
				"nil",
				"jdtls",
				"bash-language-server",
				"css-lsp",
				"html-lsp",
				"emmet-language-server",

				"bash-debug-adapter",
				"chrome-debug-adapter",
				"firefox-debug-adapter",
				"java-debug-adapter",
				"java-test",
				"js-debug-adapter",
				"mockdebug",
				"node-debug2-adapter",

				"eslint_d",
				"luacheck",
				"pylint",
				"shellcheck",

				"black",
				"goimports",
				"google-java-format",
				"isort",
				"nixfmt",
				"prettier",
				"prettierd",
				"shfmt",
				"stylua",
			},
			integrations = {
				["mason-lspconfig"] = false,
				["mason-conform"] = false,
				["mason-nvim-dap"] = false,
				["mason-nvim-lint"] = false,
			},
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		enabled = require("plug_controller").mason.mason_lsp,
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		dependencies = "mason-org/mason.nvim",
		opts = {
			automatic_installed = true,
			automatic_enable = true,
			handlers = {
				function(server_name)
					local lspconfig = require("lspconfig")

					-- Base capabilities
					local capabilities = vim.lsp.protocol.make_client_capabilities()
					capabilities.textDocument.completion.completionItem.snippetSupport = true
					capabilities.textDocument.foldingRange = {
						dynamicRegistration = false,
						lineFoldingOnly = true,
					}

					-- Enhance with cmp capabilities
					local ok_blink, blink_cmp = pcall(require, "blink.cmp")
					local ok_cmp, cmp = pcall(require, "cmp_nvim_lsp")
					if ok_blink then
						capabilities = vim.tbl_deep_extend("force", capabilities, blink_cmp.get_lsp_capabilities())
					elseif ok_cmp then
						capabilities = vim.tbl_deep_extend("force", capabilities, cmp.default_capabilities())
					end

					-- Attach function
					local on_attach = function(client, bufnr)
						if client.supports_method("textDocument/documentSymbol") then
							-- require("nvim-navic").attach(client, bufnr)
						end
					end

					-- Default LSP handlers
					local default_handlers = {
						["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
						["textDocument/signatureHelp"] = vim.lsp.with(
							vim.lsp.handlers.signature_help,
							{ border = "rounded" }
						),
					}

					-- Server-specific configs (optional)
					local servers = {} -- you can populate this with per-server settings
					local server_configs = servers[server_name] or {}

					-- Final setup
					lspconfig[server_name].setup({
						capabilities = capabilities,
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
	},

	{
		"jay-babu/mason-nvim-dap.nvim",
		enabled = require("plug_controller").mason.mason_dap,
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		dependencies = "mason-org/mason.nvim",
		opts = {
			automatic_installation = false,
			handlers = {
				function(config)
					require("mason-nvim-dap").default_setup(config)
				end,
			},
		},
	},
	{
		"zapling/mason-conform.nvim",
		enabled = require("plug_controller").mason.mason_conform,
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		dependencies = "mason-org/mason.nvim",
		opts = {
			automatic_installation = false,
		},
	},
	{
		"rshkarin/mason-nvim-lint",
		enabled = require("plug_controller").mason.mason_lint,
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		dependencies = {
			"mason-org/mason.nvim",
		},
		opts = {
			automatic_installation = false,
		},
	},
}
