local M = {}

M.dependencies = {
	"williamboman/mason.nvim",
	"mfussenegger/nvim-dap",
}

M.config = function()
	local mason_nvim_dap = require("mason-nvim-dap")

	mason_nvim_dap.setup({
		handlers = {
			function(config)
				mason_nvim_dap.default_setup(config)
			end,
		},
	})
end

return M
