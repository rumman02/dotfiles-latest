local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

---@diagnostic disable-next-line: undefined-field
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })

  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end

end

vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
local lazy = require("lazy")
lazy.setup({
  lockfile = vim.fn.stdpath("config") .. "/.tempfiles/lazy-lock.json",     -- set the lockfile (lockfile generated after running update)
  spec = {
    -- import your plugins
    { import = "init" },
  },
  -- colorscheme that will be used when installing plugins.
  install = {colorscheme = { "habamax", "sorbet", "retrobox" } },
  ui = {
    border = MY_ROUNDED_BORDER[1], -- set a border style of lazy plugin ui
    title = "Lazy plugin manager",      -- set the title of lazy plugin ui
    checker = {
      enabled = true,         -- automatically check for plugin updates
      notify = false,         -- don't getting any notification of plugin updates
    },
    change_detection = {
      enabled = true,         -- any changes will be detected into lazy plugin
      notify = false,         -- disable annoying notification of every changes
    },
    pkg = {
      enabled = false,
      -- sources = { "lazy" },
    },
    performance = {
      cache = {
        enabled = true,
      },
      reset_packpath = true, -- reset the package path to improve startup time
      rtp = {
        disabled_plugins = {
          -- "gzip",
          -- "matchit",
          -- "matchparen",
          -- "netrwPlugin",
          -- "tarPlugin",
          -- "tohtml",
          -- "tutor",
          -- "zipPlugin",
        },
      },
    },
  },
})
