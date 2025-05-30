local mason_tool_installer = require("mason-tool-installer")
local servers = require("rumman.lib.lang").servers

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

mason_tool_installer.setup({
	ensure_installed = all_in_one,
	auto_update = true,
	run_on_start = true,
	start_delay = 3000,
	debounce_hours = 5,
})

local mason = require("mason")
local icons = require("rumman.lib.icons")
local utils = require("rumman.lib.utils")

mason.setup({
	ui = {
		icons = {
			package_installed = icons.ui.Check,
			package_pending = icons.ui.Pending,
			package_uninstalled = icons.ui.CircleAlt,
		},
		border = {
			icons.ui.BorderTopLeft,
			icons.ui.BorderTop,
			icons.ui.BorderTopRight,
			icons.ui.BorderRight,
			icons.ui.BorderBottomRight,
			icons.ui.BorderBottom,
			icons.ui.BorderBottomLeft,
			icons.ui.BorderLeft,
		},
		width = utils.ui.width,
		height = utils.ui.height,
	},
})

