-- gamemode/modules/generator/cl_generator.lua

if not NextRP.Generator:IsMapEnabled() then return end

-- Клиентские переменные
NextRP.Generator.FuelLevel = 100
NextRP.Generator.PlayerCrystals = 0

-- Получение обновлений уровня топлива
net.Receive("Generator_UpdateFuel", function()
    NextRP.Generator.FuelLevel = net.ReadFloat()
    
    -- Обновляем HUD если есть
    if NextRP.Generator.UpdateHUD then
        NextRP.Generator:UpdateHUD()
    end
end)

-- Получение обновлений количества кристаллов игрока
net.Receive("Generator_UpdatePlayerCrystals", function()
    NextRP.Generator.PlayerCrystals = net.ReadInt(32)
    
    -- Обновляем HUD если есть
    if NextRP.Generator.UpdateHUD then
        NextRP.Generator:UpdateHUD()
    end
end)

-- Получение обновлений количества кристаллов в жилах
net.Receive("Generator_UpdateVeinCrystals", function()
    local veinID = net.ReadInt(32)
    local crystalAmount = net.ReadInt(32)
    
    -- Найдем соответствующую жилу и обновим её количество кристаллов
    for _, ent in pairs(ents.FindByClass("nextrp_crystal_vein")) do
        if IsValid(ent) and ent.VeinID == veinID then
            ent:SetNWInt("CrystalAmount", crystalAmount)
            break
        end
    end
end)

-- Открытие меню генератора
net.Receive("Generator_OpenMenu", function()
    NextRP.Generator:OpenMenu()
end)

-- Функция открытия меню
function NextRP.Generator:OpenMenu()
    if IsValid(NextRP.Generator.MenuPanel) then
        NextRP.Generator.MenuPanel:Remove()
    end
    
    local frame = vgui.Create("DFrame")
    frame:SetSize(600, 400)
    frame:Center()
    frame:SetTitle("Управление генератором")
    frame:SetVisible(true)
    frame:SetDraggable(true)
    frame:ShowCloseButton(true)
    frame:MakePopup()
    
    NextRP.Generator.MenuPanel = frame
    
    -- Информация о генераторе
    local infoPanel = vgui.Create("DPanel", frame)
    infoPanel:SetPos(10, 30)
    infoPanel:SetSize(580, 100)
    infoPanel.Paint = function(self, w, h)
        draw.RoundedBox(4, 0, 0, w, h, Color(50, 50, 50, 200))
        
        -- Заголовок
        draw.SimpleText("Состояние генератора", "DermaLarge", w/2, 10, Color(255, 255, 255), TEXT_ALIGN_CENTER)
        
        -- Уровень топлива
        local fuelText = "Уровень топлива: " .. math.Round(NextRP.Generator.FuelLevel, 1) .. "%"
        local fuelColor = Color(0, 255, 0)
        if NextRP.Generator.FuelLevel <= 10 then
            fuelColor = Color(255, 0, 0)
        elseif NextRP.Generator.FuelLevel <= 25 then
            fuelColor = Color(255, 255, 0)
        end
        
        draw.SimpleText(fuelText, "DermaDefault", w/2, 40, fuelColor, TEXT_ALIGN_CENTER)
        
        -- Полоса топлива
        local barW, barH = 400, 20
        local barX, barY = w/2 - barW/2, 65
        
        draw.RoundedBox(4, barX, barY, barW, barH, Color(30, 30, 30))
        
        if NextRP.Generator.FuelLevel > 0 then
            local fillWidth = (barW - 4) * (NextRP.Generator.FuelLevel / 100)
            draw.RoundedBox(4, barX + 2, barY + 2, fillWidth, barH - 4, fuelColor)
        end
    end
    
    -- Информация о кристаллах игрока
    local crystalPanel = vgui.Create("DPanel", frame)
    crystalPanel:SetPos(10, 140)
    crystalPanel:SetSize(580, 80)
    crystalPanel.Paint = function(self, w, h)
        draw.RoundedBox(4, 0, 0, w, h, Color(50, 50, 50, 200))
        
        -- Заголовок
        draw.SimpleText("Ваши кристаллы", "DermaLarge", w/2, 10, Color(255, 255, 255), TEXT_ALIGN_CENTER)
        
        -- Количество кристаллов
        local crystalText = NextRP.Generator.PlayerCrystals .. "/" .. NextRP.Generator.Config.Crystals.MaxPlayerCrystals
        local crystalColor = Color(100, 200, 255)
        if NextRP.Generator.PlayerCrystals == 0 then
            crystalColor = Color(255, 100, 100)
        elseif NextRP.Generator.PlayerCrystals >= NextRP.Generator.Config.Crystals.MaxPlayerCrystals then
            crystalColor = Color(255, 255, 100)
        end
        
        draw.SimpleText("💎 " .. crystalText, "DermaDefault", w/2, 45, crystalColor, TEXT_ALIGN_CENTER)
    end
    
    -- Кнопки управления
    local buttonPanel = vgui.Create("DPanel", frame)
    buttonPanel:SetPos(10, 230)
    buttonPanel:SetSize(580, 160)
    buttonPanel.Paint = function(self, w, h)
        draw.RoundedBox(4, 0, 0, w, h, Color(50, 50, 50, 200))
    end
    
    -- Кнопка заправки
    local refuelBtn = vgui.Create("DButton", buttonPanel)
    refuelBtn:SetText("Заправить генератор (1 кристалл)")
    refuelBtn:SetPos(10, 10)
    refuelBtn:SetSize(560, 30)
    refuelBtn.DoClick = function()
        -- Отправляем запрос на заправку
        RunConsoleCommand("say", "/refuel")
        frame:Close()
    end
    
    -- Кнопка проверки статуса
    local statusBtn = vgui.Create("DButton", buttonPanel)
    statusBtn:SetText("Обновить информацию")
    statusBtn:SetPos(10, 50)
    statusBtn:SetSize(270, 30)
    statusBtn.DoClick = function()
        net.Start("Generator_RequestData")
        net.SendToServer()
    end
    
    -- Кнопка проверки кристаллов
    local crystalsBtn = vgui.Create("DButton", buttonPanel)
    crystalsBtn:SetText("Проверить кристаллы")
    crystalsBtn:SetPos(300, 50)
    crystalsBtn:SetSize(270, 30)
    crystalsBtn.DoClick = function()
        RunConsoleCommand("crystals")
    end
    
    -- Информация о жилах
    local veinInfo = vgui.Create("DLabel", buttonPanel)
    veinInfo:SetPos(10, 90)
    veinInfo:SetSize(560, 60)
    veinInfo:SetText("Для добычи кристаллов найдите жилы на карте и нажмите E рядом с ними.\nВремя добычи: " .. NextRP.Generator.Config.Crystals.MiningTime .. " сек.\nВремя восстановления жилы: " .. math.floor(NextRP.Generator.Config.Crystals.RestoreTime / 60) .. " мин.")
    veinInfo:SetWrap(true)
    veinInfo:SetTextColor(Color(200, 200, 200))
