local M = {}

M.branch = "master"

M.event = {
  "BufReadPre",
  "BufNewFile",
}

M.config = function()
  return {}
end

return M
