local wezterm = require("wezterm")

local config = {}
-- other key mappings
-- shift to different panes
-- ctrl shift <arrow_keys>
-- adjust pane sizes
-- ctrl shift alt <arrow_keys>
--
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{
		key = "|",
		mods = "LEADER|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "-",
		mods = "LEADER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
}

--config.enable_scroll_bar = false
-- config.mouse_bindings = {
-- 	-- Disable scrolling when NOT in alt-screen (shell, prompts)
-- 	{
-- 		event = { Down = { streak = 1, button = { WheelUp = 1 } } },
-- 		mods = "NONE",
-- 		alt_screen = false,
-- 		action = "DisableDefaultAssignment",
-- 	},
-- 	{
-- 		event = { Down = { streak = 1, button = { WheelDown = 1 } } },
-- 		mods = "NONE",
-- 		alt_screen = false,
-- 		action = "DisableDefaultAssignment",
-- 	},
-- }

config.font = wezterm.font("JetBrains Mono")
config.font_size = 14.0
config.color_scheme = "Catppuccin Mocha"
--config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.integrated_title_buttons = { "Hide", "Maximize", "Close" }
config.inactive_pane_hsb = { saturation = 0.8, brightness = 0.4 }
config.window_background_image_hsb = { brightness = 0.05, hue = 1.0, saturation = 1.0 }
config.window_background_opacity = 0.95
config.force_reverse_video_cursor = true
config.text_background_opacity = 1.0
config.foreground_text_hsb = {
	hue = 0.90,
	saturation = 1.5,
	brightness = 1.2,
}
return config
