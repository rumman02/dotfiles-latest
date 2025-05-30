local M = {}

M.event = {
  "BufReadPre",
  "BufNewFile",
}

M.dependencies = {
  "nvim-lua/plenary.nvim",
}

M.opts = function()
  return {}
end

return M
