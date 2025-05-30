local M = {}

M.opts = function()
	local ensure_installed = {
		"css",
		"git_config",
		"git_rebase",
		"gitattributes",
		"gitcommit",
		"gitignore",
		"html",
		"javascript",
		"json",
		"jsonc",
		"lua",
		"luadoc",
		"regex",
		"sql",
		"tmux",
		"toml",
		"tsx",
		"typescript",
		"vim",
		"vimdoc",
	}

	return {
		auto_install = true,
		ensure_installed = ensure_installed,
		ignore_install = {},
		modules = {},
		sync_install = false,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = true,
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "gnn",
				node_incremental = "grn",
				scope_incremental = "grc",
				node_decremental = "grm",
			},
		},
		-- textobjects = {
		--    select = {
		--      enable = true,
		--      lookahead = true,
		--      keymaps = {
		--        -- You can use the capture groups defined in textobjects.scm
		--        ["af"] = "@function.outer",
		--        ["if"] = "@function.inner",
		--        ["ac"] = "@class.outer",
		--        -- You can optionally set descriptions to the mappings (used in the desc parameter of
		--        -- nvim_buf_set_keymap) which plugins like which-key display
		--        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
		--        -- You can also use captures from other query groups like `locals.scm`
		--        ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
		--      },
		--      selection_modes = {
		--        ['@parameter.outer'] = 'v', -- charwise
		--        ['@function.outer'] = 'V', -- linewise
		--        ['@class.outer'] = '<c-v>', -- blockwise
		--      },
		--      include_surrounding_whitespace = true,
		-- 	},
		-- },
	}
end


return M
