local mason_lspconfig = require("mason-lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local lsp_config = require("lspconfig")
local lang = require("rumman.lib.lang")

mason_lspconfig.setup({
	automatic_installation = true,
	handlers = {
		function(server_name)
			local server_configs = lang.lsp_settings.server_settings[server_name] or {}

			lsp_config[server_name].setup({

				capabilities = vim.tbl_deep_extend(
					"force",
					lang.lsp_settings.nvim_capabilities,
					cmp_nvim_lsp.default_capabilities()
				),

				on_attach = lang.lsp_settings.on_attach,
				settings = server_configs.settings,
				on_init = server_configs.on_init,
				autostart = server_configs.autostart,
				cmd = server_configs.cmd,
				filetypes = server_configs.filetypes,
				root_dir = server_configs.root_dir,

				handlers = vim.tbl_deep_extend(
					"force",
					lang.lsp_settings.default_handlers,
					server_configs.handlers or {}
				),

			})
		end,
	},
})

