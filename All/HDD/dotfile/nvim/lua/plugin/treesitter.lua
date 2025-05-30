return {
	"nvim-treesitter/nvim-treesitter",
	event = { "VeryLazy" },
	build= ":TSUpdate",
	config = function ()
		local treesitter = require("nvim-treesitter.configs")
		treesitter.setup({
			ensure_installed = {},
			sync_install = false,
			auto_install = true,
			ignore_install = {},
			modules = {},
		})
	end
}
