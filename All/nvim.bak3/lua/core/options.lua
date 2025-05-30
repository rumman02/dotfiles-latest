local opt = vim.opt
local utils = require("lib.utils")

-- sign & number column
opt.number = true
opt.relativenumber = true
opt.numberwidth = 1
opt.signcolumn = "yes" -- "auto:2-4"

-- indentations
opt.autoindent = true
opt.breakindent = true
opt.smartindent = true
opt.linebreak = true
opt.smarttab = true
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.cindent = true
opt.preserveindent = true
opt.shiftround = true

-- completions
opt.completeopt = {
	"menu",
	"menuone",
	"noinsert",
}
opt.pumblend = 0
opt.pumheight = 10
opt.updatetime = 20

-- cmdline
opt.cmdheight = 0
opt.showcmd = true
opt.showmode = false

-- related to window
opt.equalalways = false
opt.splitbelow = true
opt.splitright = true
opt.winwidth = 5
opt.winminwidth = 5

-- cursor & mouse
opt.cursorline = false
opt.mouse = "a"
opt.guicursor = {
	"n-v-c:block",
	"i-c-ci-ve:ver25",
	"r-cr:hor20",
	"o:hor50",
	"a:blinkwait1000-blinkoff500-blinkon250",
	-- "a:block",
}

-- keymaps
opt.timeout = true
opt.timeoutlen = utils.options.timeoutlen
opt.backspace = {
	"start",
	"eol",
	"indent",
}

-- files
opt.confirm = true
opt.fileencoding = "utf-8"
opt.conceallevel = 0
opt.swapfile = false
opt.undofile = true
opt.undolevels = 10000

-- scrolling
opt.scrolloff = 0
opt.sidescrolloff = 0

-- sessions
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

-- statusline & winbar
opt.laststatus = 0
opt.statusline = "%="
opt.showtabline = 0

-- fold
opt.foldenable = false
opt.foldcolumn = "0"
opt.foldlevel = 0
opt.foldlevelstart = -1
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- folding based on treesitter

-- search
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "split"
opt.incsearch = true
opt.hlsearch = true

-- editor
opt.wrap = false
opt.background = "dark"
opt.termguicolors = true

-- formatter
opt.formatexpr = "v:lua.require('conform').formatexpr()"

-- spelling
opt.spell = false

opt.fillchars = {
	eob = " ",
	vert = "│",
	horiz = "─",
}
