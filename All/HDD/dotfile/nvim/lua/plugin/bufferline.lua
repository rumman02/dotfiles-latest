return {
	"akinsho/bufferline.nvim",
	cond = false,
	-- event = { "BufReadPre", "BufNewFile" },
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function ()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				style_preset = {
					-- bufferline.style_preset.minimal,
					bufferline.style_preset.no_italic,
					bufferline.style_preset.no_bold,
				},
				mode = "tabs",
				diagnostics = "nvim_lsp",
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						text_align = "center",
						highlight = "Directory",
						separator = true
					}
				},
				show_close_icon = false,
				show_buffer_close_icons = false,
				show_tab_indicators = false,
				separator_style = "thin",
				enforce_regular_tabs = true,
				always_show_bufferline = true,
			}
		})
	end
}
