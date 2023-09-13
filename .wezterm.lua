local wezterm = require 'wezterm'


local config = {}
-- other key mappings
-- shift to different panes 
--  ctrl shift <arrow_keys>
--adjust pane sizes
--  ctrl shift alt <arrow_keys>
--
config.leader = {key = 'b', mods = 'CTRL', timeout_milliseconds = 1000}
config.keys = {
        {
                key = '|',
                mods = 'LEADER|SHIFT',
                action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain"},
        },
        {
                key = '-',
                mods = 'LEADER',
                action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain"}
        },
}

config.font = wezterm.font 'JetBrains Mono'
config.font_size = 10.0
config.color_scheme = "Kanagawabones"
config.window_background_opacity = 1
config.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'
config.canonicalize_pasted_newlines= nil
config.inactive_pane_hsb = { saturation = 0.8, brightness = 0.4}
config.window_background_image_hsb = { brightness = 0.05, hue = 1.0, saturation = 1.0}
config.window_background_opacity = 1.0
config.force_reverse_video_cursor = true
config.text_background_opacity = .8
config.foreground_text_hsb = {
  hue = .90,
  saturation = 1.5,
  brightness = 1.2,
}
return config;
