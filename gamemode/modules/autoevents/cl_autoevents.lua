-- gamemode/modules/autoevents/cl_autoevents.lua

include("sh_config.lua")

NextRP = NextRP or {}
NextRP.AutoEvents = NextRP.AutoEvents or {}
NextRP.AutoEvents.HUD = {
    active = false,
    preparation_active = false,
    preparation_time_left = 0,
    
    -- Поля для отсчета расписания
    schedule_countdown_active = false,
    schedule_countdown_time_left = 0,
    schedule_countdown_event_name = "",
    schedule_countdown_map_name = "",
    
    event_type = nil,
    reinforcement_points = 0,
    max_reinforcement_points = 0,
    current_wave = 0,
    captured_points = 0,
    max_capture_points = 0,
    time_left = 0,
}

NextRP.AutoEvents.ServerTime = {
    hour = 0,
    minute = 0,
    last_update = 0,
    timezone_offset = 0
}

print("[AutoEvents] Клиентская часть загружена")

-- Получение данных HUD
net.Receive("AutoEvents_UpdateHUD", function()
    local data = net.ReadTable()
    
    NextRP.AutoEvents.HUD.active = data.active
    NextRP.AutoEvents.HUD.preparation_active = data.preparation_active or false
    NextRP.AutoEvents.HUD.preparation_time_left = data.preparation_time_left or 0
    
    NextRP.AutoEvents.HUD.schedule_countdown_active = data.schedule_countdown_active or false
    NextRP.AutoEvents.HUD.schedule_countdown_time_left = data.schedule_countdown_time_left or 0
    NextRP.AutoEvents.HUD.schedule_countdown_event_name = data.schedule_countdown_event_name or ""
    NextRP.AutoEvents.HUD.schedule_countdown_map_name = data.schedule_countdown_map_name or ""
    
    NextRP.AutoEvents.HUD.event_type = data.event_type
    NextRP.AutoEvents.HUD.reinforcement_points = data.reinforcement_points or 0
    NextRP.AutoEvents.HUD.max_reinforcement_points = data.max_reinforcement_points or 0
    NextRP.AutoEvents.HUD.current_wave = data.current_wave or 0
    NextRP.AutoEvents.HUD.captured_points = data.captured_points or 0
    NextRP.AutoEvents.HUD.max_capture_points = data.max_capture_points or 0
    NextRP.AutoEvents.HUD.time_left = data.time_left or 0
end)

net.Receive("AutoEvents_SyncTime", function()
    local hour = net.ReadUInt(8)
    local minute = net.ReadUInt(8)
    local timezone = net.ReadUInt(8)
    
    NextRP.AutoEvents.ServerTime.hour = hour
    NextRP.AutoEvents.ServerTime.minute = minute
    NextRP.AutoEvents.ServerTime.last_update = CurTime()
    NextRP.AutoEvents.ServerTime.timezone_offset = timezone
end)

-- Функция получения актуального серверного времени
function NextRP.AutoEvents.GetServerTime()
    local time_passed = math.floor((CurTime() - NextRP.AutoEvents.ServerTime.last_update) / 60)
    local current_minute = NextRP.AutoEvents.ServerTime.minute + time_passed
    local current_hour = NextRP.AutoEvents.ServerTime.hour
    
    -- Корректировка при переходе через час
    while current_minute >= 60 do
        current_minute = current_minute - 60
        current_hour = current_hour + 1
    end
    
    -- Корректировка при переходе через сутки
    if current_hour >= 24 then
        current_hour = current_hour - 24
    end
    
    return {hour = current_hour, minute = current_minute}
end

