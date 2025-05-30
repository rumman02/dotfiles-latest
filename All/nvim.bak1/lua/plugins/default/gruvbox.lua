local M = {};

M.opts = function()
  return {
  };
end

M.config = function(_, opts)
  local requires = require("lib.functions").requires;
  requires("gruvbox").setup(opts);
  vim.cmd("colorscheme gruvbox");
end

return M;
