local M = {}

M.event = {
  "BufReadPre",
  "BufNewFile",
}

M.dependencies = {
  "ggandor/leap.nvim"
}

M.opts = function()
  return {}
end

return M
