return {
	"ellisonleao/gruvbox.nvim",
	event = { "VimEnter" },
	priority = 1000,
	config = function ()
		local gruvbox = require("gruvbox")
		gruvbox.setup({
			contrast = "",
			overrides = { SignColumn = { bg = "none" }, FloatBorder = { link = "GruvboxBg2" }, CmpBorder = { link = "GruvboxBg2" }, CmpDocBorder = { link = "GruvboxBg2" }, WhichKeyBorder = { link = "GruvboxBg2" }, FlashLabel = { fg = "#fff100" }, NeotreeNormal = { bg = "#1c1c1c" }, NeotreeNormalNC = { bg = "#1c1c1c" }, },
			transparent_mode = false,
		})
		vim.o.background = "dark"
		vim.cmd.colorscheme "gruvbox"
	end
}
