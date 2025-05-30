return {
  "chrisgrieser/nvim-spider",
  event = { "BufReadPre", "BufNewFile" },
  config = function ()
    local nvimSpider = require("spider")
    nvimSpider.setup {
      skipInsignificantPunctuation = true,
      consistentOperatorPending = false, -- see "Consistent Operator-pending Mode" in the README
      subwordMovement = true,
      customPatterns = {}, -- check "Custom Movement Patterns" in the README for details
    }
  end
}
