local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.window_background_opacity = 0.95
config.window_decorations = "RESIZE"

config.font = wezterm.font("InputMono Nerd Font")
config.font_size = 13
config.use_ime = true


config.exit_behavior_messaging = "None"
config.color_scheme = "Hybrid"

config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

function tab_title(tab_info)
	local title = tab_info.tab_title
	if title and #title > 0 then
		return title
	end
	return tab_info.active_pane.title
end

wezterm.on("format-tab-title", function(tab, tabs, panes, local_config, hover, max_width)
	local edge_background = "transparent"
	local background = "transparent"
	local foreground = "#999"

	if tab.is_active then
		foreground = "#fff"
	end

	local edge_foreground = background
	local title = tab_title(tab)
	title = wezterm.truncate_right(title, max_width - 2)

	return {
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = " " },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = " " },
	}
end)

return config
