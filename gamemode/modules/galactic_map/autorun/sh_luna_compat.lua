--[[
    Luna compatibility shim
    Помещайте в:
    garrysmod/addons/<ваш_аддон>/lua/autorun/sh_luna_compat.lua

    Назначение:
    В некоторых сборках модули используют глобальную таблицу `luna` (luna.Include, luna.IncludeDir и т.п.).
    Если у вас её нет, эти вызовы ломаются с ошибкой "attempt to index global 'luna' (a nil value)".
    Этот файл создаёт минимальную совместимую оболочку, чтобы загрузчики могли работать.
]]

-- Если глобальной luna нет — создаём минимальную
if _G.luna == nil then
    _G.luna = {}
end

local luna = _G.luna

-- Безопасные include-обёртки
if not isfunction(luna.Include) then
    function luna.Include(path)
        if SERVER then AddCSLuaFile(path) end
        return include(path)
    end
end

if not isfunction(luna.IncludeSH) then
    function luna.IncludeSH(path)
        if SERVER then AddCSLuaFile(path) end
        return include(path)
    end
end

if not isfunction(luna.IncludeSV) then
    function luna.IncludeSV(path)
        if SERVER then return include(path) end
    end
end

if not isfunction(luna.IncludeCL) then
    function luna.IncludeCL(path)
        if SERVER then
            AddCSLuaFile(path)
        else
            return include(path)
        end
    end
end

-- Рекурсивная загрузка директорий по префиксам sh_/sv_/cl_
if not isfunction(luna.IncludeDir) then
    function luna.IncludeDir(dir, recursive)
        recursive = recursive ~= false -- по умолчанию true
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
                -- Если нет префикса, считаем shared
                luna.IncludeSH(full)
            end
        end

        if recursive then
            for _, d in ipairs(dirs or {}) do
                luna.IncludeDir(dir .. "/" .. d, true)
            end
        end
    end
end
