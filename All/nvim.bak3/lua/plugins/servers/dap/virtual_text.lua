return {
	"theHamsta/nvim-dap-virtual-text",
	enabled = require("plugins.controller").servers.dap.virtual_text,
	config = function()
		require("nvim-dap-virtual-text").setup()
	end,
}
