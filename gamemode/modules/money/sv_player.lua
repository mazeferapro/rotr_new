--- @classmod Player

local pMeta = FindMetaTable('Player')

--- Устанавливает деньги игроку
-- @realm server
-- @tparam number nMoneyAmount кол-во денег для установки
function pMeta:SetMoney(nMoneyAmount)
    self:SetNVar('nrp_money', nMoneyAmount)
    self:SetCharValue('money', nMoneyAmount, function()
        self:LoadCharacter(nil, self:GetNVar('nrp_charid'))
    end)
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