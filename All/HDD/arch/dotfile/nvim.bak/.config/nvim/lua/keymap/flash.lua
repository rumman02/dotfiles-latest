local which_key = require("which-key")

which_key.add({
	{ "sf", function() require("flash").jump({ search = { forward = true, wrap = false, multi_window = false } }) end, desc = "[F]orward", mode = { "n", "x", "o" } },
	{ "sb", function() require("flash").jump({ search = { forward = false, wrap = false, multi_window = false } }) end, desc = "[B]ackward", mode = { "n", "x", "o" } },
	{ "sm", function() require("flash").jump() end, desc = "[M]ove", mode = { "n", "x", "o" } },
	{ "sl", function() require("flash").jump({ search = { mode = "search", max_length = 0 }, label = { after = { 0, 0 } }, pattern = "^" }) end, desc = "[L]ine", mode = { "n", "x", "o" } },
	{ "sc", function() require("flash").jump({ pattern = vim.fn.expand("<cword>") }) end, desc = "Under [C]ursor", mode = { "n", "x", "o" } },
	{ "sw", function() require("flash").jump({
		search = {
			mode = function(pattern)
				-- remove leading dot
				-- return word pattern and proper skip pattern
				return ([[\<%s\w*\>]]):format(pattern), ([[\<%s]]):format(pattern)
			end,
		},
		jump = { pos = "range" },
	}) end, desc = "[W]ord", mode = { "n", "x", "o" } },
	-- { "ss", function() require("flash").treesitter() end, desc = "Scope", mode = { "n", "x", "o" } },
	-- { "r", function() require("flash").remote() end, desc = "Flash remote", mode = { "o" } },
	-- { "R", function() require("flash").treesitter_search() end, desc = "Treesitter search", mode = { "x", "o" } },
	-- { "<c-s>s", function() require("flash").toggle() end, desc = "Toggle flash search", mode = { "n", "c" } },
})
