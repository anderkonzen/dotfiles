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
	brightness = 0.3,
}

-- Font
--
config.font = wezterm.font({ family = "Hack Nerd Font Mono" })
config.font_size = 15

-- Keys
--
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

local function move_pane(key, direction)
	return {
		key = key,
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection(direction),
	}
end

local function resize_pane(key, direction)
	return {
		key = key,
		action = wezterm.action.AdjustPaneSize({ direction, 3 }),
	}
end

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

	move_pane("j", "Down"),
	move_pane("k", "Up"),
	move_pane("h", "Left"),
	move_pane("l", "Right"),

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
}

config.key_tables = {
	resize_panes = {
		resize_pane("j", "Down"),
		resize_pane("k", "Up"),
		resize_pane("h", "Left"),
		resize_pane("l", "Right"),

		-- Cancel the mode by pressing escape
		{ key = "Escape", action = "PopKeyTable" },
	},
}

-- Status Bar
--
local function my_ip(pane)
	local DOTFILES = pane:get_user_vars().DOTFILES

	if DOTFILES then
		local _, lan_ip, _ = wezterm.run_child_process({ DOTFILES .. "/_bin/lan_ip.sh" })
		local _, public_ip, _ = wezterm.run_child_process({ "curl", "https://pppong.fly.dev" })
		if lan_ip and public_ip then
			return string.gsub(lan_ip, "%s+", "") .. " | " .. string.gsub(public_ip, "%s+", "")
		else
			return "N/A"
		end
	else
		return "N/A"
	end
end

local function tunes(pane)
	local DOTFILES = pane:get_user_vars().DOTFILES

	if DOTFILES then
		local _, tune, _ = wezterm.run_child_process({ "osascript", DOTFILES .. "/_applescripts/tunes.scpt" })
		if tune then
			return string.gsub(tune, "[\n\r]", "")
		else
			return ""
		end
	else
		return ""
	end
end

wezterm.on("update-status", function(window, pane)
	local separator = "   "

	local ip = my_ip(pane)
	local tune = tunes(pane)

	local status = wezterm.format({
		"ResetAttributes",
		{ Foreground = { Color = "#99cc99" } },
		{ Text = tune },
		{ Text = separator },
		{ Foreground = { Color = "#f2777a" } },
		{ Text = ip },
		{ Text = separator },
		{ Foreground = { Color = "#ffcc66" } },
		{ Text = wezterm.strftime("%a %b %-d %H:%M") .. " " },
	})

	window:set_right_status(status)
end)

-- Tabs
--
wezterm.on("format-tab-title", function(tab, _, _, _, _, _)
	local zoomed = ""
	if tab.active_pane.is_zoomed then
		zoomed = "🔍 "
	end

	return zoomed .. tab.active_pane.title
end)

-- and finally, return the configuration to wezterm
return config
