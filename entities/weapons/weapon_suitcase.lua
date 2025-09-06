AddCSLuaFile()
SWEP.Base				= "weapon_base"
SWEP.PrintName			= "Коробка с кристаллами"
SWEP.ViewModel			= "models/weapons/c_nsuitcase.mdl"
SWEP.WorldModel			= "models/weapons/w_nsuitcase.mdl"
SWEP.ViewModelFOV 		= 54
SWEP.HoldType			= "none"
SWEP.UseHands			= "true"
SWEP.Purpose			= ""
SWEP.Weight				= 2
SWEP.AutoSwitchTo		= true
SWEP.Spawnable			= false

SWEP.Primary.Sound			= ""
SWEP.Primary.Damage			= 0
SWEP.Primary.NumShots		= 0
SWEP.Primary.Recoil			= 0
SWEP.Primary.Cone			= 0
SWEP.Primary.Delay			= 0
SWEP.Primary.ClipSize		= 1
SWEP.Primary.DefaultClip	= 1
SWEP.Primary.Tracer			= 0
SWEP.Primary.Force			= 0
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "normal"
SWEP.Category 				= "Other"

SWEP.Secondary.Sound		= ""
SWEP.Secondary.Damage		= 0
SWEP.Secondary.NumShots		= 0
SWEP.Secondary.Recoil		= 0
SWEP.Secondary.Cone			= 0
SWEP.Secondary.Delay		= 0
SWEP.Secondary.ClipSize		= 1
SWEP.Secondary.DefaultClip	= 1
SWEP.Secondary.Tracer		= 0
SWEP.Secondary.Force		= 0
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "normal"

function SWEP:Initialize()

	self:SetWeaponHoldType("normal")
	--[[local ply=self:GetOwner()
	if CLIENT then return end
	if ply:IsPlayer() then
		if CrysCollectTable[ply:SteamID()] then
			local collect = CrysCollectTable[ply:SteamID()]
			local ws = ply:GetWalkSpeed()
			local rs = ply:GetRunSpeed()
			local wsn = ws - 0.1 * collect
			local rsn = rs - 0.1 * collect
			if wsn <= 0 then wsn = ws - 10 end
			if rsn <= 0 then rsn = rs - 10 end
			ply:SetWalkSpeed(wsn)
			ply:SetRunSpeed(rsn)
		end
	end]]--
end
function SWEP:PrimaryAttack(ply)
--[[	local ply=self.Owner
	if CLIENT then return end
	if not IsFirstTimePredicted() then return end
	if ply:IsPlayer() then
		local ent = ents.Create(self:GetClass())
            if ply:GetPos():Distance(ply:GetEyeTrace().HitPos) > 200 then
               ent:SetPos(ply:GetShootPos() + (ply:GetAimVector()*100))
            else
                ent:SetPos(ply:GetEyeTrace().HitPos)
            end
            ent:SetAngles(ply:GetAngles())
            ent:DropToFloor()
            ent:Spawn()
		self:GetOwner():StripWeapon(self:GetClass())
	end
	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)]]
end
function SWEP:SecondaryAttack() end
function SWEP:Think() end