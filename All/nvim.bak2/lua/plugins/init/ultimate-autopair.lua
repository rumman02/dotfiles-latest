local M = {}

M.branch = "v0.6"

M.event = {
  "InsertEnter",
}

M.opts = function()
  return {
	  extensions = {
		  cmdtype = {
			  p = 100,
			  skip = {
				  -- "/",
				  -- "?",
				  -- "@",
				  -- "-",
				  -- ":",
			  },
		  },
	  },
  }
end

return M
