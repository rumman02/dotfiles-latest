local M = {}
local icons = require("lib.icons")
local utils = require("lib.utils")

-- mason ui
M.mason_opts = {
	ui = {
		icons = {
			package_installed = icons.md_icons.others.loaded,
			package_pending = icons.md_icons.others.pending,
			package_uninstalled = icons.md_icons.others.not_loaded,
		},
		border = utils.ui.border,
		width = utils.ui.width,
		height = utils.ui.height,
	},
}

-- mason tool installer
M.mason_tool_installer_opts = function()
	local servers = {
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
			-- "js-debug-adapter",
			-- "chrome-debug-adapter",
			-- "firefox-debug-adapter",
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
	}

	local all_in_one = {}
	for _, server in ipairs(servers.lsp) do
		table.insert(all_in_one, server)
	end
	for _, server in ipairs(servers.dap) do
		table.insert(all_in_one, server)
	end
	for _, server in ipairs(servers.formatter) do
		table.insert(all_in_one, server)
	end
	for _, server in ipairs(servers.linter) do
		table.insert(all_in_one, server)
	end

	return {
		ensure_installed = all_in_one,
		auto_update = true,
		run_on_start = true,
		start_delay = 3000,
		debounce_hours = 5,
	}
end

-- mason lsp config
M.mason_lspconfig_opts = {}

-- lsp configs
M.opts = {}

