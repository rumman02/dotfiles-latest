local bufferline = require("bufferline")
local scope = require("scope")
local icons = require("rumman.lib.icons")

---@diagnostic disable-next-line: redundant-parameter, invisible
scope.setup({})
bufferline.setup({
	options = {
        groups = {
            items = {
                require('bufferline.groups').builtin.pinned:with({ icon = "󰐃 " })
            }
        },
		mode = "buffers",
		style_preset = {
			bufferline.style_preset.default,
			bufferline.style_preset.no_italic,
			bufferline.style_preset.no_bold,
		},
		themable = true,
		indicator = {
			style = "none",
		},
		buffer_close_icon = icons.ui.Close,
		modified_icon = icons.ui.Edited .. " ",
		close_icon = icons.ui.Close,
		left_trunc_marker = icons.ui.ArrowLeft,
		right_trunc_marker = icons.ui.ArrowRight,
		diagnostics = "nvim_lsp",
		---@diagnostic disable-next-line: unused-local
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local s = ""
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and icons.diagnostics.Error
				or (e == "warning" and icons.diagnostics.Warning or icons.diagnostics.Hint)
				s = s .. n .. sym
			end
			return s
		end,
		truncate_names = false, -- whether or not tab names should be truncated
		tab_size = 20,
		offsets = {
			{
				filetype = "neo-tree",
				text = "Explorer",
				text_align = "center",
				separator = false,
				highlight = "Directory",
			},
		},
		color_icons = true,
		show_buffer_icons = true,
		show_buffer_close_icons = false,
		show_close_icon = false,
		show_tab_indicators = true,
		show_duplicate_prefix = true,
		persist_buffer_sort = true,
		move_wraps_at_ends = true,
		separator_style = "slope",
		enforce_regular_tabs = true,
		always_show_bufferline = true,
		auto_toggle_bufferline = true,
		close_command = "bdelete! %d",
		right_mouse_command = "bdelete! %d",
		left_mouse_command = "buffer %d",
		middle_mouse_command = nil,
		pick = {
			alphabet = "abdefghijklmpqrstuvwxyz",
		},
	},
})

