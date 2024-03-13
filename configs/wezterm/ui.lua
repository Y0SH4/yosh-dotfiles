local wezterm = require("wezterm")

local format_title = function(title, is_active, max_width)
	local background = { Background = { Color = "#1f1f28" } }
	local title_len = #title
	local pad_len = math.floor((max_width - title_len) / 2)

	local formatted_title = {
		Text = string.rep(" ", pad_len) .. title .. string.rep(" ", pad_len),
	}
	if is_active then
		return { background, { Foreground = { Color = "#957fb8" } }, formatted_title }
	else
		return { background, { Foreground = { Color = "#cad3f5" } }, formatted_title }
	end
end

local user_var_tab_title_key = "tab_title"
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	-- if there is title already set, proceed with it
	if type(tab.tab_title) == "string" and #tab.tab_title > 0 then
		return format_title(tab.tab_title, tab.is_active, max_width)
	end
	return format_title("temp", tab.is_active, max_width)
end)

wezterm.on("update-right-status", function(window)
	local date = wezterm.strftime("%Y-%m-%d %H:%M:%S")
	window:set_right_status({ Foreground = { Color = "#cad3f5" } }, wezterm.format({ { Text = " " .. date .. " " } }))
end)

wezterm.on("user-var-changed", function(window, pane, name, value)
	wezterm.log_info("user-var-changed", name, value)
	if name == user_var_tab_title_key then
		pane:tab():set_title(value)
	end
end)

return {
	font = wezterm.font("Operator Mono Lig"),
	color_scheme = "Catppuccin Macchiato",
	font_size = 12,
	-- dpi = 100.0,
	audible_bell = "Disabled",
	window_background_opacity = 0.9,
	cursor_blink_ease_in = "Constant",
	cursor_blink_ease_out = "Constant",
	animation_fps = 1,
	default_cursor_style = "BlinkingBlock",
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
	harfbuzz_features = {
		"calt=1",
		"clig=1",
		"liga=1",
		"zero",
		"onum",
		"ss1",
		"ss2",
		"ss3",
		"ss4",
		"ss5",
		"ss6",
		"ss7",
		"ss8",
		"ss9",
		"ss10",
		"cv01",
		"cv02",
		"cv03",
		"cv04",
		"cv05",
		"cv06",
		"cv07",
		"cv08",
		"cv09",
		"cv10",
		"cv11",
		"cv12",
		"cv13",
		"cv14",
		"cv15",
		"cv16",
		"cv17",
		"cv18",
		"cv19",
		"cv20",
		"cv21",
		"cv22",
		"cv23",
		"cv24",
		"cv25",
		"cv26",
		"cv27",
		"cv28",
		"cv29",
		"cv30",
		"cv31",
	},
}
