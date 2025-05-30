local requires = require("lib.functions").requires;

return {
	 {
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		lazy = false,
		cmd = { "Colorscheme gruvbox" },
		opts = requires("plugins.gruvbox").opts,
		config = requires("plugins.gruvbox").config,
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
		keys = requires("plugins.neo-tree").keys,
		opts = requires("plugins.neo-tree").opts,
	},
  {
    "folke/which-key.nvim",
    opts = requires("plugins.which-key").opts,
  },
}
