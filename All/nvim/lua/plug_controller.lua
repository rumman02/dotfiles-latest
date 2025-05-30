local M = {}

M.keymaps = {
	hydra = true,
	which_key = true,
}

M.mason = {
	mason = true,
	mason_lsp = true,
	tool_installer = true,
	mason_lint = true,
	mason_conform = false,
	mason_dap = false,
}

M.colorschemes = {
	gruvbox = false,
	dracula = false,
	rose_pine = false,
	tokyonight = true,
	catppuccin = false,
}

M.cmp = {
	nvim_cmp = false,
	blink_cmp = true,
}

M.dap = {}

M.linter = {}

M.formatter = {
	conform = true,
}

M.comments = {
	comment = true,
	todo_comment = true,
}

M.treesitter = {
	treesitter = true,
}

M.lsp = {
	nvim_lsp = true,
	lspsaga = false,
}

return M
