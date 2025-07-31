-- gamemode/modules/generator/sv_generator.lua

if not NextRP.Generator:IsMapEnabled() then return end

AddCSLuaFile("cl_generator.lua")

-- Переменные сервера
NextRP.Generator.FuelLevel = 100 -- Текущий уровень топлива
NextRP.Generator.GeneratorEntity = nil
NextRP.Generator.CrystalVeins = {}
NextRP.Generator.PlayerCrystals = {} -- Инвентарь кристаллов игроков
NextRP.Generator.LightButton = nil -- Кнопка управления светом
NextRP.Generator.FuelTimer = nil -- Таймер расхода топлива
NextRP.Generator.VeinTimers = {} -- Таймеры восстановления жил

-- Сетевые строки
util.AddNetworkString("Generator_UpdateFuel")
util.AddNetworkString("Generator_UpdatePlayerCrystals")
util.AddNetworkString("Generator_StartMining")
util.AddNetworkString("Generator_StopMining")
util.AddNetworkString("Generator_OpenMenu")
util.AddNetworkString("Generator_RequestData")
util.AddNetworkString("Generator_UpdateVeinCrystals")

-- Инициализация модуля
function NextRP.Generator:Initialize()
    print("[Generator] Инициализация модуля генератора...")
    
    self:CreateGenerator()
    self:CreateCrystalVeins()
    self:FindLightButton()
    self:StartFuelConsumption()
    
    print("[Generator] Модуль генератора инициализирован")
end

-- Создание генератора
function NextRP.Generator:CreateGenerator()
    local mapConfig = self:GetMapConfig()
    local pos = mapConfig.Generator and mapConfig.Generator.Position or self.Config.Generator.Position
    
    local generator = ents.Create("nextrp_generator")
    if IsValid(generator) then
        generator:SetPos(pos)
        generator:Spawn()
        self.GeneratorEntity = generator
        print("[Generator] Генератор создан на позиции: " .. tostring(pos))
    else
        print("[Generator] ОШИБКА: Не удалось создать генератор!")
    end
end

