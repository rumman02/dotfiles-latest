local which_key = require("which-key")

which_key.add({
	{ "<leader>ff", "<cmd> Telescope fd <cr>", desc = "File"},
	{ "<leader>fb", "<cmd> Telescope buffers <cr>", desc = "Buffer"},
	{ "<leader>fa", "<cmd> Telescope builtin <cr>", desc = "All"},
	{ "<leader>fk", "<cmd> Telescope keymaps <cr>", desc = "keymaps"},
	{ "<leader>fib", "<cmd> Telescope current_buffer_fuzzy_find <cr>", desc = "Buffer"},
	-- { "", "", desc = "" }
})
