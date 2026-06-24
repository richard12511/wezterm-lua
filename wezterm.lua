-- ~/.config/wezterm/wezterm.lua
-- Adapted from Kun Chen's setup (rose-pine-moon, Hack Nerd Font, CTRL+Space leader).
-- This keeps WezTerm's default key bindings (copy/paste/etc.) and layers his
-- tmux-style leader bindings on top, so nothing built-in breaks.

local wezterm = require("wezterm")
local config = wezterm.config_builder()

local is_windows = os.getenv("OS") and os.getenv("OS"):lower():find("windows")
local is_macos = wezterm.target_triple:lower():find("darwin") ~= nil

-- ui
config.color_scheme = "rose-pine-moon"
config.max_fps = 120
config.font = wezterm.font("Hack Nerd Font", { weight = "Regular" })

config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "TITLE | RESIZE"
config.window_frame = {
  font = wezterm.font("Hack Nerd Font", { weight = "Bold" }),
}

config.inactive_pane_hsb = {
  saturation = 0.0,
  brightness = 0.5,
}

if is_windows then
  config.win32_system_backdrop = "Acrylic"
  config.window_background_opacity = 0.7
  config.window_frame.font_size = 10.0
end

if is_macos then
  config.window_background_opacity = 0.8
  config.macos_window_background_blur = 50
  config.font_size = 15.0
  config.window_frame.font_size = 13.0
end

-- shell
if is_windows then
  config.default_domain = "WSL:Ubuntu-24.04"
end

-- keys
local maximize_window = wezterm.action_callback(function(window, _pane)
  window:maximize()
end)

-- Leader key, just like Kun's: Ctrl+Space, then a second key.
config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 2000 }

-- NOTE: default key bindings are intentionally LEFT ENABLED, so Cmd+C / Cmd+V,
-- font resize, etc. all keep working. These entries are added on top.
config.keys = {
  -- maximize the window
  { key = "m", mods = "LEADER", action = maximize_window },

  -- tabs
  { key = "c", mods = "LEADER", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
  { key = "n", mods = "LEADER", action = wezterm.action.ActivateTabRelative(1) },
  { key = "p", mods = "LEADER", action = wezterm.action.ActivateTabRelative(-1) },

  -- splits (mnemonics match tmux: " = horizontal divider, % = vertical divider)
  { key = '"', mods = "LEADER", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "%", mods = "LEADER", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

  -- move between panes with h/j/k/l
  { key = "h", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Left") },
  { key = "j", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Down") },
  { key = "k", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Up") },
  { key = "l", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Right") },

  -- pane management
  { key = "x", mods = "LEADER", action = wezterm.action.CloseCurrentPane({ confirm = true }) },
  { key = "z", mods = "LEADER", action = wezterm.action.TogglePaneZoomState },

  -- jump straight to a tab by number
  { key = "1", mods = "LEADER", action = wezterm.action.ActivateTab(0) },
  { key = "2", mods = "LEADER", action = wezterm.action.ActivateTab(1) },
  { key = "3", mods = "LEADER", action = wezterm.action.ActivateTab(2) },
  { key = "4", mods = "LEADER", action = wezterm.action.ActivateTab(3) },
  { key = "5", mods = "LEADER", action = wezterm.action.ActivateTab(4) },
}

return config
