-- creates a visible new blank line end of the line
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = "*",
	callback = function()
		if vim.bo.modifiable and vim.fn.getline(vim.fn.line("$")) ~= "" then
			vim.fn.append(vim.fn.line("$"), "")
		end
	end,
})

-- creates a dynamic cursor column at insert mode
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

-- set line number to telescope previews
vim.api.nvim_create_autocmd("User", {
  pattern = "TelescopePreviewerLoaded",
  callback = function()
    vim.opt_local.number = true
  end
})

-- disable signcolumn space for toggleterm
-- vim.api.nvim_create_autocmd("Filetype", {
-- 	pattern = "zsh",
-- 	callback = function ()
-- 		vim.opt.signcolumn = "auto"
-- 		vim.opt.number = false
-- 	end
-- })

-- vim.api.nvim_create_autocmd("BufWritePost", {
-- 	callback = function()
-- 		vim.cmd("NoiceDismiss")
-- 		local function saved()
-- 			local filepath = vim.fn.expand("%")
-- 			local sizeInMb = vim.fn.getfsize(filepath)/1024
-- 			return filepath .. "\nLine:" .. vim.fn.line("$") .. " Size:" .. sizeInMb .. "mb"
-- 		end
-- 		vim.notify(saved())
-- 	end
-- })
vim.api.nvim_create_autocmd("BufWritePost", {
	callback = function()
		vim.cmd("NoiceDismiss")
		local function saved()
			local filepath = vim.fn.expand("%")
			local sizeInMb = vim.fn.getfsize(filepath) / (1024)  -- Convert to MB
			return filepath .. "\nLine:" .. vim.fn.line("$") .. " Size:" .. string.format("%.2f", sizeInMb) .. " KB"
		end
		vim.notify(saved())
	end
})

vim.api.nvim_create_autocmd("Filetype", {
	pattern = "snacks_terminal",
	callback = function()
		-- vim.opt.guicursor = 
	end
})

