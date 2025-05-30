return {
  "folke/flash.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
	  local flash = require("flash")
	  flash.setup({
		  label = {
			  uppercase = true,
			  distance = false,
		  },
		  modes = {
			  search = {
				  enabled = true, -- enable flash also in "/" and "?" search
			  },
			  char = {
				  keys = { "f", "F", "t", "T" }, -- disables ";" and "," keys
				  jump_labels = true,
			  }
		  },
		  prompt = {
			  enabled = false,
			  prefix = { { " " } },
		  },
	  })
  end
}
