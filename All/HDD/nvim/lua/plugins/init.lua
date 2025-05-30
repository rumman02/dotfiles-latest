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
-- init = most first executed things
-- keys = lazy load on keymaps
-- opt = plugins configs before load
-- config = plugins configuration
-- ============================================================================

return {
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	cmd = { "Colorscheme tokyonight" },
	-- 	opts = require("plugins.tokyonight").opts,
	-- 	config = require("plugins.tokyonight").config,
	-- },
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		lazy = false,
		cmd = { "Colorscheme gruvbox" },
		opts = require("plugins.gruvbox").opts,
		config = require("plugins.gruvbox").config,
	},
	-- {
	-- 	"goolord/alpha-nvim",
	-- 	-- dependencies = { "nvim-tree/nvim-web-devicons" },
	-- 	-- opts = require("plugins.alpha-nvim").opts,
	-- 	config = require("plugins.alpha-nvim").config,
	-- },
	-- {
	-- 	-- this plugin replaced with snacks input
	-- 	"stevearc/dressing.nvim",
	-- },
	{
		"folke/snacks.nvim",
		lazy = false,
		priority = 1000,
		-- dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = require("plugins.snacks").opts,
		config = require("plugins.snacks").config,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		cmd = { "Neotree" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim",
		},
		keys = require("plugins.neo-tree").keys,
		opts = require("plugins.neo-tree").opts,
		-- config = require("plugins.neo-tree").config,
	},
	{
		"nvim-lualine/lualine.nvim",
		-- cond = false,
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			-- "folke/noice.nvim", -- for showing pressed keys on lualine
		},
		opts = require("plugins.lualine").opts,
		-- config = require("plugins.lualine").config,
	},
	{
		"akinsho/bufferline.nvim",
		enabled = false,
		version = "*",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			-- "tiagovla/scope.nvim",
		},
		keys = require("plugins.bufferline").keys,
		opts = require("plugins.bufferline").opts,
		-- config = require("plugins.bufferline").config,
	},
	{
		"romgrk/barbar.nvim",
		version = "^1.0.0",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"lewis6991/gitsigns.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		init = require("plugins.barbar").init,
		opts = require("plugins.barbar").opts,
	},
	{
		-- multi cursor
		"mg979/vim-visual-multi",
		branch = "master",
		event = { "BufReadPre", "BufNewFile" },
		-- keys = require("plugins.vim-visual-multi").key,
		-- opts = require("plugins.vim-visual-multi").opts,
		-- config = require("plugins.vim-visual-multi").config,
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		keys = require("plugins.nvim-surround").keys,
		opts = require("plugins.nvim-surround").opts,
	},
	-- {
	-- 	-- session manager
	-- 	-- replace with persistence nvim
	-- 	"rmagatti/auto-session",
	-- 	opts = require("plugins.auto-session").opts,
	-- },
	{
		-- session manager
		"folke/persistence.nvim",
		event = { "BufReadPre" }, -- only saving when an actual file was opened
		keys = require("plugins.persistence").keys,
		opts = require("plugins.persistence").opts,
	},
	{
		-- cmd line popup shows center of screen
		"folke/noice.nvim",
		-- enabled = false,
		event = { "VeryLazy" },
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = require("plugins.noice").opts,
		config = require("plugins.noice").config,
	},
	-- {
	-- 	-- filename shows on window split lines
	-- 	"b0o/incline.nvim",
	-- 	event = { "BufReadPre", "BufNewFile" },
	-- },
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		keys = require("plugins.gitsigns").keys,
		opts = require("plugins.gitsigns").opts,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"saghen/blink.cmp",
			{
				"WhoIsSethDaniel/mason-tool-installer.nvim",
				opts = require("plugins.lsp").mason_tool_installer_opts,
				dependencies = {
					-- "jay-babu/mason-null-ls.nvim",
					-- "jay-babu/mason-nvim-dap.nvim",
					{
						"williamboman/mason-lspconfig.nvim",
						-- opts = require("plugins.lsp").mason_lspconfig_opts,
						dependencies = {
							{
								"williamboman/mason.nvim",
								cmd = { "Mason" },
								opts = require("plugins.lsp").mason_opts,
							},
						},
					},
				},
			},
		},
		-- opts = require("plugins.lsp").opts,
		config = require("plugins.lsp").config,
	},
	-- {
	-- 	"nvimdev/lspsaga.nvim",
	-- 	event = { "LspAttach" },
	-- 	dependencies = {
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		"nvim-tree/nvim-web-devicons",
	-- 	},
	-- 	opts = require("plugins.lspsaga").opts,
	-- },
	{
		"saghen/blink.cmp",
		version = "*",
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = { "rafamadriz/friendly-snippets" },
		opts = require("plugins.blink").opts,
		-- config = require("plugins.blink").config,
	},
	-- {
	-- 	"jay-babu/mason-null-ls.nvim",
	-- 	event = { "BufReadPre", "BufNewFile" },
	-- 	dependencies = {
	-- 		"williamboman/mason.nvim",
	-- 		"nvimtools/none-ls.nvim",
	-- 	},
	-- },
	-- {
	-- 	"stevearc/conform.nvim",
	-- },
	-- {
	-- 	"rshkarin/mason-nvim-lint",
	-- 	dependencies = {
	-- 		"williamboman/mason.nvim",
	-- 		"mfussenegger/nvim-lint",
	-- 	},
	-- },
	-- {
	-- 	"mfussenegger/nvim-dap",
	-- },
	-- {
	-- 	"jay-babu/mason-nvim-dap.nvim",
	-- 	dependencies = {
	-- 		"williamboman/mason.nvim",
	-- 		"mfussenegger/nvim-dap",
	-- 	},
	-- },
	-- {
	-- 	"rcarriga/nvim-dap-ui",
	-- 	dependencies = {
	-- 		"mfussenegger/nvim-dap",
	-- 		"nvim-neotest/nvim-nio",
	-- 	},
	-- },
	-- {
	-- 	"theHamsta/nvim-dap-virtual-text",
	-- 	dependencies = {
	-- 		"mfussenegger/nvim-dap",
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 	},
	-- },
	-- {
	-- 	"mxsdev/nvim-dap-vscode-js",
	-- 	dependencies = { "mfussenegger/nvim-dap" },
	-- },
	-- {
	-- 	"jbyuki/one-small-step-for-vimkind",
	-- 	dependencies = {
	-- 		"mfussenegger/nvim-dap",
	-- 		"puremourning/vimspector",
	-- 	},
	-- },
	{
		-- a animation plugins just for fun, like all codes will falled like rain
		"eandrju/cellular-automaton.nvim",
		cmd = { "CellularAutomaton" },
		opts = require("plugins.cellular-automation").opts,
	},
	-- {
	-- 	-- a yank post highlight plugin
	-- 	"rachartier/tiny-glimmer.nvim",
	-- 	event = { "BufReadPre", "BufNewFile" },
	-- 	opts = require("plugins.tiny-glimmer").opts,
	-- },
	-- {
	-- 	"nvim-telescope/telescope.nvim",
	-- 	branch = "0.1.x",
	-- 	tag = "0.1.8",
	-- 	dependencies = { "nvim-lua/plenary.nvim" },
	-- 	keys = require("plugins.telescope").keys,
	-- 	opts = require("plugins.telescope").opts,
	-- 	config = require("plugins.telescope").config,
	-- },
	-- {
	-- 	-- enables windows auto resize when shrinked
	-- 	"anuvyklack/windows.nvim",
	-- 	enabled = false,
	-- 	dependencies = {
	-- 		"anuvyklack/middleclass",
	-- 		"anuvyklack/animation.nvim",
	-- 	},
	-- },
	-- {
	-- 	"mrjones2014/smart-splits.nvim",
	-- 	enabled = false,
	-- 	version = ">=1.0.0",
	-- },
	{
		-- enables extra power for wWeE keys
		"chrisgrieser/nvim-spider",
		enabled = false,
		-- event = { "BufReadPre", "BufNewFile" },
		keys = require("plugins.nvim-spider").keys,
		opts = require("plugins.nvim-spider").opts,
	},
	-- {
	-- 	-- this plugin replacesd by snacks lazyvim
	-- 	"kdheepak/lazygit.nvim",
	-- 	lazy = true,
	-- 	cmd = {
	-- 		"LazyGit",
	-- 		"LazyGitConfig",
	-- 		"LazyGitCurrentFile",
	-- 		"LazyGitFilter",
	-- 		"LazyGitFilterCurrentFile",
	-- 	},
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 	},
	-- },
	-- {
	-- 	"folke/flash.nvim",
	-- 	event = { "VeryLazy" },
	-- },
	-- {
	-- 	-- this plugin is replaced by snacks terminal
	-- 	"akinsho/toggleterm.nvim",
	-- 	version = "*",
	-- 	keys = require("plugins.toggleterm").keys,
	-- 	opts = require("plugins.toggleterm").opts,
	-- },
	-- {
	-- 	"ryanmsnyder/toggleterm-manager.nvim",
	-- 	dependencies = {
	-- 		"akinsho/nvim-toggleterm.lua",
	-- 		"nvim-telescope/telescope.nvim",
	-- 		"nvim-lua/plenary.nvim", -- only needed because it's a dependency of telescope
	-- 	},
	-- },
	{
		-- undo states and undo history panel
		"mbbill/undotree",
		cmd = { "Undotree" },
		keys = require("plugins.undotree").keys,
		opts = require("plugins.undotree").opts,
	},
	-- {
	-- 	-- search and replace advanced & all files
	-- 	"MagicDuck/grug-far.nvim",
	-- },
	{
		"barrett-ruth/live-server.nvim",
		cmd = { "LiveServerStart", "LiveServerStop" },
		-- build = "pnpm add -g live-server", -- npm install pnpm
		opts = require("plugins.live-server").opts,
	},
	{
		-- dumi text
		"derektata/lorem.nvim",
		cmd = { "LoremIpsum" },
		opts = require("plugins.lorem").opts,
	},
	-- {
	-- 	-- supports image for neotree, and others
	-- 	"3rd/image.nvim",
	-- 	enabled = false,
	-- },
	{
		-- help to reduce usage of hjkl keys repatation and many more
		"m4xshen/hardtime.nvim",
		cmd = { "Hardtime" },
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = require("plugins.hardtime").opts,
	},
	{
		-- better textobject, like cif (change in function)
		"echasnovski/mini.ai",
		version = "*",
		event = { "BufReadPre", "BufNewFile" },
		opts = require("plugins.mini").ai_opts,
	},
	{
		-- capture code images / screenshot
		"michaelrommel/nvim-silicon",
		cmd = { "Silicon" },
		opts = require("plugins.nvim-silicon").opts,
	},
	-- {
	-- 	-- shows mark letter in signcolumn
	-- 	"chentoast/marks.nvim",
	-- 	event = { "BufReadPre", "BufNewFile" },
	-- },
	{
		-- easy way to navigate cursor
		"smoka7/hop.nvim",
		version = "*",
		opts = require("plugins.hop").opts,
		keys = require("plugins.hop").keys,
		-- config = require("plugins.hop").config,
	},
	-- {
	-- 	-- make fFtT keys more powerful and visual
	-- 	"rhysd/clever-f.vim",
	-- },
	-- {
	-- 	-- search and select custom commands to apply
	-- 	"FeiyouG/commander.nvim",
	-- 	dependencies = { "nvim-telescope/telescope.nvim" },
	-- },
	-- {
	-- 	"gbprod/yanky.nvim",
	-- },
	-- {
	-- 	"ggandor/leap-spooky.nvim",
	-- 	event = { "BufReadPre", "BufNewFile" },
	-- 	dependencies = { "ggandor/leap.nvim" },
	-- },
	{
		"ibhagwan/fzf-lua",
		cmd = { "FzfLua" },
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			-- "echasnovski/mini.icons",
			-- "mfussenegger/nvim-dap",
			"nvim-treesitter/nvim-treesitter-context",
			"OXY2DEV/markview.nvim",
			-- "MeanderingProgrammer/render-markdown.nvim",
		},
		keys = require("plugins.fzf-lua").keys,
		opts = require("plugins.fzf-lua").opts,
		-- config = require("plugins.fzf-lua").config,
	},
	-- {
	-- 	"MeanderingProgrammer/render-markdown.nvim",
	-- 	dependencies = {
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		"nvim-tree/nvim-web-devicons",
	-- 		-- "echasnovski/mini.nvim",
	-- 		-- "echasnovski/mini.icons",
	-- 	},
	-- },
	{
		"OXY2DEV/markview.nvim",
		ft = { "markdown" },
		dependencies = {
			-- "nvim-tree/nvim-web-devicons",
			-- "echasnovski/mini.icons",
		},
		-- enabled = false,
		opts = require("plugins.markview").opts,
	},
	-- {
	-- 	"hrsh7th/nvim-cmp",
	-- 	event = { "InsertEnter", "CmdlineEnter" },
	-- 	dependencies = {
	-- 		"hrsh7th/cmp-nvim-lsp",
	-- 		"hrsh7th/cmp-buffer",
	-- 		"hrsh7th/cmp-path",
	-- 		"hrsh7th/cmp-cmdline",
	-- 		"hrsh7th/cmp-nvim-lua",
	-- 		"uga-rosa/cmp-dictionary",
	-- 		"hrsh7th/cmp-emoji",
	-- 		"chrisgrieser/cmp-nerdfont",
	-- 		"brenoprata10/nvim-highlight-colors",
	-- 		"windwp/nvim-autopairs",
	-- 		{
	-- 			"saadparwaiz1/cmp_luasnip",
	-- 			dependencies = {
	-- 				{
	-- 					"L3MON4D3/LuaSnip",
	-- 					version = "v2.*",
	-- 					dependencies = {
	-- 						"rafamadriz/friendly-snippets",
	-- 					},
	-- 				},
	-- 			},
	-- 		},
	-- 	},
	-- },
	{
		-- shows color highlight
		"brenoprata10/nvim-highlight-colors",
		event = { "BufReadPre", "BufNewFile" },
		---@diagnostic disable-next-line: different-requires
		opts = require("plugins.nvim-highlight-colors").opts
	},
	{
		"windwp/nvim-autopairs",
		event = { "InsertEnter" },
		opts = require("plugins.nvim-autopairs").opts,
	},
	{
		"altermo/ultimate-autopair.nvim",
		branch = "v0.6",
		event = { "InsertEnter" },
		opts = require("plugins.ultimate-autopair").opts,
	},
	{
		"mtrajano/tssorter.nvim",
		version = "*", -- latest stable version, use `main` to keep up with the latest changes
		opts = require("plugins.tssorter").opts,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = require("plugins.nvim-treesitter").opts,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = require("plugins.nvim-treesitter-textobjects").opts,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = require("plugins.nvim-treesitter-context").opts,
	},
	{
		"Wansmer/treesj",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		keys = require("plugins.treesj").keys,
		opts = require("plugins.treesj").opts,
	},
	{
		"windwp/nvim-ts-autotag",
		ft = { "html" },
		opts = require("plugins.nvim-ts-autotag").opts,
	},
	{
		"folke/todo-comments.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = require("plugins.todo-comments").opts,
	},
	{
		"numToStr/Comment.nvim",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		keys = require("plugins.comment").keys,
		opts = require("plugins.comment").opts,
		-- config = require("plugins.comment").config,
	},
	{
		-- for diagnostics details view on split window
		"folke/trouble.nvim",
		cmd = { "Trouble" },
		-- keys = require("plugins.trouble").keys,
		opts = require("plugins.trouble").opts,
		config = require("plugins.trouble").config,
	},
	-- {
	-- 	-- for folding
	-- 	"kevinhwang91/nvim-ufo",
	-- 	event = { "BufReadPre", "VeryLazy" },
	-- 	dependencies = { "kevinhwang91/promise-async" },
	-- 	keys = require("plugins.nvim-ufo").keys,
	-- 	opts = require("plugins.nvim-ufo").opts,
	-- 	config = require("plugins.nvim-ufo").config,
	-- },
}
