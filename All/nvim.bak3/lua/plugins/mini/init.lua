return {
	require("plugins.mini.icons"),
	{

		"echasnovski/mini.nvim",
		enabled = require("plugins.controller").mini.main,
		version = false,
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		keys = {
			{
				mode = { "n" },
				"<leader>ee",
				function()
					require("mini.files").open()
				end,
				desc = "Explorer",
			},
		},
		config = function()
			local mini = require("plugins.controller").mini

			if mini.ai then
				require("plugins.mini.ai")()
			end
			if mini.align then
				require("plugins.mini.align")()
			end
			if mini.clue then
				require("plugins.mini.clue")()
			end
			if mini.comment then
				require("plugins.mini.comment")()
			end
			if mini.files then
				require("plugins.mini.files")()
			end
			if mini.hipatterns then
				require("plugins.mini.hipatterns")()
			end
			if mini.jump then
				require("plugins.mini.jump")()
			end
			if mini.jump2d then
				require("plugins.mini.jump2d")()
			end
			if mini.keymap then
				require("plugins.mini.keymap")()
			end
			if mini.move then
				require("plugins.mini.move")()
			end
			if mini.pair then
				require("plugins.mini.pair")()
			end
			if mini.session then
				require("plugins.mini.session")()
			end
			if mini.split_join then
				require("plugins.mini.split_join")()
			end
			if mini.surround then
				require("plugins.mini.surround")()
			end
			if mini.trailspace then
				require("plugins.mini.trailspace")()
			end

			-- require("plugins.mini.align")()
			-- -- require("plugins.mini.clue")()
			-- -- require("plugins.mini.comment")() -- instead using comment.nvim
			-- require("plugins.mini.files")()
			-- require("plugins.mini.hipatterns")()
			-- -- require("plugins.mini.jump")() -- instead using clever-f
			-- -- require("plugins.mini.jump2d")() -- instead using hop
			-- -- require("plugins.mini.keymap")() -- don't know what is that
			-- require("plugins.mini.move")()
			-- -- require("plugins.mini.pair")() -- instead of using nvim-autopairs
			-- -- require("plugins.mini.session")() -- instead of using persistence
			-- require("plugins.mini.split_join")()
			-- require("plugins.mini.surround")()
			-- require("plugins.mini.trailspace")()
		end,
	},
}
