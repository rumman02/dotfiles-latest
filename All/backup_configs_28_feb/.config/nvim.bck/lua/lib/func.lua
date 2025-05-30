local M = {};

M.map = function(dependency, mode, lhs, rhs, opts, loopKey, isLoop)
	local which_key = require("which-key");
	local add = {};

	-- set lhs
	add[1] = lhs;

	-- set rhs
	if loopKey ~= nil then
		isLoop = isLoop ~= nil and true or isLoop;
		local swk_show = [[<cmd>lua require('which-key').show({ keys = ']] .. loopKey .. [[', loop = ]] .. tostring(isLoop) .. [[ })<cr>]];
		local fwk_show = function()
			which_key.show({ keys = loopKey, loop = isLoop });
		end;

		if type(rhs) == "string" then
			add[2] = rhs .. swk_show;
		elseif type(rhs) == "function" then
			add[2] = function ()
				rhs();
				fwk_show();
			end;
		end;
	else
		add[2] = rhs;
	end;

	-- set mode
	add.mode = mode;

	-- set opts
	if opts then
		for key, value in pairs(opts) do
			add[key] = value;
		end;
	end;

	-- add to differenet sources to set keymaps
	if dependency == 0 then
		vim.keymap.set(mode, add[1], add[2], opts);
		return;
	elseif dependency == 2 then
		which_key.add(add);
		return;
	end;
	return add;

end;

return M;

