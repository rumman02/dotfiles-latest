local M = {}

M.cmd = {
  "LoremIpsum",
}

M.opts = function()
  return {
	  sentenceLength = "medium",
	  comma_chance = 0.2,
	  max_commas_per_sentence = 2,
  }
end

return M
