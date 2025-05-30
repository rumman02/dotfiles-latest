return {
	"RRethy/vim-illuminate",
	-- event = dependent on lsp
	config = function ()
		local auto_highlight = require("illuminate")
		auto_highlight.configure({
			filetypes_denylist = {
				"neo-tree",
				"help"
			},
		})
	end
}
