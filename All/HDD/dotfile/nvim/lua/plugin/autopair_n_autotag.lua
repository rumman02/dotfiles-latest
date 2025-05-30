return {
	{
		'windwp/nvim-autopairs',
		-- event = dependent on cmp
		config = function()
			local autopairs = require("nvim-autopairs")
			autopairs.setup({})
		end

	},
	{
		"windwp/nvim-ts-autotag",
		ft = {
			"astro",
			"glimmer",
			"handlebars",
			"html",
			"javascript",
			"jsx",
			"markdown",
			"php",
			"rescript",
			"svelte",
			"tsx",
			"typescript",
			"vue",
			"xml",
		},
		config = function ()
			local nvim_ts_autotag = require("nvim-ts-autotag")
			nvim_ts_autotag.setup({})
		end
	}
}
