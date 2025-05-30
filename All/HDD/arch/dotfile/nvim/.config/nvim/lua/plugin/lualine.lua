-- https://github.com/nvim-lualine/lualine.nvim?tab=readme-ov-file#default-configuration
return {
	"nvim-lualine/lualine.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvim-tree/nvim-web-devicons"
	},
	opts =  {
		options = {
			theme = "gruvbox",
			globalstatus = true,
			component_separators = { left = "", right = "╱" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = {
				statusline = {"neo-tree"},
				winbar = {"neo-tree"},
			},
			ignore_focus = {
				"neo-tree",
				-- "TelescopePrompt"
			},
			always_show_tabline = false,
			refresh = {
				tabline = 5,
				statusline = 5,
				winbar = 5
			},
			always_divide_middle = true
		},
		sections = {
			lualine_a = {'mode'},
			lualine_b = {'branch', 'diff', 'diagnostics'},
			lualine_c = {'filename'},
			lualine_x = {
				{
					require("lazy.status").updates,
					cond = require("lazy.status").has_updates,
				},
				"encoding",
				"filetype",
				"fileformat",
			},
			lualine_y = {'progress'},
			lualine_z = {'location'}
		},
		-- inactive_sections = {
		-- 	lualine_a = {},
		-- 	lualine_b = {},
		-- 	lualine_c = {'filename'},
		-- 	lualine_x = {'location'},
		-- 	lualine_y = {},
		-- 	lualine_z = {}
		-- },
  --   tabline = {
  --     lualine_a = {'buffers'},
  --     lualine_b = {'branch'},
  --     lualine_c = {'filename'},
  --     lualine_x = {},
  --     lualine_y = {},
  --     lualine_z = {'tabs'}
  --   },
  --   winbar = {
  --     lualine_a = {},
  --     lualine_b = {},
  --     lualine_c = {'filename'},
  --     lualine_x = {},
  --     lualine_y = {},
  --     lualine_z = {}
  --   },
  --   inactive_winbar = {
  --     lualine_a = {},
  --     lualine_b = {},
  --     lualine_c = {'filename'},
  --     lualine_x = {},
  --     lualine_y = {},
  --     lualine_z = {}
  --   },
	}
}
