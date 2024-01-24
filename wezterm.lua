local wezterm = require("wezterm")
local styles = require("styles")
local keymaps = require("keymaps")
local smart_splits = require("smart_splits")
local act = wezterm.action
local config = {}

local wezterm_config_nvim = wezterm.plugin.require("https://github.com/winter-again/wezterm-config.nvim")
config.automatically_reload_config = true
wezterm.on("user-var-changed", function(window, pane, name, value)
	local overrides = window:get_config_overrides() or {}
	overrides = wezterm_config_nvim.override_user_var(overrides, name, value, profile_data)
	window:set_config_overrides(overrides)
end)

-- zen-mode from folke
wezterm.on("user-var-changed", function(window, pane, name, value)
	local overrides = window:get_config_overrides() or {}
	if name == "ZEN_MODE" then
		local incremental = value:find("+")
		local number_value = tonumber(value)
		if incremental ~= nil then
			while number_value > 0 do
				window:perform_action(wezterm.action.IncreaseFontSize, pane)
				number_value = number_value - 1
			end
			overrides.enable_tab_bar = false
		elseif number_value < 0 then
			window:perform_action(wezterm.action.ResetFontSize, pane)
			overrides.font_size = nil
			overrides.enable_tab_bar = true
		else
			overrides.font_size = number_value
			overrides.enable_tab_bar = false
		end
	end
	window:set_config_overrides(overrides)
end)
-- rest of your config
-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

styles.apply_to_config(config)
keymaps.apply_to_config(config)

local project = require("project")

wezterm.on("gui-startup", function()
	local base_dir = wezterm.config_dir .. "/projects"
	project.startup("WZ_PROJECT", base_dir, wezterm)
end)
return config
