return {
	{
		-- https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#modules
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		opts = function ()
			local nvim_treesitter = require("nvim-treesitter.configs")
			nvim_treesitter.setup({
				ensure_installed = {
					"bash",
					"css",
					"html",
					"gitignore",
					"javascript",
					"json",
					"lua",
					"markdown",
					"tsx",
					"typescript",
					"vimdoc",
				},
				sync_install = false,
				auto_install = true,
				ignore_install = {},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = true
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection =  "gnn",
						node_incremental = "grn",
						scope_incremental = "grc",
						node_decremental = "grm"
					}
				},
				modules = {},
			})
		end
	},
	{
		-- https://github.com/nvim-treesitter/nvim-treesitter-context?tab=readme-ov-file#configuration
		"nvim-treesitter/nvim-treesitter-context",
		event = { "BufReadPre", "BufNewFile" },
		opts = {}
	}
}
