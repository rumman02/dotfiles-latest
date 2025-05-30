local cmd = vim.cmd

cmd "colorscheme gruvbox"

-- removes bg, fg of split window separator statusline, 
cmd "lua vim.api.nvim_set_hl(0, 'StatusLine', {fg='none', bg='none', force=true})"
cmd "lua vim.api.nvim_set_hl(0, 'StatusLineNC', {fg='none', bg='none', force=true})"
