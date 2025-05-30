local icons = require("rumman.lib.icons")

local nvim_capabilities = vim.lsp.protocol.make_client_capabilities()
nvim_capabilities.textDocument.completion.completionItem.snippetSupport = true
nvim_capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

return {
	servers = {
		lsp = {
			"lua-language-server",
			"typescript-language-server",
			"tailwindcss-language-server",
			"emmet-language-server",
			"html-lsp",
			"css-lsp",
			"json-lsp",
		},
		dap = {
			"js-debug-adapter",
			"chrome-debug-adapter",
			"firefox-debug-adapter",
		},
		formatter = {
			"shfmt",
			"stylua",
			"prettier",
			"prettierd",
		},
		linter = {
			"eslint_d",
			"luacheck",
			"pylint",
			"shellcheck",
		},
	},
	treesitter = {
		ensure_installed = {
			"css",
			"git_config",
			"git_rebase",
			"gitattributes",
			"gitcommit",
			"gitignore",
			"html",
			"javascript",
			"json",
			"jsonc",
			"lua",
			"luadoc",
			"regex",
			"sql",
			"tmux",
			"toml",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
		}
	},
	lsp_settings = {
		nvim_capabilities = nvim_capabilities,
		default_handlers = {
			["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = {
					icons.ui.BorderTopLeft,
					icons.ui.BorderTop,
					icons.ui.BorderTopRight,
					icons.ui.BorderRight,
					icons.ui.BorderBottomRight,
					icons.ui.BorderBottom,
					icons.ui.BorderBottomLeft,
					icons.ui.BorderLeft,
				}
			}),
			["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
				border = {
					icons.ui.BorderTopLeft,
					icons.ui.BorderTop,
					icons.ui.BorderTopRight,
					icons.ui.BorderRight,
					icons.ui.BorderBottomRight,
					icons.ui.BorderBottom,
					icons.ui.BorderBottomLeft,
					icons.ui.BorderLeft,
				}
			}),
		},
		server_settings = {
			lua_ls = {
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},
						diagnostics = {
							globals = { "vim", "Snacks" },
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
		},
		on_attach = function(client, bufnr)
			-- if client.supports_method("textDocument/documentSymbol") then
			-- 	require("nvim-navic").attach(client, bufnr)
			-- end
		end,
	},
	dap_settings = {
		js_based_languages = {
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
			"vue",
		}
	}
}

