return {
	"stevearc/conform.nvim",
	enabled = require("plugins.controller").servers.format.conform,
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	dependencies = {
		require("plugins.servers.format.mason_conform"),
	},
	opts = function()
		local default_formatter = "fallback"

		return {
			default_format_opts = {
				lsp_format = default_formatter,
			},
			format_on_save = {
				lsp_format = default_formatter,
				timeout_ms = 500,
			},
			format_after_save = {
				lsp_format = default_formatter,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				-- python = { "isort", "black" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier" },
				javascriptreact = { "prettierd", "prettier" },
				-- java = { "google-java-format" },
				typescriptreact = { "prettierd", "prettier" },
				-- rust = { "rustfmt", lsp_format = "fallback" },
				json = { "prettierd", "prettier" },
				yaml = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				markdown = { "prettierd", "prettier" },
				sh = { "shfmt" },
				-- go = { "gofmt", "goimports" },
				-- toml = { "taplo" },
				nix = { "nixfmt" },
			},
		}
	end,
}
