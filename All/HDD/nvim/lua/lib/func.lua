local M = {}

-- M.map = function(dependency, mode, lhs, rhs, opts, loopKey, isLoop)
-- 	local which_key = require("which-key")
-- 	local add = {}
--
-- 	-- set lhs
-- 	add[1] = lhs
--
-- 	-- set rhs
-- 	if loopKey ~= nil then
-- 		isLoop = isLoop ~= nil and true or isLoop
-- 		local swk_show = [[<cmd>lua require('which-key').show({ keys = ']] .. loopKey .. [[', loop = ]] .. tostring(isLoop) .. [[ })<cr>]]
-- 		local fwk_show = function()
-- 			which_key.show({ keys = loopKey, loop = isLoop })
-- 		end
--
-- 		if type(rhs) == "string" then
-- 			add[2] = rhs .. swk_show
-- 		elseif type(rhs) == "function" then
-- 			add[2] = function()
-- 				rhs()
-- 				fwk_show()
-- 			end
-- 		end
-- 	else
-- 		add[2] = rhs
-- 	end
--
-- 	-- set mode
-- 	add.mode = mode
--
-- 	-- set opts
-- 	if opts then
-- 		for key, value in pairs(opts) do
-- 			add[key] = value
-- 		end
-- 	end
--
-- 	-- add to differenet sources to set keymaps
-- 	if dependency == 0 then
-- 		vim.keymap.set(mode, add[1], add[2], opts)
-- 		return
-- 	elseif dependency == 2 then
-- 		which_key.add(add)
-- 		return
-- 	end
-- 	return add
-- end



M.map = function(dependency, mode, lhs, rhs, opts, loopKey, isLoop)
	local which_key = require("which-key")
	local add = {}
	isLoop = isLoop ~= nil and true or isLoop

	-- set lhs
	add[1] = lhs

	-- set rhs
	if loopKey ~= nil then
		local swk_show = [[<cmd>lua require('which-key').show({ keys = ']] .. loopKey .. [[', loop = ]] .. tostring(isLoop) .. [[ })<cr>]]
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
		vim.keymap.set(mode, add[1], function() vim.cmd(rhs) which_key.show({ keys = loopKey, loop = isLoop })  end, opts)
	elseif dependency == 5 then
		-- 5 is these are special
		-- NOTE: not fixed, fix it leter
		vim.keymap.set(mode, add[1], function() vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>l<C-w>c<C-w>p", true, true, true), "n", false) which_key.show({ keys = loopKey, loop = isLoop }) end, opts)
	end
end

return M
