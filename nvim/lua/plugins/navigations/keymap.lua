local M = {}

local hop_hint_anywhere_regex = function(input_regex)
	local jump_regex = require("hop.jump_regex")
	local function regex_by_searching(pat, plain_search)
		if plain_search then
			pat = vim.fn.escape(pat, "\\/.$^~[]")
		end

		local regex = vim.regex(pat)

		return {
			oneshot = false,
			match = function(s)
				return regex:match_str(s)
			end,
		}
	end

	jump_regex.regex_by_anywhere = function()
		return regex_by_searching(input_regex)
	end
end

local hop_hint_yank = function()
	local yank = require("hop-yank.yank")

	yank.yank_to = function(text, register)
		local joined_text = table.concat(text, "\n") -- Convert text to a single string
		vim.fn.setreg(register, joined_text, "V") -- Set the register as character-wise
	end
end

local hop_hint_yank_inline = function()
	local yank = require("hop-yank.yank")

	yank.yank_to = function(text, register)
		local joined_text = table.concat(text, "\n") -- Convert text to a single string
		vim.fn.setreg(register, joined_text, "v") -- Set the register as character-wise
	end
end

-- M.hop_key = {
-- 	s = {
-- 		mode = { "n", "v" },
-- 		b = {
-- 			cmd = function()
-- 				require("hop").hint_words({
-- 					current_line_only = true,
-- 					direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
-- 					hint_position = require("hop.hint").HintPosition.BEGIN,
-- 				})
-- 			end,
-- 			desc = "Native [b]",
-- 		},
-- 		c = {
-- 			cmd = function()
-- 				require("hop").hint_camel_case({ current_line_only = true })
-- 			end,
-- 			desc = "[C]amelcase",
-- 		},
-- 		e = {
-- 			cmd = function()
-- 				require("hop").hint_words({
-- 					current_line_only = true,
-- 					direction = require("hop.hint").HintDirection.AFTER_CURSOR,
-- 					hint_position = require("hop.hint").HintPosition.END,
-- 				})
-- 			end,
-- 			desc = "Native [e]",
-- 		},
-- 		-- f = {
-- 		-- 	cmd = function()
-- 		-- 		require("hop").hint_char1({
-- 		-- 			current_line_only = true,
-- 		-- 			direction = require("hop.hint").HintDirection.AFTER_CURSOR,
-- 		-- 			hint_offset = 0,
-- 		-- 		})
-- 		-- 	end,
-- 		-- 	desc = "Native [f]",
-- 		-- },
-- 		-- F = {
-- 		-- 	cmd = function()
-- 		-- 		require("hop").hint_char1({
-- 		-- 			current_line_only = true,
-- 		-- 			direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
-- 		-- 			hint_offset = 0,
-- 		-- 		})
-- 		-- 	end,
-- 		-- 	desc = "Native [F]",
-- 		-- },
-- 		h = {
-- 			cmd = function()
-- 				hop_hint_anywhere_regex("[^ ]")
-- 				require("hop").hint_anywhere({
-- 					direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
-- 					current_line_only = true,
-- 				})
-- 			end,
-- 			desc = "Left",
-- 		},
-- 		i = {
-- 			cmd = function()
-- 				require("hop").hint_lines_skip_whitespace({})
-- 			end,
-- 			desc = "Native [^]",
-- 		},
-- 		I = {
-- 			cmd = function()
-- 				require("hop").hint_lines({})
-- 			end,
-- 			desc = "Native [0]",
-- 		},
-- 		j = {
-- 			cmd = function()
-- 				require("hop").hint_vertical({ direction = require("hop.hint").HintDirection.AFTER_CURSOR })
-- 			end,
-- 			desc = "Down",
-- 		},
-- 		k = {
-- 			cmd = function()
-- 				require("hop").hint_vertical({ direction = require("hop.hint").HintDirection.BEFORE_CURSOR })
-- 			end,
-- 			desc = "Up",
-- 		},
-- 		l = {
-- 			cmd = function()
-- 				hop_hint_anywhere_regex("[^ ]")
-- 				require("hop").hint_anywhere({
-- 					direction = require("hop.hint").HintDirection.AFTER_CURSOR,
-- 					current_line_only = true,
-- 				})
-- 			end,
-- 			desc = "Right",
-- 		},
-- 		p = {
-- 			cmd = function()
-- 				require("hop")
-- 				vim.cmd("HopPasteChar1CurrentLine")
-- 			end,
-- 			desc = "Native [p]",
-- 		},
-- 		t = {
-- 			cmd = function()
-- 				require("hop").hint_char1({
-- 					current_line_only = true,
-- 					direction = require("hop.hint").HintDirection.AFTER_CURSOR,
-- 					hint_offset = -1,
-- 				})
-- 			end,
-- 			desc = "Native [t]",
-- 		},
-- 		T = {
-- 			cmd = function()
-- 				require("hop").hint_char1({
-- 					current_line_only = true,
-- 					direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
-- 					hint_offset = 1,
-- 				})
-- 			end,
-- 			desc = "Native [T]",
-- 		},
-- 		u = {
-- 			cmd = function()
-- 				require("hop").hint_patterns({ current_line_only = true })
-- 			end,
-- 			desc = "Native [u]",
-- 		},
-- 		w = {
-- 			cmd = function()
-- 				require("hop").hint_words({
-- 					current_line_only = true,
-- 					direction = require("hop.hint").HintDirection.AFTER_CURSOR,
-- 					hint_position = require("hop.hint").HintPosition.BEGIN,
-- 				})
-- 			end,
-- 			desc = "Native [w]",
-- 		},
-- 		y = {
-- 			cmd = function()
-- 				require("hop")
-- 				hop_hint_yank_inline()
-- 				vim.cmd("HopYankChar1CurrentLine")
-- 			end,
-- 			desc = "Native [y]",
-- 		},
-- 		Y = {
-- 			cmd = function()
-- 				require("hop")
-- 				hop_hint_yank()
-- 				vim.cmd("HopYankChar1CurrentLine")
-- 			end,
-- 			desc = "Native [Y]",
-- 		},
-- 		z = {
-- 			cmd = function()
-- 				require("hop").hint_char2({ current_line_only = true })
-- 			end,
-- 			desc = "Native [z]",
-- 		},
-- 		["ge"] = {
-- 			cmd = function()
-- 				require("hop").hint_words({
-- 					current_line_only = true,
-- 					direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
-- 					hint_position = require("hop.hint").HintPosition.END,
-- 				})
-- 			end,
-- 			desc = "Native [ge]",
-- 		},
-- 		s = {
-- 			b = {
-- 				cmd = function()
-- 					require("hop").hint_words({
-- 						current_line_only = false,
-- 						multi_windows = true,
-- 						direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
-- 						hint_position = require("hop.hint").HintPosition.BEGIN,
-- 					})
-- 				end,
-- 				desc = "Native [b]",
-- 			},
-- 			c = {
-- 				cmd = function()
-- 					require("hop").hint_camel_case({ current_line_only = false, multi_windows = true })
-- 				end,
-- 				desc = "[C]amelcase",
-- 			},
-- 			e = {
-- 				cmd = function()
-- 					require("hop").hint_words({
-- 						current_line_only = false,
-- 						multi_windows = true,
-- 						direction = require("hop.hint").HintDirection.AFTER_CURSOR,
-- 						hint_position = require("hop.hint").HintPosition.END,
-- 					})
-- 				end,
-- 				desc = "Native [e]",
-- 			},
-- 			f = {
-- 				cmd = function()
-- 					require("hop").hint_char1({
-- 						current_line_only = false,
-- 						multi_windows = true,
-- 						direction = require("hop.hint").HintDirection.AFTER_CURSOR,
-- 						hint_offset = 0,
-- 					})
-- 				end,
-- 				desc = "Native [f]",
-- 			},
-- 			F = {
-- 				cmd = function()
-- 					require("hop").hint_char1({
-- 						current_line_only = false,
-- 						multi_windows = true,
-- 						direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
-- 						hint_offset = 0,
-- 					})
-- 				end,
-- 				desc = "Native [F]",
-- 			},
-- 			h = {
-- 				cmd = function()
-- 					hop_hint_anywhere_regex("[^ ]")
-- 					require("hop").hint_anywhere({
-- 						direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
-- 						current_line_only = false,
-- 						multi_windows = true,
-- 					})
-- 				end,
-- 				desc = "Left",
-- 			},
-- 			i = {
-- 				cmd = function()
-- 					require("hop").hint_lines_skip_whitespace({ multi_windows = true })
-- 				end,
-- 				desc = "Native [^]",
-- 			},
-- 			I = {
-- 				cmd = function()
-- 					require("hop").hint_lines({ multi_windows = true })
-- 				end,
-- 				desc = "Native [0]",
-- 			},
-- 			j = {
-- 				cmd = function()
-- 					require("hop").hint_vertical({
-- 						direction = require("hop.hint").HintDirection.AFTER_CURSOR,
-- 						multi_windows = true,
-- 					})
-- 				end,
-- 				desc = "Down",
-- 			},
-- 			k = {
-- 				cmd = function()
-- 					require("hop").hint_vertical({
-- 						direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
-- 						multi_windows = true,
-- 					})
-- 				end,
-- 				desc = "Up",
-- 			},
-- 			l = {
-- 				cmd = function()
-- 					hop_hint_anywhere_regex("[^ ]")
-- 					require("hop").hint_anywhere({
-- 						direction = require("hop.hint").HintDirection.AFTER_CURSOR,
-- 						current_line_only = false,
-- 						multi_windows = true,
-- 					})
-- 				end,
-- 				desc = "Right",
-- 			},
-- 			p = {
-- 				cmd = function()
-- 					require("hop")
-- 					vim.cmd("HopPasteChar1")
-- 				end,
-- 				desc = "Native [p]",
-- 			},
-- 			t = {
-- 				cmd = function()
-- 					require("hop").hint_char1({
-- 						current_line_only = false,
-- 						multi_windows = true,
-- 						direction = require("hop.hint").HintDirection.AFTER_CURSOR,
-- 						hint_offset = -1,
-- 					})
-- 				end,
-- 				desc = "Native [t]",
-- 			},
-- 			T = {
-- 				cmd = function()
-- 					require("hop").hint_char1({
-- 						current_line_only = false,
-- 						multi_windows = true,
-- 						direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
-- 						hint_offset = 1,
-- 					})
-- 				end,
-- 				desc = "Native [T]",
-- 			},
-- 			u = {
-- 				cmd = function()
-- 					require("hop").hint_patterns({ current_line_only = false, multi_windows = true })
-- 				end,
-- 				desc = "Native [u]",
-- 			},
-- 			w = {
-- 				cmd = function()
-- 					require("hop").hint_words({
-- 						current_line_only = false,
-- 						multi_windows = true,
-- 						direction = require("hop.hint").HintDirection.AFTER_CURSOR,
-- 						hint_position = require("hop.hint").HintPosition.BEGIN,
-- 					})
-- 				end,
-- 				desc = "Native [w]",
-- 			},
-- 			y = {
-- 				cmd = function()
-- 					require("hop")
-- 					hop_hint_yank_inline()
-- 					vim.cmd("HopYankChar1")
-- 				end,
-- 				desc = "Native [y]",
-- 			},
-- 			Y = {
-- 				cmd = function()
-- 					require("hop")
-- 					hop_hint_yank()
-- 					vim.cmd("HopYankChar1")
-- 				end,
-- 				desc = "Native [Y]",
-- 			},
-- 			z = {
-- 				cmd = function()
-- 					require("hop").hint_char2({ current_line_only = false, multi_windows = true })
-- 				end,
-- 				desc = "Native [z]",
-- 			},
-- 			["ge"] = {
-- 				cmd = function()
-- 					require("hop").hint_words({
-- 						current_line_only = false,
-- 						multi_windows = true,
-- 						direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
-- 						hint_position = require("hop.hint").HintPosition.END,
-- 					})
-- 				end,
-- 				desc = "Native [ge]",
-- 			},
-- 		},
-- 	},
-- }

