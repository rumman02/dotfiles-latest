return {
	{
		"williamboman/mason.nvim",
		cmd = { "Mason" },
		config = function()
			local mason = require("mason")
			mason.setup({
				ui = {
					icons = {
						package_installed = " ",
						package_pending = "󱗽 ",
						package_uninstalled = " ",
					},
					border = "rounded",
					height = 0.8
				}
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{
				"williamboman/mason-lspconfig.nvim",
				dependencies = {
					"williamboman/mason.nvim",
				}
			},
			"hrsh7th/cmp-nvim-lsp", -- lsp completions
		},
		config = function()
			local mason_lspconfig =  require("mason-lspconfig")
			local servers = require("plugin.main.setting.server") -- all server settings (local file)
			local lsp_config = require("lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local capabilities = vim.tbl_deep_extend("force", servers.nvim_capabilities, cmp_nvim_lsp.default_capabilities())

			-- mason lspconfig settings
			mason_lspconfig.setup({
				ensure_installed = servers.servers,
				automatic_installation = true
			})

			-- lsp servers settings
			mason_lspconfig.setup_handlers({
				function(server_name)
					local server_configs = servers.server_settings[server_name] or {}
					lsp_config[server_name].setup({
						capabilities = capabilities,
						settings = server_configs.settings,
						on_init = server_configs.on_init,
						autostart = server_configs.autostart,
						cmd = server_configs.cmd,
						on_attach = servers.on_attach,
						filetypes = server_configs.filetypes,
						root_dir = server_configs.root_dir,
						handlers = vim.tbl_deep_extend("force", servers.default_handlers, server_configs.handlers or {})
					})
				end,
			})
		end
	}
}
