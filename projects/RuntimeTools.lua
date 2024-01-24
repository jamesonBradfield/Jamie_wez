
local function startup(wezterm)
    local mux = wezterm.mux
    local project_dir = wezterm.home_dir

    local tab, main_pane, window = mux.spawn_window {
        cwd = project_dir,
    }

    local komorebic_pane = main_pane:split {
        direction = 'Right',
        cwd = project_dir .. '.config/komorebi/',
    }
    komorebic_pane:send_text 'komorebic start -a\r'

    local yasb_pane = komorebic_pane:split {
        direction = 'Bottom',
        cwd = "C:/Program Files/Yasb",
    }
    yasb_pane:send_text 'python3.11 src/main.py\r'
end

return {
    startup = startup
}

