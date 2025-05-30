local M = {}
local icons = require("lib.icons")
local func = require("lib.func")
local map = func.map

M.opts = {}

M.config = function ()
	-- vim.g.undotree_TreeNodeShape = ui.CircleSmall
	-- vim.g.undotree_TreeReturnShape = ui.BorderBottomLeft .. ui.BorderTop .. ui.BorderTopRight
	-- vim.g.undotree_TreeVertShape = ui.BorderLeft
	-- vim.g.undotree_TreeSplitShape = ui.BorderBottom .. ui.BorderBottomRight
end

M.keys = function ()
	local undotree_leader = require("lib.keys").undotree_leader
	local undotree_window = function (undotree, diffpanel)
		vim.g.undotree_CustomUndotreeCmd = undotree
		vim.g.undotree_CustomDiffpanelCmd = diffpanel
		vim.cmd("UndotreeToggle")
		vim.cmd("UndotreeShow")
	end

	return {
		map(1, { "n" }, undotree_leader, "", { desc = "Undotree" }),
		map(1, { "n" }, undotree_leader .. "m", "", { desc = "Move" }),
		map(1, { "n" }, undotree_leader .. "f", "<cmd>UndotreeShow<cr><cmd>UndotreeFocus<cr>", { desc = "Focus" }),
		map(1, { "n" }, undotree_leader .. "x", "<cmd>UndotreeHide<cr>", { desc = "Close" }),
		map(1, { "n" }, undotree_leader .. "u", "<cmd>UndotreeToggle<cr>", { desc = "Toggle" }),

		map(1, { "n" }, undotree_leader .. "mh", function() undotree_window("topleft vertical 30 new", "rightbelow new" ) end, { desc = "Left" }),
		map(1, { "n" }, undotree_leader .. "ml", function() undotree_window("botright vertical 30 new", "rightbelow new" ) end, { desc = "Right" }),
		map(1, { "n" }, undotree_leader .. "mk", function() undotree_window("leftabove horizontal 10 new", "rightbelow vertical new") end, { desc = "Up" }),
		map(1, { "n" }, undotree_leader .. "mj", function() undotree_window("botright horizontal 10 new", "rightbelow vertical new") end, { desc = "Down" }),

		map(1, { "n" }, undotree_leader .. "mH", function() undotree_window("topleft vertical 30 new", "botright 10 new") end, { desc = "Left + Down" }),
		map(1, { "n" }, undotree_leader .. "mJ", function() undotree_window("rightbelow vertical 30 new", "botright 10 new") end, { desc = "Right + Down" }),
		map(1, { "n" }, undotree_leader .. "mK", function() undotree_window("belowright vertical 30 new", "topleft 10 new") end, { desc = "Right + Up" }),
		map(1, { "n" }, undotree_leader .. "mL", function() undotree_window("topleft vertical 30 new", "topleft 10 new") end, { desc = "Left + Up" }),
	}
end

vim.api.nvim_create_autocmd("Filetype", {
	pattern = "undotree",
	callback = function ()
		local undotree_local_leader = require("lib.keys").undotree_local_leader
		map(2, { "n" }, undotree_local_leader, "", { desc = "Undotree", buffer = true })
		map(0, { "n" }, undotree_local_leader .. "x", "<plug>UndotreeClose", { desc = "Close", buffer = true })
		map(0, { "n" }, undotree_local_leader .. "u", "<Plug>UndotreeUndo", { desc = "Undo", buffer = true })
		map(0, { "n" }, undotree_local_leader .. "r", "<Plug>UndotreeRedo", { desc = "Redo", buffer = true })

		map(0, { "n" }, undotree_local_leader .. "f", "<Plug>UndotreeFocusTarget", { desc = "Focus target", buffer = true })
		map(0, { "n" }, undotree_local_leader .. "c", "<Plug>UndotreeClearHistory", { desc = "Clear history", buffer = true })
		map(0, { "n" }, undotree_local_leader .. "t", "<Plug>UndotreeTimestampToggle", { desc = "Timestamp", buffer = true })
		map(0, { "n" }, undotree_local_leader .. "d", "<Plug>UndotreeDiffToggle", { desc = "Diff", buffer = true })
		map(0, { "n" }, undotree_local_leader .. "K", "<Plug>UndotreeNextState", { desc = "Next", buffer = true })
		map(0, { "n" }, undotree_local_leader .. "J", "<Plug>UndotreePreviousState", { desc = "Previous", buffer = true })
		map(0, { "n" }, undotree_local_leader .. "s", "<Plug>UndotreeNextSavedState", { desc = "Next saved", buffer = true })
		map(0, { "n" }, undotree_local_leader .. "S", "<Plug>UndotreePreviousSavedState", { desc = "Previous saved", buffer = true })
		map(0, { "n" }, undotree_local_leader .. "<cr>", "<Plug>UndotreeEnter", { desc = "Enter", buffer = true })
	end
})


return M
