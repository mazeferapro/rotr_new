--[[
    Galactic Map – Quick Open (client)
    Помещайте этот файл в:
    garrysmod/addons/<ваш_аддон>/lua/autorun/client/gmap_quick_open.lua

    Что делает:
    • Добавляет плавающую кнопку на экране, по нажатию открывает карту.
    • Добавляет горячую клавишу F6 для открытия карты (можно выключить).
    • Не трогает существующее меню — просто даёт отдельный быстрый способ открыть систему.

    Как это работает:
    Мы не знаем точное имя функции/команды, которая открывает вашу карту (оно зависит от сборки).
    Поэтому тут есть «умный вызов», который последовательно пробует самые частые варианты:
      - глобальные объекты: gmap.Open(), GMAP.Open(), GMap.Open(), GALACTIC_MAP.Open(), etc.
      - консольные команды: gmap_open, gmap, galactic_map, open_galactic_map

    Если ваш проект использует другое имя — просто добавьте его в списки ниже.
]]

if SERVER then return end

local CVAR_PREFIX = "gmap_quickopen_"
local cv_enable_button = CreateClientConVar(CVAR_PREFIX .. "enable_button", "0", true, false, "Включить плавающую кнопку (1/0)")
local cv_enable_hotkey = CreateClientConVar(CVAR_PREFIX .. "enable_hotkey", "1", true, false, "Включить горячую клавишу F6 (1/0)")
local cv_btn_x = CreateClientConVar(CVAR_PREFIX .. "btn_x", "24", true, false, "Позиция X кнопки (в пикселях от левого края)")
local cv_btn_y = CreateClientConVar(CVAR_PREFIX .. "btn_y", "200", true, false, "Позиция Y кнопки (в пикселях от верхнего края)")
local cv_btn_w = CreateClientConVar(CVAR_PREFIX .. "btn_w", "160", true, false, "Ширина кнопки")
local cv_btn_h = CreateClientConVar(CVAR_PREFIX .. "btn_h", "44", true, false, "Высота кнопки")
local cv_btn_text = CreateClientConVar(CVAR_PREFIX .. "btn_text", "Galactic Map", true, false, "Текст на кнопке")

-- Популярные имена глобальных таблиц/функций
local OPEN_FUNCS = {
    function() if _G.gmap and isfunction(_G.gmap.Open) then _G.gmap.Open() return true end end,
    function() if _G.GMAP and isfunction(_G.GMAP.Open) then _G.GMAP.Open() return true end end,
    function() if _G.GMap and isfunction(_G.GMap.Open) then _G.GMap.Open() return true end end,
    function() if _G.GALACTIC_MAP and isfunction(_G.GALACTIC_MAP.Open) then _G.GALACTIC_MAP.Open() return true end end,
    function() if _G.GalacticMap and isfunction(_G.GalacticMap.Open) then _G.GalacticMap.Open() return true end end,
    function() if _G.galactic_map and isfunction(_G.galactic_map.Open) then _G.galactic_map.Open() return true end end,
    -- Добавьте сюда свой явный вызов если знаете точную функцию:
    -- function() if _G.MyMap and isfunction(_G.MyMap.Show) then _G.MyMap.Show() return true end end,
}

-- Популярные имена консольных команд
local OPEN_CMDS = {
    "gmap_open",
    "gmap",
    "galactic_map",
    "open_galactic_map",
    -- Добавьте сюда свою команду если она у вас есть
}

local function TryOpenViaFunctions()
    for _, fn in ipairs(OPEN_FUNCS) do
        local ok = false
        -- защищённый вызов, чтобы не ловить ошибки чужого кода
        local success, res = pcall(function()
            return fn()
        end)
        if success and res == true then
            return true
        end
    end
    return false
end

local function TryOpenViaCommands()
    for _, cmd in ipairs(OPEN_CMDS) do
        -- RunConsoleCommand не падает, даже если команды нет
        RunConsoleCommand(cmd)
        -- Нельзя надёжно проверить, сработала ли команда, поэтому просто пробуем все
    end
    -- Возвращаем true, чтобы не дублировать попытки: если в сборке есть команда — окно откроется
    return true
end

