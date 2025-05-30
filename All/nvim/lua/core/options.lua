local opt = vim.opt
local lib = require("lib.utils")

-- sign & number columns
opt.number = true
opt.relativenumber = true
opt.numberwidth = 1
opt.signcolumn = "yes" -- more options ex: "auto2-4"

-- indentations
local indent_size = lib.indent.explorer
opt.autoindent = true
opt.smartindent = true
opt.smarttab = true
opt.expandtab = true
opt.shiftwidth = indent_size
opt.tabstop = indent_size
opt.shiftwidth = indent_size

-- completions
local completion = lib.completion
opt.completeopt = completion.opt
opt.pumblend = completion.blend
opt.pumheight = completion.height
opt.updatetime = completion.updatetime

opt.timeout = true
opt.timeoutlen = lib.delay.timeoutlen
