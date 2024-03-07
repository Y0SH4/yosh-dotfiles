-- Pull in the wezterm API
local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Macchiato"
config.window_background_opacity = 0.90
config.enable_tab_bar = false
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.animation_fps = 1
config.default_cursor_style = "BlinkingBlock"
config.font = wezterm.font("Operator Mono Lig", { weight = "Bold", stretch = "Normal", italic = false })
config.harfbuzz_features = {
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
}

-- Switch from tmux to wezterm

config.leader = { key = "a", mods = "ALT", timeout_milliseconds = 1000 }
config.keys = {
	-- splitting
	{
		mods = "LEADER",
		key = "-",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "=",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
}
return config
