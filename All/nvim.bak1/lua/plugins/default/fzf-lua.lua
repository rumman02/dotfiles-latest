local M = {};

M.opts = function()
  local requires = require("lib.functions").requires;
  local utils = requires("lib.utils");
  local localleader = requires("lib.keys").finder.locals;

  return {
    "default-prompt",
    winopts = {
      height = utils.ui.height,
			width = utils.ui.width,
			row = 0.50,
			col = 0.50,
			border = utils.ui.border,
			backdrop = utils.ui.backdrop,
			title_pos = utils.ui.title_position,
			preview = {
				border = utils.ui.border,
				title_pos = utils.ui.title_position,
			},
      on_create = function()
				map(0, { "t" }, "<c-h>", "<Left>", { buffer = true })
				map(0, { "t" }, "<c-j>", "<Down>", { buffer = true })
				map(0, { "t" }, "<c-k>", "<Up>", { buffer = true })
				map(0, { "t" }, "<c-l>", "<Right>", { buffer = true })
			end,
    },
    keymap = {
			builtin = {
				[ localleader .. "<M-Esc>"] = "hide", -- hide fzf-lua, `:FzfLua resume` to continue
				[ localleader .. "<F1>"] = "toggle-help",
				[ localleader .. "<F2>"] = "toggle-fullscreen",
				-- Only valid with the 'builtin' previewer
				[ localleader .. "<F3>"] = "toggle-preview-wrap",
				[ localleader .. "<F4>"] = "toggle-preview",
				-- Rotate preview clockwise/counter-clockwise
				[ localleader .. "<F5>"] = "toggle-preview-ccw",
				[ localleader .. "<F6>"] = "toggle-preview-cw",
				-- `ts-ctx` binds require `nvim-treesitter-context`
				[ localleader .. "<F7>"] = "toggle-preview-ts-ctx",
				[ localleader .. "<F8>"] = "preview-ts-ctx-dec",
				[ localleader .. "<F9>"] = "preview-ts-ctx-inc",
				[ localleader .. "<S-Left>"] = "preview-reset",
				[ localleader .. "<S-down>"] = "preview-page-down",
				[ localleader .. "<S-up>"] = "preview-page-up",
				[ localleader .. "<M-S-down>"] = "preview-down",
				[ localleader .. "<M-S-up>"] = "preview-up",
			},
		},
  };
end;

return M;
