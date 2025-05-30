-- __          ________ _____________ ______ _____  __  __ 
-- \ \        / /  ____|___  /__   __|  ____|  __ \|  \/  |
--  \ \  /\  / /| |__     / /   | |  | |__  | |__) | \  / |
--   \ \/  \/ / |  __|   / /    | |  |  __| |  _  /| |\/| |
--    \  /\  /  | |____ / /__   | |  | |____| | \ \| |  | |
--     \/  \/   |______/_____|  |_|  |______|_|  \_\_|  |_|
-- https://wezfurlong.org/wezterm/config/files.html                                                         

--==================================================-- 
--                      config                      -- 
--==================================================-- 
local wezterm = require("wezterm")
local config = wezterm.config_builder()

--==================================================-- 
--                       font                       -- 
--==================================================-- 
-- https://wezfurlong.org/wezterm/config/lua/wezterm/font_with_fallback.html
-- https://wezfurlong.org/wezterm/config/lua/config/font_size.html
-- https://wezfurlong.org/wezterm/config/lua/config/font_rules.html
-- https://wezfurlong.org/wezterm/config/lua/config/bold_brightens_ansi_colors.html
-- find fonts by wezterm: wezterm ls-fonts --list-system
-- <family>, <weight>, <stretch>, <italic>
-- <weigth> = Regular, Medeium, Bold
-- <stretch> = Expanded, Normal
config.font = wezterm.font_with_fallback {
	{ family = "JetBrainsMono Nerd Font", weight = "Regular" }, -- set font here, this is set as font rules | Iosevka, Iosevka Extended, Iosevka Nerd Font, JetBrains Mono, JetBrainsMono Nerd Font, ZedMono Nerd Font
	{ family = "Symbols Nerd Font Mono", scale = 0.9 }
}
config.font_size = 10.5
config.bold_brightens_ansi_colors = "BrightAndBold" -- true, No, BrightAndBold, BrightOnly

--==================================================-- 
--                    adjustment                    -- 
--==================================================-- 
-- https://wezfurlong.org/wezterm/config/lua/config/cell_width.html
-- https://wezfurlong.org/wezterm/config/lua/config/line_height.html
-- https://wezfurlong.org/wezterm/config/lua/config/underline_thickness.html
config.cell_width = 1.0
config.line_height = 1.0
config.underline_thickness = "1px"

--==================================================-- 
--                    decoration                    -- 
--==================================================-- 
-- https://wezfurlong.org/wezterm/config/lua/config/enable_tab_bar.html
-- https://wezfurlong.org/wezterm/config/lua/config/window_decorations.html
-- https://wezfurlong.org/wezterm/config/lua/config/window_padding.html
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 0,
	top = 0,
	right = 0,
	bottom = 0
}

--==================================================-- 
--                      cursor                      -- 
--==================================================-- 
-- https://wezfurlong.org/wezterm/config/lua/config/default_cursor_style.html 
-- https://wezfurlong.org/wezterm/config/lua/config/cursor_blink_rate.html
-- https://wezfurlong.org/wezterm/config/lua/config/cursor_blink_ease_in.html
-- https://wezfurlong.org/wezterm/config/lua/config/cursor_blink_ease_out.html
-- https://wezfurlong.org/wezterm/config/lua/config/hide_mouse_cursor_when_typing.html
config.default_cursor_style = "BlinkingBlock" -- SteadyBlock, SteadyUnderline, SteadyBar, BlinkingBlock, BlinkingUnderLine, BlinkingBar
config.cursor_blink_rate = 333 -- ms
config.cursor_blink_ease_in = "Linear" -- Linear, Constant, Ease, EaseIn, EaseOut, EaseInOut
config.cursor_blink_ease_out = "Linear" -- Linear, Constant, Ease, EaseIn, EaseOut, EaseInOut
config.hide_mouse_cursor_when_typing = true

--==================================================-- 
--                     opacity                      -- 
--==================================================-- 
-- https://wezfurlong.org/wezterm/config/appearance.html#window-background-opacity
-- https://wezfurlong.org/wezterm/config/appearance.html#text-background-opacity
-- https://wezfurlong.org/wezterm/config/lua/config/macos_window_background_blur.html
config.window_background_opacity = 1.0 -- 0 to 1.0
config.text_background_opacity = 1.0 -- 0 to 1.0
config.macos_window_background_blur = 100 -- 0 to 100

--==================================================-- 
--                     setting                      -- 
--==================================================-- 
-- https://wezfurlong.org/wezterm/config/lua/config/check_for_updates.html
-- https://wezfurlong.org/wezterm/config/lua/config/audible_bell.html
-- https://wezfurlong.org/wezterm/config/lua/config/adjust_window_size_when_changing_font_size.html
-- https://wezfurlong.org/wezterm/config/lua/config/enable_wayland.html
-- https://wezfurlong.org/wezterm/config/lua/config/automatically_reload_config.html
-- https://wezfurlong.org/wezterm/config/lua/config/window_close_confirmation.html
-- https://wezfurlong.org/wezterm/config/lua/config/freetype_render_target.html
-- https://wezfurlong.org/wezterm/config/lua/config/animation_fps.html
-- https://wezfurlong.org/wezterm/config/lua/config/warn_about_missing_glyphs.html
-- https://wezfurlong.org/wezterm/config/lua/config/enable_scroll_bar.html
config.check_for_updates = true
config.audible_bell = "Disabled"
config.adjust_window_size_when_changing_font_size = false
config.enable_wayland = false -- false, this will run wezterm for wayland
config.automatically_reload_config = true
config.window_close_confirmation = "NeverPrompt" -- NeverPrompt, AlwaysPrompt
config.freetype_render_target = "Normal" -- Normal, Light, Mono, HorizontalLcd
config.animation_fps = 75
config.warn_about_missing_glyphs = true
config.enable_scroll_bar = false
config.max_fps = 120

--==================================================-- 
--                   colorscheme                    -- 
--==================================================-- 
-- https://wezfurlong.org/wezterm/colorschemes/index.html
config.color_scheme = "Gruvbox Dark (Gogh)"

--==================================================-- 
--                 plugin setting                   -- 
--==================================================-- 
-- https://github.com/folke/zen-mode.nvim?tab=readme-ov-file#-plugins
wezterm.on('user-var-changed', function(window, pane, name, value)
    local overrides = window:get_config_overrides() or {}
    if name == "ZEN_MODE" then
        local incremental = value:find("+")
        local number_value = tonumber(value)
        if incremental ~= nil then
            while (number_value > 0) do
                window:perform_action(wezterm.action.IncreaseFontSize, pane)
                number_value = number_value - 1
            end
            overrides.enable_tab_bar = false
        elseif number_value < 0 then
            window:perform_action(wezterm.action.ResetFontSize, pane)
            overrides.font_size = nil
            overrides.enable_tab_bar = true
        else
            overrides.font_size = number_value
            overrides.enable_tab_bar = false
        end
    end
    window:set_config_overrides(overrides)
end)

return config -- must return config to wezterm

