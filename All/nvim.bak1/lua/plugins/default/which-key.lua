local M = {};

M.keys = function()
end;

M.opts = function()
  local requires = require("lib.functions").requires;
  local icons = requires("lib.icons");
  local utils = requires("lib.utils");

  return {
    preset = "helix",
    delay = 0, -- delay for showing which-key popup
    tiggers = {
      { "<auto>", mode = "nicvxso" },
    },
    win = {
      no_overlap = true,
      padding = { 0, 1 },
      border = {
       icons.ui.border.top.left,
       icons.ui.border.horizontal,
       icons.ui.border.top.right,
       icons.ui.border.vertical,
       icons.ui.border.bottom.right,
       icons.ui.border.horizontal,
       icons.ui.border.bottom.left,
       icons.ui.border.vertical,
     },
      title_pos = utils.ui.title_position,
    },
    layout = {
      spacing = 1,
    },
    sort = {
      "group",
      "alphanum",
    },
    expand = 0, -- expand groups when <= n mappings
    icons = {
      -- breadcrumb = "",
      separator = icons.ui.arrow.right,
      group = "",
      rules = false,
    },
    disable = {
      ft = {
        "alpha",
      },
    },
  };
end

M.config = function()
end;

return M;
