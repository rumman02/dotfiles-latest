-------------------------------------------------------------------------------
-- creates a dynamic cursor column at insert mode
-------------------------------------------------------------------------------
vim.api.nvim_create_autocmd({ "InsertEnter", "CursorMovedI" }, {
	callback = function(n)
		if vim.bo[n.buf].filetype == "TelescopePrompt" then
			vim.opt.colorcolumn = ""
		else
			vim.opt.colorcolumn = "80"
		end
	end,
})

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
	callback = function()
		vim.opt.colorcolumn = ""
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.opt.colorcolumn = ""
	end,
})

