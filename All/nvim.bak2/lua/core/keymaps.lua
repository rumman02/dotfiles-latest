local func = require("lib.func")
local map = func.map

map(0, { "v" }, "J", ":m '>+1<cr>gv=gv", { desc = "Moves lines down in visual selection" })
map(0, { "v" }, "K", ":m '<-2<cr>gv=gv", { desc = "Moves lines up in visual selection" })

map(0, { "n" }, "<c-d>", "<c-d>zz", { desc = "Move down in buffer with cursor centered" })
map(0, { "n" }, "<c-u>", "<c-u>zz", { desc = "Move up in buffer with cursor centered" })

map(0, { "n" }, "n", "nzzzv", { desc = "Next search item show with cursor centered" })
map(0, { "n" }, "N", "Nzzzv", { desc = "Previous search item show with cursor centered" })

map(0, { "v" }, "<", "<gv", { desc = "Decrease indentation" })
map(0, { "v" }, ">", ">gv", { desc = "Increase indentation" })

map(0, { "c" }, "<c-esc>", ":nohl<esc>", { desc = "Clear highlight" })
map(0, { "n" }, "Q", "<nop>")
map(0, { "n" }, "q", func.handle_q_colon_key, { desc = "Unexpected q key" })

-- clipboard fix
map(0, { "x", "v" }, "p", '"_dP', { desc = "Paste without replace clipboard" })
map(0, { "n" }, "x", '"_x', { desc = "Cut single char without copy" })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	callback = function()
		vim.highlight.on_yank()
	end,
})
