return {
  'jinh0/eyeliner.nvim',
  cond = false,
  event = { "VeryLazy" },
  config = function()
    require'eyeliner'.setup {
      dim = true,
    }
  end
}
