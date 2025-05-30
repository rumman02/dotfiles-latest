-- plugin: https://github.com/brenoprata10/nvim-highlight-colors
-- config: https://github.com/brenoprata10/nvim-highlight-colors?tab=readme-ov-file#options
return {
	"brenoprata10/nvim-highlight-colors",
	event = { "BufReadPre", "BufNewFile" },
	config = function ()
		local nvim_highlight_color = require("nvim-highlight-colors")
		nvim_highlight_color.setup({})
	end
}
