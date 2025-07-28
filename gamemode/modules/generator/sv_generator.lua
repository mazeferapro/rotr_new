-- gamemode/modules/generator/sv_generator.lua

if not NextRP.Generator:IsMapEnabled() then return end

AddCSLuaFile("cl_generator.lua")

-- Переменные сервера
NextRP.Generator.FuelLevel = 100 -- Текущий уровень топлива
NextRP.Generator.GeneratorEntity = nil
NextRP.Generator.CrystalVeins = {}
NextRP.Generator.PlayerCrystals = {} -- Инвентарь кристаллов игроков
NextRP.Generator.LightButton = nil -- Кнопка управления светом

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
    
    local generator = ents.Create("generator_entity")
    generator:SetPos(pos)
    generator:Spawn()
    
    self.GeneratorEntity = generator
end

-- Создание жил кристаллов
function NextRP.Generator:CreateCrystalVeins()
    local mapConfig = self:GetMapConfig()
    local veinPositions = mapConfig.Crystals and mapConfig.Crystals.Veins or {}
    
    for i, pos in ipairs(veinPositions) do
        self:CreateCrystalVein(pos, i)
    end
end

-- Создание одной жилы кристаллов
function NextRP.Generator:CreateCrystalVein(pos, id)
    local vein = ents.Create("crystal_vein_entity")
    vein:SetPos(pos)
    vein.VeinID = id
    vein.CrystalAmount = self.Config.Crystals.VeinCapacity -- Изначально полная жила
    vein.IsBeingMined = false
    vein.LastMiningTime = 0
    vein:Spawn()
    
    self.CrystalVeins[id] = vein
    
    -- Запускаем таймер восстановления для этой жилы
    self:StartVeinRestoration(vein)
end

-- Поиск кнопки управления светом
function NextRP.Generator:FindLightButton()
    local mapConfig = self:GetMapConfig()
    local buttonName = mapConfig.Generator and mapConfig.Generator.LightButtonName or self.Config.Generator.LightButtonName
    
    -- Ищем кнопку по названию
    for _, ent in pairs(ents.GetAll()) do
        if IsValid(ent) and ent:GetName() == buttonName then
            self.LightButton = ent
            break
        end
    end
    
    if not IsValid(self.LightButton) then
        print("[Generator] Предупреждение: Кнопка света '" .. buttonName .. "' не найдена на карте!")
    end
end

-- Добыча одного кристалла (простое нажатие E)
function NextRP.Generator:MineCrystal(player, vein)
    if not IsValid(vein) or not IsValid(player) then return end
    
    -- Проверяем кулдаун
    if CurTime() - vein.LastMiningTime < self.Config.Crystals.MiningCooldown then
        player:ChatPrint("⏰ Подождите перед следующей добычей!")
        return
    end
    
    -- Проверяем есть ли кристаллы в жиле
    if vein.CrystalAmount <= 0 then
        player:ChatPrint("❌ Жила истощена! Подождите восстановления.")
        return
    end
    
    -- Проверяем лимит кристаллов у игрока
    local steamid = player:SteamID64()
    local currentCrystals = self.PlayerCrystals[steamid] or 0
    if currentCrystals >= self.Config.Crystals.MaxPlayerCrystals then
        player:ChatPrint(string.format(self.Config.Notifications.CrystalsFull, currentCrystals, self.Config.Crystals.MaxPlayerCrystals))
        return
    end
    
    -- Добываем 1 кристалл
    local actualAdded = self:AddCrystalsToPlayer(player, 1)
    
    if actualAdded > 0 then
        -- Убираем кристалл из жилы
        vein.CrystalAmount = math.max(vein.CrystalAmount - 1, 0)
        vein.LastMiningTime = CurTime()
        
        player:ChatPrint("💎 Вы добыли " .. actualAdded .. " кристалл!")
        
        -- Воспроизводим звук добычи
        if self.Config.Sounds.Mining then
            player:EmitSound(self.Config.Sounds.Mining)
        end
        
        -- Обновляем количество кристаллов в жиле для клиентов
        self:UpdateVeinCrystals(vein)
    end
end

-- Убираем старые функции добычи
-- function NextRP.Generator:CompleteMining() - удалено
-- function NextRP.Generator:StopMining() - удалено

-- Восстановление кристаллов в жиле
function NextRP.Generator:StartVeinRestoration(vein)
    if not IsValid(vein) then return end
    
    local timerName = "Generator_VeinRestore_" .. vein.VeinID
    timer.Create(timerName, self.Config.Crystals.RestoreTime, 0, function()
        if not IsValid(vein) then 
            timer.Remove(timerName)
            return 
        end
        
        if vein.CrystalAmount < self.Config.Crystals.VeinCapacity then
            vein.CrystalAmount = math.min(vein.CrystalAmount + self.Config.Crystals.RestoreRate, self.Config.Crystals.VeinCapacity)
            NextRP.Generator:UpdateVeinCrystals(vein)
        end
    end)
end

-- Обновление количества кристаллов в жиле для клиентов
function NextRP.Generator:UpdateVeinCrystals(vein)
    if not IsValid(vein) then return end
    
    net.Start("Generator_UpdateVeinCrystals")
    net.WriteEntity(vein)
    net.WriteInt(vein.CrystalAmount, 8)
    net.Broadcast()
end

