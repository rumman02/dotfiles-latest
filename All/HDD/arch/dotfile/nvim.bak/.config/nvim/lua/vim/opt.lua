local guicursor = {
	-- "a:block",  -- all modes block
	"n-v-c:block", -- Normal, visual, command-line: block cursor
	"i-c-ve:ver25", -- Insert, command-line, visual-exclude: vertical bar cursor with 25% width
	"r-cr:hor20", -- Replace, command-line replace: horizontal bar cursor with 20% height
	"o:hor50", -- Operator-pending: horizontal bar cursor with 50% height
	"a:blinkwait700-blinkoff400-blinkon250", -- All modes: blinking settings
	"sm:block-blinkwait175-blinkoff150-blinkon175", -- Showmatch: block cursor with specific blinking settings
}

local opt = vim.opt
opt.number = true -- line number
opt.relativenumber = false -- line number relatives to current cursor line
opt.tabstop = 4 -- indent size
opt.shiftwidth = 4 -- indent size for this ">" or "<" indentation
opt.smartindent = true -- handle indenting more smart way
opt.breakindent = true -- if line wrap then wrapped line also be indented
opt.wrap = false -- no line wrap
opt.linebreak = true -- line break with full word
opt.splitbelow = true -- default horizontal split to right
opt.splitright = true -- default vertical split to left
opt.signcolumn = "yes:2" -- create gaps beside line number for showing signs
opt.cursorline = false -- highlight current cursor line
opt.guicursor = guicursor -- cursor ui behavior
opt.pumheight = 15 -- items of autosuggestion/cmp shows at the same time
opt.timeoutlen = 5 -- wait for mapped sequence to complete in milliseconds
opt.smoothscroll = true -- scrolling works with screen lines
opt.scrolloff = 0 -- number of screen lines to keep above and below the cursor
opt.sidescrolloff = 0 -- number of screen lines to keep left and right the cursor
opt.undofile = true -- enables undo even write and quit the file
opt.undolevels = 2000 -- number of undo can be possible
opt.ignorecase = true -- ignore case when search
opt.smartcase = true -- any capital letters make search case sensitive
opt.cmdheight = 1 -- cmdline hight
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
opt.fillchars = "eob: ,vert:│,horiz:─,fold: ,foldopen: ,foldclose: " -- remove "~" form empty lines and more 
opt.guifont = "JetBrains Mono,Symbols Nerd Font:h14:" -- set neovim gui font-family
opt.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
