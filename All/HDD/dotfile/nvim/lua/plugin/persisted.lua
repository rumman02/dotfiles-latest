return {
	"olimorris/persisted.nvim",
	event = { "VeryLazy" },
	config = function()
		local persisted = require("persisted")
		persisted.setup({})

		-- before save session, close neotree, help docs
		vim.api.nvim_create_autocmd("User", {
			pattern = "PersistedSavePre",
			callback = function()
				-- Close Neotree if it's open
				vim.cmd("Neotree close")

				-- Function to close any open help windows
				local function close_help_windows()
					-- Iterate through all windows
					for _, win in ipairs(vim.api.nvim_list_wins()) do
						local buf = vim.api.nvim_win_get_buf(win)
						local buftype = vim.bo[buf].buftype

						-- Check if the buffer is a help buffer
						if buftype == "help" then
							vim.api.nvim_win_close(win, true)  -- Close the help window
						end
					end
				end

				-- Call the function to close help windows
				close_help_windows()
			end,
		})

	end
}