M.hop_key = {
	-- s = {
	-- 	mode = { "n", "v" },
	-- 	b = {
	-- 		cmd = function()
	-- 			require("hop").hint_words({
	-- 				current_line_only = true,
	-- 				direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
	-- 				hint_position = require("hop.hint").HintPosition.BEGIN,
	-- 			})
	-- 		end,
	-- 		desc = "Native [b]",
	-- 	},
	-- 	c = {
	-- 		cmd = function()
	-- 			require("hop").hint_camel_case({ current_line_only = true })
	-- 		end,
	-- 		desc = "[C]amelcase",
	-- 	},
	-- 	e = {
	-- 		cmd = function()
	-- 			require("hop").hint_words({
	-- 				current_line_only = true,
	-- 				direction = require("hop.hint").HintDirection.AFTER_CURSOR,
	-- 				hint_position = require("hop.hint").HintPosition.END,
	-- 			})
	-- 		end,
	-- 		desc = "Native [e]",
	-- 	},
	-- 	-- f = {
	-- 	-- 	cmd = function()
	-- 	-- 		require("hop").hint_char1({
	-- 	-- 			current_line_only = true,
	-- 	-- 			direction = require("hop.hint").HintDirection.AFTER_CURSOR,
	-- 	-- 			hint_offset = 0,
	-- 	-- 		})
	-- 	-- 	end,
	-- 	-- 	desc = "Native [f]",
	-- 	-- },
	-- 	-- F = {
	-- 	-- 	cmd = function()
	-- 	-- 		require("hop").hint_char1({
	-- 	-- 			current_line_only = true,
	-- 	-- 			direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
	-- 	-- 			hint_offset = 0,
	-- 	-- 		})
	-- 	-- 	end,
	-- 	-- 	desc = "Native [F]",
	-- 	-- },
	-- 	h = {
	-- 		cmd = function()
	-- 			hop_hint_anywhere_regex("[^ ]")
	-- 			require("hop").hint_anywhere({
	-- 				direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
	-- 				current_line_only = true,
	-- 			})
	-- 		end,
	-- 		desc = "Left",
	-- 	},
	-- 	i = {
	-- 		cmd = function()
	-- 			require("hop").hint_lines_skip_whitespace({})
	-- 		end,
	-- 		desc = "Native [^]",
	-- 	},
	-- 	I = {
	-- 		cmd = function()
	-- 			require("hop").hint_lines({})
	-- 		end,
	-- 		desc = "Native [0]",
	-- 	},
	-- 	j = {
	-- 		cmd = function()
	-- 			require("hop").hint_vertical({ direction = require("hop.hint").HintDirection.AFTER_CURSOR })
	-- 		end,
	-- 		desc = "Down",
	-- 	},
	-- 	k = {
	-- 		cmd = function()
	-- 			require("hop").hint_vertical({ direction = require("hop.hint").HintDirection.BEFORE_CURSOR })
	-- 		end,
	-- 		desc = "Up",
	-- 	},
	-- 	l = {
	-- 		cmd = function()
	-- 			hop_hint_anywhere_regex("[^ ]")
	-- 			require("hop").hint_anywhere({
	-- 				direction = require("hop.hint").HintDirection.AFTER_CURSOR,
	-- 				current_line_only = true,
	-- 			})
	-- 		end,
	-- 		desc = "Right",
	-- 	},
	-- 	p = {
	-- 		cmd = function()
	-- 			require("hop")
	-- 			vim.cmd("HopPasteChar1CurrentLine")
	-- 		end,
	-- 		desc = "Native [p]",
	-- 	},
	-- 	t = {
	-- 		cmd = function()
	-- 			require("hop").hint_char1({
	-- 				current_line_only = true,
	-- 				direction = require("hop.hint").HintDirection.AFTER_CURSOR,
	-- 				hint_offset = -1,
	-- 			})
	-- 		end,
	-- 		desc = "Native [t]",
	-- 	},
	-- 	T = {
	-- 		cmd = function()
	-- 			require("hop").hint_char1({
	-- 				current_line_only = true,
	-- 				direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
	-- 				hint_offset = 1,
	-- 			})
	-- 		end,
	-- 		desc = "Native [T]",
	-- 	},
	-- 	u = {
	-- 		cmd = function()
	-- 			require("hop").hint_patterns({ current_line_only = true })
	-- 		end,
	-- 		desc = "Native [u]",
	-- 	},
	-- 	w = {
	-- 		cmd = function()
	-- 			require("hop").hint_words({
	-- 				current_line_only = true,
	-- 				direction = require("hop.hint").HintDirection.AFTER_CURSOR,
	-- 				hint_position = require("hop.hint").HintPosition.BEGIN,
	-- 			})
	-- 		end,
	-- 		desc = "Native [w]",
	-- 	},
	-- 	y = {
	-- 		cmd = function()
	-- 			require("hop")
	-- 			hop_hint_yank_inline()
	-- 			vim.cmd("HopYankChar1CurrentLine")
	-- 		end,
	-- 		desc = "Native [y]",
	-- 	},
	-- 	Y = {
	-- 		cmd = function()
	-- 			require("hop")
	-- 			hop_hint_yank()
	-- 			vim.cmd("HopYankChar1CurrentLine")
	-- 		end,
	-- 		desc = "Native [Y]",
	-- 	},
	-- 	z = {
	-- 		cmd = function()
	-- 			require("hop").hint_char2({ current_line_only = true })
	-- 		end,
	-- 		desc = "Native [z]",
	-- 	},
	-- 	["ge"] = {
	-- 		cmd = function()
	-- 			require("hop").hint_words({
	-- 				current_line_only = true,
	-- 				direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
	-- 				hint_position = require("hop.hint").HintPosition.END,
	-- 			})
	-- 		end,
	-- 		desc = "Native [ge]",
	-- 	},
	-- },
	s = {
		b = {
			cmd = function()
				require("hop").hint_words({
					current_line_only = false,
					multi_windows = true,
					direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
					hint_position = require("hop.hint").HintPosition.BEGIN,
				})
			end,
			desc = "Native [b]",
		},
		c = {
			cmd = function()
				require("hop").hint_camel_case({ current_line_only = false, multi_windows = true })
			end,
			desc = "[C]amelcase",
		},
		e = {
			cmd = function()
				require("hop").hint_words({
					current_line_only = false,
					multi_windows = true,
					direction = require("hop.hint").HintDirection.AFTER_CURSOR,
					hint_position = require("hop.hint").HintPosition.END,
				})
			end,
			desc = "Native [e]",
		},
		f = {
			cmd = function()
				require("hop").hint_char1({
					current_line_only = false,
					multi_windows = true,
					direction = require("hop.hint").HintDirection.AFTER_CURSOR,
					hint_offset = 0,
				})
			end,
			desc = "Native [f]",
		},
		F = {
			cmd = function()
				require("hop").hint_char1({
					current_line_only = false,
					multi_windows = true,
					direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
					hint_offset = 0,
				})
			end,
			desc = "Native [F]",
		},
		h = {
			cmd = function()
				hop_hint_anywhere_regex("[^ ]")
				require("hop").hint_anywhere({
					direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
					current_line_only = false,
					multi_windows = true,
				})
			end,
			desc = "Left",
		},
		i = {
			cmd = function()
				require("hop").hint_lines_skip_whitespace({ multi_windows = true })
			end,
			desc = "Native [^]",
		},
		I = {
			cmd = function()
				require("hop").hint_lines({ multi_windows = true })
			end,
			desc = "Native [0]",
		},
		j = {
			cmd = function()
				require("hop").hint_vertical({
					direction = require("hop.hint").HintDirection.AFTER_CURSOR,
					multi_windows = true,
				})
			end,
			desc = "Down",
		},
		k = {
			cmd = function()
				require("hop").hint_vertical({
					direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
					multi_windows = true,
				})
			end,
			desc = "Up",
		},
		l = {
			cmd = function()
				hop_hint_anywhere_regex("[^ ]")
				require("hop").hint_anywhere({
					direction = require("hop.hint").HintDirection.AFTER_CURSOR,
					current_line_only = false,
					multi_windows = true,
				})
			end,
			desc = "Right",
		},
		p = {
			cmd = function()
				require("hop")
				vim.cmd("HopPasteChar1")
			end,
			desc = "Native [p]",
		},
		t = {
			cmd = function()
				require("hop").hint_char1({
					current_line_only = false,
					multi_windows = true,
					direction = require("hop.hint").HintDirection.AFTER_CURSOR,
					hint_offset = -1,
				})
			end,
			desc = "Native [t]",
		},
		T = {
			cmd = function()
				require("hop").hint_char1({
					current_line_only = false,
					multi_windows = true,
					direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
					hint_offset = 1,
				})
			end,
			desc = "Native [T]",
		},
		u = {
			cmd = function()
				require("hop").hint_patterns({ current_line_only = false, multi_windows = true })
			end,
			desc = "Native [u]",
		},
		w = {
			cmd = function()
				require("hop").hint_words({
					current_line_only = false,
					multi_windows = true,
					direction = require("hop.hint").HintDirection.AFTER_CURSOR,
					hint_position = require("hop.hint").HintPosition.BEGIN,
				})
			end,
			desc = "Native [w]",
		},
		y = {
			cmd = function()
				require("hop")
				hop_hint_yank_inline()
				vim.cmd("HopYankChar1")
			end,
			desc = "Native [y]",
		},
		Y = {
			cmd = function()
				require("hop")
				hop_hint_yank()
				vim.cmd("HopYankChar1")
			end,
			desc = "Native [Y]",
		},
		z = {
			cmd = function()
				require("hop").hint_char2({ current_line_only = false, multi_windows = true })
			end,
			desc = "Native [z]",
		},
		["ge"] = {
			cmd = function()
				require("hop").hint_words({
					current_line_only = false,
					multi_windows = true,
					direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
					hint_position = require("hop.hint").HintPosition.END,
				})
			end,
			desc = "Native [ge]",
		},
	},
}

return M
