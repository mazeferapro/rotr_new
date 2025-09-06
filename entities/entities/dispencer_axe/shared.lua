--[[ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName		= "Аренда топора"
ENT.Author			= "ChanceSphere574"
ENT.Category		= "Kitsune Entities"
ENT.Spawnable 		= false
ENT.AdminSpawnable	= false

ENT.UseTimer = CurTime()
ENT.Status   = 0

ENT.LoadingSkin = 3
ENT.CurSkin = 6]]--
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
 
ENT.PrintName = "Кристалл"
ENT.Author = "Kitsune"
ENT.Category = "Kitsune Entities"
ENT.Contact = "none"
ENT.Spawnable = true
ENT.AdminSpawnable = false

function ENT:SetupDataTables()
	self:NetworkVar("Bool", 0, "Clean")
	self:NetworkVar("Float", 1, "ClothType") -- 1 = prisonnier, 2 = garde

	if SERVER then
		self:NetworkVarNotify("Clean", self.OnClothChangeState)
	end
end
