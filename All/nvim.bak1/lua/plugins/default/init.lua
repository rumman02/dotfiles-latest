local requires = require("lib.functions").requires;

return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    cmd = { "Colorscheme tokyonight" },
    opts = requires("plugins.default.tokyonight").opts;
    config = requires("plugins.default.tokyonight").config;
  },
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		lazy = false,
		cmd = { "Colorscheme gruvbox" },
		opts = requires("plugins.default.gruvbox").opts,
		config = requires("plugins.default.gruvbox").config,
	},
  {
	  "goolord/alpha-nvim",
	  dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
	  config = require("plugins.default.alpha-nvim").config,
	},
  {
		"nvim-lualine/lualine.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"folke/noice.nvim", -- for showing pressed keys on lualine
		},
		opts = requires("plugins.default.lualine").opts,
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
		keys = requires("plugins.default.neo-tree").keys,
		opts = requires("plugins.default.neo-tree").opts,
	},
  {
    "folke/which-key.nvim",
    opts = requires("plugins.default.which-key").opts,
  },
  {
    "rmagatti/auto-session",
    keys = requires("plugins.default.auto-session").keys,
	  opts = requires("plugins.default.auto-session").opts,
  },
  {
		"romgrk/barbar.nvim",
		version = "^1.0.0",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"lewis6991/gitsigns.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		init = requires("plugins.default.barbar").init,
    keys = requires("plugins.default.barbar").keys,
		opts = requires("plugins.default.barbar").opts,
	},
  {
		"saghen/blink.cmp",
		version = "*",
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
      "rafamadriz/friendly-snippets"
    },
		opts = requires("plugins.default.blink").opts,
	},
  {
    "akinsho/bufferline.nvim",
		version = "*",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			-- "tiagovla/scope.nvim",
		},
		keys = require("plugins.default.bufferline").keys,
		opts = require("plugins.default.bufferline").opts,
  },
  {
		-- a animation plugins just for fun, like all codes will falled like rain
		"eandrju/cellular-automaton.nvim",
		cmd = { "CellularAutomaton" },
		opts = require("plugins.default.cellular-automation").opts,
	},

}
