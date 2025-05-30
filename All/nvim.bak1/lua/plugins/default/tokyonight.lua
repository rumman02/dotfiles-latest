local M = {};

M.opts = function()
  return {
	  style = "night",
	  light_style = "day",
	  styles = {
		  comments = { italic = true },
		  keywords = { italic = true },
		  functions = { italic = false },
		  variables = { italic = false },
		  sidebars = "dark",
		  floats = "transparent",
	  },
	  day_brightness = 0.3,
	  dim_inactive = false,
	  lualine_bold = true,
	  cache = true,
  };
end;

M.config = function(_, opts)
  local requires = require("lib.functions").requires;
	requires("tokyonight").setup(opts);
	vim.cmd("colorscheme tokyonight");
end;

return M;
