-- gamemode/modules/autoevents/sv_autoevents.lua

include("sh_config.lua")

NextRP.AutoEvents.Data = {
    event_active = false,
    event_start_time = 0,
    current_event_type = nil,
    next_notification = 0,
    last_schedule_check = 0,
    
    -- Поля для подготовки
    preparation_active = false,
    preparation_start_time = 0,
    preparation_time_left = 0,
    
    -- НОВЫЕ ПОЛЯ ДЛЯ ОТСЧЕТА РАСПИСАНИЯ
    schedule_countdown_active = false,
    schedule_countdown_target_time = 0,
    schedule_countdown_event_name = "",
    schedule_countdown_map_name = "",
    next_scheduled_event = nil,
    
    -- Система очков подкрепления
    reinforcement_points = 0,
    max_reinforcement_points = 0,
    
    -- Система волн и захвата
    current_wave = 0,
    captured_points = 0,
    spawned_npcs = {},
    defense_center_pos = Vector(0, 0, 0),

    total_waves = 0,        -- Общее количество волн
    completed_waves = 0,    -- Завершенные волны
    active_waves = {},      -- Активные волны с таймерами
    wave_spawn_timers = {}, -- Таймеры спавна волн
    defense_start_time = 0,
    defense_duration = 0, -- Время обороны в секундах
    victory_check_timer = nil
}

print("[AutoEvents] Серверная часть загружена")

-- Утилиты для сетевых сообщений
util.AddNetworkString("AutoEvents_UpdateHUD")
util.AddNetworkString("AutoEvents_SyncTime")

-- Функция синхронизации времени
function NextRP.AutoEvents.SyncServerTime()
    local server_time = os.date("*t", os.time() + (NextRP.AutoEvents.Config.Settings.timezone_offset * 3600))
    
    net.Start("AutoEvents_SyncTime")
    net.WriteUInt(server_time.hour, 8)
    net.WriteUInt(server_time.min, 8)
    net.WriteUInt(NextRP.AutoEvents.Config.Settings.timezone_offset, 8)
    net.Broadcast()
end

-- Отправлять время каждую минуту
timer.Create("AutoEvents_TimeSync", 60, 0, function()
    NextRP.AutoEvents.SyncServerTime()
end)

-- Отправлять время при подключении игрока
hook.Add("PlayerFullyAuthenticated", "AutoEvents_SendTime", function(ply)
    timer.Simple(5, function()
        if IsValid(ply) then
            local server_time = os.date("*t", os.time() + (NextRP.AutoEvents.Config.Settings.timezone_offset * 3600))
            
            net.Start("AutoEvents_SyncTime")
            net.WriteUInt(server_time.hour, 8)
            net.WriteUInt(server_time.min, 8)
            net.WriteUInt(NextRP.AutoEvents.Config.Settings.timezone_offset, 8)
            net.Send(ply)
        end
    end)
end)

-- Функция смены карты
function NextRP.AutoEvents.ChangeMap(map_name)
    local map_data = NextRP.AutoEvents.Config.Maps[map_name]
    if not map_data then 
        print("[AutoEvents] Карта не найдена: " .. tostring(map_name))
        return 
    end
    
    for _, ply in pairs(player.GetAll()) do
        if IsValid(ply) then
            ply:ChatPrint("[AutoEvents] Смена карты через " .. NextRP.AutoEvents.Config.Settings.change_delay .. " секунд: " .. map_data.name)
        end
    end
    
    timer.Simple(NextRP.AutoEvents.Config.Settings.change_delay, function()
        print("[AutoEvents] Меняем карту на: " .. map_name)
        RunConsoleCommand("changelevel", map_name)
    end)
end

-- НОВАЯ ФУНКЦИЯ - Найти следующий ивент по расписанию
function NextRP.AutoEvents.FindNextScheduledEvent()
    if not NextRP.AutoEvents.Config.Settings.schedule_countdown_enabled then return nil end
    
    local current_time = os.date("*t", os.time() + (NextRP.AutoEvents.Config.Settings.timezone_offset * 3600))
    local current_minutes = current_time.hour * 60 + current_time.min
    local next_event = nil
    local min_diff = 1440 -- 24 часа в минутах
    
    for _, schedule_item in pairs(NextRP.AutoEvents.Config.Schedule) do
        local schedule_minutes = schedule_item.hour * 60 + schedule_item.minute
        local diff = schedule_minutes - current_minutes
        
        -- Если время прошло сегодня, смотрим на завтра
        if diff <= 0 then
            diff = diff + 1440 -- Добавляем 24 часа
        end
        
        -- ИСПРАВЛЕНИЕ: убираем проверку минимального времени или делаем её более гибкой
        if diff < min_diff then
            min_diff = diff
            next_event = schedule_item
            next_event.time_until_seconds = diff * 60
        end
    end
    
    -- Проверяем минимальное время только для логирования
    if next_event and next_event.time_until_seconds < NextRP.AutoEvents.Config.Settings.schedule_countdown_min_time then
        print("[AutoEvents] Внимание: до следующего ивента меньше минимального времени отсчета")
    end
    
    return next_event
end

function NextRP.AutoEvents.StartDefenseMode()
    local current_map = game.GetMap()
    local map_data = NextRP.AutoEvents.Config.Maps[current_map]
    
    if not map_data or not map_data.defense then
        print("[AutoEvents] Нет конфигурации defense для карты: " .. current_map)
        return false
    end
    
    -- Инициализация данных обороны
    NextRP.AutoEvents.Data.current_mode = "defense"
    NextRP.AutoEvents.Data.event_active = true
    NextRP.AutoEvents.Data.current_wave = 0
    NextRP.AutoEvents.Data.reinforcements = map_data.defense.reinforcements or 100
    NextRP.AutoEvents.Data.defense_start_time = CurTime()
    NextRP.AutoEvents.Data.defense_duration = map_data.defense.duration or 600 -- Дефолт 10 минут
    
    -- Поиск центра обороны
    local defense_center = ents.FindByClass("nextrp_defense_center")[1]
    if IsValid(defense_center) then
        NextRP.AutoEvents.Data.defense_center_pos = defense_center:GetPos()
    end
    
    -- Очистка старых NPC
    NextRP.AutoEvents.ClearAllNPCs()
    
    -- Уведомление игроков
    local duration_minutes = math.floor(NextRP.AutoEvents.Data.defense_duration / 60)
    for _, ply in pairs(player.GetAll()) do
        ply:PrintMessage(HUD_PRINTTALK, "=== РЕЖИМ ОБОРОНЫ ===")
        ply:PrintMessage(HUD_PRINTTALK, "Защищайтесь " .. duration_minutes .. " минут!")
        ply:PrintMessage(HUD_PRINTTALK, "Очки подкрепления: " .. NextRP.AutoEvents.Data.reinforcements)
    end
    
    -- Запуск системы волн
    timer.Simple(5, function()
        NextRP.AutoEvents.StartWaveSystem(map_data.defense)
    end)
    
    -- Запуск проверки победы
    NextRP.AutoEvents.StartVictoryCheck()
    
    NextRP.AutoEvents.UpdateHUD()
    return true
end

function NextRP.AutoEvents.StartVictoryCheck()
    -- Удаляем старый таймер если есть
    if NextRP.AutoEvents.Data.victory_check_timer then
        timer.Remove(NextRP.AutoEvents.Data.victory_check_timer)
    end
    
    local timer_name = "AutoEvents_VictoryCheck_" .. os.time()
    NextRP.AutoEvents.Data.victory_check_timer = timer_name
    
    timer.Create(timer_name, 1, 0, function()
        if not NextRP.AutoEvents.Data.event_active then
            timer.Remove(timer_name)
            return
        end
        
        NextRP.AutoEvents.CheckDefenseVictory()
    end)
end

function NextRP.AutoEvents.StartVictoryCheck()
    -- Удаляем старый таймер если есть
    if NextRP.AutoEvents.Data.victory_check_timer then
        timer.Remove(NextRP.AutoEvents.Data.victory_check_timer)
    end
    
    local timer_name = "AutoEvents_VictoryCheck_" .. os.time()
    NextRP.AutoEvents.Data.victory_check_timer = timer_name
    
    timer.Create(timer_name, 1, 0, function()
        if not NextRP.AutoEvents.Data.event_active then
            timer.Remove(timer_name)
            return
        end
        
        NextRP.AutoEvents.CheckDefenseVictory()
    end)
