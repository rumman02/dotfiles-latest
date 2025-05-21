return {
	"rcarriga/nvim-dap-ui",
	enabled = require("plugins.controller").servers.dap.ui,
	dependencies = {
		"nvim-neotest/nvim-nio",
	},
	keys = {
		{
			mode = { "n" },
			"<leader>du",
			function()
				require("dapui").toggle()
			end,
			desc = "Toggle debug UI",
		},
		{ mode = { "n" }, "<leader>dt", "<cmd>lua require('dap').repl.toggle()<cr>", desc = "Toggle REPL" },
		{ mode = { "n" }, "<leader>dL", "<cmd>DapShowLog<cr>", desc = "Show debug log" },
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dapui.setup()

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
	end,
}
