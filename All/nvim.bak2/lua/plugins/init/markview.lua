local M = {}

M.ft = {
  "markdown"
}

M.dependencies = {
	-- "nvim-tree/nvim-web-devicons",
	-- "echasnovski/mini.icons",
}

M.opts = function()
  return {
	  preview = {
		  icon_provider = "internal", -- "mini" or "devicons"
	  }
  }
end

return M
