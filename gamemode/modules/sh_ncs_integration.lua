-- gamemode/modules/money/sh_ncs_integration.lua
-- Интеграция NextRP денег с NCS_SHARED системой

-- Проверяем наличие NCS_SHARED
if not NCS_SHARED then
    print("[NextRP.Money] NCS_SHARED не найден, пропускаем интеграцию")
    return
end

-- Регистрируем валюту NextRP в системе NCS_SHARED
NCS_SHARED.RegisterCurrency("nextrp", {
    -- Функция добавления денег
    addMoney = function(P, AMOUNT)
        AMOUNT = tonumber(AMOUNT)
        if not AMOUNT or AMOUNT == 0 then return end
        
        if IsValid(P) and P:IsPlayer() then
            P:AddMoney(AMOUNT)
            return true
        end
        return false
    end,
    
    -- Функция проверки возможности трат
    canAfford = function(P, AMOUNT)
        AMOUNT = tonumber(AMOUNT)
        if not AMOUNT or AMOUNT <= 0 then return false end
        
        if IsValid(P) and P:IsPlayer() then
            return P:CanAfford(AMOUNT)
        end
        return false
    end,
    
    -- Функция получения текущих денег
    getMoney = function(P)
        if IsValid(P) and P:IsPlayer() then
            return P:GetMoney() or 0
        end
        return 0
    end,
    
    -- Функция форматирования денег
    formatMoney = function(AMOUNT)
        AMOUNT = tonumber(AMOUNT) or 0
        
        -- Форматируем с разделителями тысяч и добавляем "CR"
        local formatted = string.Comma(AMOUNT)
        return formatted .. " CR"
    end,
    
    -- Дополнительные функции для NextRP
    
    -- Функция траты денег (более безопасная чем просто addMoney с отрицательным значением)
    takeMoney = function(P, AMOUNT)
        AMOUNT = tonumber(AMOUNT)
        if not AMOUNT or AMOUNT <= 0 then return false end
        
        if IsValid(P) and P:IsPlayer() then
            if P:CanAfford(AMOUNT) then
                P:AddMoney(-AMOUNT)
                return true
            end
        end
        return false
    end,
    
    -- Функция установки денег
    setMoney = function(P, AMOUNT)
        AMOUNT = tonumber(AMOUNT)
        if not AMOUNT or AMOUNT < 0 then return false end
        
        if IsValid(P) and P:IsPlayer() then
            P:SetMoney(AMOUNT)
            return true
        end
        return false
    end,
    
    -- Функция получения названия валюты
    getCurrencyName = function()
        return "Кредиты (CR)"
    end,
    
    -- Функция получения краткого названия валюты
    getCurrencySymbol = function()
        return "CR"
    end
})

-- Дополнительные хелперы для совместимости с другими системами
if SERVER then
    -- Функция для админских команд через NCS
    hook.Add("NCS_AdminGiveMoney", "NextRP_NCS_AdminGiveMoney", function(admin, target, amount)
        if IsValid(admin) and admin:IsAdmin() and IsValid(target) and target:IsPlayer() then
            target:AddMoney(amount)
            admin:ChatPrint("Выдано " .. amount .. " CR игроку " .. target:Nick())
            target:SendNotification('Администратор выдал вам ' .. amount .. ' CR!', 0, 5, NextRP.Style.Theme.Accent, NextRP.Style.Theme.Text)
            return true
        end
        return false
    end)
    
    -- Функция для покупок через NCS
    hook.Add("NCS_ProcessPurchase", "NextRP_NCS_ProcessPurchase", function(player, itemPrice, itemName)
        if IsValid(player) and player:IsPlayer() then
            if player:CanAfford(itemPrice) then
                player:AddMoney(-itemPrice)
                player:SendNotification('Покупка "' .. itemName .. '" за ' .. itemPrice .. ' CR прошла успешно!', 0, 3, NextRP.Style.Theme.Accent, NextRP.Style.Theme.Text)
                return true
            else
                player:SendNotification('У вас недостаточно кредитов для покупки "' .. itemName .. '"!', 0, 5, NextRP.Style.Theme.Accent, NextRP.Style.Theme.Text)
                return false
            end
        end
        return false
    end)
end

-- Регистрируем алиасы для совместимости
if not NextRP.NCS then
    NextRP.NCS = {}
    
    -- Алиасы функций для более простого использования
    NextRP.NCS.GiveMoney = function(player, amount)
        return NCS_SHARED.GetCurrency("nextrp").addMoney(player, amount)
    end
    
    NextRP.NCS.TakeMoney = function(player, amount)
        return NCS_SHARED.GetCurrency("nextrp").takeMoney(player, amount)
    end
    
    NextRP.NCS.CanAfford = function(player, amount)
        return NCS_SHARED.GetCurrency("nextrp").canAfford(player, amount)
    end
    
    NextRP.NCS.GetMoney = function(player)
        return NCS_SHARED.GetCurrency("nextrp").getMoney(player)
    end
    
    NextRP.NCS.FormatMoney = function(amount)
        return NCS_SHARED.GetCurrency("nextrp").formatMoney(amount)
    end
end

print("[NextRP.Money] Интеграция с NCS_SHARED успешно загружена!")

-- Пример использования:
--[[
    -- Получить деньги игрока
    local money = NCS_SHARED.GetCurrency("nextrp").getMoney(player)
    
    -- Дать игроку деньги
    NCS_SHARED.GetCurrency("nextrp").addMoney(player, 1000)
    
    -- Проверить может ли позволить
    if NCS_SHARED.GetCurrency("nextrp").canAfford(player, 500) then
        -- Забрать деньги
        NCS_SHARED.GetCurrency("nextrp").takeMoney(player, 500)
    end
    
    -- Форматировать деньги для отображения
    local formatted = NCS_SHARED.GetCurrency("nextrp").formatMoney(1500) -- "1,500 CR"
    
    -- Или через алиасы NextRP:
    NextRP.NCS.GiveMoney(player, 1000)
    local canBuy = NextRP.NCS.CanAfford(player, 500)
    local formatted = NextRP.NCS.FormatMoney(1500)
]]