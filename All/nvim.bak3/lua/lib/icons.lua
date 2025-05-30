local M = {}

M.git = {
	-- added = "󰐙 ",
	added = "󰐗 ",
	-- added = "󰐖 ",
	branch = " ",
	-- conflict = "󱨧 ",
	conflict = "󱡝 ",
	commit = "󰜘 ",
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
	untracked = "󰄰 ",
	unstaged = "󰬦 ",
	-- untracked = "󰋗 ",
}

M.diagnostics = {
	debug = "󰃤 ",
	error = "󰅙 ",
	hint = "󱤅 ",
	-- hint = "󰌵 ",
	info = "󰋼 ",
	ques = "󰋗 ",
	warn = "󰀨 ",
	trace = " ",
	-- warn = "󰀦 ",
}

M.kind = {
	Array = " ",
	Boolean = "󰨙 ",
	Class = " ",
	Color = " ",
	Control = " ",
	Collapsed = " ",
	Constant = "󰏿 ",
	Constructor = " ",
	Copilot = " ",
	Enum = " ",
	EnumMember = " ",
	Event = " ",
	Field = " ",
	File = " ",
	Folder = " ",
	Function = "󰊕 ",
	Interface = " ",
	Key = " ",
	Keyword = " ",
	Method = "󰊕 ",
	Module = " ",
	Namespace = "󰦮 ",
	Null = " ",
	Number = "󰎠 ",
	Object = " ",
	Operator = " ",
	Package = " ",
	Property = " ",
	Reference = " ",
	Snippet = "󱄽 ",
	String = " ",
	Struct = "󰆼 ",
	Text = " ",
	TypeParameter = " ",
	Unit = " ",
	Unknown = " ",
	Value = " ",
	Variable = "󰀫 ",
}

M.filesystem = {
	file = {
		add = "󰝒 ",
		default = "󰈔 ",
		find = "󰱼 ",
		import = "󰈠 ",
		recent = "󱋡 ",
		written = " ",
	},
	folder = {
		default = "󰉋 ",
		empty = "󰉖 ",
		multi = "󰉓 ",
		opened = "󰝰 ",
		tree = "󰙅 ",
	},
	modified = "󰑊 ",
}

-- Default: `▎` ~
--
-- Alternatives: ~
--   • left aligned solid
--     • `▏`
--     • `▎` (default)
--     • `▍`
--     • `▌`
--     • `▋`
--     • `▊`
--     • `▉`
--     • `█`
--   • center aligned solid
--     • `│`
--     • `┃`
--   • right aligned solid
--     • `▕`
--     • `▐`
--   • center aligned dashed
--     • `╎`
--     • `╏`
--     • `┆`
--     • `┇`
--     • `┊`
--     • `┋`
--   • center aligned double
--     • `║`

return M
