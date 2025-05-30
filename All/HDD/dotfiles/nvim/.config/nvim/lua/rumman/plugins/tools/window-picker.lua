local window_picker = require("window-picker")

window_picker.setup({
	show_prompt = false,
	    highlights = {
        statusline = {
            unfocused = {
                fg = '#888888',
                bg = '#000000',
                bold = true,
            },
        },
        winbar = {
            unfocused = {
                fg = '#888888',
                bg = '#000000',
                bold = true,
            },
        },
    },
})

