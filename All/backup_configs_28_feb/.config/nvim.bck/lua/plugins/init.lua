-------------------------------------------------------------------------------
-- required files
-------------------------------------------------------------------------------
local configs = require("plugins.configs");
local keys = require("plugins.keymaps");

-------------------------------------------------------------------------------
-- variables
-------------------------------------------------------------------------------


-- ============================================================================
-- addings rules
-- ----------------
-- lazy = lazy loaded or not
-- enabled = disabled plugin & uninstalled
-- cond = disabled plugin
-- priority = force loading certain plugins first
-- version = version to use from the repository
-- branch = branch of the repository
-- tag = tag of the repository
-- name = custom name for the plugin
-- main = main module to use for config() and opts()
-- event = lazy load on event
-- ft = lazy load on filetypes
-- cmd = lazy load on command
-- build = executed when a plugin is installed or updated
-- dependencies = plugins are dependded on this plugins
-- keys = lazy load on keymaps
-- config = plugins configuration
-- ============================================================================

-------------------------------------------------------------------------------
-- load plugins
-------------------------------------------------------------------------------
return {
	{
		"folke/tokyonight.nvim",
		cmd = "Colorscheme tokyonight",
		config = configs.tokyonight,
	},
	{
		"ellisonleao/gruvbox.nvim",
		cmd = "Colorscheme gruvbox",
		config = configs.gruvbox,
	},
	{
		"folke/snacks.nvim",
		lazy = false,
		dependencies = "nvim-tree/nvim-web-devicons",
		config = configs.snacks,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		cmd = "Neotree",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	},
	{
		"mg979/vim-visual-multi",
		event = "VeryLazy",
	},
	{
		"nvim-lualine/lualine.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"arkav/lualine-lsp-progress",
		},
	},
	{
		"akinsho/bufferline.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			-- "tiagovla/scope.nvim",
		},
		keys = keys.bufferline,
		config = configs.bufferline,
	},
	{
		"mg979/vim-visual-multi",
		branch = "master",
		event = { "BufReadPre", "BufNewFile" },
		config = configs.visual_multi,
	},
	{
		"ibhagwan/fzf-lua",
		enabled = false,
		dependencies = "nvim-tree/nvim-web-devicons",
		event = { "BufReadPre", "BufNewFile" },
		config = configs.fzf_lua,
	},
	{
		"saghen/blink.cmp",
		version = "*",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = "rafamadriz/friendly-snippets",
		config = configs.blink,
	},
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = configs.nvim_surround,
	},
	{
		"folke/persistence.nvim",
		event = "BufReadPre", -- only saving when an actual file was opened
		config = configs.persistence,
	},
	{
		"folke/noice.nvim",
		-- enabled = false,
		event = "VeryLazy",
		dependencies = "MunifTanjim/nui.nvim",
		config = configs.noice,
	},
	{
    "nvim-lualine/lualine.nvim",
    dependencies = "nvim-tree/nvim-web-devicons" ,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = configs.git,
		keys = keys.git,
	},


	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"saghen/blink.cmp",
			{
				"williamboman/mason-lspconfig.nvim",
				dependencies = {
					"williamboman/mason.nvim",
				},
			},
		},
		config = configs.lsp,
	},
};
