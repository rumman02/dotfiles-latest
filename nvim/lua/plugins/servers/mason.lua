local mason = function()
	local utils = require("lib.utils")
	return {
		"mason-org/mason.nvim",
		enabled = require("plugins.controller").servers.mason,
		cmd = { "Mason" },
		opts = {
			ui = {
				icons = {
					package_installed = "󰗠 ",
					package_pending = "󱥸 ",
					package_uninstalled = "󰄯 ",
				},
				border = utils.ui.border,
				backdrop = utils.ui.float.backdrop,
				width = utils.ui.float.width,
				height = utils.ui.float.height,
			},
		},
	}
end

return {
	mason(),
}
