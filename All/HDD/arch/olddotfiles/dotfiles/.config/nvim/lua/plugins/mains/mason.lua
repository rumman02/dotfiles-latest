return {
  {
    "williamboman/mason.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local mason = require("mason")
      mason.setup({
        -- Limit for the maximum amount of packages to be installed at the same time. Once this limit is reached, any further
        -- packages that are requested to be installed will be put in a queue.
        max_concurrent_installers = 4,

        ui = {
          -- Whether to automatically check for new versions when opening the :Mason window.
          check_outdated_packages_on_open = true,

          -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
          border = MY_ROUNDED_BORDER[1],

          -- Width of the window. Accepts:
          -- - Integer greater than 1 for fixed width.
          -- - Float in the range of 0-1 for a percentage of screen width.
          width = 0.8,

          -- Height of the window. Accepts:
          -- - Integer greater than 1 for fixed height.
          -- - Float in the range of 0-1 for a percentage of screen height.
          height = 0.8,

          icons = {
            -- The list icon to use for installed packages.
            package_installed = MY_ICON_CHECKS_RECTANGLES[1],
            -- The list icon to use for packages that are installing, or queued for installation.
            package_pending = MY_ICON_CHECKS_RECTANGLES[2],
            -- The list icon to use for packages that are not installed.
            package_uninstalled = MY_ICON_CHECKS_RECTANGLES[3],
          },
        },
      })
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      local masonLspConfig = require("mason-lspconfig")
      masonLspConfig.setup({
        -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "lua_ls" }
        -- This setting has no relation with the `automatic_installation` setting.
        -- ensure_installed = {},

        -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
        -- This setting has no relation with the `ensure_installed` setting.
        -- Can either be:
        --   - false: Servers are not automatically installed.
        --   - true: All servers set up via lspconfig are automatically installed.
        --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
        --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
        automatic_installation = true,

        -- See `:h mason-lspconfig.setup_handlers()`
        handlers = nil,
      })
    end
  }
}
