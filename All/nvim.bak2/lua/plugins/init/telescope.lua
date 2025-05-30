local M = {}
local map = require("lib.func").map
local keys = require("lib.keys")

M.branch = "0.1.x"

M.tag = "0.1.8"

M.dependencies = {
  "nvim-lua/plenary.nvim",
}

M.config = function ()
	vim.api.nvim_create_autocmd("Filetype", {
		pattern = "TelescopePrompt",
		callback = function ()

			local telescope_local_leader = keys.localleader.finder

			map(2, { "n" }, "\\", "", { desc = "Telescope", buffer = true})
			map(2, { "n" }, telescope_local_leader, "", { desc = "Telescope", buffer = true })
			map(0, { "n" }, telescope_local_leader .. "f", "", { desc = "File", buffer = true })
			map(0, { "n" }, telescope_local_leader .. "fo", "", { desc = "Open", buffer = true })
			map(2, { "n" }, telescope_local_leader .. "foh", "", { desc = "Left", buffer = true })
			map(2, { "n" }, telescope_local_leader .. "foj", "", { desc = "Down", buffer = true })
			map(2, { "n" }, telescope_local_leader .. "fok", "", { desc = "Up", buffer = true })
			map(2, { "n" }, telescope_local_leader .. "fol", "", { desc = "Right", buffer = true })
			map(2, { "n" }, telescope_local_leader .. "fot", "", { desc = "As Tab", buffer = true })
			map(0, { "n" }, telescope_local_leader .. "h", "<cmd>Telescope find_files hidden=true<cr>", { desc = "Find files (Hidden)", buffer = true })

			map(2, { "n" }, telescope_local_leader .. "a", "", { desc = "Add", buffer = true })
			map(0, { "n" }, telescope_local_leader .. "aa", "", { desc = "All", buffer = true })
			map(0, { "n" }, telescope_local_leader .. "as", "", { desc = "Selected", buffer = true })

			map(0, { "n" }, telescope_local_leader .. "<tab>", "", { desc = "Select & up", buffer = true })
			map(0, { "n" }, telescope_local_leader .. "<s-tab>", "", { desc = "Select & down", buffer = true })
			map(0, { "n" }, telescope_local_leader .. "<cr>", "", { desc = "Enter", buffer = true })
			map(0, { "n" }, telescope_local_leader .. "<esc>", "", { desc = "Quit", buffer = true })
			map(0, { "n" }, telescope_local_leader .. "s", "", { desc = "Search", buffer = true })

			map(2, { "n" }, "si", "", { desc = "Line", buffer = true })
		end
	})


	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function()
			local lsp_leader = keys.localleader.lsp

			map(0, { "n" }, lsp_leader .. "fr", "<cmd>Telescope lsp_references<cr>", { desc = "References", buffer = true})
			map(0, { "n" }, lsp_leader .. "fd", "<cmd>Telescope lsp_definitions<cr>", { desc = "Definitions", buffer = true})
			map(0, { "n" }, lsp_leader .. "fi", "<cmd>Telescope lsp_implementations<cr>", { desc = "Implementations", buffer = true})
			map(0, { "n" }, lsp_leader .. "ft", "<cmd>Telescope lsp_type_definitions<cr>", { desc = "Type definitions", buffer = true})
			map(0, { "n" }, lsp_leader .. "fi", "<cmd>Telescope diagnostics bufnr=0<cr>", { desc = "Current", buffer = true })
			map(0, { "n" }, lsp_leader .. "fI", "<cmd>Telescope diagnostics<cr>", { desc = "All", buffer = true })
		end
	})

end

M.keys= function ()
	local telescope_leader = keys.leader.finder
	local git_leader = keys.leader.git

	return {
		map(1, { "n" }, telescope_leader, "", { desc = "Find" }),
		map(1, { "n" }, telescope_leader .. "a", "<cmd>Telescope builtin<cr>", { desc = "All" }),
		map(1, { "n" }, telescope_leader .. "b", "<cmd>Telescope buffers<cr>", { desc = "Buffers" }),
		map(1, { "n" }, telescope_leader .. "c", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Current" }),
		map(1, { "n" }, telescope_leader .. "C", "<cmd>Telescope commands<cr>", { desc = "Commands" }),
		map(1, { "n" }, telescope_leader .. "f", "<cmd>Telescope find_files<cr>", { desc = "Files" }),
		map(1, { "n" }, telescope_leader .. "F", "<cmd>Telescope resume<cr>", { desc = "Resume" }),
		map(1, { "n" }, telescope_leader .. "h", "<cmd>Telescope help_tags<cr>", { desc = "Helps" }),
		map(1, { "n" }, telescope_leader .. "m", "<cmd>Telescope marks<cr>", { desc = "Marks" }),
		map(1, { "n" }, telescope_leader .. "M", "<cmd>Telescope media_files<cr>", { desc = "Media" }),
		map(1, { "n" }, telescope_leader .. "o", "<cmd>Telescope oldfiles<cr>", { desc = "Old files" }),
		map(1, { "n" }, telescope_leader .. "r", "<cmd>Telescope registers<cr>", { desc = "Registers" }),
		map(1, { "n" }, telescope_leader .. "u", "<cmd>Telescope undo<cr>", { desc = "Undo" }),
		map(1, { "n" }, telescope_leader .. "w", "<cmd>Telescope live_grep<cr>", { desc = "Words" }),
		map(1, { "n" }, telescope_leader .. "s", "<cmd>Telescope spell_suggest<cr>", { desc = "Spell suggest" }),
		map(1, { "n" }, telescope_leader .. "l", "<cmd>Telescope loclist<cr>", { desc = "Loclist" }),
		map(1, { "n" }, telescope_leader .. "q", "<cmd>Telescope quickfix<cr>", { desc = "Quickfix" }),
		map(1, { "n" }, telescope_leader .. "z", "<cmd>Telescope colorscheme<cr>", { desc = "Colorscheme" }),

		map(1, { "n" }, git_leader .. "fc", "<cmd>Telescope git_commits<cr>", { desc = "All commits" }),
		map(1, { "n" }, git_leader .. "fC", "<cmd>Telescope git_bcommits<cr>", { desc = "Buffer commits" }),
		map(1, { "n" }, git_leader .. "fs", "<cmd>Telescope git_status<cr>", { desc = "Status" }),
		map(1, { "n" }, git_leader .. "fb", "<cmd>Telescope git_branches<cr>", { desc = "Branches" }),
		map(1, { "n" }, git_leader .. "ff", "<cmd>Telescope git_files<cr>", { desc = "Files" }),
		map(1, { "n" }, git_leader .. "fS", "<cmd>Telescope git_stash<cr>", { desc = "Stash" }),
		map(1, { "n" }, git_leader .. "fx", "<cmd>Telescope conflicts<cr>", { desc = "Conflicts" }),

		-- map(1, { "n" }, navigation_leader1 .. "H", "<cmd>Telescope search_history<cr>", { desc = "Search history" }),
		-- map(1, { "n" }, notification_leader .. "f", "<cmd>Telescope noice<cr>", { desc = "Find (Noice)" }),
	}
end


return M
