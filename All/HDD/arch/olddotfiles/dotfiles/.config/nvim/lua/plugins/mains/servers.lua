local M = {}

M.servers = {
  clangd = {},
  lua_ls = {
    -- root_dir = function(fname)
    --   -- Set the workspace directory to where your Lua projects or files are located
    --   return require('lspconfig').util.root_pattern('init.lua')(fname) or vim.fn.getcwd()
    -- end,
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT", -- Specify the Lua version
        },
        diagnostics = {
          globals = { "vim" }, -- Recognize global variables
        },
        completion = {
          callSnippet = "Replace", -- Configure snippet behavior
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          -- Optionally specify additional directories or library paths
        },
        telemetry = {
          enable = false, -- Disable telemetry if not needed
        },
      },
    }
  },
  html  = {},
  cssls = {},
  ts_ls = {},
}

M.formatters = {
  prettier = {}
}

return M