end

function NextRP.AutoEvents.EndDefenseEvent(victory, message)
    NextRP.AutoEvents.Data.event_active = false
    
    -- Удаляем таймер проверки победы
    if NextRP.AutoEvents.Data.victory_check_timer then
        timer.Remove(NextRP.AutoEvents.Data.victory_check_timer)
        NextRP.AutoEvents.Data.victory_check_timer = nil
    end
    
    -- Очистка всех NPC
    NextRP.AutoEvents.ClearAllNPCs()
    
    -- Остановка системы волн
    NextRP.AutoEvents.StopWaveSystem()
    
    -- Уведомление игроков
    local color = victory and Color(0, 255, 0) or Color(255, 0, 0)
    for _, ply in pairs(player.GetAll()) do
        ply:PrintMessage(HUD_PRINTTALK, message)
        ply:EmitSound(victory and "ambient/alarms/warningbell1.wav" or "ambient/alarms/citadel_alert_loop2.wav", 75, victory and 100 or 80)
    end
    
    -- Вызов коллбэка если есть
    if NextRP and NextRP.AutoEvents and NextRP.AutoEvents.OnDefenseEnd then
        NextRP.AutoEvents.OnDefenseEnd(victory)
    end
    
    -- Сброс данных
    timer.Simple(5, function()
        NextRP.AutoEvents.ResetEventData()
        NextRP.AutoEvents.UpdateHUD()
    end)
    
    print("[AutoEvents] Событие обороны завершено. Победа: " .. tostring(victory))
end

function NextRP.AutoEvents.LoseReinforcements(amount, reason)
    if not NextRP.AutoEvents.Data.event_active or NextRP.AutoEvents.Data.current_mode ~= "defense" then
        return
    end
    
    amount = amount or 1
    NextRP.AutoEvents.Data.reinforcements = math.max(0, NextRP.AutoEvents.Data.reinforcements - amount)
    
    -- Уведомление о потере
    local message = "Потеря подкрепления"
    if reason then
        message = message .. " (" .. reason .. ")"
    end
    message = message .. "! Осталось: " .. NextRP.AutoEvents.Data.reinforcements
    
    for _, ply in pairs(player.GetAll()) do
        ply:PrintMessage(HUD_PRINTTALK, message)
        if NextRP.AutoEvents.Data.reinforcements <= 10 then
            ply:EmitSound("buttons/button10.wav", 60, 90) -- Тревожный звук
        end
    end
    
    NextRP.AutoEvents.UpdateHUD()
    
    print("[AutoEvents] Потеря подкрепления: " .. amount .. ". Осталось: " .. NextRP.AutoEvents.Data.reinforcements)
end



-- НОВАЯ ФУНКЦИЯ - Запуск отсчета до ивента
function NextRP.AutoEvents.StartScheduleCountdown()
    local next_event = NextRP.AutoEvents.FindNextScheduledEvent()
    if not next_event then 
        print("[AutoEvents] Следующий ивент не найден в расписании")
        return 
    end
    
    -- ИСПРАВЛЕНИЕ: разрешаем отсчет даже для коротких периодов
    if next_event.time_until_seconds < 60 then
        print("[AutoEvents] До ивента осталось меньше минуты, пропускаем отсчет")
        return
    end
    
    NextRP.AutoEvents.Data.schedule_countdown_active = true
    NextRP.AutoEvents.Data.schedule_countdown_target_time = CurTime() + next_event.time_until_seconds
    NextRP.AutoEvents.Data.schedule_countdown_event_name = next_event.name
    NextRP.AutoEvents.Data.schedule_countdown_map_name = next_event.map
    NextRP.AutoEvents.Data.next_scheduled_event = next_event
    
    print("[AutoEvents] Запущен отсчет до ивента: " .. next_event.name .. " через " .. math.floor(next_event.time_until_seconds / 60) .. " минут")
    
    -- Настройка уведомлений - только для тех, которые меньше времени до ивента
    for _, seconds in pairs(NextRP.AutoEvents.Config.Settings.schedule_countdown_notifications) do
        if seconds < next_event.time_until_seconds then
            timer.Simple(next_event.time_until_seconds - seconds, function()
                if NextRP.AutoEvents.Data.schedule_countdown_active then
                    NextRP.AutoEvents.ScheduleCountdownNotification(seconds, next_event)
                end
            end)
        end
    end
    
    -- Запуск смены карты в назначенное время
    timer.Simple(next_event.time_until_seconds, function()
        if NextRP.AutoEvents.Data.schedule_countdown_active then
            NextRP.AutoEvents.Data.schedule_countdown_active = false
            NextRP.AutoEvents.ChangeMap(next_event.map)
            
            -- Запуск следующего отсчета
            timer.Simple(NextRP.AutoEvents.Config.Settings.change_delay + 5, function()
                NextRP.AutoEvents.StartScheduleCountdown()
            end)
        end
    end)
    
    NextRP.AutoEvents.UpdateHUD()
end

-- НОВАЯ ФУНКЦИЯ - Уведомления отсчета расписания
function NextRP.AutoEvents.ScheduleCountdownNotification(seconds, event_data)
    local map_data = NextRP.AutoEvents.Config.Maps[event_data.map]
    local map_name = map_data and map_data.name or event_data.map
    
    local time_str = ""
    if seconds >= 3600 then
        local hours = math.floor(seconds / 3600)
        time_str = hours .. " час" .. (hours > 1 and "а" or "")
    elseif seconds >= 60 then
        local minutes = math.floor(seconds / 60)
        time_str = minutes .. " минут" .. (minutes > 1 and "" or "у")
    else
        time_str = seconds .. " секунд"
    end
    
    for _, ply in pairs(player.GetAll()) do
        if IsValid(ply) then
            if seconds >= 3600 then
                ply:ChatPrint("[AutoEvents] До ивента \"" .. event_data.name .. "\" осталось: " .. time_str)
            elseif seconds >= 300 then
                ply:ChatPrint("[AutoEvents] ВНИМАНИЕ! До ивента \"" .. event_data.name .. "\" осталось: " .. time_str)
            elseif seconds >= 60 then
                ply:ChatPrint("[AutoEvents] ⚠️ СКОРО ИВЕНТ! \"" .. event_data.name .. "\" через " .. time_str .. "!")
            else
                ply:ChatPrint("[AutoEvents] 🚨 ИВЕНТ \"" .. event_data.name .. "\" НАЧИНАЕТСЯ ЧЕРЕЗ " .. time_str .. "! 🚨")
            end
            
            if seconds <= 300 then
                ply:ChatPrint("[AutoEvents] Карта: " .. map_name)
            end
        end
    end
    
    -- Звуковые уведомления
    if seconds <= 300 and seconds >= 60 then
        for _, ply in pairs(player.GetAll()) do
            if IsValid(ply) then
                ply:EmitSound("buttons/button15.wav", 100, 120)
            end
        end
    elseif seconds < 60 then
        for _, ply in pairs(player.GetAll()) do
            if IsValid(ply) then
                ply:EmitSound("buttons/button17.wav", 100, 150)
            end
        end
    end
end

-- Функция создания NPC
function NextRP.AutoEvents.SpawnNPC(npc_data, spawn_pos, target_pos)
    local npc = ents.Create(npc_data.class)
    if not IsValid(npc) then return nil end
    
    npc:SetPos(spawn_pos + Vector(math.random(-50, 50), math.random(-50, 50), 10))
    npc:SetAngles(Angle(0, math.random(0, 360), 0))
    npc:Spawn()
    npc:Activate()
    npc.wave_id = wave_id
    npc.event_npc = true
    
    -- Настройка NPC
    npc:SetHealth(npc_data.health or 100)
    npc:SetMaxHealth(npc_data.health or 100)
    
    if npc_data.weapon then
        timer.Simple(0.1, function()
            if IsValid(npc) then
                npc:Give(npc_data.weapon)
            end
        end)
    end
    
    -- Цель для атаки (игроки или точка обороны)
    if target_pos then
        timer.Simple(1, function()
            if IsValid(npc) then
                npc:SetSchedule(SCHED_FORCED_GO_RUN)
                npc:SetLastPosition(target_pos)
            end
        end)
    end
    
    table.insert(NextRP.AutoEvents.Data.spawned_npcs, npc)
    
    -- Автоудаление через 10 минут
    timer.Simple(600, function()
        if IsValid(npc) then
            npc:Remove()
        end
    end)
    
    return npc
