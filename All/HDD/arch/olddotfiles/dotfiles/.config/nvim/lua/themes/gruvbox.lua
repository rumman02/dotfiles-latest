return {
  "ellisonleao/gruvbox.nvim",
  cmd = { "Colorscheme gruvbox" },
  priority = 1000,
  config = function()
    local gruvbox = require("gruvbox")
    gruvbox.setup({
      terminal_colors = true, -- add neovim terminal colors
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = true,
        folds = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true, -- invert background for search, diffs, statuslines and errors
      contrast = "", -- can be "hard", "soft" or empty string
      palette_overrides = {},
      overrides = {},
      dim_inactive = false,           -- highlight current focused window
      transparent_mode = false,        -- make nvim transparent
    })
  end
}
