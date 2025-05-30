local M = {}

M.event = {
	"BufReadPre",
	"BufNewFile",
}

M.dependencies = {
	"williamboman/mason.nvim",
}

M.opts = function()
	local servers = {
		lsp = {
			"lua-language-server",
			"typescript-language-server",
			-- "tailwindcss-language-server",
			"emmet-language-server", -- emmet html
			"html-lsp", -- html lanuage server
			"css-lsp", -- css, lass, scss language server
			"json-lsp", -- json language server
			"nil", -- nix language server
			-- "jdtls", -- java language server
		},
		dap = {
			"bash-debug-adapter", -- bash
			"chrome-debug-adapter",
			"debugpy", -- python
			"delve", -- go
			"firefox-debug-adapter",
			"node-debug2-adapter", -- javascript, typescript
			"local-lua-debugger-vscode", -- lua
			"php-debug-adapter", -- php
			"mockdebug", -- markdown
			"java-debug-adapter", -- java
		},
		formatter = {
			"shfmt", -- bash / shell language formatter
			"stylua", -- lua language formatter
			"prettier", -- angular, css, flow, graphql, html, json, jsx, javascript, less, markdown, scss, typescript, vue, yaml
			-- "prettierd", -- angular, css, flow, graphql, html, json, jsx, javascript, less, markdown, scss, typescript, vue, yaml
			"nixfmt", -- nix language formatter
		},
		linter = {
			-- "eslint_d",
			-- "luacheck",
			-- "pylint",
			-- "shellcheck",
		},
	}

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

	return {
		ensure_installed = all_in_one,
		auto_update = true,
		run_on_start = true,
		start_delay = 3000,
		debounce_hours = 5,
	}
end

M.config = function(_, opts)
	require("mason-tool-installer").setup(opts)

	vim.api.nvim_create_autocmd("FileType", {
		pattern = "mason",
		callback = function()
			local keys = require("lib.keys")
			local map = require("lib.func").map

			local mason_leader = keys.localleader.lsp

			map(0, { "n" }, mason_leader .. "c", "<cmd>MasonToolsClean<cr>", { desc = "Clean unlisted", buffer = true })
		end,
	})
end

return M
