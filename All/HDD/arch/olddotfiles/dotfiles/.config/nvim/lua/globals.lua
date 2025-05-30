-- set global & local leader key
vim.g.mapleader      = " "   -- 1 space
vim.g.maplocalleader = "  "  -- 2 space

-- set some global values i need
MY_ROUNDED_BORDER = {
  { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
}

-- set some icons
-- WARNING : Never ever reorganize icons, just put it to last index
-------------------------------1-----2-----3-----4-----5-----6-----7-----8-----9-----0
MY_ICON_SEARCHS           = { "󰛔 ", " ", " ", "󱎸 ", "󰱼 ", "󰮗 ", "󰱽 ", "󱈅 ", "󱙈 "}
MY_ICON_FILES             = { " ", " ", "󰝒 " }
MY_ICON_EDITED            = { "󰤌 ", "󱞂 ", " " }
MY_ICON_FOLDERS           = { " ", " ", "󰉓 ", "󰙅 ", " ", " "}
MY_ICON_RESTORES          = { " ", "󰁯 " }
MY_ICON_SETTINGS          = { " ", " "}
MY_ICON_OUTS              = { " " }
MY_ICON_NEXTS             = { "󰒭 ", "󰼧 ", "󰙢 " }
MY_ICON_CROSSES           = { " ", " ", "󰅚 ", " ", "✗ " }
MY_ICON_WARNINGS          = { " ", " " }
MY_ICON_INFOS             = { " ", " " }
MY_ICON_HINTS             = { "󰠠 ", "󰌶 " }
MY_ICON_CHECKS            = { "✓ " }
MY_ICON_CHECKS_RECTANGLES = { "󰄮 ", "󰡖 "," " , "󰱒 " , "󱅶 " , "󰄗 " , "󰄲 "  }
MY_ICON_TIMES             = { "󱦟 ", "󰔟 ", "󰔚 "}
MY_ICON_DOWNLOADS         = { "󰇚 ", "󰮏 ", " ", "󱑣 ", "󱑥 ", "󱑢 ", "󱑤 ", " ", "󰭽 " }
MY_ICON_OTHERS            = { " " }
MY_ICON_ARROWS            = { " ", " ", "➜ ", "󰜴 ", "» ", " ", " ", " ", " ", " ",
                              " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
                              " ", " ", " ", " ", " " }
MY_ICON_LINKS             = { " ", "󰌷 ", " ", " ", "󱂺 ", "󰴚 ", "󰿨 ", "󰲔 ", "󰌸 ", "󰌹 ",
                              "󰴛 ", "󰴜 ", "󱄀 ", "󱄁 ", "󰴴 ", "󰴝 ", "󰴳 ", " ", "󰌺 ", "󱃿 " }
MY_ICON_DELETES           = { "󰆴 ", "󰧧 ", "󰺝 ", "󱂥 ", "󰚃 " }
MY_ICON_MODIFIEDS         = { " ", " ", " " }
MY_ICON_QUESTIONS         = { " ", " ", " ", "󱀶 " }
MY_ICON_TAGS              = { "󱜲 " }
MY_ICON_CONFLICTS         = { " ", " ", " ", " "  }
MY_ICON_ELLIPSIS          = { " ", " ", "…"}
MY_ICON_CIRCLES           = { " " }
MY_ICON_DOTS              = { " " }
MY_ICON_POWERLINES        = { "╱", "╲", "", "█", "", "█", "█" }
MY_ICON_VERTCAL_LINES     = { "┃", "┋", "┊", "▏", "▕", "│", "╎", "┆"}
MY_ICON_OS                = { " ", " ", " " }
MY_ICON_COMMANDS          = { " " }
