return {
	"nvim-treesitter/nvim-treesitter",
	enabled = require("plugins.controller").servers.treesitter.treesitter,
	build = ":TSUpdate",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		---@diagnostic disable-next-line
		require("nvim-treesitter.configs").setup({
			auto_install = true,
			ensure_installed = {
				"css",
				-- "git_config",
				-- "git_rebase",
				-- "gitattributes",
				-- "gitcommit",
				-- "gitignore",
				"html",
				"javascript",
				"json",
				"jsonc",
				-- "lua",
				-- "luadoc",
				-- "regex",
				-- "sql",
				"tmux",
				"toml",
				"tsx",
				"typescript",
				-- "vim",
				-- "vimdoc",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gvk",
					scope_incremental = "gvc",
					node_incremental = "gvk",
					node_decremental = "gvj",
				},
			},
			indent = {
				enable = true, -- indentation for the "=" operator
			},
		})
	end,
}
