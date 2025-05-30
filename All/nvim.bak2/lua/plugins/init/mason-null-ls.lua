local M = {}

M.event = {
  "BufReadPre",
  "BufNewFile",
}

M.dependencies = {
	"williamboman/mason.nvim",
	"nvimtools/none-ls.nvim",
}

M.opts = function()
  return {
    -- ensure_installed = { "clj-kondo", "inko", "ginko_ls", "janet", "ruby" }
  }
end

return M
