return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",   -- this plugin integrates "neovim/nvim-lsp" with "nvim-cmp"
    {
      "nvimdev/lspsaga.nvim",
      event = "LspAttach"
    }
  },
  config = function()
    local lspConfig      = require("lspconfig")
    local lspconfigUI    = require("lspconfig.ui.windows")
    local masonLspConfig = require("mason-lspconfig")
    local cmpNvimLsp     = require("cmp_nvim_lsp")
    local servers        = require("plugins.mains.servers")

    -- Change the Diagnostic symbols in the sign column (gutter)
    local signs = {
      Error = MY_ICON_CROSSES[2],
      Warn  = MY_ICON_WARNINGS[1],
      Hint  = MY_ICON_HINTS[1],
      Info  = MY_ICON_INFOS[1]
    }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- Set the border style for LSP UI elements.
    -- `MY_ROUNDED_BORDER` should be a predefined variable with the desired border style.
    lspconfigUI.default_options.border = MY_ROUNDED_BORDER[1]

    -- Configure diagnostics float windows to use the same border style.
			vim.diagnostic.config({ float = { border = "rounded" } })


    -- Default handlers for LSP requests with custom borders.
    local default_handlers = {
      -- Customize the hover handler to use a rounded border.
      ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),

      -- Customize the signature help handler to use a rounded border.
      ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
    }

    -- Note: `MY_ROUNDED_BORDER` should be a variable containing the border style. 
    -- Ensure it is defined elsewhere in your configuration. For example:
    -- local MY_ROUNDED_BORDER = { "rounded" }

    -- LSP servers and clients are able to communicate to each other what features they support.
    -- By default, Neovim doesn't support everything that is in the LSP Specification. When you add nvim-cmp, luasnip, etc.
    -- Neovim now has *more* capabilities. So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
    local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

    capabilities = vim.tbl_deep_extend("force", capabilities, cmpNvimLsp.default_capabilities())
    -- local capabilities = cmpNvimLsp.default_capabilities()   -- simply add and overwirte existing capabilities with default_capabilities

    local on_attach = function (client, bufferNumber)

    end

    -- Setup LSP servers using Mason's setup_handlers function
    masonLspConfig.setup_handlers({

      -- Function to configure each LSP server
      function(server_name)
        -- Fetch server-specific configurations from the 'servers.servers' table.
        -- If the server is not configured, fall back to an empty table.
        local server_config = servers.servers[server_name] or {}

        -- Set up the LSP server configuration using the server's name
        lspConfig[server_name].setup({

          -- Shared capabilities (e.g., autocomplete, diagnostics, etc.) for all servers
          capabilities = capabilities,

          -- Server-specific settings (fetched from 'server_config')
          autostart = server_config.autostart,  -- Automatically start the server if set
          cmd       = server_config.cmd,        -- Command to start the LSP server
          filetypes = server_config.filetypes,  -- List of file types the server handles

          -- Handlers are extended using default handlers and server-specific ones (if any)
          handlers = vim.tbl_deep_extend("force", {}, default_handlers, server_config.handlers or {}),

          -- Optionally, you can include an 'on_attach' function here to run when the server attaches
          -- on_attach = on_attach, -- Uncomment if needed
          on_attach = on_attach,

          -- Server-specific settings (like LSP configurations, preferences, etc.)
          settings = server_config.settings,

          -- Define the root directory of the project (where LSP should consider as the project root)
          root_dir = server_config.root_dir,
        })
      end
    })

    -- Explanation:
    -- This code registers a handler for each LSP server installed via Mason. The `setup_handlers` function 
    -- automatically gets the server names (like 'tsserver', 'pyright', etc.) and calls the setup function 
    -- with server-specific configuration stored in `servers.servers[server_name]`. If there is no specific 
    -- configuration, it uses an empty table to avoid errors. 

    -- The `capabilities` are shared across all servers to maintain consistency in the language features 
    -- provided by the LSP, while other settings like `autostart`, `cmd`, `filetypes`, and `handlers` are 
    -- server-specific.

    -- The `vim.tbl_deep_extend("force", {}, ...)` is used to merge the default handlers with any 
    -- server-specific handlers, ensuring that the configuration is customized but still inherits the defaults.
  end
}
