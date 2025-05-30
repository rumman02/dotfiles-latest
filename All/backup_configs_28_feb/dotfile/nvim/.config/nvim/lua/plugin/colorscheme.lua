return {
	{
		-- https://github.com/ellisonleao/gruvbox.nvim?tab=readme-ov-file#configuration
		"ellisonleao/gruvbox.nvim",
		event = { "VimEnter" },
		priority = 1000,
		opts = {
			contrast = "",
			overrides = {
				SignColumn = { bg = "none" },
				-- FloatBorder = { link = "GruvboxBg2" },
				-- CmpBorder = { link = "GruvboxBg2" },
				-- CmpDocBorder = { link = "GruvboxBg2" },
				-- WhichKeyBorder = { link = "GruvboxBg2" },
				FlashLabel = { fg = "#fff100" },
				-- NeotreeNormal = { bg = "#1c1c1c" },
				-- NeotreeNormalNC = { bg = "#1c1c1c" },
			},
			dim_inactive = false,
			transparent_mode = false,
		}
	}
}
