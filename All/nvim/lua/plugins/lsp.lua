return {
	{
		"neovim/nvim-lspconfig",
		enabled = require("plug_controller").lsp.nvim_lsp,
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		dependencies = "mason-org/mason-lspconfig.nvim",
		opts = {},
		config = function(_, opts)
			local lsp = vim.lsp

			lsp.config("*", {
				capabilities = {
					textDocument = {
						semanticTokens = {
							multilineTokenSupport = true,
						},
					},
				},
				root_markers = { ".git" },
			})

			lsp.config["lua_ls"] = {
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
			}
		end,
	},
}
