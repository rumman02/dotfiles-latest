local incline = require("incline")

local icons = require("rumman.lib.icons")

incline.setup({
	window = {
		placement = {
			horizontal = "right",
			vertical = "top"
		},
		margin = {
			vertical = 0,
			horizontal = 1
		},
		winhighlight = {
			-- active = { Normal = 'MiniStatuslineModeVisual' },
			active = { Normal = 'lualine_a_normal' },
			inactive = { Normal = 'Normal' },
		}
	},
	render = function(props)
		local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
		local icon, color = require("nvim-web-devicons").get_icon_color(filename)
		local value = {}

		if vim.bo[props.buf].modified then
			value = { icons.ui.Edited .. " ", { " " }, { icon, guifg = color }, { " " }, { filename }, }
		else
			value = { { icon, guifg = color }, { " " }, { filename }, }
		end

		return value
	end,
})

