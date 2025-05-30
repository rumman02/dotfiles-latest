local M = {}

M.events = {
	"BufReadPre",
	"BufNewFile",
}

M.dependencies = {
	"rcarriga/nvim-dap-ui",
	"theHamsta/nvim-dap-virtual-text", -- Optional: Inline virtual text
	"jbyuki/one-small-step-for-vimkind",
	"mfussenegger/nvim-dap-python", -- Optional: Python debugging
	"mxsdev/nvim-dap-vscode-js", -- Enhanced JS/TS debugging
}

M.keys = function()
	local map = require("lib.func").map
	local dap_leader = require("lib.keys").leader.dap
	return {
		-- Basic debugging
		map(0, { "n" }, dap_leader .. "b", "<cmd>DapToggleBreakpoint<cr>", { desc = "Toggle breakpoint" }),
		map(0, { "n" }, dap_leader .. "B", function()
			require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, { desc = "Conditional breakpoint" }),
		map(0, { "n" }, dap_leader .. "e", function()
			require("dapui").eval()
		end, { desc = "Eval expression under cursor" }),
		map(0, { "n" }, dap_leader .. "E", function()
			require("dapui").eval(vim.fn.input("Expression: "))
		end, { desc = "Eval expression" }),

		-- Debugging controls
		map(0, { "n" }, "<F1>", "<cmd>DapContinue<cr>", { desc = "Continue/Start debugging" }),
		map(0, { "n" }, "<F2>", "<cmd>DapStepInto<cr>", { desc = "Step into" }),
		map(0, { "n" }, "<F3>", "<cmd>DapStepOver<cr>", { desc = "Step over" }),
		map(0, { "n" }, "<F4>", "<cmd>DapStepOut<cr>", { desc = "Step out" }),
		map(0, { "n" }, "<F12>", "<cmd>DapTerminate<cr>", { desc = "Terminate session" }),
		map(0, { "n" }, dap_leader .. "r", "<cmd>DapRestartFrame<cr>", { desc = "Restart frame" }),

		-- UI controls
		map(0, { "n" }, dap_leader .. "u", "<cmd>DapUiToggle<cr>", { desc = "Toggle debug UI" }),
		map(0, { "n" }, dap_leader .. "t", "<cmd>lua require('dap').repl.toggle()<cr>", { desc = "Toggle REPL" }),
		map(0, { "n" }, dap_leader .. "L", "<cmd>DapShowLog<cr>", { desc = "Show debug log" }),
	}
end

