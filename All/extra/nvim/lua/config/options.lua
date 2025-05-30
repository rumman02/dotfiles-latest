local requires = require("lib.functions").requires;
local utils = requires("lib.utils");
local opt = vim.opt;

-- related to sign column
opt.number = true;
opt.relativenumber = true;
opt.numberwidth = 1;
opt.signcolumn = "auto:2-4";

-- related to indentations
opt.autoindent = true;
opt.breakindent = true;
opt.smartindent = true;
opt.linebreak = true;
opt.smarttab = true;
opt.expandtab = true;
opt.shiftwidth = utils.indent_size.editor;
opt.tabstop = utils.indent_size.editor;
opt.softtabstop = utils.indent_size.editor;
opt.cindent = true;
opt.preserveindent = true;
opt.shiftround = true;

opt.completeopt = utils.completeopt.behavior;
opt.pumblend = utils.completeopt.transparency;
opt.pumheight = utils.completeopt.max_height;
opt.updatetime = utils.completeopt.visible_time;

opt.wrap = utils.option.wrap;
opt.swapfile = false;
