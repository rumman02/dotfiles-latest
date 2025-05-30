return {
	{
		-- https://github.com/numToStr/Comment.nvim?tab=readme-ov-file#configuration-optional
    "numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
    opts = {
			toggler = {
				line = "gcl",
				block = "gcb"
			},
			opleader = {
				line = "gcl",
				block = "gcb"
			},
			extra = {
				above = "gcO",
				below = "gco",
				eol = "gcA",
			}
		}
	},
	{
		-- https://github.com/folke/todo-comments.nvim?tab=readme-ov-file#️-configuration
		"folke/todo-comments.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-lua/plenary.nvim"
		},
		opts = {}
	},
	{
		-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
		"JoosepAlviste/nvim-ts-context-commentstring",
		-- ft = { "js", "ts", "jsx", "tsx", "svelte", "html" },
		event = { "BufReadPre", "BufNewFile" },
		opts = {}
	}
}
