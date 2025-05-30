local utils = require("lib.utils")
local opt = vim.opt

-- related to sign columns
opt.number = true
opt.relativenumber = false
opt.numberwidth = 1
opt.signcolumn = "auto:2-4"

-- related to indentations
opt.autoindent = true
opt.breakindent = true
opt.smartindent = true
opt.linebreak = true
opt.smarttab = true
opt.expandtab = false
opt.shiftwidth = 2
opt.tabstop = 2

-- related to auto completeions
opt.completeopt = utils.completeopt.behavior
opt.pumblend = 0
opt.pumheight = 10
opt.updatetime = 100

-- related to cmdline
opt.cmdheight = 0
opt.showcmd = false
opt.showmode = false
opt.wildmenu = true
opt.wildmode = "longest:full,full"

-- related to statusline
opt.laststatus = 0
opt.statusline = "%="
opt.showtabline = 0

-- related to ui
opt.hlsearch = true
opt.colorcolumn = ""
opt.list = true
opt.fillchars = {
	eob = " ",
	-- vert = " ",
	-- horiz = " ",
}
opt.listchars = {
	-- tab = "| ",
	tab = "  ",
	trail = "·",
	nbsp = "␣",
}
opt.termguicolors = true
opt.background = "dark"
opt.wrap = false

-- related to window
opt.equalalways = false
opt.splitbelow = true
opt.splitright = true
opt.winwidth = 5
opt.winminwidth = 5

-- related to cursor & mouse
opt.cursorline = false
opt.mouse = "a"
opt.guicursor = {
	"n-v-c:block",
	"i-c-ci-ve:ver25",
	"r-cr:hor20",
	"o:hor50",
	-- "a:block",
	"a:blinkwait1000-blinkoff500-blinkon250",
}

-- related to key
opt.timeout = true
opt.timeoutlen = 0

-- related to files
opt.confirm = true
opt.fileencoding = "utf-8"
opt.conceallevel = 0
opt.swapfile = false
opt.undofile = true
opt.undolevels = 10000

-- related to search
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "split"

-- related to scrolling
opt.scrolloff = 0
opt.sidescrolloff = 0

-- related to sessions
opt.sessionoptions = {
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
}

-- related to fold
opt.foldenable = true
opt.foldcolumn = "auto:9"
opt.foldlevel = 1
opt.foldlevelstart = 1

-- opt.foldenable = true
-- opt.foldcolumn = "1"
-- opt.foldlevel = 99
-- opt.foldlevelstart = 99
