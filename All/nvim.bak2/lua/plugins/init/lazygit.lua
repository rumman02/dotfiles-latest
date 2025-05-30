local M = {}

M.lazy = true

M.cmd = {
	"LazyGit",
	"LazyGitConfig",
	"LazyGitCurrentFile",
	"LazyGitFilter",
	"LazyGitFilterCurrentFile",
}

M.dependencies = {
	"nvim-lua/plenary.nvim",
}

M.opts = function()
  return {}
end

return M
