local commands = {
	-- colorscheme
	-- "colorscheme catppuccin",
	-- removes bg, fg of split window separator statusline, 
	"lua vim.api.nvim_set_hl(0, 'StatusLine', {fg='none', bg='none', force=true})",
	"lua vim.api.nvim_set_hl(0, 'StatusLineNC', {fg='none', bg='none', force=true})",
}


for _, command in ipairs(commands) do
	vim.cmd(command)
end