-- Упрощенный HUD ивента (только текст для отсчета)
hook.Add("HUDPaint", "AutoEvents_HUD", function()
    -- Показываем только текст отсчета до следующего ивента
    if NextRP.AutoEvents.HUD.schedule_countdown_active then
        local scrW, scrH = ScrW(), ScrH()
        
        -- Время до ивента
        local countdownTime = math.max(0, NextRP.AutoEvents.HUD.schedule_countdown_time_left)
        local hours = math.floor(countdownTime / 3600)
        local minutes = math.floor((countdownTime % 3600) / 60)
        
        local timeStr = ""
        if hours > 0 then
            timeStr = string.format("%d ч %d мин", hours, minutes)
        else
            timeStr = string.format("%d мин", minutes)
        end
        
        -- Единственная надпись в правом нижнем углу
        local eventText = "Следующий ивент " .. NextRP.AutoEvents.HUD.schedule_countdown_event_name .. " до начала " .. timeStr
        draw.SimpleText(eventText, "DermaDefault", scrW - 150, scrH - 150, Color(100, 200, 255), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
        return
    end
    
    -- Остальной HUD для активных ивентов и подготовки (если нужен)
    if not NextRP.AutoEvents.HUD.active and not NextRP.AutoEvents.HUD.preparation_active then 
        return 
    end
    
    local scrW, scrH = ScrW(), ScrH()
    local panelW, panelH = 350, 150
    local panelX, panelY = scrW - panelW - 20, 750
    
    -- Фон панели
    draw.RoundedBox(8, panelX, panelY, panelW, panelH, Color(0, 0, 0, 220))
    draw.RoundedBox(8, panelX + 3, panelY + 3, panelW - 6, panelH - 6, Color(45, 45, 50, 200))
    
    -- Заголовок и цвет в зависимости от режима
    local title = "АВТО-ИВЕНТ"
    local titleColor = Color(255, 200, 0)
    
    if NextRP.AutoEvents.HUD.preparation_active then
        title = "ПОДГОТОВКА К ИВЕНТУ"
        titleColor = Color(255, 165, 0)
    elseif NextRP.AutoEvents.HUD.event_type == "defense" then
        title = "ОБОРОНА ЗОНЫ"
    elseif NextRP.AutoEvents.HUD.event_type == "capture" then
        title = "ЗАХВАТ ТОЧЕК"
    end
    
    draw.SimpleText(title, "DermaDefaultBold", panelX + panelW/2, panelY + 15, titleColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    
    if NextRP.AutoEvents.HUD.preparation_active then
        -- === РЕЖИМ ПОДГОТОВКИ ===
        
        -- Время подготовки
        local prepTime = math.max(0, NextRP.AutoEvents.HUD.preparation_time_left)
        local minutes = math.floor(prepTime / 60)
        local seconds = math.floor(prepTime % 60)
        local timeStr = string.format("%02d:%02d", minutes, seconds)
        
        draw.SimpleText("Время подготовки: " .. timeStr, "DermaDefault", panelX + 15, panelY + 40, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        
        -- Подсказки
        draw.SimpleText("Готовьтесь к бою!", "DermaDefault", panelX + 15, panelY + 60, Color(255, 200, 100), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        
    elseif NextRP.AutoEvents.HUD.event_type == "defense" then
        -- === РЕЖИМ ОБОРОНЫ ===
        
        -- Очки подкрепления
        local reinforcements = NextRP.AutoEvents.HUD.reinforcement_points
        local maxReinforcements = NextRP.AutoEvents.HUD.max_reinforcement_points
        
        draw.SimpleText("Подкрепления: " .. reinforcements .. " / " .. maxReinforcements, "DermaDefault", panelX + 15, panelY + 40, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        
        -- Текущая волна
        local wave = NextRP.AutoEvents.HUD.current_wave
        draw.SimpleText("Волна: " .. wave, "DermaDefault", panelX + 15, panelY + 60, Color(200, 255, 200), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        
        -- Прогресс-бар подкрепления
        local progressW = panelW - 30
        local progressH = 8
        local progressX = panelX + 15
        local progressY = panelY + 80
        
        draw.RoundedBox(4, progressX, progressY, progressW, progressH, Color(60, 60, 60))
        
        local progress = reinforcements / maxReinforcements
        local progressColor = Color(100, 255, 100)
        if progress <= 0.3 then
            progressColor = Color(255, 100, 100)
        elseif progress <= 0.6 then
            progressColor = Color(255, 200, 100)
        end
        
        draw.RoundedBox(4, progressX, progressY, progressW * progress, progressH, progressColor)
        
    elseif NextRP.AutoEvents.HUD.event_type == "capture" then
        -- === РЕЖИМ ЗАХВАТА ===
        
        -- Захваченные точки
        local captured = NextRP.AutoEvents.HUD.captured_points
        local maxPoints = NextRP.AutoEvents.HUD.max_capture_points
        
        draw.SimpleText("Точки: " .. captured .. " / " .. maxPoints, "DermaDefault", panelX + 15, panelY + 40, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        
        -- Время ивента
        local timeLeft = NextRP.AutoEvents.HUD.time_left
        local minutes = math.floor(timeLeft / 60)
        local seconds = math.floor(timeLeft % 60)
        local timeStr = string.format("%02d:%02d", minutes, seconds)
        
        draw.SimpleText("Время: " .. timeStr, "DermaDefault", panelX + 15, panelY + 60, Color(200, 200, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        
        -- Прогресс-бар захвата
        local progressW = panelW - 30
        local progressH = 8
        local progressX = panelX + 15
        local progressY = panelY + 80
        
        draw.RoundedBox(4, progressX, progressY, progressW, progressH, Color(60, 60, 60))
        
        local progress = captured / maxPoints
        local progressColor = Color(100, 200, 255)
        
        draw.RoundedBox(4, progressX, progressY, progressW * progress, progressH, progressColor)
    end
    
    -- Дополнительная информация
    local infoY = panelY + 100
    if NextRP.AutoEvents.HUD.time_left and NextRP.AutoEvents.HUD.time_left > 0 and NextRP.AutoEvents.HUD.event_type ~= "capture" then
        local timeLeft = NextRP.AutoEvents.HUD.time_left
        local minutes = math.floor(timeLeft / 60)
        local seconds = math.floor(timeLeft % 60)
        local timeStr = string.format("%02d:%02d", minutes, seconds)
        
        draw.SimpleText("Время ивента: " .. timeStr, "DermaDefault", panelX + 15, infoY + 20, Color(255, 200, 100), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    end
end)

-- Панель управления для администраторов
function NextRP.AutoEvents.OpenAdminPanel()
    if not LocalPlayer():IsAdmin() then 
        LocalPlayer():ChatPrint("[AutoEvents] У вас нет прав!")
        return 
    end
    
    print("[AutoEvents] Открытие админ панели")
    
    local frame = vgui.Create("PawsUI.Frame")
    frame:SetTitle("Управление авто-ивентами")
    frame:SetSize(600, 500)
    frame:Center()
    frame:MakePopup()
    frame:ShowSettingsButton(false)
    
    -- Информация о текущей карте и ивенте
    local infoPanel = vgui.Create("PawsUI.Panel", frame)
    infoPanel:SetTall(80)
    infoPanel:Dock(TOP)
    infoPanel:DockMargin(10, 10, 10, 10)
    infoPanel:Background(Color(40, 40, 45, 200))
    
    infoPanel:On('Paint', function(s, w, h)
        local current_map = game.GetMap()
        local map_data = NextRP.AutoEvents.Config.Maps and NextRP.AutoEvents.Config.Maps[current_map]
        
        if map_data then
            draw.SimpleText("Текущая карта: " .. map_data.name, "DermaDefaultBold", 10, 10, Color(255, 255, 255))
            draw.SimpleText("Тип: " .. (map_data.event_type or "Основная"), "DermaDefault", 10, 35, Color(200, 200, 200))
            
            if NextRP.AutoEvents.HUD.schedule_countdown_active then
                local timeLeft = math.max(0, NextRP.AutoEvents.HUD.schedule_countdown_time_left)
                local hours = math.floor(timeLeft / 3600)
                local minutes = math.floor((timeLeft % 3600) / 60)
                local statusText = "Отсчет: " .. NextRP.AutoEvents.HUD.schedule_countdown_event_name .. 
                                  " через " .. string.format("%02d:%02d", hours, minutes)
                draw.SimpleText(statusText, "DermaDefault", 10, 55, Color(100, 200, 255))
            elseif NextRP.AutoEvents.HUD.preparation_active then
                draw.SimpleText("Статус: Подготовка к ивенту", "DermaDefault", 10, 55, Color(255, 165, 0))
            elseif NextRP.AutoEvents.HUD.active then
                draw.SimpleText("Статус: Ивент активен", "DermaDefault", 10, 55, Color(0, 255, 0))
            else
                draw.SimpleText("Статус: Готов", "DermaDefault", 10, 55, Color(200, 200, 200))
            end
        else
            draw.SimpleText("Карта не настроена для ивентов", "DermaDefault", 10, 10, Color(255, 100, 100))
        end
    end)
    
    -- Контрольные кнопки
    local controlPanel = vgui.Create("PawsUI.Panel", frame)
    controlPanel:SetTall(50)
    controlPanel:Dock(TOP)
    controlPanel:DockMargin(10, 0, 10, 10)
    controlPanel:Background(Color(0, 0, 0, 0))
    
    local startBtn = vgui.Create("PawsUI.Button", controlPanel)
    startBtn:SetLabel("Запустить")
    startBtn:SetSize(80, 35)
    startBtn:SetPos(10, 7)
    startBtn.DoClick = function()
        RunConsoleCommand("autoevents_start")
        LocalPlayer():ChatPrint("[AutoEvents] Команда запуска отправлена")
    end
    
    local stopBtn = vgui.Create("PawsUI.Button", controlPanel)
    stopBtn:SetLabel("Остановить")
    stopBtn:SetSize(80, 35)
    stopBtn:SetPos(100, 7)
    stopBtn.DoClick = function()
        RunConsoleCommand("autoevents_stop")
        LocalPlayer():ChatPrint("[AutoEvents] Команда остановки отправлена")
    end
    
    local countdownBtn = vgui.Create("PawsUI.Button", controlPanel)
    countdownBtn:SetLabel("Отсчет")
    countdownBtn:SetSize(80, 35)
    countdownBtn:SetPos(250, 7)
    countdownBtn.DoClick = function()
        if NextRP.AutoEvents.HUD.schedule_countdown_active then
            RunConsoleCommand("autoevents_stop_countdown")
            LocalPlayer():ChatPrint("[AutoEvents] Отсчет остановлен")
        else
            RunConsoleCommand("autoevents_start_countdown")
            LocalPlayer():ChatPrint("[AutoEvents] Отсчет запущен")
        end
    end
    
    local infoBtn = vgui.Create("PawsUI.Button", controlPanel)
    infoBtn:SetLabel("Информация")
    infoBtn:SetSize(90, 35)
    infoBtn:SetPos(340, 7)
    infoBtn.DoClick = function()
        print("[AutoEvents] Клик по кнопке информации")
        RunConsoleCommand("autoevents_info")
    end
end

-- Простая функция быстрой смены карты
function NextRP.AutoEvents.QuickMapChange()
    if not LocalPlayer():IsAdmin() then 
        LocalPlayer():ChatPrint("[AutoEvents] У вас нет прав!")
        return 
    end
    
    local frame = vgui.Create("PawsUI.Frame")
    frame:SetTitle("Быстрая смена карты")
    frame:SetSize(400, 300)
    frame:Center()
    frame:MakePopup()
    
    local scrollPanel = vgui.Create("DScrollPanel", frame)
    scrollPanel:Dock(FILL)
    scrollPanel:DockMargin(10, 10, 10, 10)
    
    for map_name, map_data in pairs(NextRP.AutoEvents.Config.Maps or {}) do
        if map_data.is_main then continue end
        
        local mapBtn = vgui.Create("PawsUI.Button")
        mapBtn:SetText(map_data.name .. " (" .. map_name .. ")")
        mapBtn:SetTall(40)
        mapBtn:Dock(TOP)
        mapBtn:DockMargin(0, 0, 0, 5)
        mapBtn.DoClick = function()
            Derma_Query("Сменить карту на " .. map_data.name .. "?", 
                "Подтверждение", 
                "Да", function()
                    RunConsoleCommand("autoevents_changemap", map_name)
                    frame:Remove()
                end,
                "Нет", nil)
        end
        
        scrollPanel:Add(mapBtn)
    end
end

-- Консольные команды для интерфейса
concommand.Add("autoevents_panel", function()
    NextRP.AutoEvents.OpenAdminPanel()
end)

concommand.Add("autoevents_mapchange", function()
    NextRP.AutoEvents.QuickMapChange()
end)

print("[AutoEvents] Клиентские функции загружены")