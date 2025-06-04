-- __          ________ _____________ ______ _____  __  __ 
-- \ \        / /  ____|___  /__   __|  ____|  __ \|  \/  |
--  \ \  /\  / /| |__     / /   | |  | |__  | |__) | \  / |
--   \ \/  \/ / |  __|   / /    | |  |  __| |  _  /| |\/| |
--    \  /\  /  | |____ / /__   | |  | |____| | \ \| |  | |
--     \/  \/   |______/_____|  |_|  |______|_|  \_\_|  |_|
-- https://wezfurlong.org/wezterm/config/files.html                                                         

local wezterm = require("wezterm")
local keys = require("keybinds.keys")

return {
	--==================================================-- 
	--                       font                       -- 
	--==================================================-- 
	-- find fonts by wezterm: wezterm ls-fonts --list-system
	-- <family>, <weight>, <stretch>, <italic>
	-- <weigth> = Regular, Medeium, Bold
	-- <stretch> = Expanded, Normal
	---@diagnostic disable-next-line: undefined-field
	font = wezterm.font_with_fallback {
		--[[ set font here, this is set as font rules | Iosevka, Iosevka Extended,
		Iosevka Nerd Font, JetBrains Mono, JetBrainsMono Nerd Font, ZedMono Nerd Font ]]
		{ family = "JetBrainsMono Nerd Font", weight = "Regular" },
		{ family = "Symbols Nerd Font Mono", scale = 0.9 },
	},
	font_size = 10.5,
	bold_brightens_ansi_colors = "BrightAndBold", -- true, No, BrightAndBold, BrightOnly
	--==================================================-- 
	--                    adjustment                    -- 
	--==================================================-- 
	cell_width = 1.0,
	line_height = 1.0,
	-- underline_thickness = "1px",
	--==================================================-- 
	--                    decoration                    -- 
	--==================================================-- 
	enable_tab_bar = false,
	window_decorations = "RESIZE",
	window_padding = {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0
	},
	--==================================================-- 
	--                      cursor                      -- 
	--==================================================-- 
	default_cursor_style = "BlinkingBlock", -- SteadyBlock, SteadyUnderline, SteadyBar, BlinkingBlock, BlinkingUnderLine, BlinkingBar
	cursor_blink_rate = 333, -- ms
	cursor_blink_ease_in = "Linear", -- Linear, Constant, Ease, EaseIn, EaseOut, EaseInOut
	cursor_blink_ease_out = "Linear", -- Linear, Constant, Ease, EaseIn, EaseOut, EaseInOut
	hide_mouse_cursor_when_typing = true,
	--==================================================-- 
	--                     opacity                      -- 
	--==================================================-- 
	window_background_opacity = 1.0, -- 0 to 1.0
	text_background_opacity = 1.0, -- 0 to 1.0
	macos_window_background_blur = 100, -- 0 to 100
	--==================================================-- 
	--                     setting                      -- 
	--==================================================-- 
	check_for_updates = true,
	audible_bell = "Disabled",
	adjust_window_size_when_changing_font_size = false,
	enable_wayland = false, -- false, this will run wezterm for wayland
	front_end = "WebGpu",
	automatically_reload_config = true,
	window_close_confirmation = "NeverPrompt", -- NeverPrompt, AlwaysPrompt
	freetype_render_target = "Normal", -- Normal, Light, Mono, HorizontalLcd
	animation_fps = 75,
	warn_about_missing_glyphs = true,
	enable_scroll_bar = false,
	max_fps = 120,
	enable_kitty_keyboard = true,
	use_resize_increments = true,
	--==================================================-- 
	--                   colorscheme                    -- 
	--==================================================-- 
	color_scheme = "Gruvbox Dark (Gogh)",

	--==================================================-- 
	--                       keys                       -- 
	--==================================================-- 
	disable_default_key_bindings = true,

	--==================================================-- 
	--                 plugin settings                  -- 
	--==================================================-- 
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
}

