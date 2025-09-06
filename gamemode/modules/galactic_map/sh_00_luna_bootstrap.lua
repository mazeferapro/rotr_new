-- sh_00_luna_bootstrap.lua
-- Этот файл должен грузиться раньше sh_gmap_loader.lua.
-- Положите его в ту же папку: gamemodes/starwarsrp/gamemode/modules/galactic_map/
-- Благодаря префиксу "00" большинство загрузчиков подключают его первым.

if SERVER then AddCSLuaFile() end

if _G.luna == nil then _G.luna = {} end
local luna = _G.luna

-- Универсальные обёртки
luna.Include = luna.Include or function(path)
    if SERVER then AddCSLuaFile(path) end
    return include(path)
end

luna.IncludeSH = luna.IncludeSH or function(path)
    if SERVER then AddCSLuaFile(path) end
    return include(path)
end

luna.IncludeSV = luna.IncludeSV or function(path)
    if SERVER then return include(path) end
end

luna.IncludeCL = luna.IncludeCL or function(path)
    if SERVER then
        AddCSLuaFile(path)
    else
        return include(path)
    end
end

luna.IncludeDir = luna.IncludeDir or function(dir, recursive)
    recursive = recursive ~= false
    local files, dirs = file.Find(dir .. "/*", "LUA")

    for _, fname in ipairs(files or {}) do
        local full = dir .. "/" .. fname
        if string.StartWith(fname, "sh_") then
            luna.IncludeSH(full)
        elseif string.StartWith(fname, "sv_") then
            luna.IncludeSV(full)
        elseif string.StartWith(fname, "cl_") then
            luna.IncludeCL(full)
        else
            luna.IncludeSH(full)
        end
    end

    if recursive then
        for _, d in ipairs(dirs or {}) do
            luna.IncludeDir(dir .. "/" .. d, true)
        end
    end
end
