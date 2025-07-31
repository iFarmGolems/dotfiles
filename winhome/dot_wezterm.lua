local wezterm = require("wezterm")
local config = wezterm.config_builder()
local mux = wezterm.mux

config.default_domain = "WSL:WLinux"

config.font_size = 11
config.font = wezterm.font_with_fallback({
	"Comic Code Ligatures",
	"Symbols Nerd Font Mono",
})

config.window_background_opacity = 0.98
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "NONE"
config.color_scheme = "Gruvbox Dark (Gogh)"

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

return config
