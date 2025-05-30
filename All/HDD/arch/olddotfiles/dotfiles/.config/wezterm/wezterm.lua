local wezterm = require("wezterm")  -- pull in the wezterm api
local config = wezterm.config_builder() -- this table will hold the configuration

-- in newer versions of wezterm, use the config_builder which will help provide cleaner error message
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- for zen mode of neovim, folke/zen-mode
wezterm.on('user-var-changed', function(window, pane, name, value)
    local overrides = window:get_config_overrides() or {}
    if name == "zen_mode" then
        local incremental = value:find("+")
        local number_value = tonumber(value)
        if incremental ~= nil then
            while (number_value > 0) do
                window:perform_action(wezterm.action.increasefontsize, pane)
                number_value = number_value - 1
            end
            overrides.enable_tab_bar = false
        elseif number_value < 0 then
            window:perform_action(wezterm.action.resetfontsize, pane)
            overrides.font_size = nil
            overrides.enable_tab_bar = true
        else
            overrides.font_size = number_value
            overrides.enable_tab_bar = false
        end
    end
    window:set_config_overrides(overrides)
end)

local M = {}

M.check_for_updates = true

M.font = wezterm.font_with_fallback{
  { family = "JetBrains Mono", scale = 1.0 },
  -- { family = "Iosevka", stretch = "Expanded", scale = 1.0 },
  { family = "Noto Color Emoji", scale = 1.0 },
  { family = "Symbols Nerd Font Mono", weight = "Regular", stretch = "Normal",  scale = 0.9 },
}
-- M.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
M.font_size = 14
M.line_height = 0.97
-- M.cell_width = 1.0
-- M.initial_rows = 0
M.enable_tab_bar = false  -- disabled wezterm's default tab
M.window_decorations = "RESIZE" -- hide the window upper header and also traffic lights
M.hide_mouse_cursor_when_typing = true
M.underline_thickness = "1px" -- underline thickness
M.cursor_blink_rate = 250
M.cursor_blink_ease_in = "Constant"
M.cursor_blink_ease_out = "Constant"
M.default_cursor_style = "BlinkingBlock"  -- values can be: "SteadyBlock", "SteadyUnderline", "SteadyBar", "BlinkingBlock", "BlinkingBar", "BlinkingUnderline"
-- M.visual_bell = {
--   fade_in_function = "Constant",
--   fade_out_function = "Constant"
-- }
-- M.window_background_opacity = 0.1  -- 0 transparent, 1 no transparent
-- M.text_background_opacity = 1.0  -- 0 transparent, 1 no transparent
-- M.macos_window_background_blur = 25  -- 0 no blur, 2.0 blur
M.window_close_confirmation = "NeverPrompt"
M.audible_bell = "Disabled"   -- values can be: "SystemBeep"
M.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0
}
M.color_scheme = "Catppuccin Mocha"

return M

-----------------------------------examples of some configs---------------------------------
-- M.color_scheme = "Catppuccin Mocha"
-- M.color_scheme = "GruvboxDark"  -- values can be:
                                -- "Gruvbox (Gogh)
                                -- "Gruvbox Dark (Gogh)",
                                -- "Gruvbox dark, hard (base16)",
                                -- "Gruvbox dark, medium (base16)",
                                -- "Gruvbox dark, pale (base16)",
                                -- "Gruvbox dark, soft (base16)",
                                -- "Gruvbox light, hard (base16)",
                                -- "Gruvbox light, medium (base16)",
                                -- "Gruvbox light, soft (base16)",
                                -- "Gruvbox Material (Gogh)",
                                -- "GruvboxDark",
                                -- "GruvboxDarkHard",
                                -- "GruvboxLight",
                                -- "Dracula",
                                -- "Dracula (Official)",
-- M.color_scheme_dirs = { "~/.config/wezterm/colorschemes" }
-- M.colors = {} -- checkout this: https://wezfurlong.org/wezterm/config/appearance.html#defining-your-own-colors
-- M.font = wezterm.font_with_fallback{
--   { 
--     family = "Iosevka-Regular", -- your font family, or can use sub font family like : "JetBrains Mono Regular"
--     -- weight = "Regular", -- values can be: "Thin", "ExtraLight", "Light", "DemiLight", "Book", "Regular", "Medium", "DemiBold", "Bold", "ExtraBold", "Black", "ExtraBlack" 
--                         -- this can be also like: bold = true, false
--     stretch = "Expanded", -- values can be: "Normal", "UltraCondensed", "ExtraCondensed", "Condensed", "SemiCondensed", "Normal", "SemiExpanded", "Expanded", "ExtraExpanded", "UltraExpanded"
--     -- style = "Normal", -- values can be: "Normal", "Italic", "Oblique"
--     --                   -- this can be also like: italic = true, false
--     -- italic = false, -- true, false
--     -- scale = 2.0 -- values can be: 0.1, 0.2 .. 1.0 (default) .. 1.4 ....
--   },
--   -- { family = "Iosevka Nerd Font Mono", weight = "Regular", stretch = "Normal", italic = false, scale = 1.8 }, -- this is symbols only type font, can be smaller or larger by change scale vlaue
--   -- { family = "Symbols Nerd Font Mono", weight = "Regular", stretch = "Normal", italic = false, scale = 0.8 }, -- this is symbols only type font, can be smaller or larger by change scale vlaue
-- }
-- M.font_rules = {
--   {
--     italic = true,  -- true, false
--     -- invisible = true, -- true, false
--     -- reverse = false,  -- true, false
--     -- strikethrough = false -- true, false
--     -- underline = "None", -- values can be: "None", "Single", "Double"
--     -- blink = "None", -- values can be: "None", "Rapid", "Slow"
--     intensity = "Normal", -- values can be: "Normal", "Half", "Bold"
--     font = wezterm.font_with_fallback{
--       { family = "Symbols Nerd Font Mono", weight = "Regular", stretch = "Expanded", style = "Italic",  scale = 0.8 },
--     },
--   },
-- }
