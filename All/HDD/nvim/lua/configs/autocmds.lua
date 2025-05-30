--[[ Dynimic colorcolumn (Others mode hidden, Insert mode shows) ]]
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = "*",
  callback = function()
    local mode = vim.api.nvim_get_mode().mode
    if mode == "i" then
      -- Insert mode: set colorcolumn to 80
      vim.opt.colorcolumn = "80"
    else
      -- Other modes: reset colorcolumn to 0
      vim.opt.colorcolumn = ""
    end
  end,
})

-- Disable line numbers and relative line numbers for Markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern =  { "markdown" },
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})

-- Re-enable line numbers and relative line numbers for non-Markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    if vim.bo.filetype ~= "markdown" then
      vim.number = true
      vim.relativenumber = true
    end
  end,
})
