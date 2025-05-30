--------------------------------------------------------------------- mason dap
local mason_nvim_dap = require("mason-nvim-dap")
mason_nvim_dap.setup({
	automatic_installation = true,
	handlers = {
		function(dap_name)
			-- Safe default setup for each DAP adapter
			local ok, err = pcall(mason_nvim_dap.default_setup, dap_name)
			if not ok then
				vim.notify("Failed to setup DAP adapter: " .. dap_name .. "\n" .. err, vim.log.levels.ERROR)
			end
		end,
	},
})


------------------------------------------------------------------------ dap ui
local dap = require("dap")
local dapui = require("dapui")
dapui.setup({})
dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end


-------------------------------------------------------------- dap virtual text
local virtual_text = require("nvim-dap-virtual-text")
virtual_text.setup({
	enabled = true,
	commented = true, -- Prefix virtual text with comment string
	only_first_definition = false, -- Show all variable definitions
	all_references = true, -- Show references as well
})


--------------------------------------------- dap config for js based languages
-- for javascript, typescript ...
-- this video is for help: https://youtu.be/Ul_WPhS2bis?si=h-F1UpgWICnqfn_N
local js_based_languages = require("rumman.lib.lang").dap_settings.js_based_languages
local dap_vscode_js = require("dap-vscode-js")
dap_vscode_js.setup({
	-- Path of node executable. Defaults to $NODE_PATH, and then "node"
	-- node_path = "node",

	-- Path to vscode-js-debug installation.
	debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),

	-- Command to use to launch the debug server. Takes precedence over "node_path" and "debugger_path"
	-- debugger_cmd = { "js-debug-adapter" },

	-- which adapters to register in nvim-dap
	adapters = {
		"chrome",
		"pwa-node",
		"pwa-chrome",
		"pwa-msedge",
		"node-terminal",
		"pwa-extensionHost",
		"node",
		"node-terminal",
	}
})

for _, language in ipairs(js_based_languages) do
	dap.configurations[language] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = vim.fn.getcwd(),
			sourceMaps = true,
		},
		-- Debug nodejs processes (make sure to add --inspect when you run the process)
		{
			type = "pwa-node",
			request = "attach",
			name = "Attach",
			processId = require("dap.utils").pick_process,
			cwd = vim.fn.getcwd(),
			sourceMaps = true,
		},
		-- Debug web applications (client side)
		{
			type = "pwa-chrome",
			request = "launch",
			name = "Launch & Debug Chrome",
			url = function()
				local co = coroutine.running()
				return coroutine.create(function()
					---@diagnostic disable-next-line: missing-fields
					vim.ui.input({
						prompt = "Enter URL: ",
						default = "http://localhost:3000",
					}, function(url)
						if url == nil or url == "" then
							return
						else
							coroutine.resume(co, url)
						end
					end)
				end)
			end,
			webRoot = vim.fn.getcwd(),
			protocol = "inspector",
			sourceMaps = true,
			userDataDir = false,
		},
		{
            name = "----- ↓ launch.json configs ↓ -----",
            type = "",
            request = "launch",
		}
	}
end


--------------------------------------------------- dap config for lua language
dap.adapters.nlua = function(callback, conf)
	local adapter = {
		type = "server",
		host = conf.host or "127.0.0.1",
		port = conf.port or 8086,
	}
	if conf.start_neovim then
		local dap_run = dap.run
		dap.run = function(c)
			adapter.port = c.port
			adapter.host = c.host
		end
		require("osv").run_this()
		dap.run = dap_run
	end
	callback(adapter)
end
dap.configurations.lua = {
	{
		type = "nlua",
		request = "attach",
		name = "Run this file",
		start_neovim = {},
	},
	{
		type = "nlua",
		request = "attach",
		name = "Attach to running Neovim instance (port = 8086)",
		port = 8086,
	},
}

