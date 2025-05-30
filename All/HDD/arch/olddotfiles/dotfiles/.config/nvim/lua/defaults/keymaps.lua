-- modes : n = normal, i = insert, v = visual, x = visual block, r = replace, c = command, t = terminal
-- whichkey keymap structure : [1], [2], desc, group, mode, cond, hidden, icon, proxy, expand

-- load mapCond file
local mapCond = require "defaults.mapCond"


-- load whichKey plugin
require "which-key".add({

  ----------------------copy clipboard----------------------------
  { "<localleader>'",                                                               group = "Copy Clipboard"                                      },
  { "<localleader>'",   '"+y',                                                      desc  = "By Copy",                  mode = { "v", "x" }       },
  { "<localleader>''",  '"+yy',                                                     desc  = "By Copy",                  mode = { "n" }            },

  ----------------------Search------------------------------
  { "<localleader>s",                                                               group = "Search"                                              },
  { "<localleader>sc",   "<cmd> nohlsearch <cr>",                                   desc  = "Clear search",             mode = { "n" }            },
  { "<localleader>sr",  ":%s/",                                                     desc  = "Search highlight",         mode = { "n" }            },
  { "<localleader>sr",   ":s/",                                                     desc  = "Search highlight",         mode = { "v" }            },

  ----------------------Tabs------------------------------
  { "<localleader>t",                                                                group = "Tabs/Terminal"                                                },
  { "<localleader>tb",                                                               group = "Tabs"                                                },
  { "<localleader>tbo",  "<cmd> tabnew <cr>",                                        desc  = "New",                      mode = { "n" }            },
  { "<localleader>tbn",  "<cmd> tabnext <cr>",                                       desc  = "Next",                     mode = { "n" }            },
  { "<localleader>tbp",  "<cmd> tabprevious <cr>",                                   desc  = "Previous",                 mode = { "n" }            },
  { "<localleader>tbc",  "<cmd> tabclose <cr>",                                      desc  = "Close",                    mode = { "n" }            },
  { "<localleader>tbl",  "<cmd> tabs <cr>",                                          desc  = "List",                     mode = { "n" }            },

  ----------------------Terminal------------------------------
  { "<localleader>tt",                                                              group = "Terminal"                                            },
  { "<localleader>tto", "<cmd> terminal <cr>",                                      desc  = "Open current",             mode = { "n" }            },
  { "<localleader>ttk", "<cmd> set nosplitbelow <Bar> split <Bar> terminal <cr>",   desc  = "Open below",               mode = { "n" }            },
  { "<localleader>ttj", "<cmd> set splitbelow <Bar> split <Bar> terminal <cr>",     desc  = "Open above",               mode = { "n" }            },
  { "<localleader>ttl", "<cmd> set splitright <Bar> vsplit <Bar> terminal <cr>",    desc  = "Open left",                mode = { "n" }            },
  { "<localleader>tth", "<cmd> set nosplitright <Bar> vsplit <Bar> terminal <cr>",  desc  = "Open right",               mode = { "n" }            },
  { "<esc>",            "<c-\\><c-n>",                                              desc  = "Exit insert mode",         mode = { "t" }            },
  { "<localleader>ttc", function() mapCond.close_terminal_buffer() end,             desc  = "Quit under cursor",        mode = { "n" }            },
  { "<localleader>tta", function() mapCond.close_all_terminal_buffers() end,        desc  = "Quit all",                 mode = { "n" }            },

  ----------------------split window------------------------------
  { "<localleader>w",                                                               group = "Split window", proxy = "<c-w>"                                        },
  { "<localleader>wj",  "<cmd> set nosplitbelow <Bar> split <cr>",                  desc  = "Open below",               mode = { "n" }            },
  { "<localleader>wk",  "<cmd> set splitbelow <Bar> split <cr>",                    desc  = "Open above",               mode = { "n" }            },
  { "<localleader>wh",  "<cmd> set splitright <Bar> vsplit <cr>",                   desc  = "Open left",                mode = { "n" }            },
  { "<localleader>wl",  "<cmd> set nosplitright <Bar> vsplit <cr>",                 desc  = "Open right",               mode = { "n" }            },
  { "<localleader>wJ",  "<cmd> wincmd J <cr>",                                      desc  = "Move to very bottom",      mode = { "n" }            },
  { "<localleader>wK",  "<cmd> wincmd K <cr>",                                      desc  = "Move to very top",         mode = { "n" }            },
  { "<localleader>wH",  "<cmd> wincmd H <cr>",                                      desc  = "Move to very left",        mode = { "n" }            },
  { "<localleader>wL",  "<cmd> wincmd L <cr>",                                      desc  = "Move to very right",       mode = { "n" }            },
  { "<localleader>wT",  "<c-w>T",                                                   desc  = "Open as tab",              mode = { "n" }            },
  { "<localleader>wr",  "<c-w>r",                                                   desc  = "Swap",                     mode = { "n" }            },
  { "<localleader>wR",  "<c-w>R",                                                   desc  = "Swap reverse",             mode = { "n" }            },
  { "<localleader>wm",  "<c-w>|<c-w>_",                                             desc  = "Max high and wide",        mode = { "n" }            },
  { "<localleader>wc",  "<c-w>c",                                                   desc  = "Close",                    mode = { "n" }            },
  { "<localleader>wx",  "<c-w>|",                                                   desc  = "Max wide",                 mode = { "n" }            },
  { "<localleader>wy",  "<c-w>_",                                                   desc  = "Max high",                 mode = { "n" }            },
  { "<localleader>we",  "<c-w>=",                                                   desc  = "Equally high and wide",    mode = { "n" }            },
  { "<localleader>wo",  "<c-w>o",                                                   desc  = "Close others",             mode = { "n" }            },

  ----------------------flash plugin------------------------------
  { "<leader>/",                                                                    group = "Jump"},
  { "<leader>/w",       function() require("flash").jump() end,                     desc  = "word",                     mode = { "n", "x", "o" }  },
  { "<leader>/n",       function() require("flash").treesitter() end,               desc  = "node",                     mode = { "n", "x", "o" }  },
  { "<leader>/r",       function() require("flash").remote() end,                   desc  = "remote",                   mode = { "o" }            },
  { "<leader>/s",       function() require("flash").treesitter_search() end,        desc  = "treesitter search",        mode = { "x", "o" }       },
  { "<leader>/t",       function() require("flash").toggle() end,                   desc  = "toggle",                   mode = { "c" }            },

  ----------------------Neotree------------------------------
  { "<leader>e",                                                                    group = "Explorer",                 icon =  MY_ICON_FOLDERS[1]             },
  { "<leader>ee",       "<cmd> Neotree toggle <cr>",                                desc  = "Show filesystem",          mode = { "n" }            },
  { "<leader>ec",       "<cmd> Neotree focus reveal filesystem <cr>",               desc  = "Show current file",        mode = { "n" }            },
  { "<leader>ef",       "<cmd> Neotree focus <cr>",                                 desc  = "Explorer focus",           mode = { "n" }            },
  { "<leader>eb",       "<cmd> Neotree toggle buffers <cr>",                        desc  = "Show buffers",             mode = { "n" }            },
  { "<leader>eF",       "<cmd> Neotree float <cr>",                                 desc  = "Set explorer float",       mode = { "n" }            },
  { "<leader>eH",       "<cmd> Neotree left <cr>",                                  desc  = "Set explorer left",        mode = { "n" }            },
  { "<leader>eJ",       "<cmd> Neotree bottom <cr>",                                desc  = "Set explorer bottom",      mode = { "n" }            },
  { "<leader>eK",       "<cmd> Neotree top <cr>",                                   desc  = "Set explorer top",         mode = { "n" }            },
  { "<leader>eL",       "<cmd> Neotree right <cr>",                                 desc  = "Set explorer right",       mode = { "n" }            },

  ----------------------Telescope------------------------------
  { "<leader>f",                                                                    group = "Finder"                                              },
  { "<leader>ff",       "<cmd> Telescope find_files <cr>",                          desc  = "files",                     mode = { "n" }           },
  { "<leader>fF",       "<cmd> Telescope resume <cr>",                              desc  = "files resume",              mode = { "n" }           },
  { "<leader>fw",       "<cmd> Telescope live_grep <cr>",                           desc  = "words",                     mode = { "n" }           },
  { "<leader>fh",       "<cmd> Telescope help_tags <cr>",                           desc  = "help",                      mode = { "n" }           },
  { "<leader>fH",       "<cmd> Telescope highlights <cr>",                          desc  = "highlights",                mode = { "n" }           },
  { "<leader>fr",       "<cmd> Telescope oldfiles <cr>",                            desc  = "recents",                   mode = { "n" }           },
  { "<leader>fs",       "<cmd> Telescope session-lens <cr>",                        desc  = "sessions",                  mode = { "n" }           },
  { "<leader>fb",       "<cmd> Telescope buffers <cr>",                             desc  = "buffers",                   mode = { "n" }           },
  { "<leader>fR",       "<cmd> Telescope registers <cr>",                           desc  = "registers",                 mode = { "n" }           },
  { "<leader>fk",       "<cmd> Telescope keymaps <cr>",                             desc  = "keymaps",                   mode = { "n" }           },
  { "<leader>fc",       "<cmd> Telescope commands <cr>",                            desc  = "commands",                  mode = { "n" }           },
  { "<leader>fu",       "<cmd> Telescope undo <cr>",                                desc  = "undos",                     mode = { "n" }           },

  ----------------------autoSession------------------------------
  { "<leader>wr",       "<cmd> SessionRestore <cr>",                                desc  = "Restore recent session",     mode = { "n" }          },
  { "<leader>ws",       "<cmd> SessionSave <cr>",                                   desc  = "Save session",               mode = { "n" }          },

  ----------------------barbar------------------------------
  { "<tab>",            "<cmd> BufferNext <cr>",                                    desc  = "Buffer next",                mode = { "n" }          },
  { "<s-tab>",          "<cmd> BufferPrevious <cr>",                                desc  = "Buffer previous",            mode = { "n" }          },
  { "<A-<>",            "<cmd> BufferMovePrevious <cr>",                            desc  = "Pick to go buffer ",         mode = { "n" }          },
  { "<A->>",            "<cmd> BufferMoveNext <cr>",                                desc  = "Pick to go buffer ",         mode = { "n" }          },
  { "<leader>b",                                                                    group = "Buffer"},
  { "<leader>b1",       "<cmd> BufferGoto 1 <cr>",                                  desc  = "Buffer 1",                   mode = { "n" }          },
  { "<leader>b2",       "<cmd> BufferGoto 2 <cr>",                                  desc  = "Buffer 2",                   mode = { "n" }          },
  { "<leader>b3",       "<cmd> BufferGoto 3 <cr>",                                  desc  = "Buffer 3",                   mode = { "n" }          },
  { "<leader>b4",       "<cmd> BufferGoto 4 <cr>",                                  desc  = "Buffer 4",                   mode = { "n" }          },
  { "<leader>b5",       "<cmd> BufferGoto 5 <cr>",                                  desc  = "Buffer 5",                   mode = { "n" }          },
  { "<leader>b6",       "<cmd> BufferGoto 6 <cr>",                                  desc  = "Buffer 6",                   mode = { "n" }          },
  { "<leader>b7",       "<cmd> BufferGoto 7 <cr>",                                  desc  = "Buffer 7",                   mode = { "n" }          },
  { "<leader>b8",       "<cmd> BufferGoto 8 <cr>",                                  desc  = "Buffer 8",                   mode = { "n" }          },
  { "<leader>b9",       "<cmd> BufferGoto 9 <cr>",                                  desc  = "Buffer 9",                   mode = { "n" }          },
  { "<leader>b0",       "<cmd> BufferLast <cr>",                                    desc  = "Buffer last",                mode = { "n" }          },
  { "<leader>b;",       "<cmd> BufferPin <cr>",                                     desc  = "Pin",                        mode = { "n" }          },
  { "<leader>bc",                                                                   group = "Close"},
  { "<leader>bcc",      "<cmd> BufferClose <cr>",                                   desc  = "Current",                    mode = { "n" }          },
  { "<leader>bco",      "<cmd> BufferCloseAllButCurrent <cr>",                      desc  = "Others not current",         mode = { "n" }          },
  { "<leader>bcv",      "<cmd> BufferCloseAllButVisible <cr>",                      desc  = "Others not visible",         mode = { "n" }          },
  { "<leader>bcp",      "<cmd> BufferCloseAllButPinned <cr>",                       desc  = "Others not pinned",          mode = { "n" }          },
  { "<leader>bcP",      "<cmd> BufferCloseAllButCurrentOrPinned <cr>",              desc  = "Others not current/pinned",  mode = { "n" }          },
  { "<leader>bcl",      "<cmd> BufferCloseBuffersLeft <cr>",                        desc  = "Left all",                   mode = { "n" }          },
  { "<leader>bcr",      "<cmd> BufferCloseBuffersRight <cr>",                       desc  = "Rigth all",                  mode = { "n" }          },
  { "<leader>br",       "<cmd> BufferRestore <cr>",                                 desc  = "Restore",                    mode = { "n" }          },
  { "<leader>bw",       "<cmd> BufferWipeout <cr>",                                 desc  = "Wipeout",                    mode = { "n" }          },
  { "<leader>bp",                                                                   group = "Pick"},
  { "<leader>bpp",      "<cmd> BufferPick <cr>",                                    desc  = "Pick to go buffer ",         mode = { "n" }          },
  { "<leader>bpd",      "<cmd> BufferPickDelete <cr>",                              desc  = "Pick to delete buffer ",     mode = { "n" }          },
  { "<leader>bo",                                                                   group = "Order"},
  { "<leader>bon",      "<cmd> BufferOrderByBufferNumber <cr>",                     desc  = "Close right buffers",        mode = { "n" }          },
  { "<leader>boN",      "<cmd> BufferOrderByName <cr>",                             desc  = "Close right buffers",        mode = { "n" }          },
  { "<leader>bod",      "<cmd> BufferOrderByDirectory <cr>",                        desc  = "Close right buffers",        mode = { "n" }          },
  { "<leader>bol",      "<cmd> BufferOrderByLanguage <cr>",                         desc  = "Close right buffers",        mode = { "n" }          },
  { "<leader>bow",      "<cmd> BufferOrderByWindowNumber <cr>",                     desc  = "Close right buffers",        mode = { "n" }          },

  ----------------------LSP------------------------------
  { "<c-space>",                                                                    group = "LSP"                                                 },
  { "<c-space>t",                                                                   group = "Telescope"                                           },
  { "<c-space>g",                                                                   group = "Global"                                              },
  { "<c-space>rn",      vim.lsp.buf.rename,                                           desc  = "Rename Symbol",              mode = { "n" }          },
  { "<c-space>ca",      vim.lsp.buf.code_action,                                      desc  = "Code Action",                mode = { "n", "v" }     },
  { "<c-space>gd",      vim.lsp.buf.definition,                                       desc  = "Go to Definition",           mode = { "n" }          },
  { "<c-space>td",      "<cmd> Telescope lsp_definitions <cr>",                     desc  = "Project Symbols",            mode = { "n" }          },
  { "<c-space>tr",      "<cmd> Telescope lsp_references <cr>",                      desc  = "References",                 mode = { "n" }          },
  { "<c-space>ti",      "<cmd> Telescope lsp_implementations <cr>",                 desc  = "Go to Implementation"                                },
  { "<c-space>gi",      vim.lsp.buf.implementation,                                   desc  = "Go to Implementation",       mode = { "n" }          },
  { "<c-space>ts",      "<cmd> Telescope lsp_document_symbols <cr>",                desc  = "Buffer Symbols",             mode = { "n" }          },
  { "<c-space>ts",      "<cmd> Telescope lsp_workspace_symbols <cr>",               desc  = "Project Symbols",            mode = { "n" }          },
  { "<c-space>K",       vim.lsp.buf.hover,                                            desc  = "Hover Documentation",        mode = { "n" }          },
  { "<c-space>k",       vim.lsp.buf.signature_help,                                   desc  = "Signature Help",             mode = { "n", "i" }     },
  { "<c-space>gD",      vim.lsp.buf.declaration,                                      desc  = "Go to Declaration",          mode = { "n" }          },
  { "<c-space>gt",      vim.lsp.buf.type_definition,                                  desc  = "Go to Type Definition",      mode = { "n" }          },
  { "<c-space>ti",      "<cmd> Telescope lsp_type_definitions <cr>",                desc  = "Go to Implementation"                                },
  { "<c-space>tD",      "<cmd> Telescope diagnostics bufnr=0 <cr>",                 desc  = "Buffer Diagnostics",         mode = { "n" }          },
  { "<c-space>ld",      vim.diagnostic.open_float,                                          desc  = "Line Diagnostics",           mode = { "n" }          },
  { "<c-space>dp",      vim.diagnostic.goto_prev,                                           desc  = "Previous Diagnostic",        mode = { "n" }          },
  { "<c-space>dn",      vim.diagnostic.goto_next,                                           desc  = "Next Diagnostic",            mode = { "n" }          },
  { "<c-space>rs",      "<cmd> LspRestart <cr>",                                    desc  = "Restart LSP",                mode = { "n" }          },





  ----------------------Extras------------------------------
  -- { "<localleader>l", group = "Line"},
  -- { "<localleader>lw", "<cmd> set wrap! <cr>", desc = "Set line wrap", mode = "n" },

  --  make a function to behave these gj to j and gk to k while line wrap
  -- gj - Go down one wrapped line
  -- gk - Go up one wrapped line
  -- g^ or g0 - Go to the beginning of the wrapped line
  -- g$ - Go to the end of the wrapped line
})

