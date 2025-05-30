return {
	{
		"nvim-treesitter/nvim-treesitter",
		enabled = require("plug_controller").treesitter.treesitter,
		build = ":TSUpdate",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		init = function()
			local wo = vim.wo
			wo.foldmethod = "expr"
			wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		end,
		config = function()
			---@diagnostic disable-next-line
			require("nvim-treesitter.configs").setup({
				auto_install = true,
				ensure_installed = {
					"bash",
					"cmake",
					"comment",
					"cpp",
					"csv",
					"css",
					"git_config",
					"git_rebase",
					"gitattributes",
					"gitcommit",
					"gitignore",
					"html",
					"hyprlang",
					"java",
					"javascript",
					"json",
					"json5",
					"jsonc",
					"lua",
					-- "latex", -- gives error
					"make",
					"markdown",
					"markdown_inline",
					"meson",
					"passwd",
					-- "powersell", -- gives error
					"printf",
					"python",
					"rust",
					"scss",
					"luadoc",
					"regex",
					"sql",
					"tmux",
					"toml",
					"tsx",
					"tsv",
					"tsx",
					"typescript",
					"vim",
					"vimdoc",
					"lua",
					"luadoc",
					"yaml",
					"nix",
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						-- init_selection = "gvk",
						-- scope_incremental = "gvc",
						-- node_incremental = "gvk",
						-- node_decremental = "gvj",
					},
				},
				indent = {
					enable = true, -- indentation for the "=" operator
				},
			})
		end,
	},
	{},
}