-- Добавление кристаллов игроку
function NextRP.Generator:AddCrystalsToPlayer(player, amount)
    local steamid = player:SteamID64()
    local currentCrystals = self.PlayerCrystals[steamid] or 0
    
    -- Проверяем лимит кристаллов
    if currentCrystals >= self.Config.Crystals.MaxPlayerCrystals then
        player:ChatPrint(string.format(self.Config.Notifications.CrystalsFull, currentCrystals, self.Config.Crystals.MaxPlayerCrystals))
        return 0
    end
    
    -- Добавляем кристаллы с учетом лимита
    local newAmount = math.min(currentCrystals + amount, self.Config.Crystals.MaxPlayerCrystals)
    local actualAdded = newAmount - currentCrystals
    
    self.PlayerCrystals[steamid] = newAmount
    
    -- Отправляем обновление клиенту
    net.Start("Generator_UpdatePlayerCrystals")
    net.WriteInt(self.PlayerCrystals[steamid], 32)
    net.Send(player)
    
    return actualAdded
end

-- Заправка генератора
function NextRP.Generator:RefuelGenerator(player)
    local steamid = player:SteamID64()
    local playerCrystals = self.PlayerCrystals[steamid] or 0
    
    if playerCrystals <= 0 then
        player:ChatPrint(self.Config.Notifications.NoCrystals)
        return
    end
    
    if self.FuelLevel >= self.Config.Generator.FuelCapacity then
        player:ChatPrint(self.Config.Notifications.NoFuel)
        return
    end
    
    -- Используем один кристалл
    self.PlayerCrystals[steamid] = playerCrystals - 1
    self.FuelLevel = math.min(self.FuelLevel + self.Config.Generator.RefuelAmount, self.Config.Generator.FuelCapacity)
    
    player:ChatPrint(string.format(self.Config.Notifications.Refueled, self.FuelLevel))
    
    -- Воспроизводим звук заправки
    if self.Config.Sounds.Refuel then
        player:EmitSound(self.Config.Sounds.Refuel)
    end
    
    -- Обновляем клиентов
    net.Start("Generator_UpdatePlayerCrystals")
    net.WriteInt(self.PlayerCrystals[steamid], 32)
    net.Send(player)
    
    self:UpdateFuelLevel()
    
    -- Включаем свет если он был выключен
    if self.FuelLevel > 0 and IsValid(self.LightButton) then
        self.LightButton:Fire("Use")
    end
end

-- Потребление топлива
function NextRP.Generator:StartFuelConsumption()
    timer.Create("Generator_FuelConsumption", 60, 0, function() -- Каждую минуту
        if NextRP.Generator.FuelLevel > 0 then
            NextRP.Generator.FuelLevel = math.max(NextRP.Generator.FuelLevel - NextRP.Generator.Config.Generator.FuelConsumption, 0)
            NextRP.Generator:UpdateFuelLevel()
            
            if NextRP.Generator.FuelLevel <= 0 then
                -- Нажимаем кнопку для выключения света
                if IsValid(NextRP.Generator.LightButton) then
                    NextRP.Generator.LightButton:Fire("Use")
                end
                
                NextRP.Generator:BroadcastMessage(NextRP.Generator.Config.Notifications.GeneratorOff)
                
                -- Воспроизводим звук отключения
                if NextRP.Generator.Config.Sounds.GeneratorOff then
                    for i, ply in pairs(player.GetAll()) do
                        ply:EmitSound(NextRP.Generator.Config.Sounds.GeneratorOff)
                    end
                end
            elseif NextRP.Generator.FuelLevel <= NextRP.Generator.Config.Generator.CriticalFuelWarning then
                NextRP.Generator:BroadcastMessage(string.format(NextRP.Generator.Config.Notifications.CriticalFuel, NextRP.Generator.FuelLevel))
                
                -- Воспроизводим звук предупреждения
                if NextRP.Generator.Config.Sounds.LowFuel then
                    for i, ply in pairs(player.GetAll()) do
                        ply:EmitSound(NextRP.Generator.Config.Sounds.LowFuel)
                    end
                end
            elseif NextRP.Generator.FuelLevel <= NextRP.Generator.Config.Generator.LowFuelWarning then
                NextRP.Generator:BroadcastMessage(string.format(NextRP.Generator.Config.Notifications.LowFuel, NextRP.Generator.FuelLevel))
            end
        end
    end)
end

-- Обновление уровня топлива для клиентов
function NextRP.Generator:UpdateFuelLevel()
    net.Start("Generator_UpdateFuel")
    net.WriteFloat(self.FuelLevel)
    net.Broadcast()
end

-- Включение света
function NextRP.Generator:EnableLights()
    if IsValid(self.LightButton) then
        self.LightButton:Fire("Use")
    end
end

-- Выключение света  
function NextRP.Generator:DisableLights()
    if IsValid(self.LightButton) then
        self.LightButton:Fire("Use")
    end
end

-- Рассылка сообщения всем игрокам
function NextRP.Generator:BroadcastMessage(message)
    for i, player in pairs(player.GetAll()) do
        player:ChatPrint(message)
    end
end

-- Получение количества кристаллов игрока
function NextRP.Generator:GetPlayerCrystals(player)
    return self.PlayerCrystals[player:SteamID64()] or 0
end

-- Хуки
hook.Add("PlayerInitialSpawn", "Generator_PlayerSpawn", function(player)
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
    -- Останавливаем добычу если игрок отключился
    NextRP.Generator:StopMining(player)
end)

-- Инициализация модуля при запуске сервера
hook.Add("InitPostEntity", "Generator_Initialize", function()
    NextRP.Generator:Initialize()
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

-- Сетевые хуки
net.Receive("Generator_RequestData", function(len, player)
    -- Отправляем актуальные данные генератора
    net.Start("Generator_UpdateFuel")
    net.WriteFloat(NextRP.Generator.FuelLevel)
    net.Send(player)
    
    net.Start("Generator_UpdatePlayerCrystals")
    net.WriteInt(NextRP.Generator:GetPlayerCrystals(player), 32)
    net.Send(player)
end)