local function OpenGalacticMap()
    -- Сначала пробуем «родной» вызов, если глобальные объекты доступны
    if TryOpenViaFunctions() then return end
    -- Иначе пробуем через консольные команды
    TryOpenViaCommands()
end

-- ===== Горячая клавиша (F6) =====
hook.Add("PlayerButtonDown", "gmap_quickopen_hotkey", function(ply, button)
    if not IsFirstTimePredicted() then return end
    if not cv_enable_hotkey:GetBool() then return end
    if button == KEY_F6 then
        OpenGalacticMap()
    end
end)

-- ===== Плавающая кнопка =====
local quickBtn -- panel reference

local function CreateOrUpdateButton()
    if not cv_enable_button:GetBool() then
        if IsValid(quickBtn) then quickBtn:Remove() end
        return
    end

    if not IsValid(quickBtn) then
        quickBtn = vgui.Create("DButton")
        quickBtn:SetText("")
        quickBtn:SetZPos(10000) -- сверху «почти всегда»
        quickBtn:SetCursor("hand")

        -- Внешний вид
        quickBtn.Paint = function(self, w, h)
            -- Фон
            surface.SetDrawColor(20, 20, 30, 220)
            surface.DrawRect(0, 0, w, h)

            -- Рамка
            surface.SetDrawColor(80, 160, 255, self:IsHovered() and 220 or 160)
            surface.DrawOutlinedRect(0, 0, w, h, 2)

            -- Текст
            draw.SimpleText(cv_btn_text:GetString(), "Trebuchet18",
                w * 0.5, h * 0.5, Color(220, 230, 255),
                TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end

        quickBtn.DoClick = function()
            OpenGalacticMap()
        end

        -- Перетаскивание по экрану (зажать ПКМ)
        quickBtn.OnMousePressed = function(self, mc)
            if mc == MOUSE_RIGHT then
                self.Dragging = { gui.MouseX() - self.x, gui.MouseY() - self.y }
                self:MouseCapture(true)
            elseif mc == MOUSE_LEFT then
                self:DoClick()
            end
        end

        quickBtn.OnMouseReleased = function(self, mc)
            if mc == MOUSE_RIGHT and self.Dragging then
                self.Dragging = nil
                self:MouseCapture(false)
                -- Сохраняем новую позицию
                RunConsoleCommand(cv_btn_x:GetName(), tostring(self.x))
                RunConsoleCommand(cv_btn_y:GetName(), tostring(self.y))
            end
        end

        quickBtn.Think = function(self)
            if self.Dragging then
                local mx, my = gui.MouseX(), gui.MouseY()
                self:SetPos(mx - self.Dragging[1], my - self.Dragging[2])
            end
        end
    end

    quickBtn:SetSize(math.max(80, cv_btn_w:GetInt()), math.max(28, cv_btn_h:GetInt()))
    quickBtn:SetPos(cv_btn_x:GetInt(), cv_btn_y:GetInt())
end

-- Пересоздание/обновление на старте и при изменении конов
hook.Add("InitPostEntity", "gmap_quickopen_build_btn", CreateOrUpdateButton)
cvars.AddChangeCallback(cv_enable_button:GetName(), function() timer.Simple(0, CreateOrUpdateButton) end, "gmap_btn")
cvars.AddChangeCallback(cv_btn_x:GetName(), function() timer.Simple(0, CreateOrUpdateButton) end, "gmap_btn")
cvars.AddChangeCallback(cv_btn_y:GetName(), function() timer.Simple(0, CreateOrUpdateButton) end, "gmap_btn")
cvars.AddChangeCallback(cv_btn_w:GetName(), function() timer.Simple(0, CreateOrUpdateButton) end, "gmap_btn")
cvars.AddChangeCallback(cv_btn_h:GetName(), function() timer.Simple(0, CreateOrUpdateButton) end, "gmap_btn")
cvars.AddChangeCallback(cv_btn_text:GetName(), function() timer.Simple(0, CreateOrUpdateButton) end, "gmap_btn")

-- Команда на ручной вызов (можно подвязать на bind)
concommand.Add("gmap_quickopen", function()
    OpenGalacticMap()
end, nil, "Открыть Galactic Map из любого места")
