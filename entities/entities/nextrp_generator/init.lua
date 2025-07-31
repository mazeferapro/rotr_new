-- entities/nextrp_generator/init.lua

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
    self:SetModel(NextRP.Generator.Config.Generator.Model)
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    
    local phys = self:GetPhysicsObject()
    if IsValid(phys) then
        phys:Wake()
        phys:EnableMotion(false) -- Генератор не должен двигаться
    end
    
    self:SetUseType(SIMPLE_USE)
    
    -- Настройки для 3D2D текста
    self.NextUse = 0
end

function ENT:Use(activator, caller)
    if not IsValid(activator) or not activator:IsPlayer() then return end
    if CurTime() < self.NextUse then return end
    
    self.NextUse = CurTime() + 1 -- Кулдаун использования
    
    -- Заправляем генератор
    if NextRP and NextRP.Generator and NextRP.Generator.RefuelGenerator then
        NextRP.Generator:RefuelGenerator(activator)
    else
        activator:ChatPrint("❌ Модуль генератора не загружен!")
    end
end

function ENT:OnRemove()
    -- Очищаем ссылку на генератор при удалении
    if NextRP and NextRP.Generator then
        NextRP.Generator.GeneratorEntity = nil
    end
end