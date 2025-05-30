local M = {}

M.leader = {
	bufferline = "<c-t>",
	explorer = "<leader>e",
	finder = "<leader>f",
	folding = "<leader>z",
	git = "<leader>g",
	navigation = "<c-s>",
	option = "<leader><leader>o",
	scratch = "<leader>x",
	session = "<leader><leader>s",
	surround = "<c-s>s",
	tab = "<c-tab>",
	terminal = "<leader>t",
	toggle = "<tab>",
	trouble = "<leader>T",
	undotree = "<leader>u",
	window = "<c-w>",
	comment = "gc",
	dap = "<leader>d",
}

M.localleader = {
	explorer = "<localleader>",
	finder = "<localleader>",
	lsp = "<localleader>",
	undotree = "<localleader>",
	mason = "<localleader>",
}

M.secondary = {
	navigation = "<c-s><c-s>",
	surround = "<c-s><c-s>s",
	comment = "gb",
}

return M
