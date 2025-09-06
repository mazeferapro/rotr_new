-- sh_gmap_loader.lua
-- Универсальный загрузчик для модуля galactic_map без зависимостей от "luna"

-- Базовая папка модуля
local MODULE_DIR = "gamemodes/starwarsrp/gamemode/modules/galactic_map"

-- Чтобы не грузить дважды при повторных include
if _G.__GMAP_LOADER_DONE then return end
_G.__GMAP_LOADER_DONE = true

if SERVER then AddCSLuaFile() end

-- === Хелперы ================================================================
local function is_sv(name)
    return string.StartWith(name, "sv_")
end
local function is_cl(name)
    return string.StartWith(name, "cl_")
end
local function is_sh(name)
    return string.StartWith(name, "sh_") or (not is_sv(name) and not is_cl(name))
end

local function include_file(path)
    local fname = string.GetFileFromFilename(path)
    if is_sv(fname) then
        if SERVER then include(path) end
    elseif is_cl(fname) then
        if SERVER then AddCSLuaFile(path) else include(path) end
    else -- shared/без префикса
        if SERVER then AddCSLuaFile(path) end
        include(path)
    end
end

local function include_dir(dir, recursive)
    recursive = recursive ~= false
    local files, dirs = file.Find(dir .. "/*.lua", "LUA")

    -- Сначала shared, затем server, затем client — чтобы порядок был предсказуем
    for _, f in ipairs(files or {}) do
        if is_sh(f) then include_file(dir .. "/" .. f) end
    end
    for _, f in ipairs(files or {}) do
        if is_sv(f) then include_file(dir .. "/" .. f) end
    end
    for _, f in ipairs(files or {}) do
        if is_cl(f) then include_file(dir .. "/" .. f) end
    end

    if recursive then
        for _, d in ipairs(dirs or {}) do
            include_dir(dir .. "/" .. d, true)
        end
    end
end

-- === Загрузка всего содержимого папки модуля ================================
-- Если хотите жёстко контролировать порядок, замените на явные include_dir(...)
include_dir(MODULE_DIR, true)
