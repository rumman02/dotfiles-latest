return {
	"pogyomo/submode.nvim",
	enabled = require("plugins.controller").keymap.submode,
	event = { "VeryLazy" },
	config = function()
		local submode = require("submode")
		-- submode.create("WinMove", {
		-- 	mode = "n",
		-- 	enter = "<C-w>",
		-- 	leave = { "q", "<ESC>" },
		-- 	default = function(register)
		-- 		register("h", "<C-w>h")
		-- 		register("j", "<C-w>j")
		-- 		register("k", "<C-w>k")
		-- 		register("l", "<C-w>l")
		-- 	end,
		-- })

		-- submode.create("Hunk", {
		-- 	mode = "n",
		-- 	enter = "<leader>gh",
		-- 	leave = { "q", "<ESC>" },
		-- 	default = function(register)
		-- 		register("p", "<cmd>Gitsigns prev_hunk<cr>")
		-- 		register("n", "<cmd>Gitsigns next_hunk<cr>")
		-- 	end,
		-- })
	end,
}
