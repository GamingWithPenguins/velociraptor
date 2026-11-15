local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.default_prog = { '/usr/bin/fish', '-l' }
config.enable_wayland = true
config.color_scheme = 'Noctalia'
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = 'NONE'
config.window_padding = {
  left = 10,
  right = 10,
  top = 8,
  bottom = 8,
}

return config
