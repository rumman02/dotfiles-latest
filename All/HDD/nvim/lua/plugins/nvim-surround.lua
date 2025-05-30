local M = {}

M.opts = {
	keymaps = {
		-- insert = "<C-g>s",
		-- insert_line = "<C-g>S",
		-- normal = "ys",
		-- normal_cur = "yss",
		-- normal_line = "yS",
		-- normal_cur_line = "ySS",
		-- visual = "S",
		-- visual_line = "gS",
		-- delete = "ds",
		-- change = "cs",
		-- change_line = "cS",
	}
}

M.config = function ()
end

M.keys = function ()
	local func = require("lib.func")
	local map = func.map
	local surround_leader1 = require("lib.keys").surround_leader1
	local surround_leader2 = require("lib.keys").surround_leader2

	return {
		map(1, { "n" }, surround_leader1, 		   "<Plug>(nvim-surround-normal)", { desc = "Surround (Normal)" }),
		map(1, { "n" }, surround_leader1 .. "s", "<Plug>(nvim-surround-normal-cur)", { desc = "Surround (Cur_line)" }),
		map(1, { "n" }, surround_leader2, 			 "<Plug>(nvim-surround-normal-line)", { desc = "Surround (New_line)" }),
		map(1, { "n" }, surround_leader2 .. "S", "<Plug>(nvim-surround-normal-cur-line)", { desc = "Surround (Cur_line+New_line)" }),
		map(1, { "v" }, surround_leader1, 			 "<Plug>(nvim-surround-visual)", { desc = "Surround (Normal)" }),
		map(1, { "v" }, surround_leader2, 			 "<Plug>(nvim-surround-visual-line)", { desc = "Surround (New_line)" }),
		map(1, { "n" }, surround_leader1 .. "c", "<Plug>(nvim-surround-change)", { desc = "Surround (Normal)" }),
		map(1, { "n" }, surround_leader2 .. "C", "<Plug>(nvim-surround-change-line)", { desc = "Surround (New_line)" }),
		map(1, { "n" }, surround_leader1 .. "d", "<Plug>(nvim-surround-delete)", { desc = "Surround (Normal)" }),
		map(1, { "n" }, surround_leader2 .. "D", "<Plug>(nvim-surround-change-line)", { desc = "Surround (New_line)" }),
	}
end

return M
