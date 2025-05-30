local M = {}

M.event = {
	"BufNewFile",
	"BufReadPre",
}

M.keys = function()
	local explorer_leader = require("lib.keys").leader.explorer
	local map = require("lib.func").map

	return {
		map(1, { "n" }, explorer_leader .. "<cr>", function()
			require("oil").toggle_float()
		end, { desc = "Explorer editor" }),
	}
end

M.dependencies = {
	-- "echasnovski/mini.icons",
	"nvim-tree/nvim-web-devicons",
}

M.opts = function()
	local utils = require("lib.utils")
	local icons = require("lib.icons")
	local border = {
		icons.ui.border.top.left,
		icons.ui.border.horizontal,
		icons.ui.border.top.right,
		icons.ui.border.vertical,
		icons.ui.border.bottom.right,
		icons.ui.border.horizontal,
		icons.ui.border.bottom.left,
		icons.ui.border.vertical,
	}

	return {
		delete_to_trash = true,
		win_options = {
			signcolumn = "yes",
			list = true,
		},
		float = {
			-- padding = 10,
			max_width = utils.ui.width - 0.1,
			max_height = utils.ui.height - 0.1,
			border = border,
		},
		confirmation = {
			border = border,
		},
		progress = {
			border = border,
		},
		ssh = {
			border = border,
		},
		keymaps_help = {
			border = border,
		},
		keymaps = {
			["<"] = { "actions.parent", mode = "n" },
			[">"] = { "actions.select", mode = "n" },
			["<cr>"] = { "actions.select", mode = "n" },
			["T"] = { "actions.toggle_trash", mode = "n" },
			["H"] = { "actions.toggle_hidden", mode = "n" },
			["P"] = { "actions.preview", mode = "n" },
		},
		use_default_keymaps = false,
	}
end

return M
