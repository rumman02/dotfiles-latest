return {
	--==================================================--
	--                    catppuccin                    --
	--==================================================--
	{
		"catppuccin/nvim",
		name = "catppuccin",
		cmd = { "Catppuccin" },
		priority = 1000,
		opts = {
			background = {
				light = "latte",
				dark = "mocha"
			},
			term_colors = true,
			transparent_background = false,
			integrations = {
				notify = true
			}
		}
	},
	--==================================================--
	--                     gruvbox                      --
	--==================================================--
	{
		"ellisonleao/gruvbox.nvim",
		cmd = { "Gruvbox" },
		priority = 1000,
		opts = {
			contrast = "",
			overrides = {
				SignColumn = { bg = "none" },
				-- FloatBorder = { link = "GruvboxBg2" },
				-- CmpBorder = { link = "GruvboxBg2" },
				-- CmpDocBorder = { link = "GruvboxBg2" },
				-- WhichKeyBorder = { link = "GruvboxBg2" },
				FlashLabel = { fg = "#fff100" },
				-- NeotreeNormal = { bg = "#1c1c1c" },
				-- NeotreeNormalNC = { bg = "#1c1c1c" },
			},
			transparent_mode = false,
		}
	},
	--==================================================--
	--                 gruvbox_material                 --
	--==================================================--
	{
		"sainnhe/gruvbox-material",
		cmd = { "Colorscheme gruvbox-material" },
		priority = 1000,
		config = function ()
			local g = vim.g
			g.gruvbox_material_background = "soft" -- soft, 👉medium, hard
			g.gruvbox_material_foreground = "original" -- original, 👉material, mix
			g.gruvbox_material_disable_italic_comment = 0 -- 👉0, 1
			g.gruvbox_material_enable_bold = 1 -- 👉0, 1
			g.gruvbox_material_enable_italic = 1 -- 👉0, 1
			g.gruvbox_material_cursor = "red" -- 👉audo, red, orange, yellow, green, aqua, blue, purple
			g.gruvbox_material_transparent_background = 0 -- 👉0, 1, 2
			g.gruvbox_material_dim_inactive_windows = 0 -- 👉0, 1
			g.gruvbox_material_visual = "grey background" -- 👉grey background, green background, blue background, red background, reverse
			g.gruvbox_material_menu_selection_background = "grey" -- 👉grey, red, orange, yellow, green, aqua, blue, purple
			g.gruvbox_material_sign_column_background = "none" -- 👉none, grey
			g.gruvbox_material_spell_foreground = "none" -- 👉none, colored
			g.gruvbox_material_ui_contrast = "high" -- 👉low, high
			g.gruvbox_material_show_eob = 0 -- 0, 👉1
			g.gruvbox_material_float_style = "bright" -- 👉bright, dim
			g.gruvbox_material_diagnostic_text_highlight = 1 -- 👉0, 1
			g.gruvbox_material_diagnostic_line_highlight = 1 -- 👉0, 1
			g.gruvbox_material_diagnostic_virtual_text = "highlighted" -- 👉grey, colored, highlighted
			g.gruvbox_material_current_word = "grey background" -- 👉grey background, high contrast background, bold, underline, italic
			g.gruvbox_material_inlay_hints_background = "none" -- 👉none, dimmed
			g.gruvbox_material_disable_terminal_colors = 0 -- 👉0, 1
			g.gruvbox_material_statusline_style = "default" -- 👉default, original, mix
			g.gruvbox_material_lightline_disable_bold = 0 -- 👉0, 1
			g.gruvbox_material_better_performance = 0 -- 👉0, 1
			-- vim.g.gruvbox_material_colors_override = {}
		end
	},
	--==================================================--
	--                    tokyonight                    --
	--==================================================--
	{
		"folke/tokyonight.nvim",
		cmd = { "Tokyonight" },
		priority = 1000,
		opts = {
			style = "night", -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
			light_style = "day", -- The theme is used when the background is set to light
			transparent = false, -- Enable this to disable setting the background color
			terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
			styles = {
				-- Style to be applied to different syntax groups
				-- Value is any valid attr-list value for `:help nvim_set_hl`
				comments = { italic = true },
				keywords = { italic = true },
				functions = {},
				variables = {},
				-- Background styles. Can be "dark", "transparent" or "normal"
				sidebars = "dark", -- style for sidebars, see below
				floats = "dark", -- style for floating windows
			},
			day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
			dim_inactive = false, -- dims inactive windows
			lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

			--- You can override specific color groups to use other groups or a hex color
			--- function will be called with a ColorScheme table
			-- on_colors = function(colors) end,

			--- You can override specific highlights to use other groups or a hex color
			--- function will be called with a Highlights and ColorScheme table
			-- on_highlights = function(highlights, colors) end,

			cache = true, -- When set to true, the theme will be cached for better performance

			plugins = {
				-- enable all plugins when not using lazy.nvim
				-- set to false to manually enable/disable plugins
				all = package.loaded.lazy == nil,
				-- uses your plugin manager to automatically enable needed plugins
				-- currently only lazy.nvim is supported
				auto = true,
				-- add any plugins here that you want to enable
				-- for all possible plugins, see:
				--   * https://github.com/folke/tokyonight.nvim/tree/main/lua/tokyonight/groups
				-- telescope = true,
			}
		}
	}
}
