local M = {}

local map = require("lib.func").map
local keys = require("lib.keys")

M.cmd = {
  "FzfLua",
}

M.dependencies = {
	"nvim-tree/nvim-web-devicons",
	-- "echasnovski/mini.icons",
	-- "mfussenegger/nvim-dap",
	"nvim-treesitter/nvim-treesitter-context",
	"OXY2DEV/markview.nvim",
	-- "MeanderingProgrammer/render-markdown.nvim",
}

M.opts = function()
	local icons = require("lib.icons")
	local utils = require("lib.utils")
	local finder_local_leader = keys.localleader.finder
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
		"default-prompt",
		winopts = {
			height = utils.ui.height,
			width = utils.ui.width,
			row = 0.50,
			col = 0.50,
			border = border,
			backdrop = utils.ui.backdrop,
			title_pos = utils.ui.title_position,
			preview = {
			  border = border,
				title_pos = utils.ui.title_position,
			},
			on_create = function()
				map(0, { "t" }, "<c-h>", "<Left>", { buffer = true })
				map(0, { "t" }, "<c-j>", "<Down>", { buffer = true })
				map(0, { "t" }, "<c-k>", "<Up>", { buffer = true })
				map(0, { "t" }, "<c-l>", "<Right>", { buffer = true })
			end,
		},
		keymap = {
			builtin = {
				[finder_local_leader .. "<M-Esc>"] = "hide", -- hide fzf-lua, `:FzfLua resume` to continue
				[finder_local_leader .. "<F1>"] = "toggle-help",
				[finder_local_leader .. "<F2>"] = "toggle-fullscreen",
				-- Only valid with the 'builtin' previewer
				[finder_local_leader .. "<F3>"] = "toggle-preview-wrap",
				[finder_local_leader .. "<F4>"] = "toggle-preview",
				-- Rotate preview clockwise/counter-clockwise
				[finder_local_leader .. "<F5>"] = "toggle-preview-ccw",
				[finder_local_leader .. "<F6>"] = "toggle-preview-cw",
				-- `ts-ctx` binds require `nvim-treesitter-context`
				[finder_local_leader .. "<F7>"] = "toggle-preview-ts-ctx",
				[finder_local_leader .. "<F8>"] = "preview-ts-ctx-dec",
				[finder_local_leader .. "<F9>"] = "preview-ts-ctx-inc",
				[finder_local_leader .. "<S-Left>"] = "preview-reset",
				[finder_local_leader .. "<S-down>"] = "preview-page-down",
				[finder_local_leader .. "<S-up>"] = "preview-page-up",
				[finder_local_leader .. "<M-S-down>"] = "preview-down",
				[finder_local_leader .. "<M-S-up>"] = "preview-up",
			},
		},
	}
end

M.config = function()

	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function()
			local lsp_leader = keys.localleader.lsp

			map(0, { "n" }, lsp_leader .. "fr", "<cmd>FzfLua lsp_references<cr>", { desc = "References", buffer = true})
			map(0, { "n" }, lsp_leader .. "fd", "<cmd>FzfLua lsp_definitions<cr>", { desc = "Definitions", buffer = true})
			map(0, { "n" }, lsp_leader .. "fi", "<cmd>FzfLua lsp_implementations<cr>", { desc = "Implementations", buffer = true})
			map(0, { "n" }, lsp_leader .. "ft", "<cmd>FzfLua lsp_typedefs<cr>", { desc = "Type definitions", buffer = true})
			map(0, { "n" }, lsp_leader .. "fi", "<cmd>FzfLua lsp_document_diagnostics<cr>", { desc = "Current", buffer = true })
			map(0, { "n" }, lsp_leader .. "fI", "<cmd>FzfLua lsp_workspace_diagnostics<cr>", { desc = "All", buffer = true })

			map(0, { "n" }, lsp_leader .. "", "<cmd>FzfLua lsp_finder<cr>", { desc = "", buffer = true })
			map(0, { "n" }, lsp_leader .. "", "<cmd>FzfLua lsp_code_actions<cr>", { desc = "", buffer = true })
			map(0, { "n" }, lsp_leader .. "", "<cmd>FzfLua lsp_declarations<cr>", { desc = "", buffer = true })
			map(0, { "n" }, lsp_leader .. "", "<cmd>FzfLua lsp_incoming_calls<cr>", { desc = "", buffer = true })
			map(0, { "n" }, lsp_leader .. "", "<cmd>FzfLua lsp_outgoing_calls<cr>", { desc = "", buffer = true })
			map(0, { "n" }, lsp_leader .. "", "<cmd>FzfLua lsp_document_symbols<cr>", { desc = "", buffer = true })
			map(0, { "n" }, lsp_leader .. "", "<cmd>FzfLua lsp_workspace_symbols<cr>", { desc = "", buffer = true })
			map(0, { "n" }, lsp_leader .. "", "<cmd>FzfLua lsp_live_workspace_symbols<cr>", { desc = "", buffer = true })
		end
	})
