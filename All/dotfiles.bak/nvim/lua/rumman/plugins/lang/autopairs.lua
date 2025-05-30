local autopairs = require("nvim-autopairs")
local ultimate_autopair = require("ultimate-autopair")

ultimate_autopair.setup({
	extensions = {
		cmdtype = {
			p = 100,
			skip = {
				-- "/",
				-- "?",
				-- "@",
				-- "-",
				-- ":",
			},
		},
	},
})

autopairs.setup({
	disable_filetype = {
		"TelescopePrompt",
		"spectre_panel"
	},
})

