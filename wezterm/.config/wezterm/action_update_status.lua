local wezterm = require("wezterm")

local module = {}

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

function module.handle(window, pane)
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
end

return module