end

M.keys = function()
	local finder_leader = keys.leader.finder
	local git_leader = keys.leader.git
	return {
		map(1, { "n" }, finder_leader, "", { desc = "Find" }),
		map(1, { "n" }, finder_leader .. "a", "<cmd>FzfLua builtin<cr>", { desc = "All" }),
		map(1, { "n" }, finder_leader .. "b", "<cmd>FzfLua buffers<cr>", { desc = "Buffers" }),
		map(1, { "n" }, finder_leader .. "c", "<cmd>FzfLua blines<cr>", { desc = "Current" }),
		map(1, { "n" }, finder_leader .. "C", "<cmd>FzfLua commands<cr>", { desc = "Commands" }),
		map(1, { "n" }, finder_leader .. "f", "<cmd>FzfLua files<cr>", { desc = "Files" }),
		map(1, { "n" }, finder_leader .. "F", "<cmd>FzfLua resume<cr>", { desc = "Resume" }),
		map(1, { "n" }, finder_leader .. "h", "<cmd>FzfLua help_tags<cr>", { desc = "Helps" }),
		map(1, { "n" }, finder_leader .. "m", "<cmd>FzfLua marks<cr>", { desc = "Marks" }),
		map(1, { "n" }, finder_leader .. "o", "<cmd>FzfLua oldfiles<cr>", { desc = "Old files" }),
		map(1, { "n" }, finder_leader .. "r", "<cmd>FzfLua registers<cr>", { desc = "Registers" }),
		map(1, { "n" }, finder_leader .. "u", "<cmd>FzfLua undo<cr>", { desc = "Undo" }),
		map(1, { "n" }, finder_leader .. "w", "<cmd>FzfLua live_grep<cr>", { desc = "Words" }),
		map(1, { "n" }, finder_leader .. "s", "<cmd>FzfLua spell_suggest<cr>", { desc = "Spell suggest" }),
		map(1, { "n" }, finder_leader .. "l", "<cmd>FzfLua loclist<cr>", { desc = "Loclist" }),
		map(1, { "n" }, finder_leader .. "q", "<cmd>FzfLua quickfix<cr>", { desc = "Quickfix" }),
		map(1, { "n" }, finder_leader .. "z", "<cmd>FzfLua colorscheme<cr>", { desc = "Colorscheme" }),

		map(1, { "n" }, git_leader .. "ft", "<cmd>FzfLua git_tags<cr>", { desc = "Tags" }),
		map(1, { "n" }, git_leader .. "fb", "<cmd>FzfLua git_blame<cr>", { desc = "Blames" }),
		map(1, { "n" }, git_leader .. "ff", "<cmd>FzfLua git_files<cr>", { desc = "Files" }),
		map(1, { "n" }, git_leader .. "fS", "<cmd>FzfLua git_stash<cr>", { desc = "Stash" }),
		map(1, { "n" }, git_leader .. "fs", "<cmd>FzfLua git_status<cr>", { desc = "Status" }),
		map(1, { "n" }, git_leader .. "fC", "<cmd>FzfLua git_commits<cr>", { desc = "Commits" }),
		map(1, { "n" }, git_leader .. "fc", "<cmd>FzfLua git_bcommits<cr>", { desc = "Buffer commits" }),
		map(1, { "n" }, git_leader .. "fB", "<cmd>FzfLua git_branches<cr>", { desc = "Branches" }),

		-- map(1, { "n" }, navigation_leader1 .. "H", "<cmd>FzfLua search_history<cr>", { desc = "Search history" }),
		-- map(1, { "n" }, notification_leader .. "f", "<cmd>Telescope noice<cr>", { desc = "Find (Noice)" }),
	}
end

return M
