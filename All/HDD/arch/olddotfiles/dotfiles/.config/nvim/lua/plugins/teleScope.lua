return {
  "nvim-telescope/telescope.nvim",
  cmd = { "Telescope" },
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      -- cmd = { "Telescope" },
      build = "make"
    },
    "debugloop/telescope-undo.nvim",
  },

  config = function()
    local teleScope = require("telescope")
    local actions = require("telescope.actions")


    -- this similar as <c-w>j keymap of splitting window into telescope
    local function open_below(prompt_bufnr) vim.cmd("set splitbelow") actions.select_horizontal(prompt_bufnr) end
    -- this similar as <c-w>k keymap of splitting window into telescope
    local function open_above(prompt_bufnr) vim.cmd("set nosplitbelow") actions.select_horizontal(prompt_bufnr) end
    -- this similar as <c-w>l keymap of splitting window into telescope
    local function open_right(prompt_bufnr) vim.cmd("set splitright") actions.select_vertical(prompt_bufnr) end
    -- this similar as <c-w>h keymap of splitting window into telescope
    local function open_left(prompt_bufnr) vim.cmd("set nosplitright") actions.select_vertical(prompt_bufnr) end

    teleScope.setup({
      defaults = {
        prompt_prefix = string.format(" %s  ", MY_ICON_SEARCHS[3]),
        selection_caret = string.format("%s ", MY_ICON_ARROWS[14]..MY_ICON_VERTCAL_LINES[5]),
        path_display = { "smart" },
        layout_strategy = "flex",
        layout_config = {
          horizontal = { prompt_position = "top", preview_width = 0.65 },
          vertical = { prompt_position = "top", },
        },
        borderchars = MY_ROUNDED_BORDER[2],
        sorting_strategy = "ascending",
        mappings = {
          i = {
            ["<localleader>wl"] = open_right,
            ["<localleader>wh"] = open_left,
            ["<localleader>wj"] = open_below,
            ["<localleader>wk"] = open_above,

            ["<c-n>"] = actions.cycle_history_next,
            ["<c-p>"] = actions.cycle_history_prev,

            ["<c-j>"] = actions.move_selection_next,
            ["<c-k>"] = actions.move_selection_previous,

            ["<c-c>"] = actions.close,

            ["<down>"] = actions.move_selection_next,
            ["<up>"] = actions.move_selection_previous,

            ["<cr>"] = actions.select_default,
            -- ["<c-h>"] = actions.select_horizontal,
            -- ["<c-v>"] = actions.select_vertical,
            ["<c-t>"] = actions.select_tab,

            ["<c-u>"] = actions.preview_scrolling_up,
            ["<c-d>"] = actions.preview_scrolling_down,

            ["<pageup>"] = actions.results_scrolling_up,
            ["<pagedown>"] = actions.results_scrolling_down,

            ["<tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<s-tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<c-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<m-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<c-l>"] = actions.complete_tag,
            ["<c-_>"] = actions.which_key, -- keys from pressing <C-/>

          },

          n = {

            ["<localleader>wl"] = open_right,
            ["<localleader>wh"] = open_left,
            ["<localleader>wj"] = open_below,
            ["<localleader>wk"] = open_above,

            ["<esc>"] = actions.close,
            ["<cr>"] = actions.select_default,
            ["<c-h>"] = actions.select_horizontal,
            ["<c-v>"] = actions.select_vertical,
            ["<c-t>"] = actions.select_tab,

            ["<tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<s-tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<c-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<m-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

            ["j"] = actions.move_selection_next,
            ["k"] = actions.move_selection_previous,
            ["H"] = actions.move_to_top,
            ["M"] = actions.move_to_middle,
            ["L"] = actions.move_to_bottom,

            ["<down>"] = actions.move_selection_next,
            ["<up>"] = actions.move_selection_previous,
            ["gg"] = actions.move_to_top,
            ["G"] = actions.move_to_bottom,

            ["<c-u>"] = actions.preview_scrolling_up,
            ["<c-d>"] = actions.preview_scrolling_down,

            ["<pageup>"] = actions.results_scrolling_up,
            ["<pagedown>"] = actions.results_scrolling_down,

            ["?"] = actions.which_key,

          },
        },

        file_ignore_patterns = {
          "node_modules",
          "yarn.lock",
          "buid",
          "dist",
          ".tempfiles/",
        },

      },
      extensions = {
        undo = {}
      }
    })

    teleScope.load_extension("fzf")
    teleScope.load_extension("undo")
  end
}
