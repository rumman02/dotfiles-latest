local which_key = require("which-key")

--==================================================--
--                  normal keymap                   --
--==================================================--
-- normal keymap
local neo_tree_normal = function ()
	return {
		{ "<leader>eh", "<cmd> Neotree left <cr>", desc = "Left"},
		{ "<leader>ej", "<cmd> Neotree bottom <cr>", desc = "Down"},
		{ "<leader>ek", "<cmd> Neotree top <cr>", desc = "Up"},
		{ "<leader>el", "<cmd> Neotree right <cr>", desc = "Right"},
		{ "<leader>ef", "<cmd> Neotree focus float <cr>", desc = "Float"},
		{ "<leader>ec", "<cmd> Neotree reveal <cr>", desc = "Current"},
		{ "<leader>ex", "<cmd> Neotree close <cr>", desc = "Close" },
		{ "<leader>ee", "<cmd> Neotree focus <cr>", desc = "Focus" },
	}
end

-- which_key.add {
-- 	{ "<leader>eh", "<cmd> Neotree left <cr>", desc = "Left"},
-- 	{ "<leader>ej", "<cmd> Neotree bottom <cr>", desc = "Down"},
-- 	{ "<leader>ek", "<cmd> Neotree top <cr>", desc = "Up"},
-- 	{ "<leader>el", "<cmd> Neotree right <cr>", desc = "Right"},
-- 	{ "<leader>ef", "<cmd> Neotree focus float <cr>", desc = "Float"},
-- 	{ "<leader>ec", "<cmd> Neotree reveal <cr>", desc = "Current"},
-- 	{ "<leader>ex", "<cmd> Neotree close <cr>", desc = "Close" },
-- 	{ "<leader>ee", "<cmd> Neotree focus <cr>", desc = "Focus" },
-- }

--==================================================--
--                conditional keymap                --
--==================================================--

-- import from neo_tree file, which is inside plugin/neo_tree.lua file,
-- and add another key "\" which is need to be hidden, otherwise "\" also shown inside neo_tree
local neo_tree_inside = function ()
	return { require("plugin.neo_tree").add_labels_in_which_key(), {"\\\\", hidden = true}}
end

local neo_tree_outside = function ()
-- this keymaps will apply for outside form neotree
	return  {
	{
		hidden = true,
		{"\\a"}, {"\\b"}, {"\\c"}, {"\\d"}, {"\\e"}, {"\\f"},
		{"\\g"}, {"\\h"}, {"\\i"}, {"\\j"}, {"\\k"}, {"\\l"},
		{"\\m"}, {"\\n"}, {"\\o"}, {"\\p"}, {"\\q"}, {"\\r"},
		{"\\s"}, {"\\t"}, {"\\u"}, {"\\v"}, {"\\w"}, {"\\x"},
		{"\\y"}, {"\\z"}, {"\\,"}, {"\\."}, {"\\;"}, {"\\:"},
		{"\\'"}, {'\\"'}, {"\\<"}, {"\\>"}, {"\\/"}, {"\\?"},
	},
	{
		hidden = false,
		{ "\\\\", "", desc = "Buffer specific keymaps" }
	}
}
end

-- neo_tree normal keymap only for alpha filetype
local neo_tree_alpha = function ()
	return {
		{ "<leader>eh", "<cmd> Neotree close <cr> <bar> <cmd> Neotree left <cr>", desc = "Left"},
		{ "<leader>ej", "<cmd> Neotree close <cr> <bar> <cmd> Neotree bottom <cr>", desc = "Down"},
		{ "<leader>ek", "<cmd> Neotree close <cr> <bar> <cmd> Neotree top <cr>", desc = "Up"},
		{ "<leader>el", "<cmd> Neotree close <cr> <bar> <cmd> Neotree right <cr>", desc = "Right"},
		{ "<leader>ef", "<cmd> Neotree close <cr> <bar> <cmd> Neotree focus float <cr>", desc = "Float"},
		{ "<leader>ec", "<cmd> Neotree reveal <cr>", desc = "Current"},
		{ "<leader>ex", "<cmd> Neotree close <cr>", desc = "Close" },
		{ "<leader>ef", "<cmd> Neotree focus <cr>", desc = "Focus" },
	}
end

--==================================================--
--         conditional keymap main function         --
--==================================================--
vim.api.nvim_create_autocmd({ "BufLeave", "BufEnter" }, {
	callback = function()
		local buf = vim.api.nvim_get_current_buf()
		local current_filetype = vim.bo[buf].filetype

		-- add here filetype condition
		if current_filetype == "neo-tree" then
			which_key.add(neo_tree_inside())
		elseif current_filetype == "alpha" then
			which_key.add(neo_tree_alpha())
		else
			which_key.add(neo_tree_outside())
			which_key.add(neo_tree_normal())
		end
	end
})
