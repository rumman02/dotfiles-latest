-- https://github.com/j-hui/fidget.nvim
return {
  "j-hui/fidget.nvim",
  event = { "VeryLazy" },
  config = function()
	  local fidget = require("fidget")
	  fidget.setup({})
  end
}
