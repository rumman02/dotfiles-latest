local wezterm = require("wezterm") -- pull in the wezterm api
---@diagnostic disable-next-line: unused-local
local config = wezterm.config_builder() -- this will hold the configuration.

if wezterm.config_builder then
	---@diagnostic disable-next-line: unused-local
	config = wezterm.config_builder()
end

-- for zen mode of neovim, folke/zen-mode
local zen_mode =  function(window, pane, name, value)
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
end
wezterm.on('user-var-changed', zen_mode)

local M = {}

M.check_for_updates = true
M.font = wezterm.font_with_fallback {
	{ family = "JetBrains Mono" },
	-- { family = "Iosevka", weight = "Medium", stretch = "Expanded" },
	{ family = "LigatureSymbols", scale = 0.9 },
	{ family = "Noto Color Emoji", scale = 0.9 },
	{ family = "Symbols Nerd Font Mono", scale = 0.9 },
}
M.font_size = 11
-- M.line_height = 0.97
M.enable_tab_bar = false
M.window_decorations = "RESIZE"
M.hide_mouse_cursor_when_typing = true
M.underline_thickness = "1px"
M.cursor_blink_rate = 250
M.cursor_blink_ease_in = "Constant"
M.cursor_blink_ease_out = "Constant"
M.default_cursor_style = "BlinkingBlock"	-- options : SteadyBlock, SteadyUnderline, SteadyBar, BlinkingBlock, BlinkingUnderline, BlinkingBar
M.window_background_opacity = 1.0 			-- options : 0 full transparent, 1 no transparent (ex: 0.3, 0.9)
M.text_background_opacity = 1.0 			-- options : 0 full transparent, 1 no transparent (ex: 0.3, 0.9)
M.macos_window_background_blur = 100		-- options : 0 no blur, 100 full blur
M.window_close_confirmation = "AlwaysPrompt" -- options : AlwaysPrompt, NeverPrompt
M.audible_bell = "Disabled"
M.window_padding = {
	left = 2,
	right = 1,
	top = 1,
	bottom = 1
}
M.color_scheme = "Gruvbox Dark (Gogh)"
M.enable_wayland = false

return M