M.config = function()
	local nvim_capabilities = vim.lsp.protocol.make_client_capabilities()
	nvim_capabilities.textDocument.completion.completionItem.snippetSupport = true
	nvim_capabilities.textDocument.foldingRange = {
		dynamicRegistration = false,
		lineFoldingOnly = true,
	}

	---@diagnostic disable-next-line: unused-local
	local on_attach = function(client, bufnr)
		---@diagnostic disable-next-line: empty-block
		if client.supports_method("textDocument/documentSymbol") then
			---@diagnostic disable-next-line: empty-block
			-- 	require("nvim-navic").attach(client, bufnr)
		end
	end

	local default_handlers = {
		["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			border = utils.ui.border,
		}),
		["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
			border = utils.ui.border,
		}),
	}

	local server_settings = {
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
	}

	require("mason-lspconfig").setup({
		ensure_installed = {},
		automatic_installation = true,
		handlers = {
			function(server_name)
				local server_configs = server_settings[server_name] or {}

				require("lspconfig")[server_name].setup({
					capabilities = vim.tbl_deep_extend("force", nvim_capabilities, require("blink.cmp").get_lsp_capabilities()), -- for blink cmp
					-- capabilities = vim.tbl_deep_extend( "force", nvim_capabilities, require("cmp_nvim_lsp").default_capabilities()), -- for nvim-cmp
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

	-- set symbols of diagnostics
	-- diagnostics
	vim.fn.sign_define("DiagnosticSignError", { text = icons.md_icons.diagnostics.error, texthl = "DiagnosticSignError" })
	vim.fn.sign_define("DiagnosticSignWarn", { text = icons.md_icons.diagnostics.warn, texthl = "DiagnosticSignWarn" })
	vim.fn.sign_define("DiagnosticSignInfo", { text = icons.md_icons.diagnostics.info, texthl = "DiagnosticSignInfo" })
	vim.fn.sign_define("DiagnosticSignHint", { text = icons.md_icons.diagnostics.hint, texthl = "DiagnosticSignHint" })

	vim.diagnostic.config({
		virtual_text = false,
		signs = false,
		underline = true,
		update_in_insert = false,
		severity_sort = false,
		float = {
			---@diagnostic disable-next-line: assign-type-mismatch
			border = utils.ui.border,
			source = true,
			header = "",
			prefix = "",
		},
	})


	local diagnostic_goto = function(next, severity)
		local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
		severity = severity and vim.diagnostic.severity[string.upper(severity)] or nil
		return function()
			go({ severity = severity })
		end
	end

	---@diagnostic disable-next-line: unused-local
	local lint_autocmd_id = nil
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function()
			local func = require("lib.func")
			local map = func.map
			local lsp_leader = require("lib.keys").lsp_leader

			map(0, { "n" }, "[d", diagnostic_goto(true), { desc = "Diagnostic", buffer = true})
			map(0, { "n" }, "]d", diagnostic_goto(false), { desc = "Diagnostic", buffer = true})
			map(0, { "n" }, "[e", diagnostic_goto(true, "error"), { desc = "Error", buffer = true})
			map(0, { "n" }, "]e", diagnostic_goto(false, "error"), { desc = "Error", buffer = true})
			map(0, { "n" }, "[i", diagnostic_goto(true, "info"), { desc = "Info", buffer = true})
			map(0, { "n" }, "]i", diagnostic_goto(false, "info"), { desc = "Info", buffer = true})
			map(0, { "n" }, "[w", diagnostic_goto(true, "warn"), { desc = "Warn", buffer = true})
			map(0, { "n" }, "]w", diagnostic_goto(false, "warn"), { desc = "Warn", buffer = true})
			map(0, { "n" }, "[h", diagnostic_goto(true, "hint"), { desc = "Hint", buffer = true})
			map(0, { "n" }, "]h", diagnostic_goto(false, "hint"), { desc = "Hint", buffer = true})

			map(2, { "n" }, lsp_leader, "", { desc = "Lsp", buffer = true})
			map(0, { "n" }, lsp_leader .. "c",  "", { desc = "Code", buffer = true })
			map(0, { "n" }, lsp_leader .. "l",  "", { desc = "Lsp", buffer = true })
			map(0, { "n" }, lsp_leader .. "f",  "", { desc = "Find", buffer = true })

			map(0, { "n" }, lsp_leader .. "fd", "", { desc = "Diagnostic", buffer = true })
			map(0, { "n" }, lsp_leader .. "ca", vim.lsp.buf.code_action, { desc = "Actions", buffer = true})
			map(0, { "n" }, lsp_leader .. "r", vim.lsp.buf.rename, { desc = "Rename", buffer = true})
			map(0, { "n" }, lsp_leader .. "h", vim.lsp.buf.hover, { desc = "Hover", buffer = true})

			map(0, { "n" }, lsp_leader .. "F", vim.diagnostic.open_float, { desc = "Next diag", buffer = true})
			map(0, { "n" }, lsp_leader .. "d", function () func.diagnostic_goto(true) end, { desc = "Next diag", buffer = true})
			map(0, { "n" }, lsp_leader .. "D", function () func.diagnostic_goto(false) end, { desc = "Previous diag", buffer = true})
			map(0, { "n" }, lsp_leader .. "e", function () func.diagnostic_goto(true, "error") end, { desc = "Next error", buffer = true})
			map(0, { "n" }, lsp_leader .. "E", function () func.diagnostic_goto(false, "error") end, { desc = "Previous error", buffer = true})
			map(0, { "n" }, lsp_leader .. "w", function () func.diagnostic_goto(true, "warn") end, { desc = "Next warn", buffer = true})
			map(0, { "n" }, lsp_leader .. "W", function () func.diagnostic_goto(false, "warn") end, { desc = "Previous warn", buffer = true})
			map(0, { "n" }, lsp_leader .. "h", function () func.diagnostic_goto(true, "hint") end, { desc = "Next hint", buffer = true})
			map(0, { "n" }, lsp_leader .. "H", function () func.diagnostic_goto(false, "hint") end, { desc = "Previous hint", buffer = true})
			map(0, { "n" }, lsp_leader .. "i", function () func.diagnostic_goto(true, "info") end, { desc = "Next info", buffer = true})
			map(0, { "n" }, lsp_leader .. "I", function () func.diagnostic_goto(false, "info") end, { desc = "Previous info", buffer = true})

			-- map(0, { "n" }, linter_leader, "", { desc = "Linter", buffer = true })
			-- map(0, { "n" }, linter_leader .. "t", function() if not lint_autocmd_id then lint_autocmd_id = vim.api.nvim_create_autocmd("BufWritePost", { callback = function() require("lint").try_lint() end, group = vim.api.nvim_create_augroup("LintAutocmdGroup", { clear = true }), }) vim.notify("Linting enabled on BufWritePost", vim.log.levels.INFO) else vim.notify("Linting is already enabled", vim.log.levels.WARN) end end, { desc = "Enable lint (After save)", buffer = true })
			-- map(0, { "n" }, linter_leader .. "x", function() if lint_autocmd_id then vim.api.nvim_del_autocmd(lint_autocmd_id) lint_autocmd_id = nil vim.notify("Linting disabled on BufWritePost", vim.log.levels.INFO) else vim.notify("Linting is already disabled", vim.log.levels.WARN) end end, { desc = "Disable lint (After save)", buffer = true })
			-- map(0, { "n" }, linter_leader .. "c", function() require("lint").try_lint() end, { desc = "Current check", buffer = true })
			--
			-- map(0, { "n", "v" }, formatter_leader .. "z", function() require("conform").format({ lsp_fallback = true, async = true, timeout_ms = 500, }) end, { desc = "Format by conform", buffer = true })
			-- map(0, { "n", "v" }, formatter_leader .. "Z", vim.lsp.buf.format, { desc = "Format by lsp", buffer = true })
			--
			map(0, { "n" }, lsp_leader .. "li", "<cmd>LspInfo<cr>", { desc = "Info", buffer = true })
			map(0, { "n" }, lsp_leader .. "lI", "<cmd>LspInstall<cr>", { desc = "Install", buffer = true })
			map(0, { "n" }, lsp_leader .. "lr", "<cmd>LspRestart<cr>", { desc = "Restart", buffer = true })
			map(0, { "n" }, lsp_leader .. "ls", function() if #vim.lsp.get_clients() > 0 then vim.cmd("LspStop") vim.notify("Lsp stopped...") else vim.cmd("LspStart") vim.notify("Lsp started...") end end, { desc = "Strat/Stop", buffer = true })
			map(0, { "n" }, lsp_leader .. "lc", "<cmd>lua =vim.lsp.get_clients()[1].server_capabilities<cr>", { desc = "Server's capability", buffer = true })

			map(2, { "n" }, lsp_leader .. "a", "", { buffer = true, hidden = true })
			map(2, { "n" }, lsp_leader .. "<esc>", "", { buffer = true, hidden = true })
			map(2, { "n" }, lsp_leader .. "fo", "", { buffer = true, hidden = true })
			map(2, { "n" }, lsp_leader .. "s", "", { buffer = true, hidden = true })
			map(2, { "n" }, lsp_leader .. "<cr>", "", { buffer = true, hidden = true })
			map(2, { "n" }, lsp_leader .. "<s-cr>", "", { buffer = true, hidden = true })
			map(2, { "n" }, lsp_leader .. "<tab>", "", { buffer = true, hidden = true })
			map(2, { "n" }, lsp_leader .. "<s-tab>", "", { buffer = true, hidden = true })
		end,
	})


end

return M