M.config = function()
	local function get_chrome_path()
		-- Common NixOS Chrome paths in order of preference
		local paths = {
			os.getenv("HOME") .. "/.nix-profile/bin/google-chrome-stable", -- User profile
			"/run/current-system/sw/bin/google-chrome-stable", -- System-wide
			"/usr/bin/google-chrome-stable", -- Traditional path
			"/usr/bin/chromium", -- Fallback to Chromium
		}

		for _, path in ipairs(paths) do
			if vim.fn.executable(path) == 1 then
				return path
			end
		end

		return nil
	end

	local chrome_path = get_chrome_path()
	if not chrome_path then
		vim.notify("Chrome not found! Please install google-chrome-stable", vim.log.levels.ERROR)
	end

	local dap = require("dap")
	local dap_utils = require("dap.utils")
	local dap_path = vim.fn.stdpath("data") .. "/mason/packages/"

	-- =====================
	-- Debug Adapters
	-- =====================
	local adapters = {
		-- JavaScript/TypeScript adapters
		["pwa-node"] = {
			type = "server",
			host = "localhost",
			port = "${port}",
			executable = {
				command = "node",
				args = {
					dap_path .. "js-debug-adapter/js-debug/src/dapDebugServer.js",
					"${port}",
				},
			},
		},
		["node-terminal"] = {
			type = "executable",
			command = "node",
			args = {
				dap_path .. "node-debug2-adapter/out/src/nodeDebug.js",
			},
		},
		["chrome"] = {
			type = "executable",
			command = "node",
			args = {
				dap_path .. "chrome-debug-adapter/out/src/chromeDebug.js",
			},
			enrich_config = function(config, on_config)
				if chrome_path then
					config.runtimeExecutable = chrome_path
					-- Additional NixOS-specific Chrome flags
					config.runtimeArgs = config.runtimeArgs or {}
					vim.list_extend(config.runtimeArgs, {
						"--disable-gpu",
						"--no-first-run",
						"--no-default-browser-check",
					})
				end
				on_config(config)
			end,
		},
		-- ["firefox"] = {
		-- 	type = "executable",
		-- 	command = "node",
		-- 	args = {
		-- 		dap_path .. "firefox-debug-adapter/dist/adapter.bundle.js",
		-- 	},
		-- },
		["firefox"] = {
			type = "executable",
			command = "node",
			args = {
				dap_path .. "firefox-debug-adapter/dist/adapter.bundle.js",
			},
			enrich_config = function(config, on_config)
				-- NixOS-specific Firefox path handling
				local firefox_paths = {
					os.getenv("HOME") .. "/.nix-profile/bin/firefox",
					"/run/current-system/sw/bin/firefox",
					"/usr/bin/firefox",
				}

				for _, path in ipairs(firefox_paths) do
					if vim.fn.executable(path) == 1 then
						config.firefoxExecutable = path
						break
					end
				end

				if not config.firefoxExecutable then
					vim.notify("Firefox not found! Please install it via Nix", vim.log.levels.ERROR)
				end

				on_config(config)
			end,
		},

		-- Lua adapters
		["local-lua"] = {
			type = "executable",
			command = "node",
			args = {
				vim.fn.stdpath("data") .. "/mason/share/local-lua-debugger-vscode/extension/debugAdapter.js",
			},
			enrich_config = function(config, on_config)
				if not config["extensionPath"] then
					local c = vim.deepcopy(config)
					c.extensionPath = vim.fn.stdpath("data") .. "/mason/share/local-lua-debugger-vscode/"
					on_config(c)
				else
					on_config(config)
				end
			end,
		},
		["nlua"] = function(callback, conf)
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
		end,
	}

	for name, adapter in pairs(adapters) do
		dap.adapters[name] = adapter
	end

	-- =====================
	-- Debug Configurations
	-- =====================

	-- JavaScript configurations
	dap.configurations.javascript = {
		{
			name = "Launch Current File",
			type = "pwa-node",
			request = "launch",
			program = "${file}",
			cwd = "${workspaceFolder}",
			sourceMaps = true,
			skipFiles = { "<node_internals>/**" },
			protocol = "inspector",
			console = "integratedTerminal",
		},
		{
			name = "Attach to Node Process",
			type = "pwa-node",
			request = "attach",
			processId = dap_utils.pick_process,
			cwd = "${workspaceFolder}",
		},
		{
			name = "Debug Jest Tests",
			type = "pwa-node",
			request = "launch",
			runtimeExecutable = "node",
			runtimeArgs = {
				"./node_modules/jest/bin/jest.js",
				"--runInBand",
				"--watchAll=false",
			},
			rootPath = "${workspaceFolder}",
			cwd = "${workspaceFolder}",
			console = "integratedTerminal",
			internalConsoleOptions = "neverOpen",
		},
		{
			name = "Debug in Chrome (NixOS)",
			type = "chrome",
			request = "launch",
			url = "http://localhost:3000", -- Update to your dev server
			webRoot = "${workspaceFolder}",
			runtimeExecutable = chrome_path,
			userDataDir = "/tmp/chrome-profile-" .. os.getenv("USER"),
			sourceMaps = true,
			skipFiles = { "<node_internals>/**" },
			protocol = "inspector",
			runtimeArgs = {
				"--remote-debugging-port=9222",
				"--auto-open-devtools-for-tabs",
			},
		},
	}

	-- React configurations (JSX/TSX)
	local react_config = {
		{
			name = "Debug in Chrome",
			type = "chrome",
			request = "attach",
			program = "${file}",
			cwd = vim.fn.getcwd(),
			sourceMaps = true,
			protocol = "inspector",
			port = 9222,
			webRoot = "${workspaceFolder}",
			skipFiles = { "<node_internals>/**" },
		},
	}

	dap.configurations.javascriptreact = react_config
	dap.configurations.typescriptreact = react_config

	-- Lua configurations
	dap.configurations.lua = {
		-- Neovim-specific debugging
		{
			name = "[NVIM] Debug Config (Auto Launch)",
			type = "nlua",
			request = "attach",
			port = 8086,
			host = "127.0.0.1",
			setup = function()
				if not require("osv").is_running() then
					require("osv").launch({ port = 8086 })
					vim.notify("Started debug server on port 8086", vim.log.levels.INFO)
				end
			end,
			source = {
				workspace = vim.fn.stdpath("config"),
				paths = {
					vim.fn.stdpath("config"),
					vim.fn.stdpath("data") .. "/site/pack/*/start/*",
					vim.fn.stdpath("data") .. "/lazy/*",
				},
			},
		},
		{
			name = "[NVIM] Debug Current File",
			type = "nlua",
			request = "attach",
			port = 8086,
			host = "127.0.0.1",
			file = "${file}",
			source = {
				workspace = "${workspaceFolder}",
				paths = {
					"${workspaceFolder}",
					vim.fn.stdpath("config"),
					vim.fn.stdpath("data") .. "/site/pack/*/start/*",
				},
			},
		},

		-- Standard Lua debugging
		{
			name = "[LUA] Debug Current File (Standard Lua)",
			type = "local-lua",
			request = "launch",
			program = {
				lua = "lua",
				file = "${file}",
			},
			cwd = "${workspaceFolder}",
			args = {},
		},
		{
			name = "[LUA] Debug with LuaJIT",
			type = "local-lua",
			request = "launch",
			program = {
				lua = "luajit",
				file = "${file}",
			},
			cwd = "${workspaceFolder}",
			args = {},
		},
	}

	-- =====================
	-- UI Setup
	-- =====================
	require("dapui").setup({
		icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
		mappings = {
			expand = { "<CR>", "<2-LeftMouse>" },
			open = "o",
			remove = "d",
			edit = "e",
			repl = "r",
			toggle = "t",
		},
		layouts = {
			{
				elements = {
					{ id = "scopes", size = 0.25 },
					{ id = "breakpoints", size = 0.25 },
					{ id = "stacks", size = 0.25 },
					{ id = "watches", size = 0.25 },
				},
				size = 40,
				position = "left",
			},
			{
				elements = {
					{ id = "repl", size = 0.5 },
					{ id = "console", size = 0.5 },
				},
				size = 10,
				position = "bottom",
			},
		},
		floating = {
			max_height = nil,
			max_width = nil,
			border = "single",
			mappings = {
				close = { "q", "<Esc>" },
			},
		},
	})

	-- Auto-open UI when debugging starts
	dap.listeners.after.event_initialized["dapui_config"] = function()
		require("dapui").open()
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
		require("dapui").close()
	end
	dap.listeners.before.event_exited["dapui_config"] = function()
		require("dapui").close()
	end

	-- Virtual text configuration
	require("nvim-dap-virtual-text").setup({
		enabled = true,
		enabled_commands = true,
		highlight_changed_variables = true,
		highlight_new_as_changed = false,
		show_stop_reason = true,
		commented = false,
		only_first_definition = true,
		all_references = false,
		virt_lines = false,
		virt_text_win_col = nil,
	})
