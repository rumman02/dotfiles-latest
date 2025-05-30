return {
  "JoosepAlviste/nvim-ts-context-commentstring",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    local commentsTsContext = require("ts_context_commentstring")
    commentsTsContext.setup {
      enable_autocmd = false,
    }
  end
}
