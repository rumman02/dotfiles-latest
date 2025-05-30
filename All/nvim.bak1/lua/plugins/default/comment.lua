local M = {};

M.opts = function()
  local requires = require("lib.functions").requires;
  return {
    mappings = false,
    -- pre_hook = requires("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
  };
end;

M.keys = function()
  local func = require("lib.functions");
  local map = func.map;
  local requires = func.requires;

  return {
  };
end;

return M;