end

return M
-- local M = {}
--
-- M.dependencies = {
-- 	"rcarriga/nvim-dap-ui",
-- 	"theHamsta/nvim-dap-virtual-text",
-- 	"jbyuki/one-small-step-for-vimkind",
-- 	"mfussenegger/nvim-dap-python",
-- 	"mxsdev/nvim-dap-vscode-js",
-- }
--
-- M.keys = function()
-- 	local map = require("lib.func").map
-- 	local dap_leader = require("lib.keys").leader.dap
-- 	return {
-- 		-- Breakpoints
-- 		map(0, { "n" }, dap_leader .. "b", "<cmd>DapToggleBreakpoint<cr>", { desc = "Toggle breakpoint" }),
-- 		map(0, { "n" }, dap_leader .. "B", function()
-- 			require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
-- 		end, { desc = "Conditional breakpoint" }),
-- 		map(0, { "n" }, dap_leader .. "lp", function()
-- 			require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
-- 		end, { desc = "Log point" }),
--
-- 		-- Evaluations
-- 		map(0, { "n" }, dap_leader .. "e", function()
-- 			require("dapui").eval()
-- 		end, { desc = "Eval under cursor" }),
-- 		map(0, { "n" }, dap_leader .. "E", function()
-- 			require("dapui").eval(vim.fn.input("Expression: "))
-- 		end, { desc = "Eval expression" }),
--
-- 		-- Debug controls
-- 		map(0, { "n" }, "<F1>", "<cmd>DapContinue<cr>", { desc = "Continue/Start" }),
-- 		map(0, { "n" }, "<F2>", "<cmd>DapStepInto<cr>", { desc = "Step into" }),
-- 		map(0, { "n" }, "<F3>", "<cmd>DapStepOver<cr>", { desc = "Step over" }),
-- 		map(0, { "n" }, "<F4>", "<cmd>DapStepOut<cr>", { desc = "Step out" }),
-- 		map(0, { "n" }, "<F12>", "<cmd>DapTerminate<cr>", { desc = "Terminate" }),
-- 		map(0, { "n" }, dap_leader .. "r", "<cmd>DapRestartFrame<cr>", { desc = "Restart frame" }),
--
-- 		-- UI controls
-- 		map(0, { "n" }, dap_leader .. "u", "<cmd>DapUiToggle<cr>", { desc = "Toggle UI" }),
-- 		map(0, { "n" }, dap_leader .. "t", "<cmd>lua require('dap').repl.toggle()<cr>", { desc = "Toggle REPL" }),
-- 		map(0, { "n" }, dap_leader .. "L", "<cmd>DapShowLog<cr>", { desc = "Show debug log" }),
-- 	}
-- end
--
-- M.config = function()
-- 	local dap = require("dap")
-- 	local dap_utils = require("dap.utils")
-- 	local dap_path = vim.fn.stdpath("data") .. "/mason/packages/"
--
-- 	local function get_chrome_path()
-- 		-- Common NixOS Chrome paths in order of preference
-- 		local paths = {
-- 			os.getenv("HOME") .. "/.nix-profile/bin/google-chrome-stable", -- User profile
-- 			"/run/current-system/sw/bin/google-chrome-stable", -- System-wide
-- 			"/usr/bin/google-chrome-stable", -- Traditional path
-- 			"/usr/bin/chromium", -- Fallback to Chromium
-- 		}
--
-- 		for _, path in ipairs(paths) do
-- 			if vim.fn.executable(path) == 1 then
-- 				return path
-- 			end
-- 		end
--
-- 		return nil
-- 	end
--
-- 	local chrome_path = get_chrome_path()
-- 	if not chrome_path then
-- 		vim.notify("Chrome not found! Please install google-chrome-stable", vim.log.levels.ERROR)
-- 	end
--
-- 	-- Dynamic Chrome path detection for NixOS
-- 	local function get_chrome_path()
-- 		local paths = {
-- 			"/run/current-system/sw/bin/google-chrome-stable", -- NixOS system
-- 			os.getenv("HOME") .. "/.nix-profile/bin/google-chrome-stable", -- User profile
-- 			"/usr/bin/google-chrome-stable", -- Traditional Linux
-- 			"/usr/bin/chromium", -- Fallback
-- 			"/usr/bin/google-chrome", -- Alternative name
-- 		}
--
-- 		for _, path in ipairs(paths) do
-- 			if vim.fn.executable(path) == 1 then
-- 				return path
-- 			end
-- 		end
-- 		return nil
-- 	end
--
-- 	local chrome_path = get_chrome_path()
-- 	if not chrome_path then
-- 		vim.notify("Chrome not found! Debugging may not work properly", vim.log.levels.WARN)
-- 	end
--
-- 	-- Debug Adapters Configuration
-- 	local adapters = {
-- 		["pwa-node"] = {
-- 			type = "server",
-- 			host = "localhost",
-- 			port = "${port}",
-- 			executable = {
-- 				command = "node",
-- 				args = {
-- 					dap_path .. "js-debug-adapter/js-debug/src/dapDebugServer.js",
-- 					"${port}",
-- 				},
-- 			},
-- 		},
-- 		-- ["chrome"] = {
-- 		-- 	type = "executable",
-- 		-- 	command = "node",
-- 		-- 	args = {
-- 		-- 		dap_path .. "chrome-debug-adapter/out/src/chromeDebug.js",
-- 		-- 	},
-- 		-- 	enrich_config = function(config, on_config)
-- 		-- 		if chrome_path then
-- 		-- 			config.runtimeExecutable = chrome_path
-- 		-- 			-- Additional NixOS-specific Chrome flags
-- 		-- 			config.runtimeArgs = config.runtimeArgs or {}
-- 		-- 			vim.list_extend(config.runtimeArgs, {
-- 		-- 				"--disable-gpu",
-- 		-- 				"--no-first-run",
-- 		-- 				"--no-default-browser-check",
-- 		-- 			})
-- 		-- 		end
-- 		-- 		on_config(config)
-- 		-- 	end,
-- 		-- },
--
-- 		["chrome"] = {
-- 			type = "executable",
-- 			command = "node",
-- 			args = { dap_path .. "chrome-debug-adapter/out/src/chromeDebug.js" },
-- 			enrich_config = function(config, on_config)
-- 				if chrome_path then
-- 					config.runtimeExecutable = chrome_path
-- 					config.runtimeArgs = vim.tbl_extend("keep", config.runtimeArgs or {}, {
-- 						"--no-first-run",
-- 						"--remote-debugging-port=9222",
-- 						"--user-data-dir=/tmp/chrome-debug-profile-" .. os.getenv("USER"),
-- 						"--no-first-run",
-- 						"--no-default-browser-check",
-- 					})
-- 				end
-- 				on_config(config)
-- 			end,
-- 		},
-- 		["node-terminal"] = {
-- 			type = "executable",
-- 			command = "node",
-- 			args = { dap_path .. "node-debug2-adapter/out/src/nodeDebug.js" },
-- 		},
-- 		["local-lua"] = {
-- 			type = "executable",
-- 			command = "node",
-- 			args = { vim.fn.stdpath("data") .. "/mason/share/local-lua-debugger-vscode/extension/debugAdapter.js" },
-- 			enrich_config = function(config, on_config)
-- 				if not config.extensionPath then
-- 					config.extensionPath = vim.fn.stdpath("data") .. "/mason/share/local-lua-debugger-vscode/"
-- 				end
-- 				on_config(config)
-- 			end,
-- 		},
-- 		["nlua"] = function(callback, conf)
-- 			local adapter = {
-- 				type = "server",
-- 				host = conf.host or "127.0.0.1",
-- 				port = conf.port or 8086,
-- 			}
-- 			if conf.start_neovim then
-- 				local dap_run = dap.run
-- 				dap.run = function(c)
-- 					adapter.port = c.port
-- 					adapter.host = c.host
-- 				end
-- 				require("osv").run_this()
-- 				dap.run = dap_run
-- 			end
-- 			callback(adapter)
-- 		end,
-- 	}
--
-- 	for name, adapter in pairs(adapters) do
-- 		dap.adapters[name] = adapter
-- 	end
--
-- 	-- Debug Configurations
-- 	local js_config = {
-- 		{
-- 			name = "Launch Current File",
-- 			type = "pwa-node",
-- 			request = "launch",
-- 			program = "${file}",
-- 			cwd = "${workspaceFolder}",
-- 			sourceMaps = true,
-- 			skipFiles = { "<node_internals>/**" },
-- 			console = "integratedTerminal",
-- 		},
-- 		{
-- 			name = "Attach to Node Process",
-- 			type = "pwa-node",
-- 			request = "attach",
-- 			processId = dap_utils.pick_process,
-- 			cwd = "${workspaceFolder}",
-- 		},
-- 		{
-- 			name = "Debug Jest Tests",
-- 			type = "pwa-node",
-- 			request = "launch",
-- 			runtimeExecutable = "node",
-- 			runtimeArgs = {
-- 				"./node_modules/jest/bin/jest.js",
-- 				"--runInBand",
-- 				"--watchAll=false",
-- 			},
-- 			rootPath = "${workspaceFolder}",
-- 			cwd = "${workspaceFolder}",
-- 			console = "integratedTerminal",
-- 		},
-- 		{
-- 			name = "Debug in Chrome",
-- 			type = "chrome",
-- 			request = "launch",
-- 			url = "http://localhost:3000",
-- 			webRoot = "${workspaceFolder}",
-- 			sourceMaps = true,
-- 			protocol = "inspector",
-- 			runtimeArgs = {
-- 				"--auto-open-devtools-for-tabs",
-- 			},
-- 		},
-- 		{
-- 			name = "Debug in Chrome (NixOS)",
-- 			type = "chrome",
-- 			request = "launch",
-- 			url = "http://localhost:3000", -- Update to your dev server
-- 			webRoot = "${workspaceFolder}",
-- 			runtimeExecutable = chrome_path,
-- 			userDataDir = "/tmp/chrome-profile-" .. os.getenv("USER"),
-- 			sourceMaps = true,
-- 			skipFiles = { "<node_internals>/**" },
-- 			protocol = "inspector",
-- 			runtimeArgs = {
-- 				"--remote-debugging-port=9222",
-- 				"--auto-open-devtools-for-tabs",
-- 			},
-- 		},
-- 	}
-- 	-- React configurations (JSX/TSX)
-- 	local react_config = {
-- 		{
-- 			name = "Debug in Chrome",
-- 			type = "chrome",
-- 			request = "attach",
-- 			program = "${file}",
-- 			cwd = vim.fn.getcwd(),
-- 			sourceMaps = true,
-- 			protocol = "inspector",
-- 			port = 9222,
-- 			webRoot = "${workspaceFolder}",
-- 			skipFiles = { "<node_internals>/**" },
-- 		},
-- 	}
--
-- 	dap.configurations.javascriptreact = react_config
-- 	dap.configurations.typescriptreact = react_config
--
-- 	dap.configurations.javascript = js_config
-- 	dap.configurations.typescript = vim.deepcopy(js_config)
-- 	-- dap.configurations.javascriptreact = vim.deepcopy(js_config)
-- 	-- dap.configurations.typescriptreact = vim.deepcopy(js_config)
--
-- 	dap.configurations.lua = {
-- 		{
-- 			name = "Debug Neovim Config",
-- 			type = "nlua",
-- 			request = "attach",
-- 			port = 8086,
-- 			host = "127.0.0.1",
-- 			setup = function()
-- 				if not require("osv").is_running() then
-- 					require("osv").launch({ port = 8086 })
-- 				end
-- 			end,
-- 			source = {
-- 				workspace = vim.fn.stdpath("config"),
-- 				paths = {
-- 					vim.fn.stdpath("config"),
-- 					vim.fn.stdpath("data") .. "/site/pack/*/start/*",
-- 					vim.fn.stdpath("data") .. "/lazy/*",
-- 				},
-- 			},
-- 		},
-- 		{
-- 			name = "Debug Current Lua File",
-- 			type = "local-lua",
-- 			request = "launch",
-- 			program = {
-- 				lua = "luajit",
-- 				file = "${file}",
-- 			},
-- 			cwd = "${workspaceFolder}",
-- 		},
-- 	}
--
-- 	-- DAP UI Configuration
-- 	require("dapui").setup({
-- 		layouts = {
-- 			{
-- 				elements = {
-- 					{ id = "scopes", size = 0.25 },
-- 					{ id = "breakpoints", size = 0.25 },
-- 					{ id = "stacks", size = 0.25 },
-- 					{ id = "watches", size = 0.25 },
-- 				},
-- 				position = "left",
-- 				size = 40,
-- 			},
-- 			{
-- 				elements = {
-- 					{ id = "repl", size = 0.5 },
-- 					{ id = "console", size = 0.5 },
-- 				},
-- 				position = "bottom",
-- 				size = 10,
-- 			},
-- 		},
-- 	})
--
-- 	-- Auto open/close UI
-- 	dap.listeners.after.event_initialized["dapui_config"] = function()
-- 		require("dapui").open({ reset = true })
-- 	end
-- 	dap.listeners.before.event_terminated["dapui_config"] = require("dapui").close
-- 	dap.listeners.before.event_exited["dapui_config"] = require("dapui").close
--
-- 	-- Virtual text configuration
-- 	require("nvim-dap-virtual-text").setup({
-- 		highlight_changed_variables = true,
-- 		show_stop_reason = true,
-- 	})
--
-- 	-- Enable debugging for Python
-- 	require("dap-python").setup("python")
-- end
--
-- return M
