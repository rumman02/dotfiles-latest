-- https://github.com/brenoprata10/nvim-highlight-colors?tab=readme-ov-file#options
return {
	"brenoprata10/nvim-highlight-colors",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		render = "background",
		virtual_symbol = "██",
		exclude_filetypes = { "notify", "noice" },
		exclude_buftypes = {}
	}
}
