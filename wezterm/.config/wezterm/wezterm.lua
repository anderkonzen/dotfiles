-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration
local config = wezterm.config_builder()

-- General
--
config.audible_bell = "Disabled"
config.enable_scroll_bar = true
config.status_update_interval = 5000

-- Theme
--
config.color_scheme = "Tomorrow Night Eighties"

-- Window
--
config.window_frame = {
	font = wezterm.font({ family = "Hack Nerd Font Mono", weight = "Bold" }),
	font_size = 13.0,
}

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_padding = {
	left = "0.5cell",
	right = "1cell",
	top = "0cell",
	bottom = "0.5cell",
}

config.window_background_opacity = 0.9
config.macos_window_background_blur = 20
config.text_background_opacity = 0.8

config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.7,
}

-- Font
--
config.font = wezterm.font({ family = "Hack Nerd Font Mono" })
config.font_size = 14

-- Keys
--
local keys = require("keys")

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

config.keys = {
	-- Sends ESC + b and ESC + f sequence, which is used
	-- for telling your shell to jump back/forward.
	{
		-- When the left arrow is pressed
		key = "LeftArrow",
		-- With the "Option" key modifier held down
		mods = "OPT",
		-- Perform this action, in this case - sending ESC + B
		-- to the terminal
		action = wezterm.action.SendString("\x1bb"),
	},
	{
		key = "RightArrow",
		mods = "OPT",
		action = wezterm.action.SendString("\x1bf"),
	},

	{
		key = "|",
		-- Note that instead of a key modifier mapped to a key on your keyboard
		-- like CTRL or ALT, we can use the LEADER modifier instead.
		-- This means that this binding will be invoked when you press the leader
		-- (CTRL + A), quickly followed by pipe (|).
		mods = "LEADER",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "-",
		mods = "LEADER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},

	-- Create new tab
	{
		key = "N",
		mods = "LEADER",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},

	-- Move to tab
	{
		key = "h",
		mods = "LEADER|CTRL",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		key = "l",
		mods = "LEADER|CTRL",
		action = wezterm.action.ActivateTabRelative(1),
	},

	-- Toggle pane zoom
	{
		key = "z",
		mods = "LEADER",
		action = wezterm.action.TogglePaneZoomState,
	},

	keys.move_pane("j", "Down"),
	keys.move_pane("k", "Up"),
	keys.move_pane("h", "Left"),
	keys.move_pane("l", "Right"),

	{
		-- When we push LEADER + R...
		key = "r",
		mods = "LEADER",
		-- Activate the `resize_panes` keytable
		action = wezterm.action.ActivateKeyTable({
			name = "resize_panes",
			-- Ensures the keytable stays active after it handles its
			-- first keypress.
			one_shot = false,
			-- Deactivate the keytable after a timeout.
			timeout_milliseconds = 1000,
		}),
	},

	-- Rename current tab
	{
		key = "t",
		mods = "LEADER",
		action = wezterm.action.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, _, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
}

config.key_tables = {
	resize_panes = {
		keys.resize_pane("j", "Down"),
		keys.resize_pane("k", "Up"),
		keys.resize_pane("h", "Left"),
		keys.resize_pane("l", "Right"),

		-- Cancel the mode by pressing escape
		{ key = "Escape", action = "PopKeyTable" },
	},
}

-- Status Bar
--

local action_update_status = require("action_update_status")

wezterm.on("update-status", function(window, pane)
	action_update_status.handle(window, pane)
end)

-- Tabs
--

local action_format_tab_title = require("action_format_tab_title")

wezterm.on("format-tab-title", function(tab, _, _, _, _, _)
	action_format_tab_title.hadle(tab)
end)

-- and finally, return the configuration to wezterm
return config
