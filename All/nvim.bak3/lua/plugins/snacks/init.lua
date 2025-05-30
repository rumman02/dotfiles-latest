return {
	"folke/snacks.nvim",
	enabled = require("plugins.controller").snacks.main,
	lazy = false,
	priority = 998,
	dependencies = {
		{
			"folke/persistence.nvim",
			opts = {},
		},
	},
	keys = function()
		local keymap = require("plugins.snacks.keymap").snacks_key
		return require("lib.functions").convertKeys(keymap)
	end,
	opts = {
		animate = require("plugins.snacks.animate"),
		bigfile = require("plugins.snacks.bigfile"),
		dashboard = require("plugins.snacks.dashboard")(),
		dim = require("plugins.snacks.dim"),
		explorer = require("plugins.snacks.explorer"),
		indent = require("plugins.snacks.indent"),
		image = require("plugins.snacks.image"),
		lazygit = require("plugins.snacks.lazygit"),
		notify = require("plugins.snacks.notify"),
		notifier = require("plugins.snacks.notifier"),
		picker = require("plugins.snacks.picker")(),
		rename = require("plugins.snacks.rename"),
		scope = require("plugins.snacks.scope"),
		scratch = require("plugins.snacks.scratch"),
		-- scroll = require("plugins.snacks.scroll"),
		statuscolumn = require("plugins.snacks.statuscolumn"),
		styles = require("plugins.snacks.styles"),
		toggle = require("plugins.snacks.toggle"),
		terminal = require("plugins.snacks.terminal"),
		-- words = require("plugins.snacks.words"),
		zen = require("plugins.snacks.zen"),
	},
	config = function(_, opts)
		require("snacks").setup(opts)

		local toggle_leader = "<leader><leader>"
		local toggle = Snacks.toggle
		local map = vim.keymap.set

		-- renaming groups
		map({ "n" }, toggle_leader .. "a", "", { desc = "[A]nimate" })
		map({ "n" }, toggle_leader .. "c", "", { desc = "[C]ursor" })
		map({ "n" }, toggle_leader .. "z", "", { desc = "[Z]en" })
		map({ "n" }, toggle_leader .. "l", "", { desc = "[L]ine" })

		toggle.option("cursorline", { name = "[L]ine" }):map(toggle_leader .. "cl") -- line highlight
		toggle.option("cursorcolumn", { name = "[C]olumn highlight" }):map(toggle_leader .. "cc") -- column highlight
		toggle
			.option("scrolloff", { off = vim.o.scrolloff > 0 and vim.o.scrolloff or 0, on = 999, name = "Middle row" })
			:map(toggle_leader .. "cx") -- stay cursor at middle row

		toggle
			.option(
				"sidescrolloff",
				{ off = vim.o.sidescrolloff > 0 and vim.o.sidescrolloff or 0, on = 999, name = "Middle column" }
			)
			:map(toggle_leader .. "cy") -- stay cursor at middle column

		toggle.option("background", { off = "light", on = "dark", name = "[D]ark mode" }):map(toggle_leader .. " ") -- background dark light
		toggle.option("number", { name = "[N]umber" }):map(toggle_leader .. "ln") -- line number
		toggle.option("relativenumber", { name = "[R]elative" }):map(toggle_leader .. "lr") -- relative line number
		toggle.option("spell", { name = "[S]pelling" }):map(toggle_leader .. "p") -- word spelling
		toggle.option("wrap", { name = "[W]rap" }):map(toggle_leader .. "lw") -- word wrap

		-- snacks own keymaps
		toggle.animate():map(toggle_leader .. "aa") -- animate
		toggle.scroll():map(toggle_leader .. "as") -- animate scrolls
		--
		toggle.dim():map(toggle_leader .. "zd") -- scoped code dimming
		toggle.zen():map(toggle_leader .. "zz") -- zen mode
		toggle.zoom():map(toggle_leader .. "zZ") -- zoom mode/maximize
		--
		toggle.treesitter():map(toggle_leader .. "t") -- treesitter
		toggle.words():map(toggle_leader .. "w") -- word highlight
		toggle.indent():map(toggle_leader .. "i") -- indentation
		if vim.lsp.inlay_hint then
			toggle.inlay_hints():map(toggle_leader .. "h")
		end -- lsp inlay hint
		toggle.diagnostics():map(toggle_leader .. "d") -- diagnostics
		toggle.profiler():map(toggle_leader .. "p") -- profiler
		toggle.profiler_highlights():map(toggle_leader .. "P") -- profiler highlight
	end,
}
