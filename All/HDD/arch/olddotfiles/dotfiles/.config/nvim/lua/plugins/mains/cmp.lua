return {
  "hrsh7th/nvim-cmp",   -- this the core plugin of completion for various completion sources

  event = { "BufReadPre", "BufNewFile" },

  dependencies = {
    "hrsh7th/cmp-buffer",        -- provides completion suggestions from current buffer
    "hrsh7th/cmp-path",          -- provies completion suggestions for file path
    "hrsh7th/cmp-cmdline",       -- provides completion suggestions for cmdline inputs
    "dmitmel/cmp-cmdline-history",
    "hrsh7th/cmp-nvim-lua",      -- provides completion suggestions for lua
    "hrsh7th/cmp-emoji",         -- provides emoji suggestions, to get emoji suggestions first write ":" this
    "chrisgrieser/cmp-nerdfont", -- provides nerdfonts symbols, to get nerdfont suggestions first write ":" this
    "f3fora/cmp-spell",          -- provides spelling suggestions based on vim's spell suggest
    {
      "uga-rosa/cmp-dictionary",
      config = function ()
        local cmp_dictionary = require("cmp_dictionary")
        cmp_dictionary.setup({
          paths = {"/usr/share/dict/words"},
          exact_length = 2
        })
      end
    },
    {
      "L3MON4D3/LuaSnip",               -- provides luasnip snippet engine
      version = "v2.*",                 -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      build = "make install_jsregexp",  -- brew install make
      dependencies = {
        "saadparwaiz1/cmp_luasnip",     -- integrates luasnip with nvim-cmp
        "rafamadriz/friendly-snippets", -- provides useful snippets driven by community
      },
    },
    "onsails/lspkind.nvim",     -- provides a format to shows completions like vs_code completion
  },

  config = function()
    local cmp            = require("cmp")
    local luasnip        = require("luasnip")
    local luasnipLoaders = require("luasnip.loaders.from_vscode")
    local lspKind        = require("lspkind")

    -- Function to check if the cursor is at the beginning of a line or
    -- if the character immediately before the cursor is a whitespace.
    local check_backspace = function()

      -- Get the current cursor column (0-indexed)
      local col = vim.fn.col "." - 1

      -- Return true if the cursor is at the start of the line or
      -- if the character before the cursor is a whitespace
      return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"

    end

    luasnipLoaders.lazy_load()

    cmp.setup({

      -- Configuration for snippet expansion and completion UI in cmp (completion plugin).
      snippet = {
        -- Function to expand the snippet using LuaSnip when triggered.
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end
      },

      -- Configuration for completion and documentation window with borders.
      window = {
        completion    = cmp.config.window.bordered(),     -- Border for the completion window.
        documentation = cmp.config.window.bordered(),  -- Border for the documentation window.
      },

      -- Set completion behavior and options.
      completion = {
        completeopt = "menu,menuone,preview,noinsert"  -- Display menu with one option and a preview, but do not auto-insert.
      },

      -- Preselect the first item in the completion menu.
      preselect = cmp.PreselectMode.Item,

      -- Define key mappings for completion behavior using `cmp` with preset insert mode.
      mapping = cmp.mapping.preset.insert({

        ["<C-k>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()  -- Pressing <C-k> will select the previous item in the suggestion list
          else
            fallback()  -- If there is no suggestion list, it will perform the default <C-k> action
          end
        end, { "i", "c" }),

        ["<C-j>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()  -- Pressing <C-j> will select the next item in the suggestion list
          else
            fallback()  -- If there is no suggestion list, it will perform the default <C-j> action
          end
        end, { "i", "c" }),

        -- Scroll the documentation window up by 4 lines with <C-b>
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),

        -- Scroll the documentation window down by 4 lines with <C-f>
        ["<C-f>"] = cmp.mapping.scroll_docs(4),

        -- Trigger the completion menu with <C-Space>
        ["<C-Space>"] = cmp.mapping.complete(),

        -- Abort the completion menu with <C-e>
        ["<C-e>"] = cmp.mapping.abort(),


        -- Confirm the selected completion item with <CR>. If no completion menu is visible,
        -- fallback to the default behavior, and also handle search mode ('/' and '?').
        ["<CR>"] = cmp.mapping(function(fallback)
          local cmd_type = vim.fn.getcmdtype()
          local is_search_mode = cmd_type == '/' or cmd_type == '?'

          if cmp.visible() then
            -- Confirm the item from the completion menu (do not select automatically)
            cmp.confirm({ select = false })
          elseif is_search_mode then
            -- If in search mode, execute the fallback action (e.g., newline)
            fallback()
          else
            -- If no completion menu is open and not in search mode, execute the fallback action (e.g., newline)
            fallback()
          end
        end, { "i", "c", "n" }),

        -- Use <Tab> to:
        -- 1. Select the next item in the completion menu if visible
        -- 2. Expand a snippet if expandable
        -- 3. Expand or jump within a snippet if possible
        -- 4. If at the start of a line or no completion/snippet action, fallback to default behavior
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expandable() then
            luasnip.expand()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif check_backspace() then
            fallback()
          else
            fallback()
          end
        end, { "i", "s" }),

        -- Use <S-Tab> to:
        -- 1. Select the previous item in the completion menu if visible
        -- 2. Jump backwards in a snippet if possible
        -- 3. If no completion/snippet action, fallback to default behavior
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),

      -- Enable pictogram icons for lsp/autocompletion
      -- Configuration for formatting and sources in Neovim's `cmp` (completion plugin).
      formatting = {

        -- Enable the expandable indicator which shows an arrow or symbol if there are additional details.
        expandable_indicator = true,

        -- Define the fields to display in the completion menu.
        fields = { "kind", "abbr", "menu" },

        -- Format the completion items using `lspKind` with specific settings.
        format = lspKind.cmp_format({
          mode = "symbol",  -- Set how to display completion items: "text", "text_symbol", "symbol_text", or "symbol".
          maxwidth = 50,    -- Maximum width for completion item display.

          -- Map different types of completion items to specific symbols.
          symbol_map = {
            Text          = "󰉿 ", -- Plain text
            Method        = "󰆧 ", -- Method
            Function      = "󰊕 ", -- Function
            Constructor   = " ", -- Constructor
            Field         = " ", -- Field
            Variable      = "󰀫 ", -- Variable
            Class         = "󰠱 ", -- Class
            Interface     = " ", -- Interface
            Module        = " ", -- Module
            Property      = "󰜢 ", -- Property
            Unit          = "󰑭 ", -- Unit
            Value         = "󰎠 ", -- Value
            Enum          = " ", -- Enum
            Keyword       = "󰌋 ", -- Keyword
            Snippet       = " ", -- Snippet
            Color         = "󰏘 ", -- Color
            File          = "󰈙 ", -- File
            Reference     = " ", -- Reference
            Folder        = "󰉋 ", -- Folder
            EnumMember    = " ", -- Enum Member
            Constant      = "󰏿 ", -- Constant
            Struct        = "󰙅 ", -- Struct
            Event         = " ", -- Event
            Operator      = "󰆕 ", -- Operator
            TypeParameter = "󰊄 ", -- Type Parameter
            Misc          = " ", -- Miscellaneous
          },

          -- Use ellipsis to indicate truncated text.
          ellipsis_char = "...",

          -- Customize how the source of the completion item is displayed.
          menu = {
            nvim_lsp        = " | LSP",      -- LSP completions
            buffer          = " | Buffer",   -- Buffer completions
            path            = " | Path",     -- Path completions
            luasnip         = " | Snippet",  -- LuaSnip completions
            spell           = " | Text",     -- Text suggestion
            dictionary      = " | Text",
            cmdline         = " | Cmd",
            cmdline_history = " | Hist",
          },
        }),
      },

      -- Experimental features for `cmp`.
      experimental = {
        -- Enable ghost text, which shows a faded preview of the item being completed.
        ghost_text = true,
      },

      -- Define the sources to use for completion.
      sources = cmp.config.sources({
        { name = "nvim_lsp" },    -- Source for LSP (Language Server Protocol) completions.
        { name = "luasnip" },     -- Source for LuaSnip snippets.
        { name = "buffer" },      -- Source for completions from the current buffer.
        -- { name = "dictionary", Keyword_length = 2 },
        { name = "dictionary" },
        {
          name = "spell",
          option = {
            keep_all_entries = false,
            enable_in_context = function()
              return true
            end,
            preselect_correct_word = false
          }
        },                        -- Source for vim's spell suggestion
        { name = "path" },        -- Source for file system paths.
        { name = "emoji" },       -- Source for emoji completions.
        { name = "nerdfont" },    -- Source for Nerd Font symbols.
        { name = "nvim_lua" },    -- Source for Lua-specific completions.
      }),

      -- "/, ?" cmdline setup.
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "cmdline_history" },
          { name = "buffer" },
        }
      }),

      -- `:` cmdline setup.
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = "cmdline_history" },
            { name = "cmdline" },
            { name = "path" }
          }),
        matching = { disallow_symbol_nonprefix_matching = false }
      }),

    })
  end
}
