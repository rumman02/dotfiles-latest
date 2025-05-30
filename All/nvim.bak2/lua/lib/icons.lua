local M = {}

M.ui = {
	arrow = {
		left = "󰳝 ",
		-- left = "󰬨 ",
		right = "󰳟 ",
		-- right = "󰬪 ",
	},
	border = {
		bottom = {
			left = "╰",
			right = "╯",
		},
		horizontal = "─",
		top = {
			left = "╭",
			right = "╮",
		},
		vertical = "│",
	},
	close = "󱎘 ",
	quit = "󰍃 ",
}

M.git = {
	-- added = "󰐙 ",
	added = "󰐗 ",
	-- added = "󰐖 ",
	branch = " ",
	-- conflict = "󱨧 ",
	conflict = "󱡝 ",
	diff = "󰆗 ",
	ignored = "󱥸 ",
	-- modified = "󰻃 ",
	logo = "󰊤 ",
	-- modified = "󰻂 ",
	modified = "󰪥 ",
	-- removed = "󰜺 ",
	octoface = " ",
	-- removed = "󰍵 ",
	-- renamed = "󰮍 ",
	removed = "󰍶 ",
	renamed = "󰟃 ",
	-- staged = "󰬭 ",
	repo = " ",
	staged = "󰬬 ",
	-- unstaged = "󰬧 ",
	tag = " ",
	-- untracked = "󰄰 ",
	unstaged = "󰬦 ",
	untracked = "󰋗 ",
}

M.diagnostics = {
	debug = "󰃤 ",
	error = "󰅙 ",
	-- hint = "󱤅 ",
	hint = "󰌵 ",
	info = "󰋼 ",
	ques = "󰋗 ",
	-- warn = "󰀨 ",
	trace = " ",
	warn = "󰀦 ",
}

M.documents = {
	file = {
		add = "󰝒 ",
		default = "󰈔 ",
		find = "󰱼 ",
		import = "󰈠 ",
		recent = "󱋡 ",
		written = " ",
	},
	folder = {
		closed = "󰉋 ",
		empty = "󰉖 ",
		multi = "󰉓 ",
		opened = "󰝰 ",
		tree = "󰙅 ",
	},
	hidden = "󰈉 ",
	modified = "󰑊 ",
	-- modified = " ",
	-- modified = "󰑊 ",
	-- modified = "󰪥 ",
	save = "󰆓 ",
	text = {
		find = "󱎸 ",
	},
}

M.others = {
	buffers = "󰀻 ",
	editor = {
		neovim = " ",
		vim = " ",
	},
	favorite = "󰓎 ",
	find = {
		layer = "󱈆 ",
		session = "󱈅 ",
		-- session = "󰛔 ",
	},
	flash = "󰉁 ",
	init = "󰟒 ",
	-- start = "󰐊 ",
	key = "󰌆 ",
	label = "󰌕 ",
	-- setting = "󰣖 ",
	mark = "󰍎 ",
	pin = "󰐃 ",
	-- restore = "󱍷 ",
	-- restore = "󱍸 ",
	plugin = "󰐱 ",
	record = "󰑊 ",
	require = "󰢱 ",
	restore = "󰑌 ",
	runtime = "󰓅 ",
	-- favorite = "󰫢 ",
	server = "󰇖 ",
	setting = "󰒓 ",
	-- plugin = "󱊈 ",
	-- plugin = "󱘖 ",
	sleep = "󰒲 ",
	source = "󰐤 ",
	-- require = "󰃀 ",
	start = "󰗍 ",
	-- source = "󰆦 ",
	state = {
		loaded = "󰗠 ",
		not_loaded = "󰄯 ",
		pending = "󰟃 ",
	},
	task = "󱃔 ",
	terminal = " ",
	toggle = {
		off = "󰨙 ",
		on = "󰔡 ",
	},
}

M.separators = {
	left = {
		default = "",
		-- default = "🙽",
		-- default = "",
		-- default = "",
		-- default = "",
		-- default = "▓▒░",
		secondary = "╱",
		third = "▏", -- used only in lualine besides scrollbar
	},
	right = {
		default = "",
		-- default = "🙼",
		-- default = "",
		-- default = "",
		-- default = "",
		-- default = "░▒▓",
		secondary = "╲",
		third = "▕", -- used only in lualine besides scrollbar
	},
}

M.indent_line = {
	bottom = "─",
	default = "│",
	last = "╰",
}

M.kind = {
	array = "󰅪 ",
	boolean = "󰨚 ",
	class = " ",
	color = "󰸌 ",
	constant = "󱀍 ",
	constructor = " ",
	enum = " ",
	enumMember = " ",
	event = " ",
	field = " ",
	file = "󰈤 ",
	folder = "󰉖 ",
	functions = "󰊕 ",
	interface = "󰒉 ",
	key = "󰷖 ",
	-- keyword = "󰤱 ",
	keyword = "󰐣 ",
	method = "󰮄 ",
	module = "󰆧 ",
	namespace = "󰧾 ",
	null = "󰊓 ",
	number = "󰎠 ",
	object = "󰅩 ",
	operator = "󰆕 ",
	package = "󰏗 ",
	property = " ",
	reference = "󰷋 ",
	-- snippet = "󰏢 ",
	snippet = "󱍫 ",
	struct = " ",
	text = "󰀬 ",
	typeParameter = " ",
	unit = "󰑭 ",
	value = " ",
	variable = "󰆧 ",
}

return M
