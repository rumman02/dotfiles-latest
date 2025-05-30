local guiCursor = {
  -- "a:block",  -- all modes block
  "n-v-c:block", -- Normal, visual, command-line: block cursor
  "i-c-ve:ver25", -- Insert, command-line insert, visual-exclude: vertical bar cursor with 25% width
  "r-cr:hor20", -- Replace, command-line replace: horizontal bar cursor with 20% height
  "o:hor50", -- Operator-pending: horizontal bar cursor with 50% height
  "a:blinkwait700-blinkoff400-blinkon250", -- All modes: blinking settings
  "sm:block-blinkwait175-blinkoff150-blinkon175", -- Showmatch: block cursor with specific blinking settings
}

local options = {
  number = true,											                                    -- shows line number
  relativenumber = true,									                                -- shows relatively line nunber
  -- numberwidth = 5,                                                        -- length of sign column beside line number
  signcolumn = "yes:2",                                                     -- enables sign column
  tabstop = 2,											                                      -- make tabs length as 4
  expandtab = true,										                                    -- replace tab character as tabs lenght spaces
  smartindent = true,										                                  -- do smart autoindenting when staring a new line
  breakindent = true,                                                     -- wraps line also be indented from berfore line
  wrap = false,                                                           -- no line wrap
  linebreak = true,                                                       -- wrap without breaking in the middle of word
  shiftwidth = 2,											                                    -- create by indenting ">>" or "<<" as 4 lenth
  splitbelow = true,                                                      -- default horizontal split screen is below now
  splitright = true,                                                      -- default vertical split screen is right now
  cursorline = true,										                                  -- highlight current cursor line
  -- cursorcolumn = true,										                                -- highlight current cursor column
  guicursor = guiCursor,                                                  -- change effect of cursor
  -- backspace = "",                                                         -- backspace not work like as before
  fillchars ="eob: ",                                                     -- remove "~" this symbol from end of the buffers
  swapfile = false,                                                       -- disable buffer file temporary saving
  undofile = true,                                                        -- useful to have can undo even after save and quit
  -- fileencoding = "UTF-8",									                            -- encoding files as utf-8
  showmode = false,                                                       -- remove "--INSERT--", "--VISUAL--" from cmd bar
  pumheight = 15,                                                         -- completion popup height
  hlsearch = true,                                                        -- highlight the before search results
  ignorecase = true,                                                      -- ignore the case sensitive while searching
  smartcase = true,                                                       -- uppercase inputs makes searching case sensitive
  -- timeout = true,
  timeoutlen = 50,                                                      -- time to wait for a mapped sequence to complete
  incsearch = true,
  confirm = true,                                                         -- if don't save and try quit, it shows confirmation
  showcmd = false,                                                        -- hide the command bar
  cmdheight = 0,                                                          -- decrease the commandline height
  ruler = false,                                                          -- shows column and line number in status bar righ
  laststatus = 0,                                                         -- split windows bottom status bar
  statusline = "%=",                                                      -- split window sperator character
  sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions",
  guifont = "JetBrains Mono",
}

for keys,values in pairs(options) do
  vim.opt[keys] = values
end

-- extras
-- vOpt.iskeyword:append "-"                                                 -- count "hello-world" as a full word
vim.cmd([[colorscheme catppuccin]])                                             -- set colorscheme
vim.cmd([[highlight SignColumn guibg=transparent]])                          -- set signcolumn color to transparent
