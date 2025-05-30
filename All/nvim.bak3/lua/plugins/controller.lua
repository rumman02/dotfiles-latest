local M = {}

M.colorscheme = {
	gruvbox = false,
	rose_pine = false,
	catppuccin = false,
	tokyonight = true,
	dracula = false,
}

M.comments = {
	comment = true,
	todo_comment = true,
}

M.explorers = {
	neo_tree = true,
}

M.finders = {
	fzf_lua = false,
	telescope = true,
}

M.git = {
	gitsigns = true,
}

M.highlights = {
	highlight_colors = true,
	tiny_glimmer = true,
}

M.keymap = {
	hydra = true,
	submode = false,
	which_key = true,
}

M.lines = {
	barbar = false,
	bufferline = true,
	cmdline = false,
	incline = true,
	lualine = true,
	noice = true,
}

M.mini = {
	main = true,
	ai = false,
	align = false,
	clue = false,
	comment = false,
	files = true,
	hipatterns = false,
	icons = true,
	jump = false,
	jump2d = false,
	keymap = false,
	move = true,
	pair = false,
	session = false,
	split_join = true,
	surround = true,
	trailspace = true,
}

M.navigations = {
	flit = true,
	clever_f = false,
	hop = true,
	leap_spooky = false,
	surround = false,
}

M.pairs = {
	nvim_autopairs = true,
	ultimate_autopair = true,
}

M.servers = {
	cmps = {
		blink = true,
		nvim_cmp = false,
	},
	dap = {
		ui = true,
		virtual_text = true,
		nvim_dap = true,
		mason_dap = true,
	},
	format = {
		conform = true,
		mason_conform = true,
	},
	linter = {
		mason_lint = true,
		nvim_lint = true,
	},
	lsp = {
		mason_lsp = true,
		nvim_lsp = true,
	},
	treesitter = {
		treesitter = true,
	},
	mason = true,
	installer = false,
}

M.snacks = {
	main = true,
	animate = true,
	bigfile = false,
	dashboard = true,
	dim = true,
	explorer = true,
	image = true,
	indent = true,
	lazygit = true,
	notifier = true,
	notify = true,
	picker = true,
	rename = true,
	scope = true,
	scratch = true,
	scroll = true,
	statuscolumn = true,
	styles = true,
	terminal = true,
	toggle = true,
	words = true,
	zen = true,
}

M.markdown = {
	obsidian = true,
	render_markdown = false,
	markview = true,
	markdown_preview = true,
}

return M
