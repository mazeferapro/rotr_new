--- @classmod Player

local pMeta = FindMetaTable('Player')

--- Получает количество денег
-- @realm shared
-- @tretrun number Количество денег на счету
function pMeta:GetMoney()
    return self:GetNVar('nrp_money')
end

--- Проверяет может ли игрок позволить себе что-то на сумму
-- @realm shared
-- @tparam number nSum Сумма для проверки
-- @tretrun boolean Может или нет
function pMeta:CanAfford(nSum)
    if nSum <= 0 then return false end
    local curMoney = self:GetMoney()

    return (curMoney - nSum) >= 0
end