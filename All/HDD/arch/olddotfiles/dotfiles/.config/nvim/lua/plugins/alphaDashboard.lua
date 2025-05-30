return {
  'goolord/alpha-nvim',
  -- event = { "VimEnter" },
  lazy = false,
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- set dashboard to vertically center
    local function center_vertical(num_lines)
      return math.floor((vim.o.lines - num_lines) / 2)
    end

    -- Define the number of lines for the header - related to
    -- dashboard vertically middle
    local header_lines = 30
    local vertical_padding = center_vertical(header_lines)

    -- Configure the Alpha dashboard
    alpha.setup({
      layout = {
        { type = "padding", val = vertical_padding },
        {
          type = "text",
          val = {
            "                                                     ",
            "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
            "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
            "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
            "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
            "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
            "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
            "                                                     ",
          },
          opts = { position = "center", hl = "Type" }
        },
        { type = "padding", val = 2 },
        {
          type = "group",
          val = {
            dashboard.button("SPC ee", string.format("%s   Open file explorer",   MY_ICON_FOLDERS[4]),  "<cmd> Neotree focus reveal_force_cwd left <cr>"),
            dashboard.button("SPC ff", string.format("%s   Find files",           MY_ICON_SEARCHS[7]),  "<cmd> Telescope find_files <cr>"),
            dashboard.button("SPC fw", string.format("%s   Find words",           MY_ICON_SEARCHS[4]),  "<cmd> Telescope live_grep <cr>"),
            dashboard.button("SPC fr", string.format("%s   Find recents",         MY_ICON_SEARCHS[8]),  "<cmd> Telescope oldfiles <cr>"),
            dashboard.button("SPC fs", string.format("%s   Find sessions",        MY_ICON_SEARCHS[9]),  "<cmd> Telescope session-lens <cr>"),
            dashboard.button("SPC wr", string.format("%s   Restore last session", MY_ICON_RESTORES[1]), "<cmd> SessionRestore <cr>"),
            dashboard.button("SPC nf", string.format("%s   New file",             MY_ICON_FILES[2]),    "<cmd> ene <Bar> startinsert <cr>"),
            dashboard.button("SPC se", string.format("%s   Settings",             MY_ICON_SETTINGS[2]), "<cmd> e $MYVIMRC <Bar> lua require('neo-tree.command').execute({dir = vim.fn.stdpath('config')}) <cr>"),
            dashboard.button("SPC qq", string.format("%s   Quit",                 MY_ICON_OUTS[1]),     "<cmd> quit <cr>"),
          },
          opts = { spacing = 1 }
        },
        { type = "padding", val = 1 },
      },
      opts = {
        margin = 5,
        -- Disable folding on alpha buffer
        setup = function()
          vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])
        end,
      },
    })

    -- Get the buffer number for alpha
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'alpha',
      callback = function()
        -- get current buffer
        local buf = vim.api.nvim_get_current_buf()
        -- disable these keys in alpha buffer only
        local keys = { "a", "s", "q", "e", "i", "o", "r", "p", "u", "y", "d", "f",
                       "g", "x", "z", "n", "b", "c", ",", ".", "<", ">", "/", "?",
                       "'", '"', "[", "{", "}", "]", "\\", "|", "!", "@", "#", "$",
                       "%", "^", "&", "*", "(", ")", "~", "`", "``" }
        for _, key in ipairs(keys) do
          vim.keymap.set("n", key, "<Nop>", { buffer = buf, noremap = true, silent = true })
        end
      end
    })
  end
}