-- keymaps
local defaultMaps = {
  { "n",        "q",          function() mapCond.handle_q_colon_key() end,  "" },    -- fix q: its shows annoying command lists
  { "",         "<c-h>",      "<cmd> TmuxNavigateLeft <cr>",                "" }, -- move to split left
  { "",         "<c-j>",      "<cmd> TmuxNavigateDown <cr>",                "" }, -- move to split down
  { "",         "<c-k>",      "<cmd> TmuxNavigateUp <cr>",                  "" }, -- move to split up
  { "",         "<c-l>",      "<cmd> TmuxNavigateRight <cr>",               "" }, -- move to split right
  { "",         "<c-p>",      "<cmd> TmuxNavigatePrevious <cr>",            "" }, -- move to split previous
  { "n",        "<c-Up>",     "<cmd> resize -2 <cr>",                       "" }, -- decrease horizontal split size
  { "n",        "<c-Down>",   "<cmd> resize +2 <cr>",                       "" }, -- increase horizontal split size
  { "n",        "<c-Left>",   "<cmd> vertical resize -2 <cr>",              "" }, -- decrease vertical split size
  { "n",        "<c-Right>",  "<cmd> vertical resize +2 <cr>",              "" }, -- increase vertical split size
  { "n",        "<A-j>",      ":m .+1<cr>==",                               "" }, -- move text down
  { "n",        "<A-k>",      ":m .-2<cr>==",                               "" }, -- move text up
  { {"v", "x"}, "<A-j>",      ":m '>+1<cr>gv=gv",                           "" }, -- move text down
  { {"v", "x"}, "<A-k>",      ":m '<-2<cr>gv=gv",                           "" }, -- move text up
  { {"v", "x"}, "p",          '"_dP',                                       "" }, -- fix: do not replace register when select and paste
  { "n",        "x",          '"_x',                                        "" }, -- fix: delete character will not into register
  { "n",        "+",          "<c-a>",                                      "" }, -- increase number with +
  { "n",        "-",          "<c-x>",                                      "" }, -- decrease number with -
  { "n",        "gc",         "<Nop>",                                      "" }, -- shows warning into checkhealth which-key
  { {"v", "x"}, "<",          "<gv",                                        "" }, -- keep visual mode while decrease indentation
  { {"v", "x"}, ">",          ">gv",                                        "" }, -- keep visual mode while increase indentation
  { "n",        "n",          "nzzzv",                                      "" }, -- keep cursor center while next search result
  { "n",        "N",          "Nzzzv",                                      "" }, -- keep cursor center while previous search result
  -- { "n",        "<c-u>",      "<c-u>zz",                                    "" }, -- page up and center
  -- { "n",        "<c-d>",      "<c-d>zz",                                    "" }, -- page down and center
  -- { "n",        "<c-f>",      "<c-f>zz",                                    "" }, -- page down and center
  -- { "n",        "<c-b>",      "<c-b>zz",                                    "" }, -- page down and center
  -- { "n",        "<BS>",       "^",                                          "" }, -- go to non blank character to the line
  -- { "n",        "K",          "<Nop>",                                      "" }, -- disables opening builtin annoying infos
}

-- set the keymaps
for _ , values in pairs(defaultMaps) do
  local opts = { noremap = true, silent = true }

  if type(values[4]) == "string" and #values[4] > 0 then
    opts.desc = values[4]
    V_MAP(values[1], values[2], values[3], opts)
  else
    V_MAP(values[1], values[2], values[3], opts)
  end

end
