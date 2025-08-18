local wezterm = require("wezterm")
local config = wezterm.config_builder()
local mux = wezterm.mux

config.default_domain = "WSL:WLinux"

config.font_size = 11
config.font = wezterm.font_with_fallback({
	"Comic Code Ligatures",
	"Symbols Nerd Font Mono",
})

config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "TITLE"
config.window_background_opacity = 0.98
config.hide_tab_bar_if_only_one_tab = true
config.color_scheme = "Gruvbox dark, hard (base16)"

wezterm.on("gui-startup", function(cmd)
	local screen = wezterm.gui.screens().active
	local ratio = 0.7
	local width, height = screen.width * ratio, screen.height * ratio
	local tab, pane, window = wezterm.mux.spawn_window({
		position = {
			x = (screen.width - width) / 2,
			y = (screen.height - height) / 2,
			origin = "ActiveScreen",
		},
	})
	window:gui_window():set_inner_size(width, height)
end)

return config
