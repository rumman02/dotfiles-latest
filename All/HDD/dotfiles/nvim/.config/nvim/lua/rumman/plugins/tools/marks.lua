local marks = require("marks")
local icons =  require("rumman.lib.icons")
local annotate = false
local virtual_text = ""

marks.setup({
  default_mappings = false,
	-- "'", "^", ".", "<", ">" "[", "]"
  builtin_marks = {},
  cyclic = true,
  force_write_shada = false,
  refresh_interval = 250,
  sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
  excluded_filetypes = {},
  excluded_buftypes = {},
  bookmark_0 = { sign = icons.number.Ten, virt_text = virtual_text, annotate = annotate },
  bookmark_1 = { sign = icons.number.One, virt_text = virtual_text, annotate = annotate },
  bookmark_2 = { sign = icons.number.Two, virt_text = virtual_text, annotate = annotate },
  bookmark_3 = { sign = icons.number.Three, virt_text = virtual_text, annotate = annotate },
  bookmark_4 = { sign = icons.number.Four, virt_text = virtual_text, annotate = annotate },
  bookmark_5 = { sign = icons.number.Five, virt_text = virtual_text, annotate = annotate },
  bookmark_6 = { sign = icons.number.Six, virt_text = virtual_text, annotate = annotate },
  bookmark_7 = { sign = icons.number.Seven, virt_text = virtual_text, annotate = annotate },
  bookmark_8 = { sign = icons.number.Eight, virt_text = virtual_text, annotate = annotate },
  bookmark_9 = { sign = icons.number.Nine, virt_text = virtual_text, annotate = annotate },
})

