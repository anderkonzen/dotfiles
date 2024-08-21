local module = {}

-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()` or
-- `wezterm cli set-tab-title`, but falls back to the title of the active pane
-- in that tab.
local function tab_title(tab_info)
	local title = tab_info.tab_title
	-- If the tab title is explicitly set, take that
	if title and #title > 0 then
		return title
	end
	-- Otherwise, use the title from the active pane in that tab
	return tab_info.active_pane.title
end

function module.handle(tab)
	local zoomed = ""
	local space = "  "
	if tab.active_pane.is_zoomed then
		zoomed = "🔍 "
	end

	return zoomed .. tab.tab_index .. ": " .. tab_title(tab) .. space
end

return module
