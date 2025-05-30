return{
  "rcarriga/nvim-notify",
  event = { "VeryLazy" },
  config = function()
    -- load nvimNotify
    local nvimNotify = require("notify")
    nvimNotify.setup({
      background_colour = "NotifyBackground",
      fps = 30,
      icons = {
        DEBUG = "",
        ERROR = "",
        INFO = "",
        TRACE = "✎",
        WARN = ""
      },
      level = 2,
      minimum_width = 50,
      render = "default",
      stages = "fade_in_slide_out",
      time_formats = {
        notification = "%T",
        notification_history = "%FT%T"
      },
      timeout = 5000,
      top_down = true,
    })
    vim.notify = nvimNotify
  end
}