end

-- HUD генератора
local function DrawGeneratorHUD()
    if not NextRP.Generator:IsMapEnabled() then return end
    
    local scrW, scrH = ScrW(), ScrH()
    
    -- Панель генератора
    local panelW, panelH = 300, 120
    local panelX, panelY = scrW - panelW - 20, 20
    
    -- Фон панели
    draw.RoundedBox(8, panelX, panelY, panelW, panelH, Color(0, 0, 0, 150))
    draw.RoundedBox(8, panelX + 2, panelY + 2, panelW - 4, panelH - 4, Color(30, 30, 30, 200))
    
    -- Заголовок
    draw.SimpleText("⚡ ГЕНЕРАТОР", "DermaLarge", panelX + panelW/2, panelY + 10, Color(255, 255, 255), TEXT_ALIGN_CENTER)
    
    -- Уровень топлива
    local fuelText = "Заряд: " .. math.Round(NextRP.Generator.FuelLevel, 1) .. "%"
    local fuelColor = Color(0, 255, 0)
    if NextRP.Generator.FuelLevel <= 10 then
        fuelColor = Color(255, 0, 0)
    elseif NextRP.Generator.FuelLevel <= 25 then
        fuelColor = Color(255, 255, 0)
    end
    
    draw.SimpleText(fuelText, "DermaDefault", panelX + panelW/2, panelY + 35, fuelColor, TEXT_ALIGN_CENTER)
    
    -- Полоса топлива
    local barW, barH = panelW - 40, 15
    local barX, barY = panelX + 20, panelY + 55
    
    draw.RoundedBox(4, barX, barY, barW, barH, Color(60, 60, 60))
    
    if NextRP.Generator.FuelLevel > 0 then
        local fillWidth = (barW - 2) * (NextRP.Generator.FuelLevel / 100)
        draw.RoundedBox(4, barX + 1, barY + 1, fillWidth, barH - 2, fuelColor)
    end
    
    -- Количество кристаллов
    local crystalText = "💎 Кристаллы: " .. NextRP.Generator.PlayerCrystals .. "/" .. NextRP.Generator.Config.Crystals.MaxPlayerCrystals
    local crystalColor = Color(100, 200, 255)
    if NextRP.Generator.PlayerCrystals == 0 then
        crystalColor = Color(200, 200, 200)
    end
    
    draw.SimpleText(crystalText, "DermaDefault", panelX + panelW/2, panelY + 80, crystalColor, TEXT_ALIGN_CENTER)
    
    -- Подсказка
    draw.SimpleText("F4 -> Генератор для управления", "DermaDefaultBold", panelX + panelW/2, panelY + 100, Color(200, 200, 200), TEXT_ALIGN_CENTER)
end

-- Добавляем HUD
hook.Add("HUDPaint", "GeneratorHUD", DrawGeneratorHUD)

-- Функция обновления HUD
function NextRP.Generator:UpdateHUD()
    -- HUD обновляется автоматически через DrawGeneratorHUD
end

-- Запрос данных при подключении
hook.Add("InitPostEntity", "Generator_RequestData", function()
    timer.Simple(2, function()
        if NextRP.Generator:IsMapEnabled() then
            net.Start("Generator_RequestData")
            net.SendToServer()
        end
    end)
end)

-- Команда открытия меню через F4
hook.Add("ShowSpare2", "GeneratorMenu", function()
    if NextRP.Generator:IsMapEnabled() then
        NextRP.Generator:OpenMenu()
        return true
    end
end)

print("[Generator] Клиентская часть загружена")