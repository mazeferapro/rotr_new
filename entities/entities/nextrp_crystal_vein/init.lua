-- entities/nextrp_crystal_vein/init.lua

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
    self:SetModel(NextRP.Generator.Config.Crystals.VeinModel)
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    
    local phys = self:GetPhysicsObject()
    if IsValid(phys) then
        phys:Wake()
        phys:EnableMotion(false) -- Жила не должна двигаться
    end
    
    self:SetUseType(SIMPLE_USE)
    self:SetHealth(NextRP.Generator.Config.Crystals.VeinHealth)
    self:SetMaxHealth(NextRP.Generator.Config.Crystals.VeinHealth)
    
    -- Инициализируем переменные
    self.VeinID = self.VeinID or 0
    self.CrystalAmount = self.CrystalAmount or NextRP.Generator.Config.Crystals.VeinCapacity
    self.IsBeingMined = false
    self.LastMiningTime = 0
    self.NextUse = 0
end

function ENT:Use(activator, caller)
    if not IsValid(activator) or not activator:IsPlayer() then return end
    if CurTime() < self.NextUse then return end
    
    self.NextUse = CurTime() + 0.5 -- Кулдаун использования
    
    -- Начинаем добычу
    if NextRP and NextRP.Generator and NextRP.Generator.StartMining then
        NextRP.Generator:StartMining(activator, self)
    else
        activator:ChatPrint("❌ Модуль генератора не загружен!")
    end
end

function ENT:OnTakeDamage(dmginfo)
    -- Жилы могут получать урон, но не разрушаются
    local newHealth = self:Health() - dmginfo:GetDamage()
    self:SetHealth(math.max(newHealth, 1)) -- Минимум 1 HP
end

function ENT:OnRemove()
    -- Очищаем таймер восстановления при удалении
    if NextRP and NextRP.Generator and NextRP.Generator.VeinTimers then
        local timerName = "VeinRestore_" .. (self.VeinID or 0)
        if timer.Exists(timerName) then
            timer.Remove(timerName)
        end
        NextRP.Generator.VeinTimers[self.VeinID] = nil
    end
end

-- Сетевая переменная для отображения количества кристаллов
function ENT:SetCrystalAmount(amount)
    self.CrystalAmount = amount
    self:SetNWInt("CrystalAmount", amount)
end

function ENT:GetCrystalAmount()
    return self:GetNWInt("CrystalAmount", 0)
end