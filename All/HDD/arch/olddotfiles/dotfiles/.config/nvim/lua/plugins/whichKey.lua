return {
  "folke/which-key.nvim",
  event = { "VeryLazy" },
  -- init = function()
  --   vim.o.timeout = true
  --   vim.o.timeoutlen = 50
  --   -- vim.g.which_key_timeout = 1
  --   -- vim.g.which_key_fallback_to_native_key = 1
  -- end,
  config = function()
    local whichKey = require("which-key")
    whichKey.setup({
      notify = true,    -- show a warning when issues were detected with your mappings
      triggers = {
        { "<auto>", mode = "nixsotc" },     --  tiggers whichkey in all mode
        -- { "a", mode = { "n", "v" } },
        -- { "<leader>", mode = { "n", "v" } },
      },
      plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        spelling = {
          enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 20, -- how many suggestions should be shown in the list?
        },
        presets = {
          operators = true, -- adds help for operators like d, y, ...
          motions = true, -- adds help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = true, -- default bindings on <c-w>
          nav = true, -- misc bindings to work with windows
          z = true, -- bindings for folds, spelling and others prefixed with z
          g = true, -- bindings for prefixed with g
        },
      },
      preset = "classic",                            -- classic | modern | helix
      -- delay = 1500,                                 -- delay before showing whichkey popup
      win = {
        -- don't allow the popup to overlap with the cursor
        no_overlap = false,
        -- width = 1,
        -- height = { min = 4, max = 25 },
        -- col = 0,
        -- row = math.huge,
        border = MY_ROUNDED_BORDER[1],
        padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
        title = true,
        title_pos = "center",
        zindex = 1000,
        -- Additional vim.wo and vim.bo options
        bo = {},
        wo = {
          -- winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
        },
      },
      layout = {
        width = { min = 20 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
      },
      keys = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>", -- binding to scroll up inside the popup
      },
      --- Mappings are sorted using configured sorters and natural sort of the keys
      --- Available sorters:
      --- * local: buffer-local mappings first
      --- * order: order of the items (Used by plugins like marks / registers)
      --- * group: groups last
      --- * alphanum: alpha-numerical first
      --- * mod: special modifier keys last
      --- * manual: the order the mappings were added
      --- * case: lower-case first
      sort = { "local", "order", "group", "alphanum", "mod" },
      expand = 0, -- expand groups when <= n mappings
      replace = {
        key = {
          { "<Space>", "<Leader>" },   -- rename your keys but single keys only
        }
      },
      icons = {
        breadcrumb = MY_ICON_ARROWS[7].."",   -- symbol used in the command line area that shows your active key combo
        separator = MY_ICON_ARROWS[3].."",    -- symbol used between a key and it's label
        group = "+",               -- symbol prepended to a group
        ellipsis = MY_ICON_ELLIPSIS[1],
        -- set to false to disable all mapping icons,
        -- both those explicitly added in a mapping
        -- and those from rules
        mappings = true,
        rules = false,
        colors = true,
        keys = {
          Up = " ",
          Down = " ",
          Left = " ",
          Right = " ",
          C = "󰘴 ",
          M = "󰘵 ",
          D = "󰘳 ",
          S = "󰘶 ",
          CR = "󰌑 ",
          Esc = "󱊷 ",
          ScrollWheelDown = "󱕐 ",
          ScrollWheelUp = "󱕑 ",
          NL = "󰌑 ",
          BS = "󰁮",
          Space = "󱁐 ",
          Tab = "󰌒 ",
          F1 = "󱊫",
          F2 = "󱊬",
          F3 = "󱊭",
          F4 = "󱊮",
          F5 = "󱊯",
          F6 = "󱊰",
          F7 = "󱊱",
          F8 = "󱊲",
          F9 = "󱊳",
          F10 = "󱊴",
          F11 = "󱊵",
          F12 = "󱊶",
        },
      },
      show_help = true, -- show a help message in the command line for using WhichKey
      show_keys = true, -- show the currently pressed key and its label as a message in the command line
      -- disable WhichKey for certain buf types and file types.
      disable = {
        ft = {},
        bt = {},
      },
      debug = false, -- enable wk.log in the current directory
    })
    vim.api.nvim_set_hl(0, "WhichKeyIcon", { underline = false })
  end
}
