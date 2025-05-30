local formatters = require("rumman.lib.lang").servers.formatter

local none_ls = require("null-ls")
none_ls.setup({
	sources = (function()
		local sources = {}
		for _, formatter in ipairs(formatters) do
			local builtin = none_ls.builtins.formatting[formatter]
			if builtin then
				table.insert(sources, builtin)
			end
		end
		return sources
	end)(),
})

local mason_null_ls = require("mason-null-ls")
mason_null_ls.setup({
	automatic_installation = true,
	methods = {
		diagnostics = false,
		formatting = true,
		code_actions = true,
		completion = true,
		hover = true,
	},
	handlers = {
		-- Add specific handlers if needed; otherwise, default behavior applies
		function(source_name, methods)
			-- Use default setup for all tools
			require("mason-null-ls.automatic_setup")(source_name, methods)
		end,
	},
})

-- for conform
local conform = require("conform")
conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettier", "prettierd", stop_after_first = true },
		typescript = { "prettier", "prettierd", stop_after_first = true },
		javascriptreact = { "prettier", "prettierd", stop_after_first = true },
		typescriptreact = { "prettier", "prettierd", stop_after_first = true },
		html = { "prettier", "prettier", "htmlbeautifier", stop_after_first = true },
		css = { "prettier", "prettierd", stop_after_first = true },
		scss = { "prettier", "prettierd", stop_after_first = true },
		json = { "prettier", "prettierd", stop_after_first = true },
		yaml = { "prettier", "prettierd", "yamlfix", stop_after_first = true },
		markdown = { "prettier", "prettierd", stop_after_first = true },
		graphql = { "prettier", "prettierd", stop_after_first = true },
		python = { "isort ", "black", stop_after_first = false },
		svelte = { "prettier", "prettierd", stop_after_first = true },
		java = { "gogle-java-format" },
		kotlin = { "ktlint" },
		ruby = { "standardrb" },
		erb = { "htmlbeautifier" },
		bash = { "beautysh" },
		proto = { "buf" },
		rust = { "rustfmt" },
		toml = { "taplo" },
	},
})

