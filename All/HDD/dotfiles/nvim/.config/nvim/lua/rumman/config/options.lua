local utils = require("rumman.lib.utils")
local icons = require("rumman.lib.icons")

local options = {
	autoindent = true, --[[ copy indent from current line and apply that into next
	line ]]
	backspace = "indent,eol,start",
	breakindent = true, -- breaked line also indented
	cmdheight = 0, --[[ more heigth enables displaying messages in cmdline into
	file who have nothing ]]
	colorcolumn = "",
	completeopt = utils.completeopt.behavior, --[[ menu, menuone (single options
	also shows as completion menu), noinsert (selects the first option by default) ]]
	conceallevel = 0, -- text is shown normally, even shows `` this also in .md file
	confirm = true, -- confirms the save changes before exiting modified buffer
	cursorline = false, -- enables current line highlighted
	equalalways = false, -- split windows are same size
	expandtab = false, -- converts tabs into spaces
	fillchars = "eob: " .. ",vert:" .. icons.ui.BorderLeft .. ",horiz:" .. icons.ui.BorderBottom,
	fileencoding = "utf-8", -- the encoding written to a file
	guicursor = {
		"a:block",
		-- "n-v-c:block", -- normal, visual, command-line: block cursor
		-- "i-c-ci-ve:ver25", --[[ insert, command-line, visual-exclude: vertical bar
		-- cursor with 25% width ]]
		-- "r-cr:hor20", --[[ replace, command-line replace: horizontal bar cursor
		-- with 20% height ]]
		-- "o:hor50", -- operator-pending: horizontal bar cursor with 50% height
		"a:blinkwait1000-blinkon500-blinkoff500", -- All modes: blinking settings
	}, -- cursor ui behavior
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
	inccommand = "split", -- open split window while while search and replace
	laststatus = 0, -- windows will have a status line always and only last window
	statusline = "",
	linebreak = true, -- line break with full word
	mouse = "a", -- allow the mouse to be used in neovim
	number = true, -- set numbered lines
	numberwidth = 1, -- set number column width to 2 {default 4}
	pumblend = utils.ui.window_blend, -- popup blend
	pumheight = utils.completeopt.max_height, -- pop up menu height
	relativenumber = false, -- set relative numbered lines
	scrolloff = 0, -- starts scrolling buffer before n number of rows
	sessionoptions = {
		"buffers",
		"tabpages",
		"globals",
		"curdir",
		"folds",
		"help",
		"winsize",
		"winpos",
		"terminal",
		"localoptions",
		"skiprtp",
	},
	shiftround = true, -- Round indent shiftwidth = 4, -- shifted indent size
	shiftwidth = utils.indent_size.editor,
	showcmd = true,
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	showtabline = 0, -- always show tabs
	sidescrolloff = 0, -- starts scrolling buffer before n number of column
	signcolumn = "auto:2-5", --[[ always show the sign column, otherwise it would
	shift the text each time ]]
	smartcase = true, -- single capital letter makes search case sensitive
	smartindent = true, -- get indent size from line/file smartly
	smarttab = true,
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = false, -- creates a swapfile
	tabstop = utils.indent_size.editor, -- tab size
	termguicolors = true, -- set term gui colors (most terminals support this)
	timeout = true, -- enable timeout for key sequences; Neovim will wait for the full sequence
	timeoutlen = 0, -- set the timeout length to 0, disabling the wait time between key presses
	undofile = true, -- enable persistent undo
	undolevels = 10000, -- number of undos
	updatetime = 10, -- faster completion (4000ms default)
	wildmenu = true, -- wildmenu
	wildmode = "longest:full,full", -- Command-line completion mode
	winwidth = 5, -- minimum number of columns for the current window
	winminwidth = 5, -- minimum width of a window
	wrap = false, -- display lines as one long line
	writebackup = false, -- do not edit backups
	foldcolumn = "0",
	foldlevel = 99,
	foldlevelstart = 99,
	foldenable = true,
}

for key, value in pairs(options) do
	vim.opt[key] = value
end
