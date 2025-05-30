local M = {}

M.cmd = {
  "Hardtime",
}

M.dependencies = {
  "MunifTanjim/nui.nvim",
}

M.opts = function()
  return {
	  enabled = false,
  }
end

return M
