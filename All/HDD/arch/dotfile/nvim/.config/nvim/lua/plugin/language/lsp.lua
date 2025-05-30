-- https://github.com/neovim/nvim-lspconfig
return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{
			-- https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#default-configuration
			"williamboman/mason-lspconfig.nvim",
			dependencies = {
				{
					-- https://github.com/williamboman/mason.nvim?tab=readme-ov-file#default-configuration
					"williamboman/mason.nvim",
					cmd = { "Mason" },
					event = { "BufReadPre", "BufNewFile" },
					opts = {
						ui = {
							icons = {
								package_installed = " ",
								package_pending = "󱗽 ",
								package_uninstalled = " ",
							},
							border = "rounded",
							width = 0.7,
							height = 0.8
						}
					}
				}
			}
		}
	},
	config = function()
		local config = require("plugin.language.config.config")
		local mason_lspconfig =  require("mason-lspconfig")
		local lsp_config = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend("force", config.nvim_capabilities, cmp_nvim_lsp.default_capabilities())

		-- mason lspconfig settings
		mason_lspconfig.setup({
			ensure_installed = config.servers,
			automatic_installation = true
		})

		-- lsp servers settings
		mason_lspconfig.setup_handlers({
			function(server_name)
				local server_configs = config.server_settings[server_name] or {}
				lsp_config[server_name].setup({
					capabilities = capabilities,
					settings = server_configs.settings,
					on_init = server_configs.on_init,
					autostart = server_configs.autostart,
					cmd = server_configs.cmd,
					on_attach = config.on_attach,
					filetypes = server_configs.filetypes,
					root_dir = server_configs.root_dir,
					handlers = vim.tbl_deep_extend("force", config.default_handlers, server_configs.handlers or {})
				})
			end,
		})
	end
}
