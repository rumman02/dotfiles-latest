local opt = vim.opt
local g = vim.g

g.mapleader = " "
g.maplocalleader = ";"
BUFLEADER = "\\"
LSPLEADER = ","

opt.number = true -- line number
opt.relativenumber = true -- line number relatives to current cursor line
opt.tabstop = 2 -- indent size
opt.shiftwidth = 2 -- indent size for this ">" or "<" indentation
opt.expandtab = false -- indent with space instead of tab
opt.smartindent = true -- handle indenting more smart way
opt.breakindent = true -- if line wrap then wrapped line also be indented
opt.wrap = false -- no line wrap
opt.linebreak = true -- line break with full word
opt.splitbelow = true -- default horizontal split to right
opt.splitright = true -- default vertical split to left
opt.signcolumn = "yes:2" -- create gaps beside line number for showing signs
opt.cursorline = false -- highlight current cursor line
-- opt.guicursor = guicursor -- cursor ui behavior
opt.pumheight = 15 -- items of autosuggestion/cmp shows at the same time
opt.pumblend = 10 -- popup blend
opt.timeoutlen = 5 -- wait for mapped sequence to complete in milliseconds
opt.smoothscroll = true -- scrolling works with screen lines
opt.scrolloff = 4 -- number of screen lines to keep above and below the cursor
opt.sidescrolloff = 8 -- number of screen lines to keep left and right the cursor
opt.undofile = true -- enables undo even write and quit the file
opt.undolevels = 10000 -- number of undo can be possible
opt.ignorecase = true -- ignore case when search
opt.smartcase = true -- any capital letters make search case sensitive
opt.cmdheight = 0 -- cmdline hight
opt.showcmd = false -- shows operator pendings on cmdline ex: c, y
opt.showmode = false -- shows mode on cmdline ex: --INSERT--
opt.inccommand = "split" -- open split and shows matching search and replace
opt.ruler = false -- shows current line & column number on statusline
opt.laststatus = 0 -- remove last split windows status line
opt.statusline = "%=" -- remove all split windows status line
opt.confirm = true -- show propmt for unsaved files to ask the save files
opt.swapfile = false -- use memory for recovery unsaved changes or crashes
opt.termguicolors = true -- enables terminal 24-bit rgb color
opt.mouse = "a" -- mouse supports for all modes
-- opt.completeopt = "menu,menuone,noselect" -- auto completion options
opt.guifont = "JetBrains Mono,Symbols Nerd Font:h14:" -- set neovim gui font-family
opt.winwidth = 10
opt.winminwidth = 10
opt.equalalways = false
opt.sessionoptions = {
	"buffers",
	"curdir",
	"folds",
	"help",
	"tabpages",
	"winsize",
	"winpos",
	"terminal",
	"localoptions",
	"globals",
	"skiprtp"
}
opt.fillchars = {
	eob = " ", -- remove "~" from eof
	vert = "│", -- split window vertical
	horiz = "─", -- split window horizontal
	fold = " ",
	foldopen = "",
	foldclose = "",
	foldsep = " ",
	diff = "╱"
}
-- experimental
-- opt.foldlevel = 99 -- minimum number of line, where folding starts
opt.list = false -- show some invisible characters (tabs, whitespace, etc)
opt.listchars = { tab = "᭸᭸", trail = "·", nbsp = "+" } -- invisible characters
-- opt.winminwidth = 5 -- minimum window width
-- opt.jumpoptions = "view"
-- opt.shiftround = true -- round indent
-- opt.spelllang = { "en" }
-- opt.spelloptions:append("noplainbuffer")
