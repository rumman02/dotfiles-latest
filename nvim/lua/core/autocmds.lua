-- link signcolumn to lineNr after the colorscheme is loaded
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "SignColumn", { link = "LineNr" })
	end,
})

-- -- text highlight after selected yank
-- vim.api.nvim_create_autocmd("TextYankPost", {
-- 	desc = "Highlight when yanking text",
-- 	callback = function()
-- 		vim.highlight.on_yank()
-- 	end,
-- })
