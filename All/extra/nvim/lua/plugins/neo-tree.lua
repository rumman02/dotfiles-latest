local M = {};

M.keys = function()
  local func = require("lib.functions");
  -- local map = func.map;
  local leader = func.requires("lib.keymaps").explorer.global;

  --
  -- return {
  --   map(1, { "n" }, leader .. "", { desc = "Explorer" }),
  --   map(1, { "n" }, leader .. "m", "", { desc = "Move" }),
  --   map(1, { "n" }, leader .. "r", "", { desc = "Reveal current" }),
  --
  --   map(1, { "n" }, leader .. "f", "<cmd>Neotree focus<cr>", { desc = "Focus" }),
  --   map(1, { "n" }, leader .. "x", "<cmd>Neotree close<cr><cmd>Neotree close filesystem<cr><cmd>Neotree close buffers<cr><cmd>Neotree close git_status<cr>", { desc = "Focus" }),
  --
  -- };
end;

M.opts = function()
  local requires = require("lib.functions").requires;
  local utils = requires("lib.utils");
  local icons = requires("lib.icons");

  return {
    close_if_last_window = true,
    popup_border_style = {
	    icons.ui.border.top.left,
	    icons.ui.border.horizontal,
	    icons.ui.border.top.right,
	    icons.ui.border.vertical,
	    icons.ui.border.bottom.right,
	    icons.ui.border.horizontal,
	    icons.ui.border.bottom.left,
	    icons.ui.border.vertical,
	  },
    default_component_configs = {
      indent = {
        indent_size = utils.indent_size.explorer,
        indent_marker = icons.indent_line.default,
        last_indent_marker = icons.indent_line.last,
      },
      icon = {
        folder_closed = icons.documents.folder.closed,
        folder_open = icons.documents.folder.opened,
        folder_empty = icons.documents.folder.empty,
      },
      modified = {
        symbol = icons.extras.modified,
      },
      name = {
        use_git_status_colors = true,
      },
      git_status = {
        symbols = {
          added = icons.git.added,
          modified = icons.git.modified,
          deleted = icons.git.removed,
          renamed = icons.git.renamed,
          untracked = icons.git.untracked,
          ignored = icons.git.ignored,
          unstaged = icons.git.unstaged,
          staged = icons.git.staged,
          conflict = icons.git.conflict,
        },
      },
    },
    window = {
      position = "left",
      width = "20%",
    },
  };
end;

M.config = function(_, opts)
end;

return M;
