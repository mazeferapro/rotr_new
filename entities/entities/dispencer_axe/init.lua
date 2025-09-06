--[[AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('shared.lua')


function ENT:Initialize()
	self:SetModel("models/cs574/objects/ammo_container.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(SOLID_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:DropToFloor()

	self:SetUseType(SIMPLE_USE)

	local phys = self:GetPhysicsObject()

	if(IsValid(phys)) then
		phys:Wake()
	end
end

function ENT:SpawnFunction(ply, tr, ClassName)
	if(!tr.Hit) then return end

	local SpawnPos = ply:GetShootPos() + ply:GetForward() * 80

	local ent = ents.Create(ClassName)
	ent:SetPos(SpawnPos)
	ent:Spawn()
	ent:Activate()

	return ent
end

function ENT:Use(activator, caller)
	local dispenser_timer = GetConVar("rw_sw_dispenser_timer"):GetInt()
	if activator:GetActiveWeapon():GetClass() == "weapon_wood_axe" then
		if self.UseTimer <= CurTime() and activator:IsPlayer() then

			self:SetSkin(self.LoadingSkin)
			self:EmitSound("buttons/button6.wav")

			if activator:HasWeapon("weapon_wood_axe") then
			activator:StripWeapon( "weapon_wood_axe" )
			elseif activator:canAfford(300) then
				activator:Give("weapon_wood_axe", false )
				activator:addMoney(-300)
			else
				activator:PrintMessage( 4, "Недостаточно денег, пошел вон!" )
			end

			self.UseTimer = CurTime() + dispenser_timer
			self.Status = 0
		else
			self:EmitSound("npc/roller/code2.wav")
			return false
		end
	end
end

function ENT:Think()
	if self.UseTimer <= CurTime() && self.Status == 0 then
		self:EmitSound("buttons/button7.wav")
		self:SetSkin(self.CurSkin)
		self.Status = 1
	end
end]]--
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
 
include("shared.lua")

function ENT:SpawnFunction(ply, tr, cn)
	local ent = ents.Create(cn)
	ent:SetPos(tr.HitPos + tr.HitNormal)
	if math.random(1, 4) == 4 then
		ent:SetClothType(2)
	else 
		ent:SetClothType(1)
	end
	ent:SetClean(false)
	ent:Spawn()

	return ent
end

function ENT:Initialize()
	self:SetModel("models/venator/venator_kybercrystal_wos_white.mdl")

	if not self:GetClean() then
		self:SetMaterial("models/props_pipes/GutterMetal01a")
	else
		self:SetMaterial("models/debug/debugwhite")
	end

	if self:GetClothType() == 1 then
		self:SetColor(Color(255,125,0))
	elseif self:GetClothType() == 2 then
		self:SetColor(Color(0,50,255))
	elseif self:GetClothType() == 3 then
		self:SetColor(Color(255,51,255))
	elseif self:GetClothType() == 4 then
		self:SetColor(Color(160,160,160))
	elseif self:GetClothType() == 5 then
		self:SetColor(Color(255,255,51))
	end

	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetUseType( SIMPLE_USE )
 
    local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end
end

function ENT:Use( ply, caller )
	--[[if ( self:IsPlayerHolding() ) then return end
		ply:PickupObject( self )
    return ent]]--
    ply:ChatPrint('Кристалл спиздили.')
    self:Remove()
end
