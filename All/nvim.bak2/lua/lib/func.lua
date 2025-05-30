local M = {}

M.requires = function(module)
	local status_ok, plugin = pcall(require, module)
	if not status_ok then
		vim.notify("Warning!! " .. '"' .. module .. '"' .. " not found!!")
	else
		return plugin
	end
end

M.map = function(dependency, mode, lhs, rhs, opts, loopKey, isLoop)
	local which_key = require("which-key")
	local add = {}
	isLoop = isLoop ~= nil and true or isLoop

	-- set lhs
	add[1] = lhs

	-- set rhs
	if loopKey ~= nil then
		local swk_show = [[<cmd>lua require('which-key').show({ keys = ']]
			.. loopKey
			.. [[', loop = ]]
			.. tostring(isLoop)
			.. [[ })<cr>]]
		local fwk_show = function()
			which_key.show({ keys = loopKey, loop = isLoop })
		end

		if type(rhs) == "string" then
			add[2] = rhs .. swk_show
		elseif type(rhs) == "function" then
			add[2] = function()
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
	elseif dependency == 1 then
		return add
	elseif dependency == 4 then
		-- 4 is these are special
		vim.keymap.set(mode, add[1], function()
			vim.cmd(rhs)
			which_key.show({ keys = loopKey, loop = isLoop })
		end, opts)
	elseif dependency == 5 then
		-- 5 is these are special
		-- NOTE: not fixed, fix it leter
		vim.keymap.set(mode, add[1], function()
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>l<C-w>c<C-w>p", true, true, true), "n", false)
			which_key.show({ keys = loopKey, loop = isLoop })
		end, opts)
	end
end

--[[ custom function for keymaps of q, fix q key without breaking q macro
recording ]]
M.handle_q_colon_key = function()
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
end

return M
