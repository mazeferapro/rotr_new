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

-- HUD ивента
hook.Add("HUDPaint", "AutoEvents_HUD", function()
    if not NextRP.AutoEvents.HUD.active and 
       not NextRP.AutoEvents.HUD.preparation_active and 
       not NextRP.AutoEvents.HUD.schedule_countdown_active then 
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
    
    if NextRP.AutoEvents.HUD.schedule_countdown_active then
        title = "СЛЕДУЮЩИЙ ИВЕНТ"
        titleColor = Color(100, 200, 255)
    elseif NextRP.AutoEvents.HUD.preparation_active then
        title = "ПОДГОТОВКА К ИВЕНТУ"
        titleColor = Color(255, 165, 0)
    elseif NextRP.AutoEvents.HUD.event_type == "defense" then
        title = "ОБОРОНА ЗОНЫ"
    elseif NextRP.AutoEvents.HUD.event_type == "capture" then
        title = "ЗАХВАТ ТОЧЕК"
    end
    
    draw.SimpleText(title, "DermaDefaultBold", panelX + panelW/2, panelY + 15, titleColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    
    if NextRP.AutoEvents.HUD.schedule_countdown_active then
        -- === РЕЖИМ ОТСЧЕТА ДО ИВЕНТА ===
        
        -- Время до ивента
        local countdownTime = math.max(0, NextRP.AutoEvents.HUD.schedule_countdown_time_left)
        local hours = math.floor(countdownTime / 3600)
        local minutes = math.floor((countdownTime % 3600) / 60)
        local seconds = math.floor(countdownTime % 60)
        
        local timeStr = ""
        if hours > 0 then
            timeStr = string.format("%02d:%02d:%02d", hours, minutes, seconds)
        else
            timeStr = string.format("%02d:%02d", minutes, seconds)
        end
        
        draw.SimpleText("До начала: " .. timeStr, "DermaDefault", panelX + 15, panelY + 40, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        
        -- Название ивента
        local eventName = NextRP.AutoEvents.HUD.schedule_countdown_event_name
        if string.len(eventName) > 25 then
            eventName = string.sub(eventName, 1, 22) .. "..."
        end
        draw.SimpleText("Ивент: " .. eventName, "DermaDefault", panelX + 15, panelY + 60, Color(200, 255, 200), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        
        -- Название карты
        local mapName = NextRP.AutoEvents.HUD.schedule_countdown_map_name
        local map_data = NextRP.AutoEvents.Config.Maps and NextRP.AutoEvents.Config.Maps[mapName]
        local displayMapName = map_data and map_data.name or mapName
        if string.len(displayMapName) > 25 then
            displayMapName = string.sub(displayMapName, 1, 22) .. "..."
        end
        draw.SimpleText("Карта: " .. displayMapName, "DermaDefault", panelX + 15, panelY + 80, Color(200, 200, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        
        -- Прогресс бар отсчета
        local progressW = panelW - 30
        local progressH = 8
        local progressX = panelX + 15
        local progressY = panelY + 100
        
        draw.RoundedBox(4, progressX, progressY, progressW, progressH, Color(60, 60, 60))
        
        -- Определяем максимальное время для прогресс-бара
        local maxTime = 3600 -- 1 час максимум для отображения
        if countdownTime > maxTime then maxTime = countdownTime end
        
        local progress = math.Clamp(1 - (countdownTime / maxTime), 0, 1)
        local progressColor = Color(100, 200, 255) -- Синий для отсчета
        
        -- Меняем цвет в зависимости от оставшегося времени
        if countdownTime <= 300 then -- Последние 5 минут
            progressColor = Color(255, 165, 0) -- Оранжевый
            if countdownTime <= 60 then -- Последняя минута
                progressColor = Color(255, 100, 100) -- Красный
            end
        end
        
        draw.RoundedBox(4, progressX, progressY, progressW * progress, progressH, progressColor)
        
        -- Статус и подсказки
        local statusY = panelY + 120
        if countdownTime <= 60 then
            local alpha = math.abs(math.sin(CurTime() * 3)) * 255
            draw.SimpleText("СКОРО НАЧНЕТСЯ!", "DermaDefaultBold", panelX + panelW/2, statusY, Color(255, 100, 100, alpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        elseif countdownTime <= 300 then
            draw.SimpleText("Готовьтесь к бою!", "DermaDefault", panelX + 15, statusY, Color(255, 200, 100), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Автоматический запуск", "DermaDefault", panelX + 15, statusY, Color(200, 200, 200), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        end
        
    elseif NextRP.AutoEvents.HUD.preparation_active then
        -- === РЕЖИМ ПОДГОТОВКИ ===
        
        -- Время подготовки
        local prepTime = math.max(0, NextRP.AutoEvents.HUD.preparation_time_left)
        local minutes = math.floor(prepTime / 60)
        local seconds = math.floor(prepTime % 60)
        local timeStr = string.format("%02d:%02d", minutes, seconds)
        
        draw.SimpleText("Подготовка: " .. timeStr, "DermaDefault", panelX + 15, panelY + 40, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        
        -- Прогресс бар подготовки
        local progressW = panelW - 30
        local progressH = 8
        local progressX = panelX + 15
        local progressY = panelY + 55
        
        draw.RoundedBox(4, progressX, progressY, progressW, progressH, Color(60, 60, 60))
        
        local maxPrepTime = NextRP.AutoEvents.Config and NextRP.AutoEvents.Config.Settings and NextRP.AutoEvents.Config.Settings.preparation_time or 60
        local progress = math.Clamp((maxPrepTime - prepTime) / maxPrepTime, 0, 1)
        local progressColor = Color(255, 165, 0) -- Оранжевый для подготовки
        
        draw.RoundedBox(4, progressX, progressY, progressW * progress, progressH, progressColor)
        
        -- Информация о предстоящем ивенте
        local eventTypeText = ""
        if NextRP.AutoEvents.HUD.event_type == "defense" then
            eventTypeText = "Готовьтесь к обороне!"
        elseif NextRP.AutoEvents.HUD.event_type == "capture" then
            eventTypeText = "Готовьтесь к захвату!"
        else
            eventTypeText = "Приготовьтесь к бою!"
        end
        
        draw.SimpleText(eventTypeText, "DermaDefault", panelX + 15, panelY + 75, Color(255, 200, 100), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        
        -- Очки подкрепления (предварительная информация)
        draw.SimpleText("Очки подкрепления:", "DermaDefault", panelX + 15, panelY + 95, Color(200, 200, 200), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        local reinforcementText = NextRP.AutoEvents.HUD.max_reinforcement_points .. " (макс.)"
        draw.SimpleText(reinforcementText, "DermaDefaultBold", panelX + panelW - 15, panelY + 95, Color(255, 255, 255), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
        
        -- Мигающий текст в последние секунды
        if prepTime <= 10 and prepTime > 0 then
            local alpha = math.abs(math.sin(CurTime() * 5)) * 255
            draw.SimpleText("НАЧИНАЕТСЯ!", "DermaDefaultBold", panelX + panelW/2, panelY + 120, Color(255, 0, 0, alpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Проверьте снаряжение", "DermaDefault", panelX + 15, panelY + 120, Color(200, 200, 200), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        end
        
    else
        -- === РЕЖИМ АКТИВНОГО ИВЕНТА ===
        
        -- Время ивента
        local timeLeft = math.max(0, NextRP.AutoEvents.HUD.time_left)
        local minutes = math.floor(timeLeft / 60)
        local seconds = math.floor(timeLeft % 60)
        local timeStr = string.format("%02d:%02d", minutes, seconds)
        
        draw.SimpleText("Время: " .. timeStr, "DermaDefault", panelX + 15, panelY + 40, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        
        -- Прогресс бар времени
        local progressW = panelW - 30
        local progressH = 8
        local progressX = panelX + 15
        local progressY = panelY + 55
        
        draw.RoundedBox(4, progressX, progressY, progressW, progressH, Color(60, 60, 60))
        
        local current_map = game.GetMap()
        local map_data = NextRP.AutoEvents.Config.Maps and NextRP.AutoEvents.Config.Maps[current_map]
        local maxTime = map_data and map_data.duration or 900
        local progress = math.Clamp(timeLeft / maxTime, 0, 1)
        local progressColor = progress > 0.3 and Color(0, 200, 0) or Color(200, 0, 0)
        
        draw.RoundedBox(4, progressX, progressY, progressW * progress, progressH, progressColor)
        
        -- Очки подкрепления (главный показатель)
        local reinforcementY = panelY + 75
        draw.SimpleText("Очки подкрепления:", "DermaDefault", panelX + 15, reinforcementY, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        
        local reinforcementText = NextRP.AutoEvents.HUD.reinforcement_points .. "/" .. NextRP.AutoEvents.HUD.max_reinforcement_points
        local reinforcementColor = Color(255, 255, 255)
        
        -- Цвет в зависимости от количества очков
        local reinforcementPercent = NextRP.AutoEvents.HUD.reinforcement_points / math.max(1, NextRP.AutoEvents.HUD.max_reinforcement_points)
        if reinforcementPercent > 0.6 then
            reinforcementColor = Color(0, 255, 0) -- Зеленый
        elseif reinforcementPercent > 0.3 then
            reinforcementColor = Color(255, 255, 0) -- Желтый
        else
            reinforcementColor = Color(255, 0, 0) -- Красный
        end
        
        draw.SimpleText(reinforcementText, "DermaDefaultBold", panelX + panelW - 15, reinforcementY, reinforcementColor, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
        
        -- Прогресс бар очков подкрепления
        local reinforcementBarY = panelY + 90
        draw.RoundedBox(4, progressX, reinforcementBarY, progressW, progressH, Color(60, 60, 60))
        draw.RoundedBox(4, progressX, reinforcementBarY, progressW * reinforcementPercent, progressH, reinforcementColor)
        
        -- Дополнительная информация
        local infoY = panelY + 110
        
        if NextRP.AutoEvents.HUD.event_type == "defense" then
            draw.SimpleText("Волна: " .. NextRP.AutoEvents.HUD.current_wave, "DermaDefault", panelX + 15, infoY, Color(200, 200, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
            draw.SimpleText("Не покидайте зону!", "DermaDefault", panelX + 15, infoY + 20, Color(255, 200, 100), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        elseif NextRP.AutoEvents.HUD.event_type == "capture" then
            local captureText = "Точки: " .. NextRP.AutoEvents.HUD.captured_points .. "/" .. NextRP.AutoEvents.HUD.max_capture_points
            draw.SimpleText(captureText, "DermaDefault", panelX + 15, infoY, Color(200, 255, 200), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
            draw.SimpleText("Захватывайте точки!", "DermaDefault", panelX + 15, infoY + 20, Color(255, 200, 100), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        end
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
        local map_data = NextRP.AutoEvents.Config.Maps[current_map]
        
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
                local statusText = "Подготовка к ивенту | Осталось: " .. math.floor(NextRP.AutoEvents.HUD.preparation_time_left) .. " сек"
                draw.SimpleText(statusText, "DermaDefault", 10, 55, Color(255, 165, 0))
            elseif NextRP.AutoEvents.HUD.active then
                local statusText = "Ивент активен | Очки: " .. NextRP.AutoEvents.HUD.reinforcement_points .. "/" .. NextRP.AutoEvents.HUD.max_reinforcement_points
                draw.SimpleText(statusText, "DermaDefault", 10, 55, Color(0, 255, 0))
            else
                draw.SimpleText("Ивент неактивен", "DermaDefault", 10, 55, Color(255, 100, 100))
            end
        else
            draw.SimpleText("Карта не настроена", "DermaDefaultBold", 10, 25, Color(255, 100, 100))
        end
    end)
    
    -- Вкладки
    local tabPanel = vgui.Create("DPropertySheet", frame)
    tabPanel:Dock(FILL)
    tabPanel:DockMargin(10, 0, 10, 10)
    
    -- Вкладка карт
    local mapsPanel = vgui.Create("DPanel", tabPanel)
    mapsPanel:SetBackgroundColor(Color(35, 35, 40))
    
    local mapsScroll = vgui.Create("PawsUI.ScrollPanel", mapsPanel)
    mapsScroll:Dock(FILL)
    mapsScroll:DockMargin(5, 5, 5, 5)
    
    for map_name, map_data in pairs(NextRP.AutoEvents.Config.Maps) do
        local mapPanel = vgui.Create("PawsUI.Panel")
        mapPanel:SetTall(100)
        mapPanel:Stick(TOP, 5)
        mapPanel:Background(Color(45, 45, 50, 200))
        
        mapPanel:On('Paint', function(s, w, h)
            draw.SimpleText(map_data.name, "DermaDefaultBold", 15, 15, Color(255, 255, 255))
            draw.SimpleText(map_data.description or "Нет описания", "DermaDefault", 15, 35, Color(180, 180, 180))
            
            local typeText = map_data.is_main and "Основная карта" or ("Ивентовая (" .. (map_data.event_type or "неизвестно") .. ")")
            draw.SimpleText(typeText, "DermaDefault", 15, 55, Color(150, 150, 150))
            
            -- Показать очки подкрепления для ивентовых карт
            if not map_data.is_main and map_data.reinforcement_points then
                draw.SimpleText("Очки подкрепления: " .. map_data.reinforcement_points, "DermaDefault", 15, 75, Color(255, 200, 100))
            end
            
            if game.GetMap() == map_name then
                draw.SimpleText("ТЕКУЩАЯ", "DermaDefault", w - 15, h/2, Color(0, 255, 0), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
            end
        end)
        
        -- Кнопка смены карты
        local changeBtn = vgui.Create("PawsUI.Button", mapPanel)
        changeBtn:SetLabel(game.GetMap() == map_name and "Текущая" or "Сменить")
        changeBtn:SetSize(80, 30)
        changeBtn:SetPos(mapPanel:GetWide() - 95, 35)
        
        if game.GetMap() == map_name then
            changeBtn:SetEnabled(false)
        else
            changeBtn.DoClick = function()
                print("[AutoEvents] Клик по кнопке смены карты: " .. map_name)
                
                NextRP:QuerryText(QUERY_MAT_QUESTION, NextRP.Style.Theme.Accent,
                    'Сменить карту на "' .. map_data.name .. '"?\n\nСмена произойдет через ' .. NextRP.AutoEvents.Config.Settings.change_delay .. ' секунд.',
                    '',
                    'Да', function()
                        print("[AutoEvents] Выполнение команды смены карты")
                        RunConsoleCommand("autoevents_changemap", map_name)
                        frame:Remove()
                    end,
                    'Нет', nil)
            end
        end
        
        mapsScroll:Add(mapPanel)
    end
    
    tabPanel:AddSheet("Карты", mapsPanel, "icon16/map.png")
    
    -- Вкладка расписания
    local schedulePanel = vgui.Create("DPanel", tabPanel)
    schedulePanel:SetBackgroundColor(Color(35, 35, 40))
    
    local scheduleScroll = vgui.Create("PawsUI.ScrollPanel", schedulePanel)
    scheduleScroll:Dock(FILL)
    scheduleScroll:DockMargin(5, 5, 5, 5)
    
    -- Заголовок расписания с информацией об отсчете
    local scheduleHeader = vgui.Create("PawsUI.Panel")
    scheduleHeader:SetTall(60)
    scheduleHeader:Stick(TOP, 5)
    scheduleHeader:Background(Color(60, 60, 65, 200))
    
    scheduleHeader:On('Paint', function(s, w, h)
        draw.SimpleText("Расписание автоматических ивентов", "DermaDefaultBold", w/2, 15, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        
        -- Показать текущее время с поправкой
        local server_time = NextRP.AutoEvents.GetServerTime()
        local time_text = "Серверное время: " .. string.format("%02d:%02d", server_time.hour, server_time.minute)
        if NextRP.AutoEvents.ServerTime.timezone_offset ~= 0 then
            time_text = time_text .. " (UTC" .. (NextRP.AutoEvents.ServerTime.timezone_offset >= 0 and "+" or "") .. NextRP.AutoEvents.ServerTime.timezone_offset .. ")"
        end
        
        if NextRP.AutoEvents.HUD.schedule_countdown_active then
            local timeLeft = math.max(0, NextRP.AutoEvents.HUD.schedule_countdown_time_left)
            local hours = math.floor(timeLeft / 3600)
            local minutes = math.floor((timeLeft % 3600) / 60)
            local countdownText = "Следующий: " .. NextRP.AutoEvents.HUD.schedule_countdown_event_name .. 
                                " через " .. string.format("%02d:%02d", hours, minutes)
            draw.SimpleText(countdownText, "DermaDefault", w/2, 35, Color(100, 200, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            draw.SimpleText(time_text, "DermaDefault", w/2, 50, Color(200, 200, 200), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Автоматический отсчет отключен", "DermaDefault", w/2, 35, Color(200, 200, 200), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            draw.SimpleText(time_text, "DermaDefault", w/2, 50, Color(200, 200, 200), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
    end)
    
    scheduleScroll:Add(scheduleHeader)
    
    -- Сортируем расписание по времени
    local sorted_schedule = {}
    for k, v in pairs(NextRP.AutoEvents.Config.Schedule) do
        table.insert(sorted_schedule, v)
    end
    
    table.sort(sorted_schedule, function(a, b)
        return (a.hour * 60 + a.minute) < (b.hour * 60 + b.minute)
    end)
    
    for _, schedule_item in pairs(sorted_schedule) do
        local scheduleItemPanel = vgui.Create("PawsUI.Panel")
        scheduleItemPanel:SetTall(60)
        scheduleItemPanel:Stick(TOP, 3)
        scheduleItemPanel:Background(Color(45, 45, 50, 200))
        
        scheduleItemPanel:On('Paint', function(s, w, h)
            local time_str = string.format("%02d:%02d", schedule_item.hour, schedule_item.minute)
            local map_data = NextRP.AutoEvents.Config.Maps[schedule_item.map]
            
            -- Подсветка следующего ивента
            local textColor = Color(255, 255, 255)
            if NextRP.AutoEvents.HUD.schedule_countdown_active and 
               schedule_item.name == NextRP.AutoEvents.HUD.schedule_countdown_event_name then
                textColor = Color(100, 200, 255)
                draw.RoundedBox(4, 0, 0, w, h, Color(20, 40, 60, 100))
            end
            
            draw.SimpleText(time_str, "DermaLarge", 15, 15, Color(100, 200, 255))
            draw.SimpleText(schedule_item.name, "DermaDefault", 80, 15, textColor)
            
            if map_data then
                draw.SimpleText(map_data.name .. " (" .. schedule_item.map .. ")", "DermaDefault", 80, 35, Color(180, 180, 180))
            else
                draw.SimpleText("Карта не найдена: " .. schedule_item.map, "DermaDefault", 80, 35, Color(255, 100, 100))
            end
        end)
        
        scheduleScroll:Add(scheduleItemPanel)
    end
    
    tabPanel:AddSheet("Расписание", schedulePanel, "icon16/time.png")
    
    -- Панель управления внизу
    local controlPanel = vgui.Create("PawsUI.Panel", frame)
    controlPanel:SetTall(50)
    controlPanel:Dock(BOTTOM)
    controlPanel:DockMargin(10, 0, 10, 10)
    controlPanel:Background(Color(30, 30, 35, 200))
    
    local startBtn = vgui.Create("PawsUI.Button", controlPanel)
    startBtn:SetLabel("Запустить ивент")
    startBtn:SetSize(110, 35)
    startBtn:SetPos(10, 7)
    startBtn.DoClick = function()
        print("[AutoEvents] Клик по кнопке запуска ивента")
        RunConsoleCommand("autoevents_start")
        LocalPlayer():ChatPrint("[AutoEvents] Команда запуска отправлена")
    end
    
    local stopBtn = vgui.Create("PawsUI.Button", controlPanel)
    stopBtn:SetLabel("Остановить ивент")
    stopBtn:SetSize(110, 35)
    stopBtn:SetPos(130, 7)
    stopBtn.DoClick = function()
        print("[AutoEvents] Клик по кнопке остановки ивента")
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
    
    -- Статус в правом углу
    local statusPanel = vgui.Create("PawsUI.Panel", controlPanel)
    statusPanel:SetWide(80)
    statusPanel:Dock(RIGHT)
    statusPanel:DockMargin(10, 7, 10, 7)
    statusPanel:Background(Color(0, 0, 0, 0))
    
    statusPanel:On('Paint', function(s, w, h)
        local statusText = "Готов"
        local statusColor = Color(100, 100, 100)
        
        if NextRP.AutoEvents.HUD.schedule_countdown_active then
            statusText = "Отсчет"
            statusColor = Color(100, 200, 255)
        elseif NextRP.AutoEvents.HUD.preparation_active then
            statusText = "Подготовка"
            statusColor = Color(255, 165, 0)
        elseif NextRP.AutoEvents.HUD.active then
            statusText = "Активен"
            statusColor = Color(0, 255, 0)
        end
        
        draw.SimpleText(statusText, "DermaDefault", w/2, h/2, statusColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end)
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
    frame:ShowSettingsButton(false)
    
    local scrollPanel = vgui.Create("PawsUI.ScrollPanel", frame)
    scrollPanel:Dock(FILL)
    scrollPanel:DockMargin(10, 10, 10, 10)
    
    for map_name, map_data in pairs(NextRP.AutoEvents.Config.Maps) do
        local mapBtn = vgui.Create("PawsUI.Button")
        mapBtn:SetLabel("")
        mapBtn:SetTall(50)
        mapBtn:Stick(TOP, 5)
        mapBtn:Background(game.GetMap() == map_name and Color(60, 120, 60, 200) or Color(45, 45, 50, 200))
        mapBtn:FadeHover(Color(80, 80, 85, 200))
        
        mapBtn:On('Paint', function(s, w, h)
            local textColor = game.GetMap() == map_name and Color(200, 255, 200) or Color(255, 255, 255)
            draw.SimpleText(map_data.name, "DermaDefaultBold", 15, h/2 - 8, textColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
            
            local statusText = game.GetMap() == map_name and "ТЕКУЩАЯ" or "Сменить →"
            draw.SimpleText(statusText, "DermaDefault", w - 15, h/2 + 8, textColor, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
        end)
        
        if game.GetMap() ~= map_name then
            mapBtn.DoClick = function()
                NextRP:QuerryText(QUERY_MAT_QUESTION, NextRP.Style.Theme.Accent,
                    'Быстрая смена на "' .. map_data.name .. '"?',
                    '',
                    'Да', function()
                        RunConsoleCommand("autoevents_changemap", map_name)
                        frame:Remove()
                    end,
                    'Нет', nil)
            end
        end
        
        scrollPanel:Add(mapBtn)
    end
end

function NextRP.AutoEvents.DrawDefenseHUD()
    if not NextRP.AutoEvents.Data.event_active or NextRP.AutoEvents.Data.current_mode ~= "defense" then 
        return 
    end
    
    local scrW, scrH = ScrW(), ScrH()
    local panelW, panelH = 400, 120
    local x, y = scrW - panelW - 20, 20
    
    -- Фон панели
    draw.RoundedBox(8, x, y, panelW, panelH, Color(0, 0, 0, 180))
    draw.RoundedBox(8, x + 2, y + 2, panelW - 4, panelH - 4, Color(30, 30, 50, 200))
    
    -- Заголовок
    draw.SimpleText("РЕЖИМ ОБОРОНЫ", "DermaDefaultBold", x + panelW/2, y + 12, Color(255, 255, 255), TEXT_ALIGN_CENTER)
    
    -- Получаем данные времени
    local remaining_time, total_time, progress = NextRP.AutoEvents.GetDefenseTimeProgress()
    
    -- Таймер обратного отсчета
    local minutes = math.floor(remaining_time / 60)
    local seconds = math.floor(remaining_time % 60)
    local time_text = string.format("%02d:%02d", minutes, seconds)
    
    local time_color = Color(255, 255, 255)
    if remaining_time <= 60 then
        time_color = Color(255, 100, 100) -- Красный если меньше минуты
    elseif remaining_time <= 300 then
        time_color = Color(255, 200, 100) -- Оранжевый если меньше 5 минут
    end
    
    draw.SimpleText("Время до победы:", "DermaDefault", x + 10, y + 35, Color(200, 200, 200))
    draw.SimpleText(time_text, "DermaLarge", x + panelW - 10, y + 32, time_color, TEXT_ALIGN_RIGHT)
    
    -- Прогресс-бар времени
    local bar_x, bar_y = x + 10, y + 55
    local bar_w, bar_h = panelW - 20, 12
    
    -- Фон прогресс-бара
    draw.RoundedBox(4, bar_x, bar_y, bar_w, bar_h, Color(100, 100, 100, 150))
    
    -- Заполнение прогресс-бара (зеленый = прогресс к победе)
    local fill_w = (progress / 100) * bar_w
    local bar_color = Color(100, 255, 100) -- Зеленый
    if progress > 80 then
        bar_color = Color(255, 255, 100) -- Желтый ближе к концу
    end
    draw.RoundedBox(4, bar_x, bar_y, fill_w, bar_h, bar_color)
    
    -- Процент прогресса
    draw.SimpleText(math.floor(progress) .. "%", "DermaDefault", bar_x + bar_w/2, bar_y + bar_h/2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    
    -- Очки подкрепления
    local reinforcements_color = Color(100, 255, 100)
    if NextRP.AutoEvents.Data.reinforcements <= 10 then
        reinforcements_color = Color(255, 100, 100) -- Красный если мало
    elseif NextRP.AutoEvents.Data.reinforcements <= 25 then
        reinforcements_color = Color(255, 200, 100) -- Оранжевый
    end
    
    draw.SimpleText("Подкрепления:", "DermaDefault", x + 10, y + 75, Color(200, 200, 200))
    draw.SimpleText(NextRP.AutoEvents.Data.reinforcements, "DermaDefaultBold", x + panelW - 10, y + 75, reinforcements_color, TEXT_ALIGN_RIGHT)
    
    -- Текущая волна
    draw.SimpleText("Волна: " .. NextRP.AutoEvents.Data.current_wave, "DermaDefault", x + 10, y + 95, Color(200, 200, 200))
    
    -- Количество врагов
    local enemy_count = #NextRP.AutoEvents.Data.spawned_npcs
    local enemy_color = enemy_count > 10 and Color(255, 100, 100) or Color(255, 255, 255)
    draw.SimpleText("Врагов: " .. enemy_count, "DermaDefault", x + panelW - 10, y + 95, enemy_color, TEXT_ALIGN_RIGHT)
end

function NextRP.AutoEvents.DrawHUD()
    if not NextRP.AutoEvents.Config.HUD.enabled then return end
    
    local mode = NextRP.AutoEvents.Data.current_mode
    
    if mode == "defense" then
        NextRP.AutoEvents.DrawDefenseHUD()
    elseif mode == "capture" then
        NextRP.AutoEvents.DrawCaptureHUD() -- Существующая функция
    end
end

net.Receive("NextRP_AutoEvents_TimeData", function()
    local remaining_time = net.ReadFloat()
    local total_time = net.ReadFloat()
    local progress = net.ReadFloat()
    
    -- Сохраняем данные для HUD
    NextRP.AutoEvents.Data.remaining_time = remaining_time
    NextRP.AutoEvents.Data.total_time = total_time
    NextRP.AutoEvents.Data.time_progress = progress
end)

-- Функция для получения прогресса времени на клиенте
function NextRP.AutoEvents.GetDefenseTimeProgress()
    return NextRP.AutoEvents.Data.remaining_time or 0,
           NextRP.AutoEvents.Data.total_time or 1,
           NextRP.AutoEvents.Data.time_progress or 0
end

-- Консольные команды для открытия панелей
concommand.Add("autoevents_menu", function()
    print("[AutoEvents] Команда открытия меню")
    NextRP.AutoEvents.OpenAdminPanel()
end)

concommand.Add("autoevents_quickchange", function()
    print("[AutoEvents] Команда быстрой смены карты")
    NextRP.AutoEvents.QuickMapChange()
end)

concommand.Add("autoevents_panel", function()
    print("[AutoEvents] Альтернативная команда открытия панели")
    NextRP.AutoEvents.OpenAdminPanel()
end)

concommand.Add("ae_menu", function()
    print("[AutoEvents] Короткая команда открытия меню")
    NextRP.AutoEvents.OpenAdminPanel()
end)

concommand.Add("ae_change", function()
    print("[AutoEvents] Короткая команда смены карты")
    NextRP.AutoEvents.QuickMapChange()
end)