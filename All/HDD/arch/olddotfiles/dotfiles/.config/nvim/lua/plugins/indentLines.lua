return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  config = function()
    local indentBlankLine = require("ibl")
    -- local highlight = {
    --   "CursorColumn",
    --   "Whitespace",
    -- }

    indentBlankLine.setup({
      indent = {
        -- highlight = highlight,
        char = MY_ICON_VERTCAL_LINES[6],
      },
      scope = {
        enabled    = true,
        show_start = false,
        show_end   = false,
        include    = {
          node_type = { ["*"] = { "*" } },      -- works indent highlight in every scope, indentation
        }
      },
      exclude = {
        filetypes = {
          "alpha",
        }
      },
      whitespace = {
        -- highlight = highlight,
        remove_blankline_trail = false,
      }
    })
  end
}
