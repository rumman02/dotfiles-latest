-- vim.api.nvim_create_autocmd({"BufEnter"}, {
-- 	callback = function()
-- 		local buf = vim.api.nvim_get_current_buf()
-- 		-- local ft = vim.api.nvim_buf_get_option(buf, 'filetype')
-- 		local ft = vim.bo[buf].filetype
--
--
-- 		if ft == 'neo-tree' then
-- 			------------------neo-tree-----------------
-- 			local unhidden = {
-- 					hidden = false,
-- 					-- keymaps here which is shown in neo-tree
-- 					{"\\b", desc = "Buffer"},
-- 					{"\\c", desc = "Close"},
-- 					{"\\d", desc = "Directory"},
-- 					{"\\e", desc = "Expand"},
-- 					{"\\f", desc = "File"},
-- 					{"\\fo", desc = "Open"},
-- 					{"\\fp", desc = "Preview"},
-- 					{"\\fop", desc = "Pick window"},
-- 					{"\\fot", desc = "Tab"},
-- 					{"\\g", desc = "Git"},
-- 					{"\\ga", desc = "Add"},
-- 					{"\\gm", desc = "Modified"},
-- 					{"\\h", desc = "Show hidden"},
-- 					{"\\i", desc = "Show details"},
-- 					{"\\o", desc = "Sort by"},
-- 					{"\\p", desc = "Paste"},
-- 					{"\\y", desc = "Copy"},
-- 					{"\\x", desc = "Cut"},
-- 					{"\\q", desc = "Quit"},
-- 					{"\\r", desc = "Refresh"},
-- 			}
-- 			local hidden = {
-- 					hidden = true,
-- 					-- keymaps here which is hidden in neo-tree
-- 					{ "\\\\", "", desc = "Buffer specific keymaps" }
-- 			}
-- 			require("which-key").add(unhidden)
-- 			require("which-key").add(hidden)
-- 		else
-- 			------------------global-----------------
-- 			local unhidden = {
-- 					hidden = false,
-- 					{ "\\\\", "", desc = "Buffer specific keymaps" }
-- 					-- keymaps here which is shown in global
-- 			}
-- 			local hidden = {
-- 					hidden = true,
-- 					-- keymaps here which is hidden in global
--
-- 					-- no need to change anything here, its almost fixed,
-- 					-- if add then add, or don't remove any mappings
-- 					{"\\a"}, {"\\b"}, {"\\c"}, {"\\d"}, {"\\e"}, {"\\f"},
-- 					{"\\g"}, {"\\h"}, {"\\i"}, {"\\j"}, {"\\k"}, {"\\l"},
-- 					{"\\m"}, {"\\n"}, {"\\o"}, {"\\p"}, {"\\q"}, {"\\r"},
-- 					{"\\s"}, {"\\t"}, {"\\u"}, {"\\v"}, {"\\w"}, {"\\x"},
-- 					{"\\y"}, {"\\z"}, {"\\,"}, {"\\."}, {"\\;"}, {"\\:"},
-- 					{"\\'"}, {'\\"'}, {"\\<"}, {"\\>"}, {"\\/"}, {"\\?"},
-- 			}
-- 			require("which-key").add(unhidden)
-- 			require("which-key").add(hidden)
-- 		end
-- 	end
-- })


-- add filetype keymaps here
local neo_tree = require("plugin.neo_tree").add_labels_in_which_key

-- reverse filetype keymaps (global)
local global = function ()
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

-- main function
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	callback = function()
		local buf = vim.api.nvim_get_current_buf()
		local current_filetype = vim.bo[buf].filetype
		local filetype_whichkey = function (filetype)
			require("which-key").add({ filetype(), { "\\\\", hidden = true } })
		end

		-- add here filetype condition
		if current_filetype == "neo-tree" then
			filetype_whichkey(neo_tree)
		else
			require("which-key").add(global())
		end
	end
})