end

-- Функция запуска ивента
function NextRP.AutoEvents.StartEvent()
    local current_map = game.GetMap()
    local map_data = NextRP.AutoEvents.Config.Maps[current_map]
    
    print("[AutoEvents] Попытка запуска ивента на карте: " .. current_map)
    
    if not map_data then
        print("[AutoEvents] Карта не настроена: " .. current_map)
        return
    end
    
    if map_data.is_main then
        print("[AutoEvents] Это основная карта, ивент не нужен")
        return
    end
    
    if #player.GetAll() < NextRP.AutoEvents.Config.Settings.min_players then
        print("[AutoEvents] Недостаточно игроков для ивента")
        for _, ply in pairs(player.GetAll()) do
            if IsValid(ply) then
                ply:ChatPrint("[AutoEvents] Недостаточно игроков для запуска ивента!")
            end
        end
        return
    end
    
    -- Проверяем, не идет ли уже подготовка или ивент
    if NextRP.AutoEvents.Data.preparation_active or NextRP.AutoEvents.Data.event_active then
        print("[AutoEvents] Ивент или подготовка уже активны!")
        return
    end
    
    -- Отключаем отсчет расписания
    NextRP.AutoEvents.Data.schedule_countdown_active = false

    -- Запуск периода подготовки
    NextRP.AutoEvents.StartPreparation(map_data)
end

-- Функция запуска периода подготовки
function NextRP.AutoEvents.StartPreparation(map_data)
    NextRP.AutoEvents.Data.preparation_active = true
    NextRP.AutoEvents.Data.preparation_start_time = CurTime()
    NextRP.AutoEvents.Data.preparation_time_left = NextRP.AutoEvents.Config.Settings.preparation_time
    NextRP.AutoEvents.Data.current_event_type = map_data.event_type
    
    -- Инициализация данных ивента заранее
    NextRP.AutoEvents.Data.reinforcement_points = map_data.reinforcement_points or 50
    NextRP.AutoEvents.Data.max_reinforcement_points = map_data.reinforcement_points or 50
    NextRP.AutoEvents.Data.current_wave = 0
    NextRP.AutoEvents.Data.captured_points = 0
    NextRP.AutoEvents.Data.spawned_npcs = {}
    
    for _, ply in pairs(player.GetAll()) do
        if IsValid(ply) then
            ply:ChatPrint("[AutoEvents] ===== ПОДГОТОВКА К ИВЕНТУ =====")
            ply:ChatPrint("[AutoEvents] Ивент: " .. map_data.description)
            ply:ChatPrint("[AutoEvents] Время на подготовку: " .. NextRP.AutoEvents.Config.Settings.preparation_time .. " секунд")
            ply:ChatPrint("[AutoEvents] Подготовьтесь к бою!")
        end
    end
    
    print("[AutoEvents] Подготовка к ивенту начата: " .. map_data.event_type)
    
    -- Настройка уведомлений
    for _, seconds in pairs(NextRP.AutoEvents.Config.Settings.preparation_notifications) do
        timer.Simple(NextRP.AutoEvents.Config.Settings.preparation_time - seconds, function()
            if NextRP.AutoEvents.Data.preparation_active then
                NextRP.AutoEvents.PreparationNotification(seconds)
            end
        end)
    end
    
    -- Запуск основного ивента после подготовки
    timer.Simple(NextRP.AutoEvents.Config.Settings.preparation_time, function()
        if NextRP.AutoEvents.Data.preparation_active then
            NextRP.AutoEvents.StartMainEvent(map_data)
        end
    end)
    
    -- Обновление HUD
    NextRP.AutoEvents.UpdateHUD()
end

-- Функция уведомлений во время подготовки
function NextRP.AutoEvents.PreparationNotification(seconds)
    for _, ply in pairs(player.GetAll()) do
        if IsValid(ply) then
            if seconds >= 10 then
                ply:ChatPrint("[AutoEvents] До начала ивента: " .. seconds .. " секунд!")
            elseif seconds >= 5 then
                ply:ChatPrint("[AutoEvents] ВНИМАНИЕ! До начала ивента: " .. seconds .. " секунд!")
            else
                ply:ChatPrint("[AutoEvents] ИВЕНТ НАЧИНАЕТСЯ ЧЕРЕЗ " .. seconds .. "!")
            end
        end
    end
    
    -- Звуковое уведомление
    if seconds <= 5 then
        for _, ply in pairs(player.GetAll()) do
            if IsValid(ply) then
                ply:EmitSound("buttons/button17.wav", 100, 150)
            end
        end
    end
end

-- Функция запуска основного ивента после подготовки
function NextRP.AutoEvents.StartMainEvent(map_data)
    -- Завершаем подготовку
    NextRP.AutoEvents.Data.preparation_active = false
    NextRP.AutoEvents.Data.preparation_time_left = 0
    
    -- Запускаем основной ивент
    NextRP.AutoEvents.Data.event_active = true
    NextRP.AutoEvents.Data.event_start_time = CurTime()
    
    for _, ply in pairs(player.GetAll()) do
        if IsValid(ply) then
            ply:ChatPrint("[AutoEvents] ========== ИВЕНТ НАЧАЛСЯ! ==========")
            ply:ChatPrint("[AutoEvents] " .. map_data.description)
            ply:ChatPrint("[AutoEvents] Очки подкрепления: " .. NextRP.AutoEvents.Data.reinforcement_points)
            ply:EmitSound("ambient/alarms/warningbell1.wav", 100, 100)
        end
    end
    
    print("[AutoEvents] Основной ивент запущен: " .. map_data.event_type)

    NextRP.AutoEvents.SpawnEventDropPods(map_data)
    NextRP.AutoEvents.SpawnEventVehicles(map_data)
    
    -- Запуск логики в зависимости от типа ивента
    if map_data.event_type == "defense" then
        NextRP.AutoEvents.StartDefenseEvent(map_data)
    elseif map_data.event_type == "capture" then
        NextRP.AutoEvents.StartCaptureEvent(map_data)
    end
    
    -- Таймер окончания ивента
    timer.Simple(map_data.duration or 900, function()
        if NextRP.AutoEvents.Data.event_active and NextRP.AutoEvents.Data.current_event_type == "capture" then
            NextRP.AutoEvents.EndEvent(false, "Время вышло! Ивент провален!")
        elseif NextRP.AutoEvents.Data.event_active and NextRP.AutoEvents.Data.current_event_type == "defense" then
            NextRP.AutoEvents.EndEvent(true, "Вы успешно продержались указанное время!")
        end
    end)
    
    -- Обновление HUD
    NextRP.AutoEvents.UpdateHUD()
end

-- Запуск ивента обороны
function NextRP.AutoEvents.StartDefenseEvent(map_data)
    -- Найти центр обороны
    for _, ent in pairs(ents.FindByClass("nextrp_defense_center")) do
        NextRP.AutoEvents.Data.defense_center_pos = ent:GetPos()
        break
    end
    
    -- Запуск волн атаки
    for _, wave_data in pairs(map_data.attack_waves) do
        timer.Simple(wave_data.delay, function()
            if NextRP.AutoEvents.Data.event_active then
                NextRP.AutoEvents.SpawnAttackWave(wave_data)
            end
        end)
    end
    
    -- Урон вне зоны
    timer.Create("AutoEvents_ZoneDamage", NextRP.AutoEvents.Config.Settings.zone_damage_interval, 0, function()
        NextRP.AutoEvents.CheckZoneDamage(map_data)
    end)
end

-- Запуск ивента захвата
function NextRP.AutoEvents.StartCaptureEvent(map_data)
    -- Активировать точки захвата
    for _, ent in pairs(ents.FindByClass("nextrp_capture_point")) do
        ent:SetActive(true)
        ent:SetCaptured(false)
    end
    
    -- Заспавнить защитников на точках
    timer.Simple(5, function()
        NextRP.AutoEvents.SpawnPointDefenders(map_data)
    end)
    
    -- Дополнительные волны NPC
    for i = 1, map_data.defenders.spawn_waves do
        timer.Simple(i * map_data.defenders.wave_interval, function()
            if NextRP.AutoEvents.Data.event_active then
                NextRP.AutoEvents.SpawnPointDefenders(map_data)
            end
        end)
    end
