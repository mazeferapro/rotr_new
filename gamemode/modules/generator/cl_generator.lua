-- gamemode/modules/generator/cl_generator.lua

if not NextRP.Generator:IsMapEnabled() then return end

-- Клиентские переменные
NextRP.Generator.FuelLevel = 100
NextRP.Generator.PlayerCrystals = 0
NextRP.Generator.IsMining = false
NextRP.Generator.MiningProgress = 0
NextRP.Generator.MiningStartTime = 0
NextRP.Generator.MiningDuration = 0
NextRP.Generator.MenuOpen = false

-- HUD элементы
local function DrawGeneratorHUD()
    local scrW, scrH = ScrW(), ScrH()
    local x, y = scrW - 250, 50
    
    -- Фон панели
    draw.RoundedBox(8, x - 10, y - 10, 230, 80, Color(0, 0, 0, 150))
    
    -- Заголовок
    draw.SimpleText("ГЕНЕРАТОР", "DermaLarge", x + 105, y, Color(255, 255, 255), TEXT_ALIGN_CENTER)
    
    -- Уровень топлива
    local fuelColor = Color(0, 255, 0)
    if NextRP.Generator.FuelLevel <= 20 then
        fuelColor = Color(255, 0, 0)
    elseif NextRP.Generator.FuelLevel <= 50 then
        fuelColor = Color(255, 255, 0)
    end
    
    draw.SimpleText("Топливо: " .. math.Round(NextRP.Generator.FuelLevel, 1) .. "%", "DermaDefault", x, y + 25, fuelColor)
    
    -- Кристаллы
    draw.SimpleText("Кристаллы: " .. NextRP.Generator.PlayerCrystals, "DermaDefault", x, y + 45, Color(0, 150, 255))
end

local function DrawMiningProgress()
    if not NextRP.Generator.IsMining then return end
    
    local progress = 0
    if NextRP.Generator.MiningDuration > 0 then
        progress = math.min((CurTime() - NextRP.Generator.MiningStartTime) / NextRP.Generator.MiningDuration, 1)
    end
    NextRP.Generator.MiningProgress = progress
    
    -- Если прогресс завершен, но добыча все еще активна - останавливаем на клиенте
    if progress >= 1 then
        NextRP.Generator.IsMining = false
        return
    end
    
    local scrW, scrH = ScrW(), ScrH()
    local barW, barH = 350, 30
    local x, y = scrW / 2 - barW / 2, scrH - 150
    
    -- Фон панели
    draw.RoundedBox(8, x - 10, y - 20, barW + 20, barH + 40, Color(0, 0, 0, 200))
    
    -- Заголовок
    draw.SimpleText("⛏️ ДОБЫЧА КРИСТАЛЛОВ", "DermaDefaultBold", scrW / 2, y - 5, Color(255, 255, 255), TEXT_ALIGN_CENTER)
    
    -- Фон прогресс-бара
    draw.RoundedBox(4, x, y + 15, barW, barH, Color(40, 40, 40, 255))
    
    -- Полоса прогресса
    local progressWidth = (barW - 4) * progress
    if progressWidth > 0 then
        -- Основная полоса
        draw.RoundedBox(4, x + 2, y + 17, progressWidth, barH - 4, Color(0, 150, 255, 220))
        
        -- Блик на полосе
        draw.RoundedBox(4, x + 2, y + 17, progressWidth, (barH - 4) / 3, Color(255, 255, 255, 80))
    end
    
    -- Процент в центре
    draw.SimpleText(math.floor(progress * 100) .. "%", "DermaDefaultBold", scrW / 2, y + 30, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    
    -- Подсказка
    draw.SimpleText("Зажмите E для продолжения добычи", "DermaDefault", scrW / 2, y + 55, Color(200, 200, 200), TEXT_ALIGN_CENTER)
end

-- Сетевые функции
net.Receive("Generator_UpdateFuel", function()
    NextRP.Generator.FuelLevel = net.ReadFloat()
end)

net.Receive("Generator_UpdatePlayerCrystals", function()
    NextRP.Generator.PlayerCrystals = net.ReadInt(32)
end)

net.Receive("Generator_StartMining", function()
    NextRP.Generator.IsMining = true
    NextRP.Generator.MiningStartTime = CurTime()
    NextRP.Generator.MiningDuration = net.ReadFloat()
    NextRP.Generator.MiningProgress = 0
end)

net.Receive("Generator_StopMining", function()
    NextRP.Generator.IsMining = false
    NextRP.Generator.MiningProgress = 0
end)

-- HUD хуки
hook.Add("HUDPaint", "Generator_HUD", function()
    DrawGeneratorHUD()
    DrawMiningProgress()
end)