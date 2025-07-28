-- gamemode/modules/generator/entities/crystal_vein_entity/init.lua

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
    self:SetModel(NextRP.Generator.Config.Crystals.VeinModel)
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetUseType(SIMPLE_USE) -- Обычное нажатие E
    
    self:SetHealth(NextRP.Generator.Config.Crystals.VeinHealth)
    self:SetMaxHealth(NextRP.Generator.Config.Crystals.VeinHealth)
    
    self.VeinID = 0
    self.CrystalAmount = NextRP.Generator.Config.Crystals.VeinCapacity
    self.LastMiningTime = 0
    
    local phys = self:GetPhysicsObject()
    if IsValid(phys) then
        phys:Wake()
        phys:EnableMotion(false)
    end
end

function ENT:Use(activator, caller)
    if not IsValid(activator) or not activator:IsPlayer() then return end
    
    if NextRP and NextRP.Generator then
        NextRP.Generator:MineCrystal(activator, self)
    end
end