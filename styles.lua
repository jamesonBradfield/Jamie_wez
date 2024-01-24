-- I am styles.lua and I should live in ~/.config/wezterm/styles.lua

local wezterm = require("wezterm")

-- This is the module table that we will export
local module = {}

-- define a function in the module table.
-- Only functions defined in `module` will be exported to
-- code that imports this module.
-- The suggested convention for making modules that update
-- the config is for them to export an `apply_to_config`
-- function that accepts the config object, like this:
function module.apply_to_config(config)
	config.scrollback_lines = 5000
	config.adjust_window_size_when_changing_font_size = false
	config.default_cursor_style = "BlinkingBlock"
	-- config.cursor_blink_rate = 300
	config.hide_tab_bar_if_only_one_tab = true
	config.tab_max_width = 15
	config.color_scheme = "Catppuccin Mocha"
	config.term = "wezterm"
	config.colors = {
		tab_bar = {
			-- The color of the strip that goes along the top of the window
			-- (does not apply when fancy tab bar is in use)
			background = "#2a2b3c",

			-- The active tab is the one that has focus in the window
			active_tab = {
				-- The color of the background area for the tab
				bg_color = "#1e1e2e",
				-- The color of the text for the tab
				fg_color = "#aab3f0",

				-- Specify whether you want "Half", "Normal" or "Bold" intensity for the
				-- label shown for
				-- The default is "Normal"
				intensity = "Normal",

				-- Specify whether you want "None", "Single" or "Double" underline for
				-- label shown for this tab.
				-- The default is "None"
				underline = "None",

				-- Specify whether you want the text to be italic (true) or not (false)
				-- for this tab.  The default is false.
				italic = false,

				-- Specify whether you want the text to be rendered with strikethrough (true)
				-- or not for this tab.  The default is false.
				strikethrough = false,
			},
			-- Inactive tabs are the tabs that do not have focus
			inactive_tab = {
				bg_color = "#191b28",
				fg_color = "#555e87",

				-- The same options that were listed under the `active_tab` section above
				-- can also be used for `inactive_tab`.
			},

			-- The new tab button that let you create new tabs
			new_tab = {
				bg_color = "#2a2b3c",
				fg_color = "#555e87",

				-- The same options that were listed under the `active_tab` section above
				-- can also be used for `new_tab`.
			},

			-- You can configure some alternate styling when the mouse pointer
			-- moves over the new tab button
			new_tab_hover = {
				bg_color = "#3b3052",
				fg_color = "#909090",
				italic = true,

				-- The same options that were listed under the `active_tab` section above
				-- can also be used for `new_tab_hover`.
			},
		},
	}
	-- https://wezfurlong.org/wezterm/config/lua/wezterm/font.html?h=font
	config.font = wezterm.font("BigBlueTerm437 Nerd Font Mono")
	config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
	config.force_reverse_video_cursor = true
	config.check_for_updates = false
	config.inactive_pane_hsb = {
		hue = 1.0,
		saturation = 1.0,
		brightness = 0.1,
	}
	config.window_padding = {
		left = "0cell",
		right = "0cell",
		top = "0cell",
		bottom = "0cell",
	}

	config.window_frame = {
		font = wezterm.font({ family = "BigBlueTerm437", weight = "Regular" }),
	}
	config.use_fancy_tab_bar = false
	config.default_prog = { "powershell" }
	config.font_size = 20
end

-- return our module table
return module
