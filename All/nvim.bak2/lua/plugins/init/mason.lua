local M = {}

M.cmd = {
  "Mason"
}

M.opts = function()
  local icons = require("lib.icons")
  local utils = require("lib.utils")

  return {
	  ui = {
		  icons = {
			  package_installed = icons.others.state.loaded,
			  package_pending = icons.others.state.pending,
			  package_uninstalled = icons.others.state.not_loaded,
        border = {
          icons.ui.border.top.left,
	        icons.ui.border.horizontal,
	        icons.ui.border.top.right,
	        icons.ui.border.vertical,
	        icons.ui.border.bottom.right,
	        icons.ui.border.horizontal,
	        icons.ui.border.bottom.left,
	        icons.ui.border.vertical,
        },
		  },
		  width = utils.ui.width,
		  height = utils.ui.height,
	  },
  }
end

return M
