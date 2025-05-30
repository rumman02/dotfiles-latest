-- returns to lua/init.lua
return {
  require("plugins.mains"),                    -- inside folder: cmp, lsp, linters, formatters, dap etc
  require("plugins.alphaDashboard"),           -- enables a good looking dashboard to welcome screen of neovim
  require("plugins.autoPairs"),                -- enables autopairs of brackets, quotes etc
  require("plugins.autoSession"),              -- enables saving sessions and restore sessions for neovim
  -- require("plugins.autoTsTag"),             -- 
  require("plugins.barBar"),                   -- enables showing all buffers and tabs in most first line
  -- require("plugins.breadCrumbs"),           -- enables a path of folder, files, function, method etc under cursor
  require("plugins.comments"),                 -- expand comments capability ex: multicomment etc
  require("plugins.commentsTodo"),             -- enables highlight for todo comments
  require("plugins.commentsTsContext"),        -- enables comments for tsx or jsx
  -- require("plugins.cursorSpecs"),           --
  require("plugins.dressingUI"),               -- enables modern ui for vim input and selector 
  require("plugins.fidget"),                   -- shows diagnostics loading messages and loading icon
  require("plugins.flash"),                    -- speedup cursor movement without mouse
  -- require("plugins.gitDiffView"),           --
  require("plugins.gitSigns"),                 -- enables git status into signcolumn
  require("plugins.indentLines"),              -- enables indent guides for every scopes
  require("plugins.luaLine"),                  -- enables a modern status line
  -- require("plugins.markdownPreviewer"),     --
  -- require("plugins.marks"),                 --
  -- require("plugins.matchHighlighter"),      -- 
  -- require("plugins.neoScroll"),             --
  require("plugins.neoTree"),                  -- enables files explorer like file view
  require("plugins.noiceCmd"),                 -- hiding the bottom cmd and enables floating cmdline
  require("plugins.numb"),                     -- enables easy go to line number, just type line number into cmdline by ":"
  -- require("plugins.nvimHlsLens"),           --
  require("plugins.nvimNotify"),               -- 
  -- require("plugins.nvimSpider"),            --
  -- require("plugins.oil"),                   --
  -- require("plugins.outline"),               --
  require("plugins.splitWindows"),          --
  -- require("plugins.surround"),              -- 
  require("plugins.teleScope"),                -- enables fuzzy finding of many things
  -- require("plugins.toggleTerm"),            -- enables easy to view, show, access terminal inside neovim
  require("plugins.treeSitter"),               -- enables more powerful parser for languages
  require("plugins.treeSitterContext"),        -- showing relevent scopes header by treesitter under cursor
  -- require("plugins.trouble"),               --
  -- require("plugins.twiLight"),              -- dimming all text except current scope and nonscope surround under cursor
  require("plugins.vimEasyAlign"),          -- 
  require("plugins.vimTmuxNav"),               -- simplify move cursor between neovim and tmux panes
  require("plugins.whichKey"),                 -- shows key suggestions on a floating window
  -- require("plugins.yanky"),                 -- 
  -- require("plugins.zenMode"),               -- enables zenmode like vscode to disable all distracted things from window
}
