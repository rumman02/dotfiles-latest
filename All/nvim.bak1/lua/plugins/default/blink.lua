local M = {};

M.opts = function()
  local requires = require("lib.functions").requires;
  local utils = requires("lib.utils");
  local icons = require("lib.icons");
  local border = {
	  icons.ui.border.top.left,
	  icons.ui.border.horizontal,
	  icons.ui.border.top.right,
	  icons.ui.border.vertical,
	  icons.ui.border.bottom.right,
	  icons.ui.border.horizontal,
	  icons.ui.border.bottom.left,
	  icons.ui.border.vertical,
	};

  return {
    appearance = {
      use_nvim_cmp_as_default = false,
      nerd_font_variant = "normal",
      kind_icons = {
        -- loaded kind icons will slows down the blink cmp
        -- Text = icons.kind.Text,
        -- Method = icons.kind.Method,
        -- Function = icons.kind.Function,
        -- Constructor = icons.kind.Constructor,
        -- Field = icons.kind.Field,
        -- Variable = icons.kind.Variable,
        -- Property = icons.kind.Property,
        -- Class = icons.kind.Class,
        -- Interface = icons.kind.Interface,
        -- Struct = icons.kind.Struct,
        -- Module = icons.kind.Module,
        -- Unit = icons.kind.Unit,
        -- Value = icons.kind.Value,
        -- Enum = icons.kind.Enum,
        -- EnumMember = icons.kind.EnumMember,
        -- Keyword = icons.kind.Keyword,
        -- Constant = icons.kind.Constant,
        -- Snippet = icons.kind.Snippet,
        -- Color = icons.kind.Color,
        -- File = icons.kind.File,
        -- Reference = icons.kind.Reference,
        -- Folder = icons.kind.Folder,
        -- Event = icons.kind.Event,
        -- Operator = icons.kind.Operator,
        -- TypeParameter = icons.kind.TypeParameter,
      },
    },
    sources = {
      default = {
        "lsp",
        "path",
        "snippets",
        "buffer",
      },
    },
    completion = {
      documentation = {
        window = {
          border = border,
        },
      },
      menu = { },
    },
    signature = {
      enabled = true,
      window = {
        border = border,
      },
    },
    keymap = {
      preset = "none", -- disables all default keymaps

      ["<c-j>"] = { function(cmp) cmp.select_next({ auto_insert = false }) return true end, "fallback", },
			["<c-k>"] = { function(cmp) cmp.select_prev({ auto_insert = false }) return true end, "fallback", },
			["<c-n>"] = { function(cmp) cmp.select_next({ auto_insert = true }) return true end, "fallback", },
			["<c-p>"] = { function(cmp) cmp.select_prev({ auto_insert = true }) return true end, "fallback", },

			["<c-h>"] = { "hide", "fallback" },
			["<c-l>"] = { "show_documentation", "hide_documentation", "fallback" },

			["<c-u>"] = { "scroll_documentation_up", "fallback" },
			["<c-d>"] = { "scroll_documentation_down", "fallback" },

			["<c-i>"] = { "show_signature", "hide_signature", "fallback" },

			["<c-space>"] = { "show", "hide", "fallback" },
			["<c-cr>"] = { "accept", "fallback" },

			["<tab>"] = { "snippet_forward", "fallback" },
			["<s-tab>"] = { "snippet_backward", "fallback" },

			-- cmdline = {
			-- 	preset = 'enter',
			-- },
    },
  };
end;

return M;
