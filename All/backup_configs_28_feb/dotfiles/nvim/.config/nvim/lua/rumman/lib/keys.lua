---@diagnostic disable: unused-local
-- main leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- NOTE: Also can be like "1<leader>", "2<leader>" keymaps ... "9<leader>"
-- so you will use all navtive keybinds from neovim
local l1 = "<leader>"
local l2 = "<leader><leader>"

local ll1 = "<localleader>"
local ll2 = "<localleader><localleader>"

local c1 = ","
local c2 = ",,"

local s1 = ";"
local s2 = ";;"

local il1 = "<c-,>"
local il2 = "<c-,><c-,>"

return {
	telescope = {
		leaders = {
			globals = l2 .. "f",
			locals = ll1,
		},
	},
	fzf = {
		leaders = {
			globals = l1 .. "f",
			locals = "<c-\\>",
		},
	},
	bufferline = {
		leaders = {
			globals = "<c-t>",
		},
	},
	tab = {
		leaders = {
			globals = "<c-s>",
		},
	},
	git = {
		leaders = {
			globals = l1 .. "g",
		},
	},
	navigation = {
		leaders = {
			globals1 = "s",
			globals2 = "S",
		},
	},
	linter = {
		leaders = {
			locals = ll1 .. "L",
		},
	},
	formatter = {
		leaders = {
			locals = ll1 .. "",
		},
	},
	lsp = {
		leaders = {
			locals = ll1,
		},
	},
	trouble = {
		leaders = {
			locals = ll1 .. "t",
		},
	},
	neotree = {
		leaders = {
			globals = l1 .. "e",
			locals = ll1,
		},
	},
	toggleterm = {
		leaders = {
			globals = l1 .. "t",
		},
	},
	windows = {
		leaders = {
			globals = "<c-w>",
		},
	},
	session = {
		leaders = {
			globals = l2 .. "S",
		},
	},
	dap = {
		leaders = {
			globals = l1 .. "d"
		},
	},
	fold = {
		leaders = {
			globals = "z",
		},
	},
	undotree = {
		leaders = {
			globals = l1 .. "u",
			locals = ll1,
		},
	},
	options = {
		leaders = {
			globals = l2 .. "o",
		},
	},
	lazygit = {
		leaders = {
			globals = l1 .. "gg",
		},
	},
	comment = {
		leaders = {
			globals1 = "gc",
			globals2 = "gb",
		},
	},
	loc_qfix_list_leader = {
		leaders = {
			globals = l1 .. "x",
		},
	},
	notification = {
		leaders = {
			globals = l1 .. "n",
		},
	},
	marks = {
		leaders = {
			globals = l1 .. "m",
		},
	},
	visual_multi = {
		leaders = {
			globals = l1 .. "m",
		},
	},
	yanky = {
		leaders = {
			globals = l1 .. "fy",
		},
	},
	surround = {
		leaders = {
			globals1 = "ss",
			globals2 = "SS",
		},
	},
}

