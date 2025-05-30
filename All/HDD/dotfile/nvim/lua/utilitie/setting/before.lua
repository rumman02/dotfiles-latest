local guicursor = {
	-- "a:block",  -- all modes block
	"n-v-c:block", -- Normal, visual, command-line: block cursor
	"i-c-ve:ver25", -- Insert, command-line, visual-exclude: vertical bar cursor with 25% width
	"r-cr:hor20", -- Replace, command-line replace: horizontal bar cursor with 20% height
	"o:hor50", -- Operator-pending: horizontal bar cursor with 50% height
	"a:blinkwait700-blinkoff400-blinkon250", -- All modes: blinking settings
	"sm:block-blinkwait175-blinkoff150-blinkon175", -- Showmatch: block cursor with specific blinking settings
}

local globals = {
	mapleader = " ",
	maplocalleader = ","
}

local options = {
	number = true, -- line number
	relativenumber = false, -- line number relatives to current cursor line
	tabstop = 4, -- indent size
	shiftwidth = 4, -- indent size for this ">" or "<" indentation
	smartindent = true, -- handle indenting more smart way
	breakindent = true, -- if line wrap then wrapped line also be indented
	wrap = false, -- no line wrap
	linebreak = true, -- line break with full word
	splitbelow = true, -- default horizontal split to right
	splitright = true, -- default vertical split to left
	signcolumn = "yes:2", -- create gaps beside line number for showing signs
	cursorline = false, -- highlight current cursor line
	guicursor = guicursor, -- cursor ui behavior
	pumheight = 15, -- items of autosuggestion/cmp shows at the same time
	timeoutlen = 5, -- wait for mapped sequence to complete in milliseconds
	smoothscroll = true, -- scrolling works with screen lines
	scrolloff = 0, -- number of screen lines to keep above and below the cursor
	sidescrolloff = 0, -- number of screen lines to keep left and right the cursor
	undofile = true, -- enables undo even write and quit the file
	undolevels = 2000, -- number of undo can be possible
	ignorecase = true, -- ignore case when search
	smartcase = true, -- any capital letters make search case sensitive
	cmdheight = 0, -- cmdline hight
	showcmd = false, -- shows operator pendings on cmdline ex: c, y
	showmode = false, -- shows mode on cmdline ex: --INSERT--
	inccommand = "split", -- open split and shows matching search and replace
	ruler = false, -- shows current line & column number on statusline
	laststatus = 0, -- remove last split windows status line
	statusline = "%=", -- remove all split windows status line
	confirm = true, -- show propmt for unsaved files to ask the save files
	swapfile = false, -- use memory for recovery unsaved changes or crashes
	termguicolors = true, -- enables terminal 24-bit rgb color
	mouse = "a", -- mouse supports for all modes
	fillchars = "eob: ,vert:│,horiz:─,fold: ,foldopen: ,foldclose: ", -- remove "~" form empty lines and more 
	guifont = "JetBrains Mono,Symbols Nerd Font:h14:", -- set neovim gui font-family
	sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions",
}

-- these are simply set to neovim as normal as it is
for opts, values in pairs(options) do
	vim.opt[opts] = values
end
for opts, values in pairs(globals) do
	vim.g[opts] = values
end
