local M = {};

M.opts = function()
end;

M.config = function()
  local func = require("lib.functions");
  local map = func.map;
  local requires = func.requires;

  map(0, { "n", "v" }, "<esc>", "<esc><Plug>(clever-f-reset)", { desc = "Reset" })
end;

M.keys = function()
end;

return M;
