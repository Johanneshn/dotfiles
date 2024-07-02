-- Pull in the wezterm API
local wezterm = require("wezterm")
local tab = require("tab")
local fonts = require("fonts")
local keys = require("keys")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end
config.color_scheme = "Kanagawa (Gogh)"
config.term = "wezterm"
config.warn_about_missing_glyphs = true
config.enable_scroll_bar = false
config.window_padding = {
	left = "0.5cell",
	right = "0cell",
	top = "1.50cell",
	bottom = "0cell",
}
config.scrollback_lines = 10000
config.window_decorations = "INTEGRATED_BUTTONS"

config.window_background_opacity = 0.9
config.text_background_opacity = 0.4
config.macos_window_background_blur = 50
config.animation_fps = 60

config.initial_rows = 40
config.initial_cols = 150

config.command_palette_rows = 14
config.command_palette_bg_color = "#1a1b26"
config.command_palette_fg_color = "#959cbd"
config.show_update_window = false
config.check_for_updates = false

config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 800

config.default_prog = { "pwsh.exe", "-NoLogo" }

tab.setup(config)
fonts.setup(config)
keys.setup(config)
return config
