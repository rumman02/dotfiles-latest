local M = {}

M.event = {
  "BufReadPre",
  "BufNewFile",
}

M.opts = function()
  return {
	  enabled = true,
	  default_animation = "fade",
	  refresh_interval_ms = 1,

	  overwrite = {
		  auto_map = true,
		  search = {
			  enabled = true,
			  default_animation = "pulse",
			  next_mapping = "n",
			  prev_mapping = "N",
		  },
		  paste = {
			  enabled = true,
			  default_animation = "fade",
			  paste_mapping = "p",
			  Paste_mapping = "P",
			  from_color = "Todo",
			  to_color = "Normal",
		  },
	  },
	  transparency_color = nil,
	  animations = {
		  fade = {
			  max_duration = 500,
			  min_duration = 300,
			  easing = "outQuad",
			  chars_for_max_duration = 10,
			  from_color = "Todo",
			  to_color = "Normal",
		  },
		  reverse_fade = {
			  max_duration = 380,
			  min_duration = 300,
			  easing = "outBack",
			  chars_for_max_duration = 10,
		  },
		  bounce = {
			  max_duration = 500,
			  min_duration = 400,
			  chars_for_max_duration = 20,
			  oscillation_count = 1,
		  },
		  left_to_right = {
			  max_duration = 350,
			  min_duration = 350,
			  min_progress = 0.85,
			  chars_for_max_duration = 25,
			  lingering_time = 50,
		  },
		  pulse = {
			  max_duration = 600,
			  min_duration = 400,
			  chars_for_max_duration = 15,
			  pulse_count = 2,
			  intensity = 1.2,
		  },
	  },
	  virt_text = {
		  priority = 2048,
	  },
  }
end

return M
