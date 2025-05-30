local which_key = require("which-key")

--==================================================--
--                     neo_tree                     --
--==================================================--
local neo_tree_inside = function ()
	return {
		{
			{ BUFLEADER .. "b", desc = "Buffer"},
			{ BUFLEADER .. "c", desc = "Close"},
			{ BUFLEADER .. "d", desc = "Directory"},
			{ BUFLEADER .. "e", desc = "Expand"},
			{ BUFLEADER .. "f", desc = "File"},
			{ BUFLEADER .. "fo", desc = "Open"},
			{ BUFLEADER .. "fp", desc = "Preview"},
			{ BUFLEADER .. "fop", desc = "Pick window"},
			{ BUFLEADER .. "fot", desc = "Tab"},
			{ BUFLEADER .. "g", desc = "Git"},
			{ BUFLEADER .. "ga", desc = "Add"},
			{ BUFLEADER .. "gm", desc = "Modified"},
			{ BUFLEADER .. "h", desc = "Show hidden"},
			{ BUFLEADER .. "i", desc = "Show details"},
			{ BUFLEADER .. "o", desc = "Sort by"},
			{ BUFLEADER .. "p", desc = "Paste"},
			{ BUFLEADER .. "y", desc = "Copy"},
			{ BUFLEADER .. "c", desc = "Cut"},
			{ BUFLEADER .. "r", desc = "Refresh"},
			{ BUFLEADER .. "<cr>", desc = "Enter"},
			{ BUFLEADER .. "<esc>", desc = "Quit"},
		},
		{
			hidden = true,
			{ BUFLEADER .. BUFLEADER },
		}
	}
end

--==================================================--
--                    telescope                     --
--==================================================--
local telescope_inside = function ()
	return {
		{
			hidden = false,
			{ BUFLEADER .. "f", desc = "File" },
			{ BUFLEADER .. "fo", desc = "Open" },
			{ BUFLEADER .. "foh", desc = "Left" },
			{ BUFLEADER .. "foj", desc = "Down" },
			{ BUFLEADER .. "fok", desc = "Up" },
			{ BUFLEADER .. "fol", desc = "Right" },
			{ BUFLEADER .. "fot", desc = "As Tab" },
			{ BUFLEADER .. "<tab>", desc = "Select & up" },
			{ BUFLEADER .. "<s-tab>", desc = "Select & down" },
			{ BUFLEADER .. "a", desc = "Add" },
			{ BUFLEADER .. "aa", desc = "All" },
			{ BUFLEADER .. "as", desc = "Selected" },
			{ BUFLEADER .. "<cr>", desc = "Enter"},
			{ BUFLEADER .. "<esc>", desc = "Quit"},
		},
		{
			hidden = true,
			{ BUFLEADER .. BUFLEADER }
		}
	}
end

--==================================================--
--                      global                      --
--==================================================--
-- this keymaps will apply into globally
local global = function ()
	return  {
		{
			hidden = true,
			{ BUFLEADER .. "a"},
			{ BUFLEADER .. "b"},
			{ BUFLEADER .. "c"},
			{ BUFLEADER .. "d"},
			{ BUFLEADER .. "e"},
			{ BUFLEADER .. "f"},
			{ BUFLEADER .. "fp"},
			{ BUFLEADER .. "fop"},
			{ BUFLEADER .. "g"},
			{ BUFLEADER .. "h"},
			{ BUFLEADER .. "i"},
			{ BUFLEADER .. "j"},
			{ BUFLEADER .. "k"},
			{ BUFLEADER .. "l"},
			{ BUFLEADER .. "m"},
			{ BUFLEADER .. "n"},
			{ BUFLEADER .. "o"},
			{ BUFLEADER .. "p"},
			{ BUFLEADER .. "q"},
			{ BUFLEADER .. "r"},
			{ BUFLEADER .. "s"},
			{ BUFLEADER .. "t"},
			{ BUFLEADER .. "u"},
			{ BUFLEADER .. "v"},
			{ BUFLEADER .. "w"},
			{ BUFLEADER .. "x"},
			{ BUFLEADER .. "y"},
			{ BUFLEADER .. "z"},
			{ BUFLEADER .. ","},
			{ BUFLEADER .. "."},
			{ BUFLEADER .. ";"},
			{ BUFLEADER .. ":"},
			{ BUFLEADER .. "'"},
			{ BUFLEADER .. '"'},
			{ BUFLEADER .. "<"},
			{ BUFLEADER .. ">"},
			{ BUFLEADER .. "/"},
			{ BUFLEADER .. "?"},
			{ BUFLEADER .. "<cr>"},
			{ BUFLEADER .. "<tab>"},
			{ BUFLEADER .. "<s-tab>"},
			{ BUFLEADER .. "<esc>"},
		},
		{
			hidden = false,
			{ BUFLEADER .. BUFLEADER, desc = "Buffer specific keymaps" }
		}
	}
end


--==================================================--
--         conditional keymap main function         --
--==================================================--
vim.api.nvim_create_autocmd({ "BufWinEnter", "BufEnter", "BufLeave", "InsertLeave"  }, {
-- vim.api.nvim_create_autocmd({ "BufWinEnter", "BufEnter", "InsertLeave" }, {
	callback = function()
		local buf = vim.api.nvim_get_current_buf()
		local current_filetype = vim.bo[buf].filetype
		-- print(buf, current_filetype)

		if current_filetype == "neo-tree" then
			which_key.add(neo_tree_inside())
		elseif current_filetype == "TelescopePrompt" then
			which_key.add(telescope_inside())
		else
			which_key.add(global())
		end
	end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "lazy",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, "n", "<Esc>", "<cmd>q<cr>", { noremap = true, silent = true })
  end
})
