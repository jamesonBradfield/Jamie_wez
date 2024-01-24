
local file_exists = function(name)
    local file = io.open(name, "r")
    if file ~= nil then
        io.close(file)
        return true
    else
        return false
    end
end

local startup = function(env_var, base_path, wezterm)
    local project = os.getenv(env_var)

    if project == nil then return end

    -- Check that the file actually exists
    local project_path = base_path .. "/" .. project
    if not file_exists(project_path) then
        wezterm.log_error("Project file does not exist: " .. project_path)
        return
    end

    local project_config = dofile(project_path)
    --                       ^ this import and execute a lua file (because it's not in package.path)
    local project_startup = project_config.startup
    -- Here I defined the contract that a project config needs to export a function called `startup`.

    -- Check the project_startup is set and is a function
    if project_startup == nil or type(project_startup) ~= "function" then
        wezterm.log_error("Project " ..
            project .. " has no exported 'startup' function (type is " .. type(project_startup) .. ")")
        return
    end

    -- Finally let's setup the project
    project_startup(wezterm)
end

return {
    startup = startup
}
