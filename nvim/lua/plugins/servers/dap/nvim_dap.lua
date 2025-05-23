return {
	"mfussenegger/nvim-dap",
	enabled = require("plugins.controller").servers.dap.nvim_dap,
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	dependencies = {
		require("plugins.servers.dap.mason_dap"),
		require("plugins.servers.dap.virtual_text"),
		require("plugins.servers.dap.ui"),
	},
	keys = {
		{ mode = { "n" }, "<leader>db", "<cmd>DapToggleBreakpoint<cr>", desc = "Toggle breakpoint" },
		{ mode = { "n" }, "<F1>", "<cmd>DapContinue<cr>", desc = "Continue/Start debugging" },
		{ mode = { "n" }, "<F2>", "<cmd>DapStepInto<cr>", desc = "Step into" },
		{ mode = { "n" }, "<F3>", "<cmd>DapStepOver<cr>", desc = "Step over" },
		{ mode = { "n" }, "<F4>", "<cmd>DapStepOut<cr>", desc = "Step out" },
		{ mode = { "n" }, "<F12>", "<cmd>DapTerminate<cr>", desc = "Terminate session" },
		{ mode = { "n" }, "<leader>dr", "<cmd>DapRestartFrame<cr>", desc = "Restart frame" },
	},
	config = function()
		-- local dap = require("dap")
		-- local dap_path = vim.fn.stdpath("data") .. "/mason/packages/"
		--
		-- --------------------------------------------------------------------------------
		-- ----------------------------------python----------------------------------------
		-- --------------------------------------------------------------------------------
		-- dap.adapters.python = function(cb, config)
		-- 	if config.request == "attach" then
		-- 		local port = (config.connect or config).port
		-- 		local host = (config.connect or config).host or "127.0.0.1"
		-- 		cb({
		-- 			type = "server",
		-- 			port = assert(port, "`connect.port` is required for a python `attach` configuration"),
		-- 			host = host,
		-- 			options = {
		-- 				source_filetype = "python",
		-- 			},
		-- 		})
		-- 	else
		-- 		cb({
		-- 			type = "executable",
		-- 			command = "python", -- Let Nix's environment handle the Python path
		-- 			args = { "-m", "debugpy.adapter" },
		-- 			options = {
		-- 				source_filetype = "python",
		-- 			},
		-- 		})
		-- 	end
		-- end
		--
		-- dap.configurations.python = {
		-- 	{
		-- 		type = "python",
		-- 		request = "launch",
		-- 		name = "Launch file",
		-- 		program = "${file}",
		-- 		pythonPath = function()
		-- 			local cwd = vim.fn.getcwd()
		-- 			if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
		-- 				return cwd .. "/venv/bin/python"
		-- 			elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
		-- 				return cwd .. "/.venv/bin/python"
		-- 			else
		-- 				-- Use the Python available in the Nix environment
		-- 				return "python"
		-- 			end
		-- 		end,
		-- 	},
		-- }
		--
		-- --------------------------------------------------------------------------------
		-- ------------------------------------cpp-----------------------------------------
		-- --------------------------------------------------------------------------------
		--
		-- --------------------------------------------------------------------------------
		-- -------------------------------------go-----------------------------------------
		-- --------------------------------------------------------------------------------
		-- dap.adapters.delve = function(callback, config)
		-- 	if config.mode == "remote" and config.request == "attach" then
		-- 		callback({
		-- 			type = "server",
		-- 			host = config.host or "127.0.0.1",
		-- 			port = config.port or "38697",
		-- 		})
		-- 	else
		-- 		callback({
		-- 			type = "server",
		-- 			port = "${port}",
		-- 			executable = {
		-- 				command = "dlv",
		-- 				args = { "dap", "-l", "127.0.0.1:${port}", "--log", "--log-output=dap" },
		-- 				detached = vim.fn.has("win32") == 0,
		-- 			},
		-- 		})
		-- 	end
		-- end
		--
		-- -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
		-- dap.configurations.go = {
		-- 	{
		-- 		type = "delve",
		-- 		name = "Debug",
		-- 		request = "launch",
		-- 		program = "${file}",
		-- 	},
		-- 	{
		-- 		type = "delve",
		-- 		name = "Debug test", -- configuration for debugging test files
		-- 		request = "launch",
		-- 		mode = "test",
		-- 		program = "${file}",
		-- 	},
		-- 	-- works with go.mod packages and sub packages
		-- 	{
		-- 		type = "delve",
		-- 		name = "Debug test (go.mod)",
		-- 		request = "launch",
		-- 		mode = "test",
		-- 		program = "./${relativeFileDirname}",
		-- 	},
		-- }
		--
		-- --------------------------------------------------------------------------------
		-- -------------------------------------js-----------------------------------------
		-- --------------------------------------------------------------------------------
		-- dap.adapters.node2 = {
		-- 	type = "executable",
		-- 	command = "node",
		-- 	args = { dap_path .. "node-debug2-adapter/out/src/nodeDebug.js" },
		-- }
		--
		-- dap.adapters.firefox = {
		-- 	type = "executable",
		-- 	command = "node",
		-- 	args = { dap_path .. "firefox-debug-adapter/dist/adapter.bundle.js" },
		-- }
		-- dap.adapters.chrome = {
		-- 	type = "executable",
		-- 	command = "node",
		-- 	args = { dap_path .. "chrome-debug-adapter/out/src/chromeDebug.js" },
		-- 	enrich_config = function(config, on_config)
		-- 		if chrome_path then
		-- 			config.runtimeExecutable = chrome_path
		-- 			-- Additional NixOS-specific Chrome flags
		-- 			config.runtimeArgs = config.runtimeArgs or {}
		-- 			vim.list_extend(config.runtimeArgs, {
		-- 				"--disable-gpu",
		-- 				"--no-first-run",
		-- 				"--no-default-browser-check",
		-- 			})
		-- 		end
		-- 		on_config(config)
		-- 	end,
		-- }
		--
		-- local shared_js_config = {
		-- 	--------------------------------node--------------------------------------------
		-- 	{
		-- 		name = "Launch",
		-- 		type = "node2",
		-- 		request = "launch",
		-- 		program = "${file}",
		-- 		cwd = vim.fn.getcwd(),
		-- 		sourceMaps = true,
		-- 		protocol = "inspector",
		-- 		console = "integratedTerminal",
		-- 	},
		-- 	{
		-- 		-- For this to work you need to make sure the node process is started with the `--inspect` flag.
		-- 		name = "Attach to process",
		-- 		type = "node2",
		-- 		request = "attach",
		-- 		processId = require("dap.utils").pick_process,
		-- 	},
		-- 	--------------------------------firefox-----------------------------------------
		-- 	{
		-- 		name = "Firefox: Debug (Standalone)",
		-- 		type = "firefox",
		-- 		request = "launch",
		-- 		reAttach = true,
		-- 		url = "http://localhost:3000",
		-- 		webRoot = "${workspaceFolder}",
		-- 		sourceMaps = true,
		-- 		pathMappings = {
		-- 			{
		-- 				url = "webpack:///./",
		-- 				path = "${workspaceFolder}/",
		-- 			},
		-- 		},
		-- 		firefoxArgs = {
		-- 			"--devtools", -- Auto-opens DevTools
		-- 			"--start-debugger-server", -- Required for debugging
		-- 			"--no-remote", -- Important for NixOS isolation
		-- 		},
		-- 		firefoxExecutable = function()
		-- 			local candidates = {
		-- 				-- NixOS/Linux paths (keep your existing NixOS paths first)
		-- 				vim.fn.exepath("firefox"),
		-- 				os.getenv("HOME") .. "/.nix-profile/bin/firefox",
		-- 				"/run/current-system/sw/bin/firefox",
		-- 				"${pkgs.firefox}/bin/firefox",
		--
		-- 				-- Windows paths
		-- 				"C:\\Program Files\\Mozilla Firefox\\firefox.exe",
		-- 				"C:\\Program Files (x86)\\Mozilla Firefox\\firefox.exe",
		--
		-- 				-- macOS paths
		-- 				"/Applications/Firefox.app/Contents/MacOS/firefox",
		-- 				"/Applications/Firefox Developer Edition.app/Contents/MacOS/firefox",
		--
		-- 				-- Last resort
		-- 				"/usr/bin/firefox",
		-- 				"firefox", -- Fallback to $PATH
		-- 			}
		--
		-- 			-- Platform-specific priority
		-- 			if vim.fn.has("win32") == 1 then
		-- 				table.insert(candidates, 1, "C:\\Program Files\\Mozilla Firefox\\firefox.exe")
		-- 			elseif vim.fn.has("mac") == 1 then
		-- 				table.insert(candidates, 1, "/Applications/Firefox.app/Contents/MacOS/firefox")
		-- 			end
		--
		-- 			for _, path in ipairs(candidates) do
		-- 				if path and vim.fn.executable(path) == 1 then
		-- 					return path
		-- 				end
		-- 			end
		-- 			return "firefox" -- Final fallback
		-- 		end,
		-- 	},
		-- 	--------------------------------chrome------------------------------------------
		-- 	{
		-- 		name = "Chrome: Debug (Standalone)",
		-- 		program = "${file}",
		-- 		cwd = vim.fn.getcwd(),
		-- 		port = 9222,
		-- 		type = "chrome",
		-- 		request = "launch",
		-- 		url = "http://localhost:3000", -- Update to your dev server
		-- 		webRoot = "${workspaceFolder}",
		-- 		userDataDir = "/tmp/chrome-profile-" .. os.getenv("USER"),
		-- 		sourceMaps = true,
		-- 		skipFiles = { "<node_internals>/**" },
		-- 		protocol = "inspector",
		-- 		runtimeArgs = {
		-- 			"--remote-debugging-port=9222",
		-- 			"--auto-open-devtools-for-tabs",
		-- 			-- "--no-first-run",
		-- 			-- "--no-default-browser-check",
		-- 		},
		-- 		runtimeExecutable = function()
		-- 			local candidates = {
		-- 				-- ===== NixOS/Linux Paths =====
		-- 				vim.fn.exepath("google-chrome"), -- $PATH lookup
		-- 				vim.fn.exepath("chrome"), -- Alternative command
		-- 				vim.fn.exepath("chromium"), -- Chromium fallback
		-- 				os.getenv("HOME") .. "/.nix-profile/bin/google-chrome-stable", -- Home Manager
		-- 				"/run/current-system/sw/bin/google-chrome-stable", -- System-wide NixOS
		-- 				"${pkgs.google-chrome}/bin/google-chrome-stable", -- Direct Nix store
		-- 				"${pkgs.chromium}/bin/chromium", -- Chromium fallback
		--
		-- 				-- ===== Windows Paths =====
		-- 				"C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe",
		-- 				"C:\\Program Files (x86)\\Google\\Chrome\\Application\\chrome.exe",
		-- 				"C:\\Program Files\\Microsoft\\Edge\\Application\\msedge.exe", -- Edge fallback
		--
		-- 				-- ===== macOS Paths =====
		-- 				"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome",
		-- 				"/Applications/Chromium.app/Contents/MacOS/Chromium",
		-- 				"/Applications/Microsoft Edge.app/Contents/MacOS/Microsoft Edge",
		--
		-- 				-- ===== Last Resorts =====
		-- 				"/usr/bin/google-chrome",
		-- 				"/usr/bin/chromium",
		-- 				"google-chrome", -- Final $PATH fallback
		-- 			}
		--
		-- 			-- Platform-specific priority boost
		-- 			if vim.fn.has("win32") == 1 then
		-- 				table.insert(candidates, 1, "C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe")
		-- 			elseif vim.fn.has("mac") == 1 then
		-- 				table.insert(candidates, 1, "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome")
		-- 			end
		--
		-- 			-- Validate paths
		-- 			for _, path in ipairs(candidates) do
		-- 				if path and vim.fn.executable(path) == 1 then
		-- 					return path
		-- 				end
		-- 			end
		-- 			return "google-chrome" -- Ultimate fallback
		-- 		end,
		-- 	},
		-- }
		--
		-- -- File types to apply these configurations to
		-- local js_ts_filetypes = {
		-- 	"javascript",
		-- 	"typescript",
		-- 	"javascriptreact",
		-- 	"typescriptreact",
		-- 	"vue",
		-- }
		--
		-- -- Assign the same configurations to each file type
		-- for _, ft in ipairs(js_ts_filetypes) do
		-- 	dap.configurations[ft] = vim.deepcopy(shared_js_config)
		-- end
		--
		-- --------------------------------------------------------------------------------
		-- ------------------------------------php-----------------------------------------
		-- --------------------------------------------------------------------------------
		-- dap.adapters.php = {
		-- 	type = "executable",
		-- 	command = "node",
		-- 	args = { dap_path .. "php-debug-adapter/extension/out/phpDebug.js" },
		-- }
		--
		-- dap.configurations.php = {
		-- 	{
		-- 		type = "php",
		-- 		request = "launch",
		-- 		name = "Listen for Xdebug",
		-- 		port = 9003,
		-- 	},
		-- }
		--
		-- --------------------------------------------------------------------------------
		-- ------------------------------------bash----------------------------------------
		-- --------------------------------------------------------------------------------
		-- dap.adapters.bashdb = {
		-- 	name = "bashdb",
		-- 	type = "executable",
		-- 	command = dap_path .. "bash-debug-adapter/bash-debug-adapter",
		-- }
		--
		-- dap.configurations.sh = {
		-- 	{
		-- 		type = "bashdb",
		-- 		request = "launch",
		-- 		name = "Launch file",
		-- 		showDebugOutput = true,
		-- 		pathBashdb = dap_path .. "bash-debug-adapter/extension/bashdb_dir/bashdb",
		-- 		pathBashdbLib = dap_path .. "bash-debug-adapter/extension/bashdb_dir",
		-- 		trace = true,
		-- 		file = "${file}",
		-- 		program = "${file}",
		-- 		cwd = "${workspaceFolder}",
		-- 		pathCat = "cat",
		-- 		pathBash = "/bin/bash",
		-- 		pathMkfifo = "mkfifo",
		-- 		pathPkill = "pkill",
		-- 		args = {},
		-- 		env = {},
		-- 		terminalKind = "integrated",
		-- 	},
		-- }
		-- --------------------------------------------------------------------------------
		-- ----------------------------------markdown--------------------------------------
		-- --------------------------------------------------------------------------------
		-- dap.adapters.markdown = {
		-- 	type = "executable",
		-- 	name = "mockdebug",
		-- 	command = "node",
		-- 	args = { "./out/debugAdapter.js" },
		-- 	cwd = dap_path .. "mockdebug",
		-- }
		--
		-- dap.configurations.markdown = {
		-- 	{
		-- 		type = "mock",
		-- 		request = "launch",
		-- 		name = "mock test",
		-- 		program = dap_path .. "mockdebug/readme.md",
		-- 		stopOnEntry = true,
		-- 		debugServer = 4711,
		-- 	},
		-- }
		--
		-- --------------------------------------------------------------------------------
		-- ------------------------------------lua-----------------------------------------
		-- --------------------------------------------------------------------------------
		-- -- dap.adapters["local-lua"] = {
		-- -- 	type = "executable",
		-- -- 	command = "node",
		-- -- 	args = { dap_path .. "local-lua-debugger-vscode/extension/extension/debugAdapter.js" },
		-- -- 	enrich_config = function(config, on_config)
		-- -- 		if not config["extensionPath"] then
		-- -- 			local c = vim.deepcopy(config)
		-- -- 			c.extensionPath = dap_path .. "local-lua-debugger-vscode/extension"
		-- -- 			on_config(c)
		-- -- 		else
		-- -- 			on_config(config)
		-- -- 		end
		-- -- 	end,
		-- -- }
		-- --
		-- -- dap.configurations.lua = {
		-- -- 	{
		-- -- 		name = "Launch (Lua)",
		-- -- 		type = "local-lua",
		-- -- 		request = "launch",
		-- -- 		cwd = "${workspaceFolder}",
		-- -- 		program = {
		-- -- 			lua = "lua",
		-- -- 			file = "${file}",
		-- -- 		},
		-- -- 		args = {},
		-- -- 	},
		-- -- }
		--
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		-- -- ================================== works
		--
		-- dap.adapters["local-lua"] = {
		-- 	type = "executable",
		-- 	command = "node",
		-- 	args = { dap_path .. "local-lua-debugger-vscode/extension/extension/debugAdapter.js" },
		-- 	enrich_config = function(config, on_config)
		-- 		if not config["extensionPath"] then
		-- 			local c = vim.deepcopy(config)
		-- 			c.extensionPath = dap_path .. "local-lua-debugger-vscode/extension"
		-- 			on_config(c)
		-- 		else
		-- 			on_config(config)
		-- 		end
		-- 	end,
		-- }
		--
		-- dap.configurations.lua = {
		-- 	{
		-- 		name = "Launch (Lua)",
		-- 		type = "local-lua",
		-- 		request = "launch",
		-- 		cwd = "${workspaceFolder}",
		-- 		program = {
		-- 			lua = "lua",
		-- 			file = "${file}",
		-- 		},
		-- 		args = {},
		-- 	},
		-- }
		--
		-- --------------------------------------------------------------------------------
		-- ------------------------------------java----------------------------------------
		-- --------------------------------------------------------------------------------
	end,
}
