local M = {}

M.dependencies = {
	"mfussenegger/nvim-dap",
	"rcarriga/nvim-dap-ui",
	"nvim-neotest/nvim-nio",
}

M.keys = function()
	local map = require("lib.func").map
	local dap_leader = require("lib.keys").leader.dap

	return {
		map(0, { "n" }, dap_leader .. "u", function()
			require("dapui").toggle()
		end, { desc = "Toggle ui" }),
	}
end

M.config = function()
	local dap_ok, dap = pcall(require, "dap")
	if not dap_ok then
		vim.notify("nvim-dap not found!", vim.log.levels.ERROR)
		return
	end

	local dapui_ok, dapui = pcall(require, "dapui")
	if not dapui_ok then
		vim.notify("nvim-dap-ui not found!", vim.log.levels.WARN)
	else
		dapui.setup()
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end
	end
end

return M
