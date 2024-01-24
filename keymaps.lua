-- I am keymaps.lua and I should live in ~/.config/wezterm/keymaps.lua

local wezterm = require("wezterm")
local act = wezterm.action
-- This is the module table that we will export
local module = {}

-- This function is private to this module and is not visible
-- outside.

-- define a function in the module table.
-- Only functions defined in `module` will be exported to
-- code that imports this module.
-- The suggested convention for making modules that update
-- the config is for them to export an `apply_to_config`
-- function that accepts the config object, like this:
function module.apply_to_config(config)
	config.disable_default_key_bindings = true
	config.mouse_bindings = {
		-- Scrolling up while holding CTRL increases the font size
		{
			event = { Down = { streak = 1, button = { WheelUp = 1 } } },
			mods = "CTRL",
			action = act.IncreaseFontSize,
		},

		-- Scrolling down while holding CTRL decreases the font size
		{
			event = { Down = { streak = 1, button = { WheelDown = 1 } } },
			mods = "CTRL",
			action = act.DecreaseFontSize,
		},
	}
	Prefix = "CTRL"
	scalingPrefix = "CTRL|SHIFT"
	swappingPrefix = "CTRL|ALT"
	config.keys = {
		-- pane navigation.
		{
			key = "h",
			mods = Prefix,
			-- wezterm will "eat" maps for keys not sending them to the terminal.
			-- the fix is act.SendKey.
			action = act.Multiple({
				act.ActivatePaneDirection("Left"),
				act.SendKey({
					key = "h",
					mods = Prefix,
				}),
			}),
		},
		{
			key = "l",
			mods = Prefix,
			-- wezterm will "eat" maps for keys not sending them to the terminal.
			-- the fix is act.SendKey.
			action = act.Multiple({
				act.ActivatePaneDirection("Right"),
				act.SendKey({
					key = "l",
					mods = Prefix,
				}),
			}),
		},
		{
			key = "k",
			mods = Prefix,
			-- wezterm will "eat" maps for keys not sending them to the terminal.
			-- the fix is act.SendKey.
			action = act.Multiple({
				act.ActivatePaneDirection("Up"),
				act.SendKey({
					key = "k",
					mods = Prefix,
				}),
			}),
		},
		{
			key = "j",
			mods = Prefix,
			-- wezterm will "eat" maps for keys not sending them to the terminal.
			-- the fix is act.SendKey.
			action = act.Multiple({
				act.ActivatePaneDirection("Down"),
				act.SendKey({
					key = "j",
					mods = Prefix,
				}),
			}),
		},
		{
			key = "h",
			mods = scalingPrefix,
			action = act.Multiple({
				act.AdjustPaneSize({ "Left", 5 }),
				act.SendKey({
					key = "h",
					mods = scalingPrefix,
				}),
			}),
		},
		{
			key = "j",
			mods = scalingPrefix,
			action = act.Multiple({
				act.AdjustPaneSize({ "Down", 5 }),
				act.SendKey({
					key = "j",
					mods = scalingPrefix,
				}),
			}),
		},
		{
			key = "k",
			mods = scalingPrefix,
			action = act.Multiple({
				act.AdjustPaneSize({ "Up", 5 }),
				act.SendKey({
					key = "k",
					mods = scalingPrefix,
				}),
			}),
		},
		{
			key = "l",
			mods = scalingPrefix,
			action = act.Multiple({
				act.AdjustPaneSize({ "Right", 5 }),
				act.SendKey({
					key = "l",
					mods = scalingPrefix,
				}),
			}),
		},
		-- tab navigation
		{
			key = "u",
			mods = Prefix,
			action = act.ActivateTabRelative(-1),
		},
		{
			key = "i",
			mods = Prefix,
			action = act.ActivateTabRelative(1),
		},
		{
			key = "-",
			mods = Prefix,
			action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }),
		},
		{
			key = "\\",
			mods = Prefix,
			action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
		},
		{
			key = "z",
			mods = Prefix,
			action = "TogglePaneZoomState",
		},
		{
			key = "o",
			mods = Prefix,
			action = act({ SpawnTab = "CurrentPaneDomain" }),
		},
		{
			key = "y",
			mods = Prefix,
			action = act({ CloseCurrentTab = { confirm = true } }),
		},
		{
			key = "x",
			mods = Prefix,
			action = act({ CloseCurrentPane = { confirm = true } }),
		},
		{
			key = "v",
			mods = "CTRL|SHIFT",
			action = act.PasteFrom("Clipboard"),
		},
		{
			key = "c",
			mods = "CTRL|SHIFT",
			action = act.CopyTo("Clipboard"),
		},
		-- CTRL-SHIFT-d activates the debug overlay
		{
			key = "d",
			mods = scalingPrefix,
			action = wezterm.action.ShowDebugOverlay,
		},
		{
			key = " ",
			mods = Prefix,
			action = wezterm.action.QuickSelect,
		},
	}
end

return module