-- Создание жил кристаллов
function NextRP.Generator:CreateCrystalVeins()
    local mapConfig = self:GetMapConfig()
    local veinPositions = mapConfig.Crystals and mapConfig.Crystals.Veins or {}
    
    print("[Generator] Создание " .. #veinPositions .. " жил кристаллов...")
    
    for i, pos in ipairs(veinPositions) do
        self:CreateCrystalVein(pos, i)
    end
end

-- Создание одной жилы кристаллов
function NextRP.Generator:CreateCrystalVein(pos, id)
    local vein = ents.Create("nextrp_crystal_vein")
    if IsValid(vein) then
        vein:SetPos(pos)
        vein.VeinID = id
        vein.CrystalAmount = self.Config.Crystals.VeinCapacity -- Изначально полная жила
        vein.IsBeingMined = false
        vein.LastMiningTime = 0
        vein:Spawn()
        
        self.CrystalVeins[id] = vein
        
        -- Запускаем таймер восстановления для этой жилы
        self:StartVeinRestoration(vein)
        
        print("[Generator] Жила #" .. id .. " создана на позиции: " .. tostring(pos))
    else
        print("[Generator] ОШИБКА: Не удалось создать жилу #" .. id .. "!")
    end
end

-- ИСПРАВЛЕНИЕ: Реализация восстановления жил
function NextRP.Generator:StartVeinRestoration(vein)
    if not IsValid(vein) then return end
    
    local veinID = vein.VeinID
    local timerName = "VeinRestore_" .. veinID
    
    -- Удаляем старый таймер если есть
    if timer.Exists(timerName) then
        timer.Remove(timerName)
    end
    
    -- Создаем новый таймер восстановления
    timer.Create(timerName, self.Config.Crystals.RestoreTime, 0, function()
        if not IsValid(vein) then
            timer.Remove(timerName)
            return
        end
        
        -- Восстанавливаем кристаллы если жила не полная
        if vein.CrystalAmount < self.Config.Crystals.VeinCapacity then
            vein.CrystalAmount = math.min(
                vein.CrystalAmount + self.Config.Crystals.RestoreRate,
                self.Config.Crystals.VeinCapacity
            )
            
            -- Обновляем клиентов
            self:UpdateVeinCrystals(vein)
            
            print("[Generator] Жила #" .. veinID .. " восстановлена до " .. vein.CrystalAmount .. " кристаллов")
        end
    end)
    
    self.VeinTimers[veinID] = timerName
end

-- Обновление количества кристаллов в жиле для клиентов
function NextRP.Generator:UpdateVeinCrystals(vein)
    if not IsValid(vein) then return end
    
    net.Start("Generator_UpdateVeinCrystals")
    net.WriteInt(vein.VeinID, 32)
    net.WriteInt(vein.CrystalAmount, 32)
    net.Broadcast()
end

-- Поиск кнопки управления светом
function NextRP.Generator:FindLightButton()
    local mapConfig = self:GetMapConfig()
    local buttonName = mapConfig.Generator and mapConfig.Generator.LightButtonName or self.Config.Generator.LightButtonName
    
    -- Ищем кнопку по названию
    for _, ent in pairs(ents.GetAll()) do
        if IsValid(ent) and ent:GetName() == buttonName then
            self.LightButton = ent
            print("[Generator] Найдена кнопка света: " .. buttonName)
            break
        end
    end
    
    if not IsValid(self.LightButton) then
        print("[Generator] Предупреждение: Кнопка света '" .. buttonName .. "' не найдена на карте!")
    end
end

-- ИСПРАВЛЕНИЕ: Улучшенный расход топлива
function NextRP.Generator:StartFuelConsumption()
    -- Удаляем старый таймер если есть
    if self.FuelTimer and timer.Exists(self.FuelTimer) then
        timer.Remove(self.FuelTimer)
    end
    
    local timerName = "GeneratorFuelConsumption"
    self.FuelTimer = timerName
    
    -- Создаем таймер расхода топлива (каждые 60 секунд)
    timer.Create(timerName, 60, 0, function()
        if self.FuelLevel > 0 then
            local consumption = self.Config.Generator.FuelConsumption / 100 -- Конвертируем проценты в десятичные
            self.FuelLevel = math.max(self.FuelLevel - consumption, 0)
            
            print("[Generator] Расход топлива: " .. consumption .. "%, текущий уровень: " .. self.FuelLevel .. "%")
            
            self:UpdateFuelLevel()
            
            -- Проверяем состояние генератора
            if self.FuelLevel <= 0 then
                self:OnGeneratorShutdown()
            elseif self.FuelLevel <= self.Config.Generator.CriticalFuelWarning then
                self:OnCriticalFuel()
            elseif self.FuelLevel <= self.Config.Generator.LowFuelWarning then
                self:OnLowFuel()
            end
        end
    end)
    
    print("[Generator] Запущен таймер расхода топлива")
end

-- Обработка отключения генератора
function NextRP.Generator:OnGeneratorShutdown()
    print("[Generator] Генератор отключился!")
    
    -- Выключаем свет
    if IsValid(self.LightButton) then
        self.LightButton:Fire("Use")
    end
    
    self:BroadcastMessage(self.Config.Notifications.GeneratorOff)
    
    -- Воспроизводим звук отключения
    if self.Config.Sounds.GeneratorOff then
        for _, ply in pairs(player.GetAll()) do
            if IsValid(ply) then
                ply:EmitSound(self.Config.Sounds.GeneratorOff)
            end
        end
    end
end

-- Обработка критического уровня топлива
function NextRP.Generator:OnCriticalFuel()
    self:BroadcastMessage(string.format(self.Config.Notifications.CriticalFuel, math.Round(self.FuelLevel)))
    
    -- Воспроизводим звук предупреждения
    if self.Config.Sounds.LowFuel then
        for _, ply in pairs(player.GetAll()) do
            if IsValid(ply) then
                ply:EmitSound(self.Config.Sounds.LowFuel)
            end
        end
    end
end

-- Обработка низкого уровня топлива
function NextRP.Generator:OnLowFuel()
    self:BroadcastMessage(string.format(self.Config.Notifications.LowFuel, math.Round(self.FuelLevel)))
end

-- Заправка генератора
function NextRP.Generator:RefuelGenerator(player)
    if not IsValid(player) then return false end
    
    local playerCrystals = self:GetPlayerCrystals(player)
    if playerCrystals <= 0 then
        player:ChatPrint(self.Config.Notifications.NoCrystals)
        return false
    end
    
    if self.FuelLevel >= 100 then
        player:ChatPrint(self.Config.Notifications.NoFuel)
        return false
    end
    
    -- Заправляем генератор
    self.FuelLevel = math.min(self.FuelLevel + self.Config.Generator.RefuelAmount, 100)
    
    -- Убираем кристалл у игрока
    self:SetPlayerCrystals(player, playerCrystals - 1)
    
    -- Если генератор был выключен и теперь заправлен, включаем свет
    if self.FuelLevel > 0 and IsValid(self.LightButton) then
        self.LightButton:Fire("Use")
    end
    
    -- Уведомляем игрока
    player:ChatPrint(string.format(self.Config.Notifications.Refueled, math.Round(self.FuelLevel)))
    
    -- Воспроизводим звук заправки
    if self.Config.Sounds.Refuel then
        player:EmitSound(self.Config.Sounds.Refuel)
    end
    
    self:UpdateFuelLevel()
    
    print("[Generator] Игрок " .. player:Name() .. " заправил генератор до " .. self.FuelLevel .. "%")
    
    return true
end

-- Обновление уровня топлива для клиентов
function NextRP.Generator:UpdateFuelLevel()
    net.Start("Generator_UpdateFuel")
    net.WriteFloat(self.FuelLevel)
    net.Broadcast()
end

-- Установка количества кристаллов игрока
function NextRP.Generator:SetPlayerCrystals(player, amount)
    if not IsValid(player) then return end
    
    self.PlayerCrystals[player:SteamID64()] = math.max(amount, 0)
    
    net.Start("Generator_UpdatePlayerCrystals")
    net.WriteInt(self.PlayerCrystals[player:SteamID64()], 32)
    net.Send(player)
end

-- Получение количества кристаллов игрока
function NextRP.Generator:GetPlayerCrystals(player)
    if not IsValid(player) then return 0 end
    return self.PlayerCrystals[player:SteamID64()] or 0
end

-- Рассылка сообщения всем игрокам
function NextRP.Generator:BroadcastMessage(message)
    for _, player in pairs(player.GetAll()) do
        if IsValid(player) then
            player:ChatPrint(message)
        end
    end
end

-- Добыча кристаллов
function NextRP.Generator:StartMining(player, vein)
    if not IsValid(player) or not IsValid(vein) then return false end
    
    if vein.IsBeingMined then
        player:ChatPrint("❌ Эта жила уже добывается!")
        return false
    end
    
    if vein.CrystalAmount <= 0 then
        player:ChatPrint("❌ В этой жиле нет кристаллов!")
        return false
    end
    
    local playerCrystals = self:GetPlayerCrystals(player)
    if playerCrystals >= self.Config.Crystals.MaxPlayerCrystals then
        player:ChatPrint(string.format(self.Config.Notifications.CrystalsFull, 
            playerCrystals, self.Config.Crystals.MaxPlayerCrystals))
        return false
    end
    
    -- Проверяем кулдаун
    local lastMining = player.LastMiningTime or 0
    if CurTime() - lastMining < self.Config.Crystals.MiningCooldown then
        player:ChatPrint("❌ Подождите перед следующей добычей!")
        return false
    end
    
    vein.IsBeingMined = true
    player.IsMining = true
    player.MiningVein = vein
    player.LastMiningTime = CurTime()
    
    player:ChatPrint(self.Config.Notifications.MiningStarted)
    
    -- Воспроизводим звук добычи
    if self.Config.Sounds.Mining then
        player:EmitSound(self.Config.Sounds.Mining)
    end
    
    -- Таймер добычи
    timer.Simple(self.Config.Crystals.MiningTime, function()
        if IsValid(player) and IsValid(vein) and player.IsMining and player.MiningVein == vein then
            self:CompleteMining(player, vein)
        end
    end)
    
    return true
end

-- Завершение добычи
function NextRP.Generator:CompleteMining(player, vein)
    if not IsValid(player) or not IsValid(vein) then return end
    
    local crystalsToMine = math.min(
        math.random(self.Config.Crystals.CrystalDropAmount[1], self.Config.Crystals.CrystalDropAmount[2]),
        vein.CrystalAmount,
        self.Config.Crystals.MaxPlayerCrystals - self:GetPlayerCrystals(player)
    )
    
    if crystalsToMine > 0 then
        -- Добавляем кристаллы игроку
        local newAmount = self:GetPlayerCrystals(player) + crystalsToMine
        self:SetPlayerCrystals(player, newAmount)
        
        -- Убираем кристаллы из жилы
        vein.CrystalAmount = vein.CrystalAmount - crystalsToMine
        self:UpdateVeinCrystals(vein)
        
        player:ChatPrint(string.format(self.Config.Notifications.MiningCompleted, crystalsToMine))
    end
    
    -- Сбрасываем состояние добычи
    vein.IsBeingMined = false
    player.IsMining = false
    player.MiningVein = nil
end

-- Остановка добычи
function NextRP.Generator:StopMining(player)
    if not IsValid(player) then return end
    
    if player.IsMining and IsValid(player.MiningVein) then
        player.MiningVein.IsBeingMined = false
    end
    
    player.IsMining = false
    player.MiningVein = nil
end

-- Хуки
hook.Add("PlayerInitialSpawn", "Generator_PlayerSpawn", function(player)
    if not NextRP.Generator:IsMapEnabled() then return end
    
    -- Отправляем текущий уровень топлива новому игроку
    timer.Simple(1, function()
        if IsValid(player) then
            net.Start("Generator_UpdateFuel")
            net.WriteFloat(NextRP.Generator.FuelLevel)
            net.Send(player)
            
            net.Start("Generator_UpdatePlayerCrystals")
            net.WriteInt(NextRP.Generator:GetPlayerCrystals(player), 32)
            net.Send(player)
        end
    end)
end)

hook.Add("PlayerDisconnected", "Generator_PlayerDisconnect", function(player)
    if not NextRP.Generator:IsMapEnabled() then return end
    
    -- Останавливаем добычу если игрок отключился
    NextRP.Generator:StopMining(player)
end)

-- Инициализация модуля при запуске сервера
hook.Add("InitPostEntity", "Generator_Initialize", function()
    if NextRP.Generator:IsMapEnabled() then
        NextRP.Generator:Initialize()
    end
end)

-- Команды
concommand.Add("generator_menu", function(player)
    if not NextRP.Generator:IsMapEnabled() then
        player:ChatPrint("Модуль генератора отключен на этой карте!")
        return
    end
    
    net.Start("Generator_OpenMenu")
    net.Send(player)
end)

concommand.Add("crystals", function(player)
    if not NextRP.Generator:IsMapEnabled() then
        player:ChatPrint("Модуль генератора отключен на этой карте!")
        return
    end
    
    local crystals = NextRP.Generator:GetPlayerCrystals(player)
    player:ChatPrint("💎 У вас кристаллов: " .. crystals .. "/" .. NextRP.Generator.Config.Crystals.MaxPlayerCrystals)
end)

-- Команды для админов
concommand.Add("generator_refuel", function(player, cmd, args)
    if not player:IsAdmin() then return end
    if not NextRP.Generator:IsMapEnabled() then return end
    
    local amount = tonumber(args[1]) or 100
    NextRP.Generator.FuelLevel = math.min(amount, 100)
    NextRP.Generator:UpdateFuelLevel()
    
    player:ChatPrint("Генератор заправлен до " .. NextRP.Generator.FuelLevel .. "%")
end)

concommand.Add("generator_debug", function(player, cmd, args)
    if not player:IsAdmin() then return end
    if not NextRP.Generator:IsMapEnabled() then return end
    
    player:ChatPrint("=== ОТЛАДКА ГЕНЕРАТОРА ===")
    player:ChatPrint("Уровень топлива: " .. NextRP.Generator.FuelLevel .. "%")
    player:ChatPrint("Активных жил: " .. table.Count(NextRP.Generator.CrystalVeins))
    player:ChatPrint("Таймер топлива: " .. (NextRP.Generator.FuelTimer and "работает" or "не работает"))
    player:ChatPrint("Кнопка света: " .. (IsValid(NextRP.Generator.LightButton) and "найдена" or "не найдена"))
end)

-- Сетевые хуки
net.Receive("Generator_RequestData", function(len, player)
    if not NextRP.Generator:IsMapEnabled() then return end
    
    -- Отправляем актуальные данные генератора
    net.Start("Generator_UpdateFuel")
    net.WriteFloat(NextRP.Generator.FuelLevel)
    net.Send(player)
    
    net.Start("Generator_UpdatePlayerCrystals")
    net.WriteInt(NextRP.Generator:GetPlayerCrystals(player), 32)
    net.Send(player)
end)


-- gamemode/modules/generator/sv_chat_commands.lua

if not NextRP.Generator:IsMapEnabled() then return end

-- Команда заправки генератора
hook.Add("PlayerSay", "GeneratorChatCommands", function(player, text, team)
    if not IsValid(player) then return end
    
    local command = string.lower(string.Trim(text))
    
    -- Команда заправки
    if command == "/refuel" or command == "/заправить" then
        if NextRP.Generator:RefuelGenerator(player) then
            -- Заправка прошла успешно
        end
        return ""
    end
    
    -- Команда проверки статуса генератора
    if command == "/generator" or command == "/генератор" then
        player:ChatPrint("=== СТАТУС ГЕНЕРАТОРА ===")
        player:ChatPrint("⚡ Уровень заряда: " .. math.Round(NextRP.Generator.FuelLevel) .. "%")
        
        local status = "🟢 Работает"
        if NextRP.Generator.FuelLevel <= 0 then
            status = "🔴 Отключен"
        elseif NextRP.Generator.FuelLevel <= NextRP.Generator.Config.Generator.CriticalFuelWarning then
            status = "🟠 Критический уровень"
        elseif NextRP.Generator.FuelLevel <= NextRP.Generator.Config.Generator.LowFuelWarning then
            status = "🟡 Низкий заряд"
        end
        
        player:ChatPrint("📊 Состояние: " .. status)
        player:ChatPrint("💎 Ваши кристаллы: " .. NextRP.Generator:GetPlayerCrystals(player) .. "/" .. NextRP.Generator.Config.Crystals.MaxPlayerCrystals)
        return ""
    end
    
    -- Команда проверки кристаллов
    if command == "/crystals" or command == "/кристаллы" then
        local crystals = NextRP.Generator:GetPlayerCrystals(player)
        local maxCrystals = NextRP.Generator.Config.Crystals.MaxPlayerCrystals
        
        player:ChatPrint("💎 У вас кристаллов: " .. crystals .. "/" .. maxCrystals)
        
        if crystals == 0 then
            player:ChatPrint("ℹ️ Найдите жилы кристаллов на карте и добудьте их нажав E")
        elseif crystals >= maxCrystals then
            player:ChatPrint("⚠️ У вас максимальное количество кристаллов!")
        end
        
        return ""
    end
    
    -- Команда помощи
    if command == "/generator help" or command == "/генератор помощь" then
        player:ChatPrint("=== ПОМОЩЬ ПО ГЕНЕРАТОРУ ===")
        player:ChatPrint("💡 Команды:")
        player:ChatPrint("  /generator - статус генератора")
        player:ChatPrint("  /refuel - заправить генератор")
        player:ChatPrint("  /crystals - проверить кристаллы")

        player:ChatPrint("")
        player:ChatPrint("🔧 Как играть:")
        player:ChatPrint("  1. Найдите жилы кристаллов на карте")
        player:ChatPrint("  2. Нажмите E рядом с жилой для добычи")
        player:ChatPrint("  3. Используйте кристаллы для заправки генератора")
        player:ChatPrint("  4. Следите за уровнем заряда!")
        player:ChatPrint("")
        player:ChatPrint("⚙️ Настройки:")
        player:ChatPrint("  • Время добычи: " .. NextRP.Generator.Config.Crystals.MiningTime .. " сек.")
        player:ChatPrint("  • Восстановление жилы: " .. math.floor(NextRP.Generator.Config.Crystals.RestoreTime / 60) .. " мин.")
        player:ChatPrint("  • Заправка за кристалл: " .. NextRP.Generator.Config.Generator.RefuelAmount .. "%")
        player:ChatPrint("  • Расход: " .. NextRP.Generator.Config.Generator.FuelConsumption .. "% в минуту")
        return ""
    end
end)

-- Автодополнение команд в чате
hook.Add("OnPlayerChat", "GeneratorAutoComplete", function(player, strText, bTeam, bDead)
    if not IsValid(player) then return end
    
    local text = string.lower(strText)
    
    -- Автоматические уведомления
    if string.find(text, "генератор") or string.find(text, "generator") then
        if string.find(text, "помощь") or string.find(text, "help") then
            timer.Simple(0.1, function()
                if IsValid(player) then
                    player:ChatPrint("💡 Попробуйте: /generator help")
                end
            end)
        end
    end
    
    if string.find(text, "кристалл") or string.find(text, "crystal") then
        timer.Simple(0.1, function()
            if IsValid(player) then
                player:ChatPrint("💎 Команда: /crystals")
            end
        end)
    end
end)


-- Функция для админов - телепорт к генератору
concommand.Add("generator_tp", function(player, cmd, args)
    if not player:IsAdmin() then 
        player:ChatPrint("❌ Только для администраторов!")
        return 
    end
    
    if not NextRP.Generator:IsMapEnabled() then
        player:ChatPrint("❌ Модуль генератора отключен на этой карте!")
        return
    end
    
    if IsValid(NextRP.Generator.GeneratorEntity) then
        local pos = NextRP.Generator.GeneratorEntity:GetPos()
        player:SetPos(pos + Vector(0, 0, 50))
        player:ChatPrint("✅ Телепортация к генератору выполнена!")
    else
        player:ChatPrint("❌ Генератор не найден!")
    end
end)

-- Функция для админов - телепорт к жиле
concommand.Add("generator_tp_vein", function(player, cmd, args)
    if not player:IsAdmin() then 
        player:ChatPrint("❌ Только для администраторов!")
        return 
    end
    
    if not NextRP.Generator:IsMapEnabled() then
        player:ChatPrint("❌ Модуль генератора отключен на этой карте!")
        return
    end
    
    local veinID = tonumber(args[1]) or 1
    local vein = NextRP.Generator.CrystalVeins[veinID]
    
    if IsValid(vein) then
        local pos = vein:GetPos()
        player:SetPos(pos + Vector(0, 0, 50))
        player:ChatPrint("✅ Телепортация к жиле #" .. veinID .. " выполнена!")
    else
        player:ChatPrint("❌ Жила #" .. veinID .. " не найдена!")
        player:ChatPrint("💡 Доступные жилы: 1-" .. table.Count(NextRP.Generator.CrystalVeins))
    end
end)

-- Функция для админов - добавить кристаллы игроку
concommand.Add("generator_give_crystals", function(player, cmd, args)
    if not player:IsAdmin() then 
        player:ChatPrint("❌ Только для администраторов!")
        return 
    end
    
    if not NextRP.Generator:IsMapEnabled() then
        player:ChatPrint("❌ Модуль генератора отключен на этой карте!")
        return
    end
    
    local targetName = args[1]
    local amount = tonumber(args[2]) or 10
    
    if not targetName then
        player:ChatPrint("❌ Использование: generator_give_crystals <имя_игрока> [количество]")
        return
    end
    
    local target = nil
    for _, ply in pairs(player.GetAll()) do
        if string.find(string.lower(ply:Name()), string.lower(targetName)) then
            target = ply
            break
        end
    end
    
    if not IsValid(target) then
        player:ChatPrint("❌ Игрок не найден!")
        return
    end
    
    local currentCrystals = NextRP.Generator:GetPlayerCrystals(target)
    local newAmount = math.min(currentCrystals + amount, NextRP.Generator.Config.Crystals.MaxPlayerCrystals)
    
    NextRP.Generator:SetPlayerCrystals(target, newAmount)
    
    player:ChatPrint("✅ Выдано " .. (newAmount - currentCrystals) .. " кристаллов игроку " .. target:Name())
    target:ChatPrint("💎 Администратор выдал вам " .. (newAmount - currentCrystals) .. " кристаллов!")
end)

-- Функция для админов - восстановить все жилы
concommand.Add("generator_restore_veins", function(player, cmd, args)
    if not player:IsAdmin() then 
        player:ChatPrint("❌ Только для администраторов!")
        return 
    end
    
    if not NextRP.Generator:IsMapEnabled() then
        player:ChatPrint("❌ Модуль генератора отключен на этой карте!")
        return
    end
    
    local restored = 0
    for id, vein in pairs(NextRP.Generator.CrystalVeins) do
        if IsValid(vein) then
            vein.CrystalAmount = NextRP.Generator.Config.Crystals.VeinCapacity
            NextRP.Generator:UpdateVeinCrystals(vein)
            restored = restored + 1
        end
    end
    
    player:ChatPrint("✅ Восстановлено " .. restored .. " жил кристаллов!")
    NextRP.Generator:BroadcastMessage("⚡ Администратор восстановил все жилы кристаллов!")
end)

print("[Generator] Команды чата загружены")