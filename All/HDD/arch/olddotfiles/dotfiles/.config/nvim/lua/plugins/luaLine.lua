return {
  "nvim-lualine/lualine.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    -- load luaLine files
    local luaLine = require("lualine")

    ---@diagnostic disable-next-line: undefined-field
    luaLine.setup({
      options = {
        icons_enabled        = true,
        theme                = "catppuccin",
        component_separators = { left = MY_ICON_POWERLINES[1], right = MY_ICON_POWERLINES[1] },
        section_separators   = { left = MY_ICON_POWERLINES[6], right = MY_ICON_POWERLINES[7] },

        -- Filetypes to disable lualine for.
        disabled_filetypes   = {
          statusline = {},       -- only ignores the ft for statusline.
          winbar     = {},           -- only ignores the ft for winbar.
        },

        ignore_focus = {},
        always_divide_middle = true,

        globalstatus = true,        -- enable global statusline (have a single statusline
                                    -- at bottom of neovim instead of one for  every window).
                                    -- This feature is only available in neovim -1.7 and higher.

        refresh = {                 -- sets how often lualine should refresh it"s contents (in ms)
          statusline = 250,         -- The refresh option sets minimum time that lualine tries
          tabline = 250,            -- to maintain between refresh. It"s not guarantied if situation
          winbar = 250              -- arises that lualine needs to refresh itself before this time
                                    -- Also you can force lualine"s refresh by calling refresh function
                                    -- like require("lualine").refresh()
        }
      },

      sections = {
        lualine_a = {"mode"},
        lualine_b = {"branch", "diff", "diagnostics"},
        lualine_c = {"filename", "filesize" },
        lualine_x = {
          "encoding",
          "filetype",
          {
            "fileformat",
            symbols = {
              unix = MY_ICON_OS[1],
            }
          },
        },
        lualine_y = {"progress"},
        lualine_z = {"location"}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {"filename"},
        lualine_x = {"location"},
        lualine_y = {},
        lualine_z = {}
      },
      tabline         = {},
      winbar          = {},
      inactive_winbar = {},
      extensions      = {}
    })
  end
}