end

-- Спавн волны атаки (для обороны)
function NextRP.AutoEvents.SpawnAttackWave(wave_data)
    if not wave_data then 
        print("[AutoEvents] Ошибка: wave_data не передан!")
        return 
    end
    
    local spawn_zones = ents.FindByClass("nextrp_npc_spawn")
    if #spawn_zones == 0 then
        print("[AutoEvents] Нет доступных зон спавна враждебных NPC!")
        return
    end
    
    -- Фильтруем только активные зоны
    local active_zones = {}
    for _, zone in pairs(spawn_zones) do
        if zone:GetActive() then
            table.insert(active_zones, zone)
        end
    end
    
    if #active_zones == 0 then
        print("[AutoEvents] Нет активных зон спавна NPC!")
        return
    end
    
    local npc_types_with_counts = wave_data.npcs or {
        {class = "npc_combine_s", count = 5, health = 100, weapon = "weapon_ar2"}
    }
    
    -- Считаем общее количество NPC из всех типов
    local total_npc_count = 0
    for _, npc_data in pairs(npc_types_with_counts) do
        total_npc_count = total_npc_count + (npc_data.count or 1)
    end
    
    print("[AutoEvents] Спавн волны атакующих: " .. total_npc_count .. " NPC")
    
    -- Определяем сколько зон использовать (максимум 3)
    local zones_to_use = math.min(#active_zones, math.ceil(total_npc_count / 5), 3)
    local selected_zones = {}
    
    -- Выбираем случайные зоны
    local zone_indices = {}
    for i = 1, #active_zones do
        table.insert(zone_indices, i)
    end
    
    for i = 1, zones_to_use do
        local rand_index = math.random(1, #zone_indices)
        table.insert(selected_zones, active_zones[zone_indices[rand_index]])
        table.remove(zone_indices, rand_index)
    end
    
    -- Создаем список всех NPC которых нужно заспавнить
    local npcs_to_spawn = {}
    for _, npc_data in pairs(npc_types_with_counts) do
        for i = 1, (npc_data.count or 1) do
            table.insert(npcs_to_spawn, {
                class = npc_data.class,
                health = npc_data.health,
                weapon = npc_data.weapon
            })
        end
    end
    
    -- Распределяем NPC по зонам
    local remaining_npcs = #npcs_to_spawn
    local npc_index = 1
    
    for zone_index, spawn_zone in pairs(selected_zones) do
        -- Вычисляем сколько NPC спавнить в этой зоне
        local remaining_zones = zones_to_use - zone_index + 1
        local zone_npc_count = math.ceil(remaining_npcs / remaining_zones)
        
        -- Получаем позиции для всех NPC этой зоны сразу
        local spawn_positions = spawn_zone:GetMultipleSpawnPositions(zone_npc_count, 75)
        
        print("[AutoEvents] Зона " .. spawn_zone:GetSpawnName() .. ": " .. zone_npc_count .. " NPC")
        
        for i = 1, zone_npc_count do
            if npc_index <= #npcs_to_spawn then
                local npc_data = npcs_to_spawn[npc_index]
                local spawn_pos = spawn_positions[i] or spawn_zone:GetSpawnPosition()
                
                -- Спавним с небольшой задержкой чтобы избежать одновременного появления
                local spawn_delay = (zone_index - 1) * 1.5 + (i - 1) * 0.4
                
                timer.Simple(spawn_delay, function()
                    local npc = NextRP.AutoEvents.CreateAttackerNPC(npc_data, spawn_pos)
                    if IsValid(npc) then
                        -- Добавляем в список для отслеживания
                        table.insert(NextRP.AutoEvents.Data.spawned_npcs, npc)
                    end
                end)
                
                npc_index = npc_index + 1
            end
        end
        
        -- Уменьшаем количество оставшихся NPC
        remaining_npcs = remaining_npcs - zone_npc_count
    end
    
    -- Обновляем данные волны
    NextRP.AutoEvents.Data.current_wave = NextRP.AutoEvents.Data.current_wave + 1
    NextRP.AutoEvents.UpdateHUD()
end


function NextRP.AutoEvents.CreateAttackerNPC(npc_data, spawn_pos)
    local npc = ents.Create(npc_data.class)
    if not IsValid(npc) then 
        print("[AutoEvents] Не удалось создать NPC:", npc_data.class)
        return nil 
    end
    
    -- Финальная проверка позиции перед спавном
    local final_trace = util.TraceHull({
        start = spawn_pos,
        endpos = spawn_pos + Vector(0, 0, 10),
        mins = Vector(-16, -16, 0),
        maxs = Vector(16, 16, 72),
        mask = MASK_SOLID
    })
    
    -- Если позиция занята, немного поднимаем
    if final_trace.Hit then
        spawn_pos = spawn_pos + Vector(0, 0, 25)
    end
    
    npc:SetPos(spawn_pos)
    npc:SetAngles(Angle(0, math.random(0, 360), 0))
    npc:Spawn()
    npc:Activate()
    
    -- Применяем настройки NPC с задержкой
    timer.Simple(0.2, function()
        if not IsValid(npc) then return end
        
        -- Настройки здоровья
        npc:SetHealth(npc_data.health or 100)
        npc:SetMaxHealth(npc_data.health or 100)
        
        -- Выдача оружия
        
        -- Настройки AI для атакующих
        npc:SetKeyValue("spawnflags", "256") -- Fall to ground
        npc:SetKeyValue("squadname", "attackers_wave_" .. NextRP.AutoEvents.Data.current_wave)
        
        -- Задаем цель - центр обороны или ближайшего игрока
        timer.Simple(1, function()
            if not IsValid(npc) then return end
            
            -- Ищем ближайшего игрока в радиусе 800 единиц
            local nearest_player = nil
            local nearest_distance = math.huge
            
            for _, ply in pairs(player.GetAll()) do
                if ply:Alive() then
                    local distance = npc:GetPos():Distance(ply:GetPos())
                    if distance < 800 and distance < nearest_distance then
                        nearest_distance = distance
                        nearest_player = ply
                    end
                end
            end
        end)
    end)
    
    -- Автоудаление через 8 минут (защита от накопления)
    timer.Simple(480, function()
        if IsValid(npc) then
            npc:Remove()
        end
    end)
    
    return npc
end


-- Спавн защитников точек (для захвата)
function NextRP.AutoEvents.SpawnPointDefenders(map_data)
    local capture_points = ents.FindByClass("nextrp_capture_point")
    
    for _, point in pairs(capture_points) do
        if IsValid(point) and point:GetActive() and not point:GetCaptured() then
            for i = 1, map_data.defenders.count_per_point do
                local npc_data = map_data.defenders.npc_types[math.random(1, #map_data.defenders.npc_types)]
                NextRP.AutoEvents.SpawnNPC(npc_data, point:GetPos(), point:GetPos())
            end
        end
    end
end

-- Проверка урона в зоне
function NextRP.AutoEvents.CheckZoneDamage(map_data)
    if not NextRP.AutoEvents.Data.event_active then
        timer.Remove("AutoEvents_ZoneDamage")
        return
    end
    
    for _, ply in pairs(player.GetAll()) do
        if IsValid(ply) and ply:Alive() then
            local dist = ply:GetPos():Distance(NextRP.AutoEvents.Data.defense_center_pos)
            if dist > map_data.defense_radius then
                ply:TakeDamage(NextRP.AutoEvents.Config.Settings.zone_damage)
                ply:ChatPrint("[AutoEvents] Вы получаете урон за пределами зоны обороны!")
            end
        end
    end
end

-- Обработка смерти игрока
hook.Add("PlayerDeath", "AutoEvents_PlayerDeath", function(victim, inflictor, attacker)
    if not NextRP.AutoEvents.Data.event_active then return end
    
    NextRP.AutoEvents.Data.reinforcement_points = NextRP.AutoEvents.Data.reinforcement_points - NextRP.AutoEvents.Config.Settings.death_cost
    
    for _, ply in pairs(player.GetAll()) do
        if IsValid(ply) then
            ply:ChatPrint("[AutoEvents] " .. victim:Nick() .. " погиб! Очки подкрепления: " .. NextRP.AutoEvents.Data.reinforcement_points)
        end
    end
    
    if NextRP.AutoEvents.Data.reinforcement_points <= 0 then
        NextRP.AutoEvents.EndEvent(false, "Очки подкрепления исчерпаны! Поражение!")
    end
    
    NextRP.AutoEvents.UpdateHUD()
end)

-- Обработка захвата точки
function NextRP.AutoEvents.OnPointCaptured()
    if not NextRP.AutoEvents.Data.event_active then return end
    
    NextRP.AutoEvents.Data.captured_points = NextRP.AutoEvents.Data.captured_points + 1
    
    local current_map = game.GetMap()
    local map_data = NextRP.AutoEvents.Config.Maps[current_map]
    
    for _, ply in pairs(player.GetAll()) do
        if IsValid(ply) then
            ply:ChatPrint("[AutoEvents] Точка захвачена! (" .. NextRP.AutoEvents.Data.captured_points .. "/" .. (map_data.capture_points or 0) .. ")")
        end
    end
    
    if map_data and NextRP.AutoEvents.Data.captured_points >= map_data.capture_points then
        NextRP.AutoEvents.EndEvent(true, "Все точки захвачены! Победа!")
    end
    
    NextRP.AutoEvents.UpdateHUD()
end

-- Функция окончания ивента
function NextRP.AutoEvents.EndEvent(success, message)
    NextRP.AutoEvents.Data.event_active = false
    NextRP.AutoEvents.Data.preparation_active = false -- Останавливаем и подготовку
    NextRP.AutoEvents.Data.total_waves = 0
    NextRP.AutoEvents.Data.completed_waves = 0
    NextRP.AutoEvents.Data.active_waves = {}
    
    -- Удаление всех NPC
    for _, npc in pairs(NextRP.AutoEvents.Data.spawned_npcs) do
        if IsValid(npc) then
            npc:Remove()
        end
    end
    NextRP.AutoEvents.Data.spawned_npcs = {}
    
    -- Остановка таймеров
    timer.Remove("AutoEvents_ZoneDamage")
    
    for _, ply in pairs(player.GetAll()) do
        if IsValid(ply) then
            ply:ChatPrint("[AutoEvents] " .. message)
            
            -- Выдача наград при победе
            if success == true then
                local current_map = game.GetMap()
                local map_data = NextRP.AutoEvents.Config.Maps[current_map]

                ply:ChatPrint("[AutoEvents] Вы получили награду за победу!")
                NextRP.Progression:AddXP(ply, map_data.reward_xp)
            end
        end
    end
    
    print("[AutoEvents] Ивент завершен: " .. message)
    
    -- Возврат на основную карту через 30 секунд
    timer.Simple(30, function()
        for map_name, map_data in pairs(NextRP.AutoEvents.Config.Maps) do
            if map_data.is_main then
                NextRP.AutoEvents.ChangeMap(map_name)
                
                -- Запуск отсчета до следующего ивента после смены карты
                timer.Simple(NextRP.AutoEvents.Config.Settings.change_delay + 5, function()
                    NextRP.AutoEvents.StartScheduleCountdown()
                end)
                break
            end
        end
    end)
    
    for wave_id, timer_name in pairs(NextRP.AutoEvents.Data.wave_spawn_timers) do
        if timer.Exists(timer_name) then
            timer.Remove(timer_name)
        end
    end
    NextRP.AutoEvents.Data.wave_spawn_timers = {}

    local current_map = game.GetMap()
    local map_data = NextRP.AutoEvents.Config.Maps[current_map]

    NextRP.AutoEvents.UpdateHUD()
end

-- Обновленная функция NextRP.AutoEvents.UpdateHUD()
function NextRP.AutoEvents.UpdateHUD()
    local data = {
        active = NextRP.AutoEvents.Data.event_active,
        preparation_active = NextRP.AutoEvents.Data.preparation_active,
        preparation_time_left = 0,
        
        -- НОВЫЕ ПОЛЯ ДЛЯ ОТСЧЕТА РАСПИСАНИЯ
        schedule_countdown_active = NextRP.AutoEvents.Data.schedule_countdown_active,
        schedule_countdown_time_left = 0,
        schedule_countdown_event_name = NextRP.AutoEvents.Data.schedule_countdown_event_name,
        schedule_countdown_map_name = NextRP.AutoEvents.Data.schedule_countdown_map_name,
        
        event_type = NextRP.AutoEvents.Data.current_event_type,
        reinforcement_points = NextRP.AutoEvents.Data.reinforcement_points,
        max_reinforcement_points = NextRP.AutoEvents.Data.max_reinforcement_points,
        current_wave = NextRP.AutoEvents.Data.current_wave,
        captured_points = NextRP.AutoEvents.Data.captured_points,
        time_left = 0,
    }
    
    if NextRP.AutoEvents.Data.preparation_active then
        data.preparation_time_left = math.max(0, NextRP.AutoEvents.Config.Settings.preparation_time - (CurTime() - NextRP.AutoEvents.Data.preparation_start_time))
    elseif NextRP.AutoEvents.Data.schedule_countdown_active then
        data.schedule_countdown_time_left = math.max(0, NextRP.AutoEvents.Data.schedule_countdown_target_time - CurTime())
    elseif NextRP.AutoEvents.Data.event_active then
        local current_map = game.GetMap()
        local map_data = NextRP.AutoEvents.Config.Maps[current_map]
        
        if map_data then
            data.time_left = math.max(0, map_data.duration - (CurTime() - NextRP.AutoEvents.Data.event_start_time))
            data.max_capture_points = map_data.capture_points or 0
        end
    end
    
    net.Start("AutoEvents_UpdateHUD")
    net.WriteTable(data)
    net.Broadcast()
end

-- Таймер для регулярного обновления HUD во время ивента
timer.Create("AutoEvents_HUD_Update", 1, 0, function()
    if NextRP.AutoEvents.Data.event_active or NextRP.AutoEvents.Data.preparation_active or NextRP.AutoEvents.Data.schedule_countdown_active then
        NextRP.AutoEvents.UpdateHUD()
    end
end)

-- Обновленная проверка расписания
function NextRP.AutoEvents.CheckSchedule()
    local current_time = os.date("*t", os.time() + (NextRP.AutoEvents.Config.Settings.timezone_offset * 3600))
    local current_minutes = current_time.hour * 60 + current_time.min
    
    -- Проверяем каждую минуту
    if NextRP.AutoEvents.Data.last_schedule_check == current_minutes then
        return
    end
    NextRP.AutoEvents.Data.last_schedule_check = current_minutes
    
    print("[AutoEvents] Проверка расписания. Текущее время: " .. string.format("%02d:%02d", current_time.hour, current_time.min))
    
    -- Запуск отсчета, если он не активен и нет активных ивентов
    if not NextRP.AutoEvents.Data.schedule_countdown_active and 
       not NextRP.AutoEvents.Data.event_active and 
       not NextRP.AutoEvents.Data.preparation_active then
        print("[AutoEvents] Попытка запуска отсчета...")
        NextRP.AutoEvents.StartScheduleCountdown()
    end
    
    for _, schedule_item in pairs(NextRP.AutoEvents.Config.Schedule) do
        local schedule_minutes = schedule_item.hour * 60 + schedule_item.minute
        local notification_minutes = schedule_minutes - math.floor(NextRP.AutoEvents.Config.Settings.notification_time / 60)
        
        -- Уведомление за 5 минут (старая система, может быть отключена если включен отсчет)
        if current_minutes == notification_minutes and not NextRP.AutoEvents.Config.Settings.schedule_countdown_enabled then
            local map_data = NextRP.AutoEvents.Config.Maps[schedule_item.map]
            if map_data then
                for _, ply in pairs(player.GetAll()) do
                    if IsValid(ply) then
                        ply:ChatPrint("[AutoEvents] Через 5 минут: " .. schedule_item.name .. " (" .. map_data.name .. ")")
                    end
                end
                print("[AutoEvents] Уведомление: " .. schedule_item.name)
            end
        end
        
        -- Смена карты (происходит автоматически через отсчет, если он включен)
        if current_minutes == schedule_minutes and not NextRP.AutoEvents.Config.Settings.schedule_countdown_enabled then
            print("[AutoEvents] Расписание: " .. schedule_item.name .. " на карте " .. schedule_item.map)
            NextRP.AutoEvents.ChangeMap(schedule_item.map)
        end
    end
end

-- Создание дроп-пода
function NextRP.AutoEvents.CreateDropPod(drop_data, event_type)
    local pod = ents.Create("summe_dispenser_flying")
    if not IsValid(pod) then return end
    
    local target_pos = drop_data.drop_position
    local spawn_pos = target_pos + Vector(0, 0, NextRP.AutoEvents.Config.Settings.droppod_settings.fall_height)
    
    pod:SetPos(spawn_pos)
    pod.TargetPos = target_pos
    pod.event_npc = true
    
    local npc_list = {}
    for _, npc_data in pairs(drop_data.npcs) do
        for i = 1, (npc_data.count or 1) do
            table.insert(npc_list, npc_data.class)
        end
    end
    pod.NPCList = npc_list
    
    pod:Spawn()
    pod:SetModel(drop_data.model)
    pod:SetMaxHealth(drop_data.health)
    pod:SetHealth(drop_data.health)
    
    local phys = pod:GetPhysicsObject()
    if IsValid(phys) then
        phys:Wake()
    end
    
    table.insert(NextRP.AutoEvents.Data.spawned_npcs, pod)
    return pod
end

-- Спавн дроп-подов для ивента
function NextRP.AutoEvents.SpawnEventDropPods(map_data)
    if not map_data.droppods then return end
    
    for _, drop_data in pairs(map_data.droppods) do
        timer.Simple(drop_data.spawn_delay or 0, function()
            if NextRP.AutoEvents.Data.event_active then
                NextRP.AutoEvents.CreateDropPod(drop_data, map_data.event_type)
            end
        end)
    end
end

-- Создание LVS техники с ИИ
function NextRP.AutoEvents.CreateLVSVehicle(vehicle_data, event_type)
    local vehicle = ents.Create(vehicle_data.vehicle_class)
    if not IsValid(vehicle) then return end
    
    vehicle:SetPos(vehicle_data.spawn_position)
    vehicle:SetAngles(Angle(0, math.random(0, 360), 0))
    vehicle:Spawn()
    vehicle:Activate()
    vehicle.event_vehicle = true
    vehicle.event_type = event_type
    
    -- Настройка здоровья
    if vehicle_data.health_multiplier then
        local maxHP = vehicle:GetMaxHP()
        vehicle:SetHP(maxHP * vehicle_data.health_multiplier)
    end
    
    -- Включение ИИ
    if vehicle_data.ai_enabled and vehicle.SetAI then
        timer.Simple(1, function()
            if IsValid(vehicle) then
                vehicle:SetAI(true)
                
                -- Установка цели
                if vehicle_data.target_position then
                    vehicle:SetAITarget(vehicle_data.target_position)
                end
            end
        end)
    end
    
    table.insert(NextRP.AutoEvents.Data.spawned_npcs, vehicle)
    
    for _, ply in pairs(player.GetAll()) do
        if IsValid(ply) then
            ply:ChatPrint("[AutoEvents] 🚗 Техника противника заспавнена!")
        end
    end
    
    return vehicle
end

-- Спавн техники для ивента
function NextRP.AutoEvents.SpawnEventVehicles(map_data)
    if not map_data.vehicles then return end
    
    for _, vehicle_data in pairs(map_data.vehicles) do
        timer.Simple(vehicle_data.spawn_delay or 0, function()
            if NextRP.AutoEvents.Data.event_active then
                NextRP.AutoEvents.CreateLVSVehicle(vehicle_data, map_data.event_type)
            end
        end)
    end
end

-- Таймер проверки расписания (каждую минуту)
timer.Create("AutoEvents_Schedule", 60, 0, NextRP.AutoEvents.CheckSchedule)

concommand.Add("autoevents_test_vehicle", function(ply, cmd, args)
    if IsValid(ply) and not ply:IsAdmin() then return end
    
    local vehicle_class = args[1] or "lvs_starfighter_vulturedroid"
    local test_vehicle_data = {
        spawn_position = ply:GetPos() + ply:GetForward() * 500,
        vehicle_class = vehicle_class,
        target_position = ply:GetPos() + ply:GetForward() * 1000,
        team = "enemy",
        health_multiplier = 1.5,
        ai_enabled = true
    }
    
    NextRP.AutoEvents.CreateLVSVehicle(test_vehicle_data, "test")
    ply:ChatPrint("[AutoEvents] Тестовая техника " .. vehicle_class .. " заспавнена!")
end)

concommand.Add("autoevents_test_droppod", function(ply, cmd, args)
    if IsValid(ply) and not ply:IsAdmin() then return end
    
    local test_drop_data = {
        drop_position = ply:GetPos() + ply:GetForward() * 300,
        model = "models/props/starwars/vehicles/sbd_dispenser.mdl",
        health = 1000,
        npcs = {{class = "npc_combine_s", count = 3}}
    }
    
    NextRP.AutoEvents.CreateDropPod(test_drop_data, "test")
end)

concommand.Add("autoevents_force_countdown", function(ply, cmd, args)
    if IsValid(ply) and not ply:IsAdmin() then
        ply:ChatPrint("[AutoEvents] У вас нет прав!")
        return
    end
    
    -- Остановить текущий отсчет
    NextRP.AutoEvents.Data.schedule_countdown_active = false
    
    -- Запустить новый
    NextRP.AutoEvents.StartScheduleCountdown()
    
    if IsValid(ply) then
        ply:ChatPrint("[AutoEvents] Отсчет принудительно перезапущен!")
    end
    
    print("[AutoEvents] Отсчет принудительно перезапущен администратором")
end)

concommand.Add("autoevents_debug_schedule", function(ply, cmd, args)
    if IsValid(ply) and not ply:IsAdmin() then return end
    
    local current_time = os.date("*t", os.time() + (NextRP.AutoEvents.Config.Settings.timezone_offset * 3600))
    
    if IsValid(ply) then
        ply:ChatPrint("=== Отладка расписания ===")
        ply:ChatPrint("Текущее время: " .. string.format("%02d:%02d", current_time.hour, current_time.min))
        ply:ChatPrint("Отсчет активен: " .. tostring(NextRP.AutoEvents.Data.schedule_countdown_active))
        
        for i, schedule_item in pairs(NextRP.AutoEvents.Config.Schedule) do
            ply:ChatPrint("Ивент " .. i .. ": " .. schedule_item.name .. " в " .. string.format("%02d:%02d", schedule_item.hour, schedule_item.minute))
        end
        
        local next_event = NextRP.AutoEvents.FindNextScheduledEvent()
        if next_event then
            ply:ChatPrint("Следующий ивент: " .. next_event.name .. " через " .. math.floor(next_event.time_until_seconds / 60) .. " минут")
        else
            ply:ChatPrint("Следующий ивент не найден!")
        end
    end
end)

-- Консольные команды
concommand.Add("autoevents_start", function(ply, cmd, args)
    if IsValid(ply) and not ply:IsAdmin() then
        ply:ChatPrint("[AutoEvents] У вас нет прав!")
        return
    end
    
    NextRP.AutoEvents.StartEvent()
    
    if IsValid(ply) then
        ply:ChatPrint("[AutoEvents] Команда запуска выполнена")
    end
end)

concommand.Add("autoevents_stop", function(ply, cmd, args)
    if IsValid(ply) and not ply:IsAdmin() then
        ply:ChatPrint("[AutoEvents] У вас нет прав!")
        return
    end
    
    if NextRP.AutoEvents.Data.event_active or NextRP.AutoEvents.Data.preparation_active then
        NextRP.AutoEvents.EndEvent(false, "Ивент остановлен администратором")
    else
        if IsValid(ply) then
            ply:ChatPrint("[AutoEvents] Ивент не активен")
        end
    end
end)

concommand.Add("autoevents_changemap", function(ply, cmd, args)
    if IsValid(ply) and not ply:IsAdmin() then
        ply:ChatPrint("[AutoEvents] У вас нет прав!")
        return
    end
    
    local map_name = args[1]
    if not map_name then
        if IsValid(ply) then
            ply:ChatPrint("[AutoEvents] Укажите название карты!")
        end
        return
    end
    
    NextRP.AutoEvents.ChangeMap(map_name)
    
    if IsValid(ply) then
        ply:ChatPrint("[AutoEvents] Команда смены карты выполнена")
    end
end)

concommand.Add("autoevents_info", function(ply, cmd, args)
    if IsValid(ply) and not ply:IsAdmin() then
        ply:ChatPrint("[AutoEvents] У вас нет прав!")
        return
    end
    
    local current_map = game.GetMap()
    local map_data = NextRP.AutoEvents.Config.Maps[current_map]
    
    if IsValid(ply) then
        ply:ChatPrint("=== Информация об авто-ивентах ===")
        ply:ChatPrint("Текущая карта: " .. current_map)
        
        if map_data then
            ply:ChatPrint("Название: " .. map_data.name)
            ply:ChatPrint("Тип: " .. (map_data.event_type or "Основная"))
            ply:ChatPrint("Награда за побеуд " .. map_data.reward_xp)
            
            if NextRP.AutoEvents.Data.schedule_countdown_active then
                ply:ChatPrint("Статус: Отсчет до ивента")
                local timeLeft = math.max(0, NextRP.AutoEvents.Data.schedule_countdown_target_time - CurTime())
                local hours = math.floor(timeLeft / 3600)
                local minutes = math.floor((timeLeft % 3600) / 60)
                ply:ChatPrint("До ивента \"" .. NextRP.AutoEvents.Data.schedule_countdown_event_name .. "\": " .. 
                             string.format("%02d:%02d", hours, minutes))
            elseif NextRP.AutoEvents.Data.preparation_active then
                ply:ChatPrint("Статус ивента: Подготовка")
                local prepTimeLeft = math.max(0, NextRP.AutoEvents.Config.Settings.preparation_time - (CurTime() - NextRP.AutoEvents.Data.preparation_start_time))
                ply:ChatPrint("Время до начала: " .. math.floor(prepTimeLeft) .. " секунд")
            elseif NextRP.AutoEvents.Data.event_active then
                ply:ChatPrint("Статус ивента: Активен")
                ply:ChatPrint("Очки подкрепления: " .. NextRP.AutoEvents.Data.reinforcement_points .. "/" .. NextRP.AutoEvents.Data.max_reinforcement_points)
                ply:ChatPrint("Текущая волна: " .. NextRP.AutoEvents.Data.current_wave)
                ply:ChatPrint("Захвачено точек: " .. NextRP.AutoEvents.Data.captured_points)
            else
                ply:ChatPrint("Статус ивента: Неактивен")
            end
        else
            ply:ChatPrint("Карта не настроена в конфигурации!")
        end
        
        -- Показать ближайший ивент по расписанию
        local next_event = NextRP.AutoEvents.FindNextScheduledEvent()
        if next_event then
            ply:ChatPrint("Следующий ивент: " .. next_event.name .. " в " .. string.format("%02d:%02d", next_event.hour, next_event.minute))
        end
    end
end)

concommand.Add("autoevents_schedule", function(ply, cmd, args)
    if IsValid(ply) and not ply:IsAdmin() then
        ply:ChatPrint("[AutoEvents] У вас нет прав!")
        return
    end
    
    if IsValid(ply) then
        ply:ChatPrint("=== Расписание ивентов ===")
        
        for _, schedule_item in pairs(NextRP.AutoEvents.Config.Schedule) do
            local time_str = string.format("%02d:%02d", schedule_item.hour, schedule_item.minute)
            ply:ChatPrint(time_str .. " - " .. schedule_item.name .. " (" .. schedule_item.map .. ")")
        end
        
        if NextRP.AutoEvents.Data.schedule_countdown_active then
            local timeLeft = math.max(0, NextRP.AutoEvents.Data.schedule_countdown_target_time - CurTime())
            local hours = math.floor(timeLeft / 3600)
            local minutes = math.floor((timeLeft % 3600) / 60)
            ply:ChatPrint("Текущий отсчет: " .. NextRP.AutoEvents.Data.schedule_countdown_event_name .. 
                         " через " .. string.format("%02d:%02d", hours, minutes))
        end
    end
end)

-- Автоматический запуск ивента при загрузке ивентовой карты
hook.Add("InitPostEntity", "AutoEvents_AutoStart", function()
    timer.Simple(10, function()
        local current_map = game.GetMap()
        local map_data = NextRP.AutoEvents.Config.Maps[current_map]
        
        print("[AutoEvents] Проверка карты при загрузке: " .. current_map)
        
        if map_data and not map_data.is_main then
            print("[AutoEvents] Ивентовая карта обнаружена, запуск ивента...")
            NextRP.AutoEvents.StartEvent()
        else
            -- На основной карте запускаем отсчет расписания
            print("[AutoEvents] Основная карта, запуск отсчета расписания...")
            NextRP.AutoEvents.StartScheduleCountdown()
        end
    end)
end)

concommand.Add("autoevents_time", function(ply, cmd, args)
    if IsValid(ply) and not ply:IsAdmin() then
        ply:ChatPrint("[AutoEvents] У вас нет прав!")
        return
    end
    
    local server_time_raw = os.date("*t")
    local server_time_corrected = os.date("*t", os.time() + (NextRP.AutoEvents.Config.Settings.timezone_offset * 3600))
    
    if IsValid(ply) then
        ply:ChatPrint("=== Информация о времени ===")
        ply:ChatPrint("Серверное время (UTC): " .. string.format("%02d:%02d", server_time_raw.hour, server_time_raw.min))
        ply:ChatPrint("Скорректированное время: " .. string.format("%02d:%02d", server_time_corrected.hour, server_time_corrected.min))
        ply:ChatPrint("Сдвиг часового пояса: " .. NextRP.AutoEvents.Config.Settings.timezone_offset .. " часов")
        
        -- Принудительная синхронизация
        NextRP.AutoEvents.SyncServerTime()
    else
        print("Серверное время (UTC): " .. string.format("%02d:%02d", server_time_raw.hour, server_time_raw.min))
        print("Скорректированное время: " .. string.format("%02d:%02d", server_time_corrected.hour, server_time_corrected.min))
    end
end)

-- Дополнительные команды для отладки
concommand.Add("autoevents_debug", function(ply, cmd, args)
    if IsValid(ply) and not ply:IsAdmin() then
        ply:ChatPrint("[AutoEvents] У вас нет прав!")
        return
    end
    
    if IsValid(ply) then
        ply:ChatPrint("=== Отладочная информация ===")
        ply:ChatPrint("Активен: " .. tostring(NextRP.AutoEvents.Data.event_active))
        ply:ChatPrint("Подготовка: " .. tostring(NextRP.AutoEvents.Data.preparation_active))
        ply:ChatPrint("Отсчет расписания: " .. tostring(NextRP.AutoEvents.Data.schedule_countdown_active))
        ply:ChatPrint("Тип ивента: " .. tostring(NextRP.AutoEvents.Data.current_event_type))
        ply:ChatPrint("Очки подкрепления: " .. NextRP.AutoEvents.Data.reinforcement_points)
        ply:ChatPrint("Текущая волна: " .. NextRP.AutoEvents.Data.current_wave)
        ply:ChatPrint("Захвачено точек: " .. NextRP.AutoEvents.Data.captured_points)
        ply:ChatPrint("Живых NPC: " .. #NextRP.AutoEvents.Data.spawned_npcs)
        
        if NextRP.AutoEvents.Data.schedule_countdown_active then
            local timeLeft = math.max(0, NextRP.AutoEvents.Data.schedule_countdown_target_time - CurTime())
            ply:ChatPrint("Время до ивента: " .. math.floor(timeLeft) .. " сек")
            ply:ChatPrint("Следующий ивент: " .. NextRP.AutoEvents.Data.schedule_countdown_event_name)
        end
        
        -- Проверка энтити
        local npc_spawns = #ents.FindByClass("nextrp_npc_spawn")
        local capture_points = #ents.FindByClass("nextrp_capture_point")
        local defense_centers = #ents.FindByClass("nextrp_defense_center")
        
        ply:ChatPrint("Энтити - Спавны: " .. npc_spawns .. ", Точки: " .. capture_points .. ", Центры: " .. defense_centers)
    end
end)

-- НОВЫЕ КОМАНДЫ ДЛЯ УПРАВЛЕНИЯ ОТСЧЕТОМ
concommand.Add("autoevents_start_countdown", function(ply, cmd, args)
    if IsValid(ply) and not ply:IsAdmin() then
        ply:ChatPrint("[AutoEvents] У вас нет прав!")
        return
    end
    
    NextRP.AutoEvents.StartScheduleCountdown()
    
    if IsValid(ply) then
        ply:ChatPrint("[AutoEvents] Отсчет до следующего ивента запущен")
    end
end)

concommand.Add("autoevents_stop_countdown", function(ply, cmd, args)
    if IsValid(ply) and not ply:IsAdmin() then
        ply:ChatPrint("[AutoEvents] У вас нет прав!")
        return
    end
    
    NextRP.AutoEvents.Data.schedule_countdown_active = false
    NextRP.AutoEvents.UpdateHUD()
    
    if IsValid(ply) then
        ply:ChatPrint("[AutoEvents] Отсчет остановлен")
    end
end)

concommand.Add("autoevents_force_wave", function(ply, cmd, args)
    if IsValid(ply) and not ply:IsAdmin() then
        ply:ChatPrint("[AutoEvents] У вас нет прав!")
        return
    end
    
    if not NextRP.AutoEvents.Data.event_active then
        if IsValid(ply) then
            ply:ChatPrint("[AutoEvents] Ивент не активен!")
        end
        return
    end
    
    local current_map = game.GetMap()
    local map_data = NextRP.AutoEvents.Config.Maps[current_map]
    
    if map_data and map_data.event_type == "defense" and map_data.attack_waves then
        local wave_num = tonumber(args[1]) or 1
        local wave_data = map_data.attack_waves[wave_num]
        
        if wave_data then
            NextRP.AutoEvents.SpawnAttackWave(wave_data)
            if IsValid(ply) then
                ply:ChatPrint("[AutoEvents] Принудительно запущена волна " .. wave_num)
            end
        else
            if IsValid(ply) then
                ply:ChatPrint("[AutoEvents] Волна " .. wave_num .. " не найдена!")
            end
        end
    else
        if IsValid(ply) then
            ply:ChatPrint("[AutoEvents] Команда работает только в режиме обороны!")
        end
    end
end)

concommand.Add("autoevents_add_reinforcements", function(ply, cmd, args)
    if IsValid(ply) and not ply:IsAdmin() then
        ply:ChatPrint("[AutoEvents] У вас нет прав!")
        return
    end
    
    if not NextRP.AutoEvents.Data.event_active then
        if IsValid(ply) then
            ply:ChatPrint("[AutoEvents] Ивент не активен!")
        end
        return
    end
    
    local amount = tonumber(args[1]) or 10
    NextRP.AutoEvents.Data.reinforcement_points = NextRP.AutoEvents.Data.reinforcement_points + amount
    
    for _, ply_target in pairs(player.GetAll()) do
        if IsValid(ply_target) then
            ply_target:ChatPrint("[AutoEvents] Добавлено " .. amount .. " очков подкрепления! Всего: " .. NextRP.AutoEvents.Data.reinforcement_points)
        end
    end
    
    NextRP.AutoEvents.UpdateHUD()
end)

concommand.Add("autoevents_clear_npcs", function(ply, cmd, args)
    if IsValid(ply) and not ply:IsAdmin() then
        ply:ChatPrint("[AutoEvents] У вас нет прав!")
        return
    end
    
    local count = 0
    for _, npc in pairs(NextRP.AutoEvents.Data.spawned_npcs) do
        if IsValid(npc) then
            npc:Remove()
            count = count + 1
        end
    end
    
    NextRP.AutoEvents.Data.spawned_npcs = {}
    
    if IsValid(ply) then
        ply:ChatPrint("[AutoEvents] Удалено " .. count .. " NPC")
    end
end)

concommand.Add("autoevents_test_hud", function(ply, cmd, args)
    if IsValid(ply) and not ply:IsAdmin() then
        ply:ChatPrint("[AutoEvents] У вас нет прав!")
        return
    end
    
    -- Принудительно активируем HUD для тестирования
    NextRP.AutoEvents.Data.event_active = true
    NextRP.AutoEvents.Data.current_event_type = "defense"
    NextRP.AutoEvents.Data.reinforcement_points = 25
    NextRP.AutoEvents.Data.max_reinforcement_points = 50
    NextRP.AutoEvents.Data.current_wave = 2
    NextRP.AutoEvents.Data.event_start_time = CurTime()
    
    NextRP.AutoEvents.UpdateHUD()
    
    if IsValid(ply) then
        ply:ChatPrint("[AutoEvents] Тестовый HUD активирован!")
    end
end)

concommand.Add("autoevents_hide_hud", function(ply, cmd, args)
    if IsValid(ply) and not ply:IsAdmin() then
        ply:ChatPrint("[AutoEvents] У вас нет прав!")
        return
    end
    
    NextRP.AutoEvents.Data.event_active = false
    NextRP.AutoEvents.Data.preparation_active = false
    NextRP.AutoEvents.Data.schedule_countdown_active = false
    NextRP.AutoEvents.UpdateHUD()
    
    if IsValid(ply) then
        ply:ChatPrint("[AutoEvents] HUD скрыт!")
    end
end)

concommand.Add("autoevents_test_preparation", function(ply, cmd, args)
    if IsValid(ply) and not ply:IsAdmin() then
        ply:ChatPrint("[AutoEvents] У вас нет прав!")
        return
    end
    
    -- Тестирование режима подготовки
    NextRP.AutoEvents.Data.preparation_active = true
    NextRP.AutoEvents.Data.preparation_start_time = CurTime()
    NextRP.AutoEvents.Data.current_event_type = "defense"
    NextRP.AutoEvents.Data.reinforcement_points = 50
    NextRP.AutoEvents.Data.max_reinforcement_points = 50
    
    NextRP.AutoEvents.UpdateHUD()
    
    if IsValid(ply) then
        ply:ChatPrint("[AutoEvents] Тестовый режим подготовки активирован!")
    end
end)

concommand.Add("autoevents_test_countdown", function(ply, cmd, args)
    if IsValid(ply) and not ply:IsAdmin() then
        ply:ChatPrint("[AutoEvents] У вас нет прав!")
        return
    end
    
    -- Тестирование режима отсчета
    local test_time = tonumber(args[1]) or 300 -- 5 минут по умолчанию
    
    NextRP.AutoEvents.Data.schedule_countdown_active = true
    NextRP.AutoEvents.Data.schedule_countdown_target_time = CurTime() + test_time
    NextRP.AutoEvents.Data.schedule_countdown_event_name = "Тестовый ивент"
    NextRP.AutoEvents.Data.schedule_countdown_map_name = "rp_oldworld"
    
    NextRP.AutoEvents.UpdateHUD()
    
    if IsValid(ply) then
        ply:ChatPrint("[AutoEvents] Тестовый отсчет на " .. test_time .. " секунд активирован!")
    end
end)

-- Очистка данных при отключении
hook.Add("ShutDown", "AutoEvents_Cleanup", function()
    -- Удаляем всех NPC
    for _, npc in pairs(NextRP.AutoEvents.Data.spawned_npcs) do
        if IsValid(npc) then
            npc:Remove()
        end
    end
    
    -- Останавливаем таймеры
    timer.Remove("AutoEvents_Schedule")
    timer.Remove("AutoEvents_ZoneDamage")
    timer.Remove("AutoEvents_HUD_Update")
    
    print("[AutoEvents] Очистка завершена")
end)

-- Добавить в конец sv_autoevents.lua
timer.Create("AutoEvents_CountdownCheck", 300, 0, function() -- Каждые 5 минут
    if not NextRP.AutoEvents.Data.schedule_countdown_active and 
       not NextRP.AutoEvents.Data.event_active and 
       not NextRP.AutoEvents.Data.preparation_active then
        print("[AutoEvents] Автоматическая проверка отсчета...")
        NextRP.AutoEvents.StartScheduleCountdown()
    end
end)