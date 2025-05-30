-- Setup mason-nvim-lint with automatic installation
local mason_nvim_lint = require("mason-nvim-lint")
---@diagnostic disable-next-line: missing-fields
mason_nvim_lint.setup({
	automatic_installation = true,
	handlers = {
		function(linter_name)
			-- Use default setup for all linters
			mason_nvim_lint.default_setup(linter_name)
		end,
	},
})

-- Register linters dynamically
local nvim_lint = require("lint")
nvim_lint.linters_by_ft = {
	javascript = { "eslint_d" },
	typescript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	typescriptreact = { "eslint_d" },
	svelte = { "eslint_d" },
	python = { "pylint" },
	lua = { "luacheck" },
	sh = { "shellcheck" },
}

