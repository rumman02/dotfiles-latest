local M = {}

M.event = {
  "BufReadPre",
  "BufNewFile",
}

M.dependencies = {
  "nvim-treesitter/nvim-treesitter",
}

M.opts = function()
  return {}
end

return M

