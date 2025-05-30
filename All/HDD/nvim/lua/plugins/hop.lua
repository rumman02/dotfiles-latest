local M = {}

M.opts = {
	keys = "etovxqpdygfblzhckisuranjmw",
	x_bias = 100,
	dim_unmatched = false,
	hint_type = "overlay",
	jump_on_sole_occurrence = false,
}

M.config = function()
end

M.keys = function()
	local func = require("lib.func")
	local map = func.map
	local navigation_leader1 = require("lib.keys").navigation_leader1
	local navigation_leader2 = require("lib.keys").navigation_leader2

	local hop_hint_anywhere_regex = function(input_regex)
		local jump_regex = require('hop.jump_regex')
		local function regex_by_searching(pat, plain_search)
			if plain_search then
				pat = vim.fn.escape(pat, '\\/.$^~[]')
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
		local yank = require('hop-yank.yank')

		yank.yank_to = function(text, register)
			local joined_text = table.concat(text, '\n') -- Convert text to a single string
			vim.fn.setreg(register, joined_text, 'V')    -- Set the register as character-wise
		end

	end

	local hop_hint_yank_inline = function()
		local yank = require('hop-yank.yank')

		yank.yank_to = function(text, register)
			local joined_text = table.concat(text, '\n') -- Convert text to a single string
			vim.fn.setreg(register, joined_text, 'v')    -- Set the register as character-wise
		end

	end

	return {
		map(1, { "" }, navigation_leader1 .. "h", function() hop_hint_anywhere_regex("[^ ]") require("hop").hint_anywhere({ direction = require("hop.hint").HintDirection.BEFORE_CURSOR, current_line_only = true }) end, { desc = "Horizontal left" }),
		map(1, { "" }, navigation_leader1 .. "j", function() require("hop").hint_vertical({ direction = require("hop.hint").HintDirection.AFTER_CURSOR }) end, { desc = "Vertical down" }),
		map(1, { "" }, navigation_leader1 .. "k", function() require("hop").hint_vertical({ direction = require("hop.hint").HintDirection.BEFORE_CURSOR }) end, { desc = "Vertical up" }),
		map(1, { "" }, navigation_leader1 .. "l", function() hop_hint_anywhere_regex("[^ ]") require("hop").hint_anywhere({ direction = require("hop.hint").HintDirection.AFTER_CURSOR, current_line_only = true }) end, { desc = "Horizontal left" }),

		map(1, { "" }, navigation_leader1 .. "f", function() require("hop").hint_char1({ current_line_only = true, direction = require("hop.hint").HintDirection.AFTER_CURSOR, hint_offset = 0 }) end, { desc = "Native f" }),
		map(1, { "" }, navigation_leader1 .. "F", function() require("hop").hint_char1({ current_line_only = true, direction = require("hop.hint").HintDirection.BEFORE_CURSOR, hint_offset = 0 }) end, { desc = "Native F" }),
		map(1, { "" }, navigation_leader1 .. "t", function() require("hop").hint_char1({ current_line_only = true, direction = require("hop.hint").HintDirection.AFTER_CURSOR, hint_offset = -1 }) end, { desc = "Native t" }),
		map(1, { "" }, navigation_leader1 .. "T", function() require("hop").hint_char1({ current_line_only = true, direction = require("hop.hint").HintDirection.BEFORE_CURSOR, hint_offset = 1 }) end, { desc = "Native T" }),

		map(1, { "" }, navigation_leader1 .. "c", function() require("hop").hint_camel_case({ current_line_only = true }) end, { desc = "Camel case" }),

		map(1, { "" }, navigation_leader1 .. "w", function() require("hop").hint_words({ current_line_only = true, direction = require("hop.hint").HintDirection.AFTER_CURSOR, hint_position = require'hop.hint'.HintPosition.BEGIN }) end, { desc = "Native w" }),
		map(1, { "" }, navigation_leader1 .. "b", function() require("hop").hint_words({ current_line_only = true, direction = require("hop.hint").HintDirection.BEFORE_CURSOR, hint_position = require'hop.hint'.HintPosition.BEGIN }) end, { desc = "Native b" }),
		map(1, { "" }, navigation_leader1 .. "e", function() require("hop").hint_words({ current_line_only = true,  direction = require("hop.hint").HintDirection.AFTER_CURSOR, hint_position = require'hop.hint'.HintPosition.END }) end, { desc = "Native e" }),
		map(1, { "" }, navigation_leader1 .. "ge", function() require("hop").hint_words({ current_line_only = true, direction = require("hop.hint").HintDirection.BEFORE_CURSOR, hint_position = require'hop.hint'.HintPosition.END }) end, { desc = "Native ge" }),

		map(1, { "" }, navigation_leader1 .. "I", function() require("hop").hint_lines({}) end, { desc = "Lines (Native 0)" }),
		map(1, { "" }, navigation_leader1 .. "i", function() require("hop").hint_lines_skip_whitespace({ }) end, { desc = "Lines (Native ^)" }),
		map(1, { "" }, navigation_leader1 .. "z", function() require("hop").hint_char2({ current_line_only = true }) end, { desc = "Char 2" }),
		map(1, { "" }, navigation_leader1 .. "u", function() require("hop").hint_patterns({ current_line_only = true }) end, { desc = "Pattern" }),

		map(1, { "" }, navigation_leader1 .. "y", function() require("hop") hop_hint_yank_inline() vim.cmd("HopYankChar1CurrentLine") end, { desc = "Native y (Inline)" }),
		map(1, { "" }, navigation_leader1 .. "Y", function() require("hop") hop_hint_yank() vim.cmd("HopYankChar1CurrentLine") end, { desc = "Native y" }),
		map(1, { "" }, navigation_leader1 .. "p", function() require("hop") vim.cmd("HopPasteChar1CurrentLine") end, { desc = "Native p" }),

		-- multi window only
		map(1, { "" }, navigation_leader2 .. "h", function() hop_hint_anywhere_regex("[^ ]") require("hop").hint_anywhere({ direction = require("hop.hint").HintDirection.BEFORE_CURSOR, current_line_only = false, multi_windows = true }) end, { desc = "Horizontal left" }),
		map(1, { "" }, navigation_leader2 .. "j", function() require("hop").hint_vertical({ direction = require("hop.hint").HintDirection.AFTER_CURSOR, multi_windows = true }) end, { desc = "Vertical down" }),
		map(1, { "" }, navigation_leader2 .. "k", function() require("hop").hint_vertical({ direction = require("hop.hint").HintDirection.BEFORE_CURSOR, multi_windows = true }) end, { desc = "Vertical up" }),
		map(1, { "" }, navigation_leader2 .. "l", function() hop_hint_anywhere_regex("[^ ]") require("hop").hint_anywhere({ direction = require("hop.hint").HintDirection.AFTER_CURSOR, current_line_only = false, multi_windows = true }) end, { desc = "Horizontal left" }),

		map(1, { "" }, navigation_leader2 .. "f", function() require("hop").hint_char1({ current_line_only = false, multi_windows = true, direction = require("hop.hint").HintDirection.AFTER_CURSOR, hint_offset = 0 }) end, { desc = "Native f" }),
		map(1, { "" }, navigation_leader2 .. "F", function() require("hop").hint_char1({ current_line_only = false, multi_windows = true, direction = require("hop.hint").HintDirection.BEFORE_CURSOR, hint_offset = 0 }) end, { desc = "Native F" }),
		map(1, { "" }, navigation_leader2 .. "t", function() require("hop").hint_char1({ current_line_only = false, multi_windows = true, direction = require("hop.hint").HintDirection.AFTER_CURSOR, hint_offset = -1 }) end, { desc = "Native t" }),
		map(1, { "" }, navigation_leader2 .. "T", function() require("hop").hint_char1({ current_line_only = false, multi_windows = true, direction = require("hop.hint").HintDirection.BEFORE_CURSOR, hint_offset = 1 }) end, { desc = "Native T" }),

		map(1, { "" }, navigation_leader2 .. "c", function() require("hop").hint_camel_case({ current_line_only = false, multi_windows = true }) end, { desc = "Camel case" }),

		map(1, { "" }, navigation_leader2 .. "w", function() require("hop").hint_words({ current_line_only = false, multi_windows = true, direction = require("hop.hint").HintDirection.AFTER_CURSOR, hint_position = require'hop.hint'.HintPosition.BEGIN }) end, { desc = "Native w" }),
		map(1, { "" }, navigation_leader2 .. "b", function() require("hop").hint_words({ current_line_only = false, multi_windows = true, direction = require("hop.hint").HintDirection.BEFORE_CURSOR, hint_position = require'hop.hint'.HintPosition.BEGIN }) end, { desc = "Native b" }),
		map(1, { "" }, navigation_leader2 .. "e", function() require("hop").hint_words({ current_line_only = false, multi_windows = true,  direction = require("hop.hint").HintDirection.AFTER_CURSOR, hint_position = require'hop.hint'.HintPosition.END }) end, { desc = "Native e" }),
		map(1, { "" }, navigation_leader2 .. "ge", function() require("hop").hint_words({ current_line_only = false, multi_windows = true, direction = require("hop.hint").HintDirection.BEFORE_CURSOR, hint_position = require'hop.hint'.HintPosition.END }) end, { desc = "Native ge" }),

		map(1, { "" }, navigation_leader2 .. "i", function() require("hop").hint_lines({ multi_windows = true }) end, { desc = "Lines (Native 0)" }),
		map(1, { "" }, navigation_leader2 .. "I", function() require("hop").hint_lines_skip_whitespace({ multi_windows = true }) end, { desc = "Lines (Native ^)" }),

		map(1, { "" }, navigation_leader2 .. "z", function() require("hop").hint_char2({ current_line_only = false, multi_windows = true }) end, { desc = "Char 2" }),
		map(1, { "" }, navigation_leader2 .. "u", function() require("hop").hint_patterns({ current_line_only = false, multi_windows = true }) end, { desc = "Pattern" }),

		map(1, { "" }, navigation_leader2 .. "y", function() require("hop") hop_hint_yank_inline() vim.cmd("HopYankChar1") end, { desc = "Native y (Inline)" }),
		map(1, { "" }, navigation_leader2 .. "Y", function() require("hop") hop_hint_yank() vim.cmd("HopYankChar1") end, { desc = "Native y" }),
		map(1, { "" }, navigation_leader2 .. "p", function() require("hop") vim.cmd("HopPasteChar1") end, { desc = "Native p" }),
	}
end

return M
