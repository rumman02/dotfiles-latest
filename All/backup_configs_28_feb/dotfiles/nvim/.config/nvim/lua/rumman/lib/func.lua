local icons = require("rumman.lib.icons")
local utils = require("rumman.lib.utils")
local before_scrolloff = vim.o.scrolloff
local before_sidescrolloff = vim.o.sidescrolloff
local SCROLL_BAR = { "█", "▇", "▆", "▅", "▄", "▃", "▂", "▁", " " }
local snacks_toggle_terminal_count = 0
local visual_multi_add_cursor_at_pos_count = 0
local visual_multi_add_cursor_down = 0

return {
	--[[ this funciton will help you to, not break every plugins, if a single
	plugin will break. only that plugin will break and other plugins will run
	smoothly without any problem ]]
	requires = function(module)
		local status_ok, plugin = pcall(require, module)
		if not status_ok then
			vim.notify("WARNING!!! " .. '"' .. module .. '"' .. " plugin's not found!!!")
		else
			return plugin
		end
	end,

	--[[ removes repetation of opts from vim.keymap.set ]]
	set_keymaps = function(mode, lhs, rhs, options)
		-- can set here extra any other opts
		local default_opts = { noremap = true, nowait = true }
		options = vim.tbl_extend("force", default_opts, options or {})
		vim.keymap.set(mode, lhs, rhs, options)
	end,


	-- this is for repetable keymaps
	loop_keymaps = function (loop_back_to, isloop, lhs, rhs, opts)

		local swk_show = [[<cmd>lua require('which-key').show({ keys = ']] .. loop_back_to .. [[', loop = ]] .. tostring(isloop) .. [[ })<cr>]]
		local fwk_show = function()
			require("which-key").show({ keys = loop_back_to, loop = isloop })
		end

		local rhsf = function ()
			if type(rhs) == "string" then
				return rhs .. swk_show
			elseif type(rhs) == "function" then
				return function ()
					rhs()
					fwk_show()
				end
			end
		end

		return {
			lhs,
			rhsf(),
			desc = opts.desc,
			expr = opts.expr,
			icon = opts.icon,
			mode = opts.mode,
			hidden = opts.hidden,
			cond = opts.cond,
			proxy = opts.proxy,
			expand = opts.expand,
			buffer = opts.buffer,
		}
	end,


	--[[ custom function for keymaps of q, fix q key without breaking q macro
	recording ]]
	handle_q_colon_key = function()
		--[[ when alreaddy recording, this vim.fn.reg_recording() this function returns
		recording register (ex: a/b/c..) & when not recording, it returns empty
		string (ex: '') ]]
		if vim.fn.reg_recording() == "" then
			--[[ when call that vim.fn.getcharstr() function, after calling this waiting
			for key press and returns the key ]]
			local key = vim.fn.getcharstr()

			-- if after pressing q, the key is ":" then leave function
			if key ~= ":" then
				--[[ if after pressing q, the key is "keys" then this vim.api.nvim_feedkeys()
				function will send the given "keys" to nvim, that is q + "keys" with normal
				mode which is starting recording macros (ex: qa) ]]
				vim.api.nvim_feedkeys("q" .. key, "n", true)
			end
		else
			--[[ when already into recording, after pressing q is the given intput key
			also q, so that nvim can recognize as quit macro ]]
			vim.api.nvim_feedkeys("q", "n", true)
		end
	end,


	-- open terminal by toggleterm or tmux pane
	toggleterm_tmux = function (key, count)
		---@diagnostic disable-next-line: unused-local
		local result = vim.fn.system("tmux info")
		local split_size, toggleterm_direction, tmux_option, tmux_reverse_direction, tmux_reverse_split_size, char

		-- get expected width & height size
		local split_ratio = 3 -- less is bigger window, higher is smaller window
		local w_split_size = math.floor(vim.api.nvim_win_get_width(0) / split_ratio)
		local h_split_size = math.floor(vim.api.nvim_win_get_height(0) / split_ratio)

		-- ask for input of count
		if count == 1 then
			char = vim.fn.input("Count: ") or 1
		end

		if key == "h" or key == "l" then
			split_size = w_split_size
			toggleterm_direction = "vertical"

			tmux_reverse_direction = "-v -l "
			tmux_reverse_split_size = math.floor(vim.api.nvim_win_get_height(0))

			if key == "h" then
				tmux_option = "-d -h -b -l "
			else
				tmux_option = "-d -h -l "
			end

		elseif key == "j" or key == "k" then
			split_size = h_split_size
			toggleterm_direction = "horizontal"

			tmux_reverse_direction = "-h -l "
			tmux_reverse_split_size = math.floor(vim.api.nvim_win_get_width(0))

			if key == "k" then
				tmux_option = "-d -v -b -l "
			else
				tmux_option = "-d -v -l "
			end
		end

		if vim.v.shell_error == 0 then
			vim.cmd("silent! !tmux split-window " .. tmux_option .. split_size)
			if count == 1 then
				local split_size_per_pane = math.floor(tmux_reverse_split_size / char)
				local nsplit_size = tmux_reverse_split_size - split_size_per_pane
				---@diagnostic disable-next-line: unused-local
				for i = 1, char-1, 1 do
					vim.cmd("silent! !tmux split-window " .. tmux_reverse_direction .. nsplit_size)
					nsplit_size = nsplit_size - split_size_per_pane
				end
			end
		else
			vim.cmd("ToggleTerm size=".. split_size .. " direction=" .. toggleterm_direction)
			vim.cmd("wincmd " .. string.upper(key))
			vim.cmd(toggleterm_direction .. " resize " .. split_size)
			if count == 1 then
				local split_size_per_pane = math.floor(tmux_reverse_split_size / char)
				local nsplit_size = tmux_reverse_split_size - split_size_per_pane
				for i = 1, char-1, 1 do
					vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(tostring(i+1) .. "<cmd>exe v:count1 . 'ToggleTerm direction=" .. toggleterm_direction .. "'<cr><c-w>=", true, false, true), "n", false)
					nsplit_size = nsplit_size - split_size_per_pane
				end
			end
		end

		if vim.fn.exists(":NoiceDismiss") == 2 then
			vim.cmd("NoiceDismiss")
		end
	end,

	toggle_toggleterm_tmux = function ()
		local result = vim.fn.system("tmux info")
		if vim.v.shell_error == 0 then
			vim.cmd("silent! !tmux resize-pane -Z")
		else
			vim.cmd("ToggleTerm")
		end
	end,


	toggleterm_tmux_close = function (key)
		local result = vim.fn.system("tmux info")
		local tmux_direction
		if key == "h" then
			tmux_direction = "-L"
		elseif key == "j" then
			tmux_direction = "-D"
		elseif key == "k" then
			tmux_direction = "-U"
		elseif key == "l" then
			tmux_direction = "-R"
		end

		if vim.v.shell_error == 0 then
			vim.cmd("silent! !tmux select-pane " .. tmux_direction )
			vim.cmd("silent! !tmux kill-pane")
		end

		if vim.fn.exists(":NoiceDismiss") == 2 then
			vim.cmd("NoiceDismiss")
		end
	end,

	hop_hint_anywhere_regex = function(input_regex)
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
	end,

	hop_hint_yank = function()
		local yank = require('hop-yank.yank')

		yank.yank_to = function(text, register)
			local joined_text = table.concat(text, '\n') -- Convert text to a single string
			vim.fn.setreg(register, joined_text, 'V')    -- Set the register as character-wise
		end

	end,

	hop_hint_yank_inline = function()
		local yank = require('hop-yank.yank')

		yank.yank_to = function(text, register)
			local joined_text = table.concat(text, '\n') -- Convert text to a single string
			vim.fn.setreg(register, joined_text, 'v')    -- Set the register as character-wise
		end

	end,

	diagnostic_goto = function(next, severity)
		local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
		severity = severity and vim.diagnostic.severity[string.upper(severity)] or nil
		return function()
			go({ severity = severity })
		end
	end,

	neotree_reveal_cwd = function (is_enabled, is_leave_dir_opened)
		local config = require("neo-tree").config or {}

		-- Ensure filesystem table exists
		config.filesystem = config.filesystem or {}

		config.filesystem.follow_current_file = {
			enabled = is_enabled,
			leave_dirs_open = is_leave_dir_opened,
		}

		-- Reapply the updated configuration
		require("neo-tree").setup(config)

		-- Notify the user
		if is_enabled and is_leave_dir_opened then
			vim.notify("Neotree: Reveal current file enabled,\n(Leave directory opened)")
		elseif is_enabled and not is_leave_dir_opened then
			vim.notify("Neotree: Reveal current file enabled,\n(Leave directory closed)")
		else
			vim.notify("Neotree: Reveal current file disabled")
		end

		vim.cmd("Neotree close")
		vim.cmd("Neotree")
	end,

	map = function(dependency, mode, lhs, rhs, opts, loopKey, isLoop)
		local which_key = require("which-key")
		local add = {}

		-- set lhs
		add[1] = lhs

		-- set rhs
		if loopKey ~= nil then
			isLoop = isLoop ~= nil and true or isLoop
			local swk_show = [[<cmd>lua require('which-key').show({ keys = ']] .. loopKey .. [[', loop = ]] .. tostring(isLoop) .. [[ })<cr>]]
			local fwk_show = function()
				which_key.show({ keys = loopKey, loop = isLoop })
			end

			if type(rhs) == "string" then
				add[2] = rhs .. swk_show
			elseif type(rhs) == "function" then
				add[2] = function ()
					rhs()
					fwk_show()
				end
			end
		else
			add[2] = rhs
		end

		-- set mode
		add.mode = mode

		-- set opts
		if opts then
			for key, value in pairs(opts) do
				add[key] = value
			end
		end

		-- add to differenet sources to set keymaps
		if dependency == 0 then
			vim.keymap.set(mode, add[1], add[2], opts)
			return
		elseif dependency == 2 then
			which_key.add(add)
			return
		end
		return add

	end,

	scrolloff = function ()
		if vim.o.scrolloff == 999 then
			vim.o.scrolloff = before_scrolloff
		else
			vim.o.scrolloff = 999
		end
	end,

	sidescrolloff = function ()
		if vim.o.sidescrolloff == 999 then
			vim.o.sidescrolloff = before_sidescrolloff
		else
			vim.o.sidescrolloff = 999
		end
	end,

	undotree_window = function (undotree, diffpanel)
		vim.g.undotree_CustomUndotreeCmd = undotree
		vim.g.undotree_CustomDiffpanelCmd = diffpanel
		vim.cmd("UndotreeToggle")
		vim.cmd("UndotreeShow")
	end,

	-- shows column position:total column / line position:total line
	totalline = function()
		return "[" .. vim.fn.col(".")  .. ":" .. vim.fn.col("$") .. " / " ..vim.fn.line(".") .. ":" .. vim.fn.line("$") .. "]"
	end,

	totalline1 = function()
		return vim.fn.col(".")  .. ":" .. vim.fn.line(".")
	end,

	-- shows current filesize in kb
	filesize = function()
		local filepath = vim.fn.expand("%")
		local sizeInBytes = vim.fn.getfsize(filepath)
		if sizeInBytes <= 0 then
			return ""
		end
		local sizeInKb = sizeInBytes / 1024
		return string.format("%.2f", sizeInKb) .. " KB"
	end,

	myFilename = function()
		local filepath = vim.fn.expand("%:p") -- Get the full path
		local filename = vim.fn.fnamemodify(filepath, ":t") -- Extract the filename
		local fileext = vim.fn.fnamemodify(filepath, ":e") -- Get the file extension
		local fileicon = require("nvim-web-devicons").get_icon(filename, fileext) or "" -- Use file extension
		local icon = vim.bo.modified and " " .. icons.ui.Edited .. " " or ""

		-- Fallback for unnamed buffers
		if filename == "" then
			filename = "[No Name]"
		end

		return fileicon .. " " .. filename .. icon
	end,

	snacks_toggle_terminal_toggle = function(direction_key, myCount)
		local split_ratio = 3;
		local w_split_size = math.floor(vim.api.nvim_win_get_width(0) / split_ratio)
		local h_split_size = math.floor(vim.api.nvim_win_get_height(0) / split_ratio)

		if myCount <= 10 then
			if snacks_toggle_terminal_count > 9 then
				snacks_toggle_terminal_count = 0
			end
			snacks_toggle_terminal_count = snacks_toggle_terminal_count + 1
		end

			if direction_key == "h" then
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(tostring(myCount > 10 and myCount or snacks_toggle_terminal_count) .. "<cmd>exe v:count1 . 'lua Snacks.terminal.toggle(nil, { win = { position = \"left\", width = " .. w_split_size .. " } })'<cr><esc>", true, false, true), "n", false)
			elseif direction_key == "j" then
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(tostring(myCount > 10 and myCount or snacks_toggle_terminal_count) .. "<cmd>exe v:count1 . 'lua Snacks.terminal.toggle(nil, { win = { position = \"bottom\", height = " .. h_split_size .. " } })'<cr><esc>", true, false, true), "n", false)
			elseif direction_key == "k" then
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(tostring(myCount > 10 and myCount or snacks_toggle_terminal_count) .. "<cmd>exe v:count1 . 'lua Snacks.terminal.toggle(nil, { win = { position = \"top\", height = " .. h_split_size .. " } })'<cr><esc>", true, false, true), "n", false)
			elseif direction_key == "l" then
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(tostring(myCount > 10 and myCount or snacks_toggle_terminal_count) .. "<cmd>exe v:count1 . 'lua Snacks.terminal.toggle(nil, { win = { position = \"right\", width = " .. w_split_size .. " } })'<cr><esc>", true, false, true), "n", false)
			elseif direction_key == "f" then
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(tostring(myCount > 10 and myCount or snacks_toggle_terminal_count) .. "<cmd>exe v:count1 . 'lua Snacks.terminal.toggle(nil, { win = { position = \"float\", width = " .. utils.ui.width .. ", height = " .. utils.ui.height .. ", enter = true  } })'<cr><esc>", true, false, true), "n", false)
			elseif direction_key == "t" then
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(tostring(myCount) .. "<cmd>exe v:count1 . 'lua Snacks.terminal.toggle()'<cr><esc>", true, false, true), "n", false)
			end
	end,

	scrollbar = function()
		local curr_line = vim.api.nvim_win_get_cursor(0)[1]
		local lines = vim.api.nvim_buf_line_count(0)
		local i = math.floor((curr_line - 1) / lines * #SCROLL_BAR) + 1

		-- Calculate the highest column and line lengths
		local highest_col = 0
		for _, line in ipairs(vim.api.nvim_buf_get_lines(0, 0, -1, false)) do
			highest_col = math.max(highest_col, #line)
		end

		local highest_col_length = #tostring(highest_col)
		local highest_line_length = #tostring(lines)

		-- Helper function to pad numbers with spaces
		local function pad_num(num, max_length)
			local num_length = #tostring(num)
			return string.rep(" ", max_length - num_length) .. num
		end

		local current_col = vim.fn.col(".")
		local total_col = vim.fn.col("$")
		local current_line = vim.fn.line(".")
		local total_line = vim.fn.line("$")

		return " "
		.. pad_num(current_col, highest_col_length)
		.. ":"
		.. pad_num(total_col, highest_col_length)
		.. "|"
		.. pad_num(current_line, highest_line_length)
		.. ":"
		.. pad_num(total_line, highest_line_length)
		.. " "
		.. icons.ui.HorizontalRight
		.. SCROLL_BAR[i]
	end,

	get_lsp_clients = function()
		local replacements = {
			{ pattern = "_language_server$", replacement = "" },
			{ pattern = "tsserver$", replacement = "typescript" },
			{ pattern = "-tools$", replacement = "" },
			{ pattern = "_ls$", replacement = "" },
			{ pattern = "ls$", replacement = "" },
			{ pattern = "_+$", replacement = "" },
			{ pattern = "-+$", replacement = "" },
		}

		local sign = "⚙" .. " LSP"
		local result = ""
		local client_names = {}
		local clients = vim.lsp.get_active_clients()
		local buffer_filetype = vim.api.nvim_buf_get_option(0, "filetype")

		if next(clients) == nil then
			return result
		end

		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buffer_filetype) ~= -1 then
				local name = client.name
				for _, entry in ipairs(replacements) do
					name = name:gsub(entry.pattern, entry.replacement)
				end
				-- Exclude "null" and "null_ls"
				if name ~= "null" and name ~= "null_ls" then
					-- Capitalize the first letter of the client name
					name = name:gsub("^%l", string.upper)
					table.insert(client_names, name)
				end
			end
		end

		if #client_names > 0 then
			table.sort(client_names, function(a, b) return #a < #b end)
			result = icons.ui.Flash .. table.concat(client_names, " | ")
		end

		return result
	end,

	visual_multi_add_cursor_at_pos = function()

		if visual_multi_add_cursor_at_pos_count == 0 then
			vim.cmd('silent! execute "normal! \\<Plug>(VM-Add-Cursor-At-Pos)"')
			-- vim.cmd('sleep 200m')
			vim.cmd('silent! execute "normal! \\<Plug>(VM-Toggle-Mappings)"')
		else
			vim.cmd('silent! execute "normal! \\<Plug>(VM-Toggle-Mappings)"')
			-- vim.cmd('sleep 200m')
			vim.cmd('silent! execute "normal! \\<Plug>(VM-Add-Cursor-At-Pos)"')
			-- vim.cmd('sleep 200m')
			vim.cmd('silent! execute "normal! \\<Plug>(VM-Toggle-Mappings)"')
			visual_multi_add_cursor_at_pos_count = 0
		end
		visual_multi_add_cursor_at_pos_count = visual_multi_add_cursor_at_pos_count + 1
	end,

	visual_multi_add_cursor_down = function()

		if visual_multi_add_cursor_down == 0 then
			vim.cmd('silent! execute "normal! \\<Plug>(VM-Add-Cursor-Down)"')
			-- vim.cmd('sleep 200m')
			vim.cmd('silent! execute "normal! \\<Plug>(VM-Toggle-Mappings)"')
		else
			vim.cmd('silent! execute "normal! \\<Plug>(VM-Toggle-Mappings)"')
			-- vim.cmd('sleep 200m')
			vim.cmd('silent! execute "normal! \\<Plug>(VM-Add-Cursor-Down)"')
			-- vim.cmd('sleep 200m')
			vim.cmd('silent! execute "normal! \\<Plug>(VM-Toggle-Mappings)"')
			visual_multi_add_cursor_down = 0
		end
		visual_multi_add_cursor_down = visual_multi_add_cursor_down + 1
	end
}

