local M = {}

M.cmd = {
  "LiveServerStart",
  "LiveServerStop"
}

M.build = "pnpm add -g live-server" -- npm install pnpm

M.opts = function()
  return {}
end

return M
