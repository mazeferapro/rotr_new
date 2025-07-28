--- @classmod Player

local pMeta = FindMetaTable('Player')

--- Устанавливает деньги игроку
-- @realm server
-- @tparam number nMoneyAmount кол-во денег для установки
function pMeta:SetMoney(nMoneyAmount)
    local oldMoney = self:GetMoney() or 0
    
    -- 1. Сразу обновляем NVar для клиента
    self:SetNVar('nrp_money', nMoneyAmount)
    
    -- 2. Обновляем кэш персонажа
    local char = self:CharacterByID(self:GetNVar('nrp_charid'))
    if char then
        char.money = nMoneyAmount
    end
    
    -- 3. Сохраняем в БД без колбэков
    local charid = self:GetNVar('nrp_charid')
    if charid and charid ~= -1 then
        MySQLite.query(string.format(
            "UPDATE nextrp_characters SET money = %d WHERE character_id = %d",
            nMoneyAmount,
            charid
        ))
        
        -- Обновляем глобальный кэш
        if NextRP.Chars.Cache[charid] then
            NextRP.Chars.Cache[charid].money = nMoneyAmount
        end
    end
    
    -- 4. Уведомляем клиент если есть изменения
    if oldMoney ~= nMoneyAmount then
        if netstream then
            netstream.Start(self, 'NextRP::MoneyUpdated', nMoneyAmount)
        end
        print("[Money] " .. self:Nick() .. " money: " .. oldMoney .. " -> " .. nMoneyAmount)
    end
end
--- Добавляет деньги игроку
-- @realm server
-- @tparam number nMoneyAmount кол-во денег для добавления
-- @treturn number Новый баланс игрока
function pMeta:AddMoney(nMoneyAmount)
    local curMoney = self:GetMoney()
    self:SetMoney(curMoney + nMoneyAmount)

    --return curMoney + nMoneyAmount
end

function pMeta:SendMoney(nMoneyAmount, pTarget)
    if not self:CanAfford(nMoneyAmount) then self:SendNotification('У вас недостаточно денег!', 0, 5, NextRP.Style.Theme.Accent, NextRP.Style.Theme.Text) return end
    if pTarget:IsPlayer() then
        self:AddMoney(-nMoneyAmount)
        self:SendNotification('Вы передали '..nMoneyAmount..' CR игроку '..pTarget:GetNVar('nrp_nickname'), 0, 3, NextRP.Style.Theme.Accent, NextRP.Style.Theme.Text)
        self:DoAnimationEvent(ACT_GMOD_GESTURE_ITEM_GIVE)
        pTarget:AddMoney(nMoneyAmount)
        pTarget:SendNotification('Вы получили '..nMoneyAmount..' CR от игрока '..self:GetNVar('nrp_nickname'), 0, 3, NextRP.Style.Theme.Accent, NextRP.Style.Theme.Text)
    end
end

if not netstream then
    util.AddNetworkString("NextRP_MoneyUpdate")
end

concommand.Add("nextrp_givemoney", function(pPlayer, cmd, args)
        if not IsValid(pPlayer) or not pPlayer:IsAdmin() then 
            if IsValid(pPlayer) then
                pPlayer:ChatPrint("У вас нет прав для использования этой команды!")
            end
            return 
        end
        
        if #args < 2 then
            pPlayer:ChatPrint("Использование: nextrp_givemoney <имя игрока> <количество>")
            return
        end
        
        local playerName = args[1]
        local amount = tonumber(args[2])
        
        if not amount or amount <= 0 then
            pPlayer:ChatPrint("Количество денег должно быть положительным числом")
            return
        end
        
        -- Ищем игрока по частичному совпадению имени
        local targetPlayer = nil
        for _, ply in ipairs(player.GetAll()) do
            if string.find(string.lower(ply:Nick()), string.lower(playerName)) then
                targetPlayer = ply
                break
            end
        end
        
        if not targetPlayer then
            pPlayer:ChatPrint("Игрок с именем '" .. playerName .. "' не найден")
            return
        end
        
        if targetPlayer:GetNVar('nrp_charid') == -1 then
            pPlayer:ChatPrint("Нельзя выдать деньги администратору")
            return
        end
        
        -- Выдаем деньги
        targetPlayer:AddMoney(amount)
        
        -- Уведомления
        pPlayer:ChatPrint("Выдано " .. amount .. " CR игроку " .. targetPlayer:Nick())
        targetPlayer:SendNotification('Администратор выдал вам ' .. amount .. ' CR!', 0, 5, NextRP.Style.Theme.Accent, NextRP.Style.Theme.Text)
        
        -- Лог
        print("[Money] Админ " .. pPlayer:Nick() .. " выдал " .. amount .. " CR игроку " .. targetPlayer:Nick())
    end)