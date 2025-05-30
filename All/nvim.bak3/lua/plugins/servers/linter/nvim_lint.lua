return {
	"mfussenegger/nvim-lint",
	enabled = require("plugins.controller").servers.linter.nvim_lint,
	lazy = true,
	dependencies = {
		require("plugins.servers.linter.mason_lint"),
	},
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			python = { "ruff", "mypy" },
			lua = { "luacheck" },
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			markdown = { "markdownlint" },
			sh = { "shellcheck" },
		}

		-- Optionally trigger linting on save or insert leave
		vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
			callback = function()
				-- lint.try_lint()
			end,
		})
	end,
}
