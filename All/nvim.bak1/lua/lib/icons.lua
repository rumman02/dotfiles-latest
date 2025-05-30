local M = {};

M.ui = {
  border = {
    top = {
      left = "╭",
      right = "╮",
    },
    bottom = {
      left = "╰",
      right = "╯",
    },
    horizontal = "─",
    vertical = "│",
  },
	close = "󱎘",
	quit = "󰍃",
  arrow = {
	  left = "󰳝",
	  -- left = "󰬨",
	  right = "󰳟",
	  -- right = "󰬪",
  },
};

M.git = {
	-- added = "󰐙",
	added = "󰐗",
	-- added = "󰐖",
	branch = "",
	-- conflict = "󱨧",
	conflict = "󱡝",
	diff = "󰆗",
	ignored = "󱥸",
	-- modified = "󰻃",
	modified = "󰪥",
	-- modified = "󰻂",
	octoface = "",
	-- removed = "󰜺",
	removed = "󰍶",
	-- removed = "󰍵",
	-- renamed = "󰮍",
	renamed = "󰟃",
	repo = "",
	-- staged = "󰬭",
	staged = "󰬬",
	tag = "",
	-- unstaged = "󰬧",
	unstaged = "󰬦",
	-- untracked = "󰄰",
	untracked = "󰋗",
	logo = "󰊤",
};

M.diagnostics = {
	error = "󰅙",
	hint = "󰌵",
	-- hint = "󱤅",
	info = "󰋼",
	ques = "󰋗",
	warn = "󰀦",
	-- warn = "󰀨",
	debug = "󰃤",
	trace = "",
};

M.documents = {
  file = {
		add = "󰝒",
    default = "󰈔",
		written = "",
		import = "󰈠",
		find = "󰱼",
		recent = "󱋡",
  },
  folder = {
    multi = "󰉓",
		closed = "󰉋",
		opened = "󰝰",
		empty = "󰉖",
		tree = "󰙅",
  },
};

M.extras = {
  find = {
	  layer = "󱈆",
	  session = "󱈅",
	  -- session = "󰛔",
  },
  editor = {
	  vim = "",
	  neovim = "",
  },
  toggle = {
	  on = "󰔡",
	  off = "󰨙",
  },
  state = {
	  loaded = "󰗠",
	  pending = "󰟃",
	  not_loaded = "󰄯",
  },
  modified = "󰑊",
	-- modified = "",
	-- modified = "󰑊",
	-- modified = "󰪥",
	hidden = "󰈉",
  init = "󰟒",
	key = "󰌆",
	-- start = "󰐊",
	start = "󰗍",
	setting = "󰒓",
	-- setting = "󰣖",
	server = "󰇖",
	restore = "󰑌",
	-- restore = "󱍷",
	-- restore = "󱍸",
	mark = "󰍎",
	flash = "󰉁",
	pin = "󰐃",
	terminal = "",
	favorite = "󰓎",
	-- favorite = "󰫢",
	sleep = "󰒲",
	plugin = "󰐱",
	-- plugin = "󱊈",
	-- plugin = "󱘖",
	runtime = "󰓅",
	require = "󰢱",
	-- require = "󰃀",
	source = "󰐤",
	-- source = "󰆦",
	task = "󱃔",
	label = "󰌕",
	save = "󰆓",
	buffers = "󰀻",
	record = "󰑊",
};

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
};

M.indent_line = {
  default = "│",
	last = "╰",
	bottom = "─",
};

M.kind = {
	File = "󰈤",
	Module = "󰆧",
	Namespace = "󰧾",
	Package = "󰏗",
	Class = "",
	Method = "󰮄",
	Property = "",
	Field = "",
	Constructor = "",
	Enum = "",
	Interface = "󰒉",
	Functions = "󰊕",
	Variable = "󰫧",
	Constant = "󱀍",
	Number = "󰎠",
	Boolean = "󰨚",
	Array = "󰅪",
	Object = "󰅩",
	Key = "󰷖",
	Value = "",
	Null = "󰊓",
	EnumMember = "",
	Struct = "",
	Event = "",
	Operator = "󰆕",
	TypeParameter = "",
	Color = "󰸌",
	Folder = "󰉖",
	Keyword = "󰤱",
	Reference = "󰷋",
	Snippet = "󰏢",
	Text = "󰀬",
	Unit = "󰑭",
};

return M;
