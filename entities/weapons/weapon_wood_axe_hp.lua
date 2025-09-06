if ( SERVER ) then
	AddCSLuaFile()
	SWEP.Weight = 5
	CreateConVar("ta_enable_secondary","1",{FCVAR_ARCHIVE,FCVAR_REPLICATED,FCVAR_SERVER_CAN_EXECUTE})
	CreateConVar("ta_allow_sticksound","1",{FCVAR_ARCHIVE,FCVAR_REPLICATED,FCVAR_SERVER_CAN_EXECUTE})
	CreateConVar("ta_allow_stickblood","1",{FCVAR_ARCHIVE,FCVAR_REPLICATED,FCVAR_SERVER_CAN_EXECUTE})
end

if ( CLIENT ) then
	SWEP.PrintName		= "Тест Топор"
	SWEP.Author		    = "Hds46"
	SWEP.Category		= "Other"
	SWEP.Slot			= 0
	SWEP.SlotPos		= 3
	SWEP.IconLetter		= "x"
    SWEP.ViewModelFOV          = 54
	killicon.Add(  "weapon_throwable_axe","killicon/fireaxe", Color( 255, 255, 255, 255 ))
	killicon.Add(  "sent_throwable_axe","killicon/fireaxe", Color( 255, 255, 255, 255 ))
	local texture_hud=surface.GetTextureID("backpack/weapons/c_models/c_fireaxe_pyro/c_fireaxe_pyro_large")
	function SWEP:DrawWeaponSelection( x, y, wide, tall, alpha )
    draw.RoundedBox( 6, x, y, wide, tall - 25, Color( 50, 50, 50, alpha ) )
    surface.SetTexture(texture_hud)
    surface.SetDrawColor(255,255,255,alpha)
    surface.DrawTexturedRect(x,y - 12,wide,tall)
    return true
	end
end

sound.Add(
{
 name = "Weapon_FireAxe.Miss",
 channel = CHAN_WEAPON,
 volume = 0.6,
 level = 64,
 sound = "weapons/cbar_miss1.wav"
} )

sound.Add(
{
 name = "Weapon_FireAxe.HitFlesh1",
 channel = CHAN_STATIC,
 volume = 1.0,
 level = SNDLVL_NORM,
 sound = "weapons/axe_hit_flesh1.wav"
} )
sound.Add(
{
 name = "Weapon_FireAxe.HitFlesh2",
 channel = CHAN_STATIC,
 volume = 1.0,
 level = SNDLVL_NORM,
 sound = "weapons/axe_hit_flesh2.wav"
} )
sound.Add(
{
 name = "Weapon_FireAxe.HitFlesh3",
 channel = CHAN_STATIC,
 volume = 1.0,
 level = SNDLVL_NORM,
 sound = "weapons/axe_hit_flesh3.wav"
} )

sound.Add(
{
 name = "Weapon_Crowbar.Single1",
 channel = CHAN_STATIC,
 volume = 1.0,
 level = SNDLVL_NORM,
 sound = "weapons/cbar_hit1.wav"
} )
sound.Add(
{
 name = "Weapon_Crowbar.Single2",
 channel = CHAN_STATIC,
 volume = 1.0,
 level = SNDLVL_NORM,
 sound = "weapons/cbar_hit2.wav"
} )
sound.Add(
{
 name = "Weapon_FireAxe.Draw",
 channel = CHAN_AUTO,
 volume = 0.5,
 level = 74,
 sound = "weapons/draw_melee.wav"
} )


------------General Swep Info---------------
SWEP.Author         = "Hds46"
SWEP.Contact        = "Steam Workshop"
SWEP.Purpose        = "Just like one from COD:BO2"
SWEP.Instructions   = "Left Click - Swing"
SWEP.Spawnable      = false
SWEP.AdminOnly      = false
SWEP.DrawAmmo		= false
-----------------------------------------------

-----------------Models---------------------------
SWEP.ViewModel             = Model("models/weapons/c_models/c_pyro_arms.mdl")
SWEP.WorldModel            = Model("models/weapons/w_crowbar.mdl")
SWEP.CModel                = Model("models/weapons/c_models/c_fireaxe_pyro/c_fireaxe_pyro.mdl")
SWEP.UseHands = false

SWEP.HoldType			    = "melee2"

-----------------------------------------------


-------------Primary Fire Attributes----------------------------------------
SWEP.Primary.Delay		    = 20
SWEP.Primary.ClipSize		= 50
SWEP.Primary.DefaultClip	= 50
SWEP.Primary.Automatic   	= true
SWEP.Primary.Ammo         	= "AirboatGun"
-------------End Primary Fire Attributes------------------------------------

-------------Secondary Fire Attributes-------------------------------------
SWEP.Secondary.Delay	    = 6
SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic   	= true
SWEP.Secondary.Ammo         = "none"
-------------End Secondary Fire Attributes--------------------------------
SWEP.AnimTime = 0

SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelBoneMods = {}
SWEP.WElements = {
	["axe"] = { type = "Model", model = "models/weapons/c_models/c_fireaxe_pyro/c_fireaxe_pyro.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.997, 1.029, 3.628), angle = Angle(1.159, 0, 174.865), size = Vector(0.698, 0.698, 0.698), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

function SWEP:Deploy()
    self:TFAnim("fa_draw")
	local anim, duration
	anim,duration = self.Owner:GetViewModel():LookupSequence("fa_draw")
    self:SetNextPrimaryFire(CurTime() + (duration - 1))
    if(SERVER)then
	self:CallOnClient("CreateModel","")
	end
    if(CLIENT and !IsValid(self.Axe))then
        self:CreateModel()
    end
end

function SWEP:TFAnim(anim)
    self:ResetSequenceInfo()
    self.Owner:GetViewModel():SetSequence(0)
    self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
    local duration
    self.Anim,duration = self.Owner:GetViewModel():LookupSequence(anim)
    self.AnimTime = CurTime() + duration
end

function SWEP:CreateModel()
    if(CLIENT)then
        self.Axe=ClientsideModel(self.CModel,RENDERGROUP_OPAQUE)
        self.Axe:SetOwner(self.Owner:GetViewModel())
        self.Axe:SetParent(self.Owner:GetViewModel())
        self.Axe:AddEffects(bit.bor(EF_BONEMERGE, EF_NODRAW))
    end
end

function SWEP:RemoveModels()
    SafeRemoveEntity(self.Axe)
end

function SWEP:Reload()
end

function SWEP:Think()
    if(self.Anim != nil and self.AnimTime != nil) and SERVER then
        self.Owner:GetViewModel():SetPlaybackRate(1)
		self.Owner:GetViewModel():SetSequence(self.Anim)
    end
    if(!IsValid(self.Axe) and IsValid(self.Owner) and self.Owner:IsPlayer()) then
        self:CreateModel()
    end
	if (self:GetNextPrimaryFire()- 0.05) < CurTime() then
    self.Owner:GetViewModel():SetPlaybackRate(1)
	self.Owner:GetViewModel():SetSequence((self.Owner:GetViewModel():LookupSequence("fa_idle")))
	self.AnimTime=nil
    self.Anim=nil
	self:SendWeaponAnim(ACT_VM_IDLE)
	end
end

function SWEP:Equip()
end

function SWEP:PrimaryAttack()
if self:GetNextPrimaryFire() < CurTime() then
	self.Primary.ClipSize = self.Primary.ClipSize - 1
	if self.Primary.ClipSize > 0 then

	self.Weapon:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
	self.Weapon:SetNextSecondaryFire(CurTime() + self.Primary.Delay)
	self.Weapon:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
	self.Owner:SetAnimation( PLAYER_ATTACK1 )
	local anim
	local duration
	if math.random(1,100) >= 40 then
	self:TFAnim("fa_swing_b")
	anim,duration = self.Owner:GetViewModel():LookupSequence("fa_swing_b")
	self.Owner:GetViewModel():SetSequence(self.Owner:GetViewModel():LookupSequence("fa_swing_b"))
	else
	self:TFAnim("fa_swing_c")
	anim,duration = self.Owner:GetViewModel():LookupSequence("fa_swing_c")
	self.Owner:GetViewModel():SetSequence(self.Owner:GetViewModel():LookupSequence("fa_swing_c"))
	end
	self.Weapon:SetNextPrimaryFire(CurTime() + duration - 0.5)
	self.Weapon:SetNextSecondaryFire(CurTime() + duration - 0.5)
	timer.Create("attackfunc" .. self:EntIndex(),0.28,1,function()
	if IsValid(self) and IsValid(self.Owner) and SERVER then
	local trworldx = {
	start = self.Owner:EyePos(),
	endpos = self.Owner:EyePos() + self.Owner:GetAimVector() * 80,
	filter = self.Owner
	}
	local trace = util.TraceLine(trworldx)
	local trace2 = util.TraceLine(trworldx)
	if !trace.Hit or trace.HitWorld then
	trace = util.TraceHull( {
		start = self.Owner:EyePos(),
		endpos = self.Owner:EyePos() + self.Owner:GetAimVector() * 80,
		filter = {self.Owner},
		mins = Vector( -20, 0, -20 ),
		maxs = Vector( 20, 0, 20 )
	} )
	end
	if trace.Hit then
	if trace.HitWorld then
	self.Owner:EmitSound("Weapon_Crowbar.Single")
	if trace2.Hit then
	local bullet = {}
	bullet.Num = 1
	bullet.Src = self.Owner:GetShootPos()
	bullet.Dir = self.Owner:GetAimVector()
	bullet.Spread = Vector(0,0,0)
	bullet.Tracer = 0
	bullet.Force  = 0
	bullet.Damage = 1
	bullet.Callback = function(attacker, trx, dmginfo)
	dmginfo:SetDamageType(DMG_DIRECT)
	end
	self.Owner:FireBullets( bullet )
	end
	else
	if trace2.Hit then
	if IsValid(trace.Entity) and IsValid(trace2.Entity) and trace2.Entity == trace.Entity then
	local bullet = {}
	bullet.Num = 1
	bullet.Src = self.Owner:GetShootPos()
	bullet.Dir = self.Owner:GetAimVector()
	bullet.Spread = Vector(0,0,0)
	bullet.Tracer = 0
	bullet.Force  = 0
	bullet.Damage = 0
	bullet.Callback = function(attacker, trx, dmginfo)
	dmginfo:SetDamageType(DMG_DIRECT)
	end
	self.Owner:FireBullets( bullet )
	end
	end
	if IsValid(trace.Entity) then
	local dmginfo = DamageInfo()
	dmginfo:SetDamage( 1 )
	dmginfo:SetDamageType(DMG_GENERIC)
	dmginfo:SetDamagePosition( trace2.HitPos )
	dmginfo:SetDamageForce( self.Owner:GetForward()*(10*1000) )
	dmginfo:SetAttacker( self.Owner )
	dmginfo:SetInflictor( self )
	trace.Entity:DispatchTraceAttack( dmginfo, trace.HitPos, trace2.HitPos )
	if (trace.Entity:IsPlayer() or trace.Entity:IsNPC() or type( trace.Entity ) == "NextBot") then
	self.Owner:EmitSound("Weapon_FireAxe.HitFlesh")
	else
	self.Owner:EmitSound("Weapon_Crowbar.Single")
	if IsValid(trace.Entity:GetPhysicsObject()) then
	trace.Entity:GetPhysicsObject():ApplyForceCenter(self.Owner:GetForward()*8000)
	end
	end
	end
	end
	else
	self.Owner:EmitSound("Weapon_FireAxe.Miss")
	end
	end
	end)

	else
		--self.Owner:Say('/rem')
		--self:Remove()
		--self.Owner:StripWeapon('weapon_wood_axe_hp')
	end

	end

end

hook.Add("ScaleNPCDamage","NPCAxeFixHeadHit",function(npc, hitgroup, dmginfo)
if IsValid(npc) and IsValid(dmginfo:GetInflictor()) and dmginfo:GetInflictor():IsPlayer() and dmginfo:GetDamageType() == DMG_DIRECT then
dmginfo:ScaleDamage( 0 )
end
end)

/********************************************************
	SWEP Construction Kit base code
		Created by Clavus
	Available for public use, thread at:
	   facepunch.com/threads/1032378


	DESCRIPTION:
		This script is meant for experienced scripters
		that KNOW WHAT THEY ARE DOING. Don't come to me
		with basic Lua questions.

		Just copy into your SWEP or SWEP base of choice
		and merge with your own code.

		The SWEP.VElements, SWEP.WElements and
		SWEP.ViewModelBoneMods tables are all optional
		and only have to be visible to the client.
********************************************************/

function SWEP:Initialize()

	// other initialize code goes here
	self:SetWeaponHoldType( self.HoldType )
    if CLIENT and !IsValid(self.AxeThowable) and self.Owner and self.Owner:IsPlayer() then
        self:CreateModel()
    end

	if CLIENT then

		// Create a new table for every weapon instance
		self.VElements = table.FullCopy( self.VElements )
		self.WElements = table.FullCopy( self.WElements )
		self.ViewModelBoneMods = table.FullCopy( self.ViewModelBoneMods )

		self:CreateModels(self.VElements) // create viewmodels
		self:CreateModels(self.WElements) // create worldmodels

		// init view model bone build function
		if IsValid(self.Owner) then
			local vm = self.Owner:GetViewModel()
			if IsValid(vm) then
				self:ResetBonePositions(vm)

				// Init viewmodel visibility
				if (self.ShowViewModel == nil or self.ShowViewModel) then
					vm:SetColor(Color(255,255,255,255))
				else
					// we set the alpha to 1 instead of 0 because else ViewModelDrawn stops being called
					vm:SetColor(Color(255,255,255,1))
					// ^ stopped working in GMod 13 because you have to do Entity:SetRenderMode(1) for translucency to kick in
					// however for some reason the view model resets to render mode 0 every frame so we just apply a debug material to prevent it from drawing
					vm:SetMaterial("Debug/hsv")
				end
			end
		end

	end

end

function SWEP:Holster()

    if SERVER then
    if game.SinglePlayer()then
    self:CallOnClient("Holster","")
	end
	end
    self:RemoveModels()

	if CLIENT and IsValid(self.Owner) then
		local vm = self.Owner:GetViewModel()
		if IsValid(vm) then
			self:ResetBonePositions(vm)
		end
	end

	return true
end

function SWEP:OnRemove()
	self:Holster()
end

if CLIENT then

	SWEP.vRenderOrder = nil
	function SWEP:ViewModelDrawn()
		if IsValid(self.Axe) then
        self.Axe:DrawModel()
		end

		local vm = self.Owner:GetViewModel()
		if !IsValid(vm) then return end

		if (!self.VElements) then return end

		self:UpdateBonePositions(vm)

		if (!self.vRenderOrder) then

			// we build a render order because sprites need to be drawn after models
			self.vRenderOrder = {}

			for k, v in pairs( self.VElements ) do
				if (v.type == "Model") then
					table.insert(self.vRenderOrder, 1, k)
				elseif (v.type == "Sprite" or v.type == "Quad") then
					table.insert(self.vRenderOrder, k)
				end
			end

		end

		for k, name in ipairs( self.vRenderOrder ) do

			local v = self.VElements[name]
			if (!v) then self.vRenderOrder = nil break end
			if (v.hide) then continue end

			local model = v.modelEnt
			local sprite = v.spriteMaterial

			if (!v.bone) then continue end

			local pos, ang = self:GetBoneOrientation( self.VElements, v, vm )

			if (!pos) then continue end

			if (v.type == "Model" and IsValid(model)) then

				model:SetPos(pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z )
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)

				model:SetAngles(ang)
				//model:SetModelScale(v.size)
				local matrix = Matrix()
				matrix:Scale(v.size)
				model:EnableMatrix( "RenderMultiply", matrix )

				if (v.material == "") then
					model:SetMaterial("")
				elseif (model:GetMaterial() != v.material) then
					model:SetMaterial( v.material )
				end

				if (v.skin and v.skin != model:GetSkin()) then
					model:SetSkin(v.skin)
				end

				if (v.bodygroup) then
					for k, v in pairs( v.bodygroup ) do
						if (model:GetBodygroup(k) != v) then
							model:SetBodygroup(k, v)
						end
					end
				end

				if (v.surpresslightning) then
					render.SuppressEngineLighting(true)
				end

				render.SetColorModulation(v.color.r/255, v.color.g/255, v.color.b/255)
				render.SetBlend(v.color.a/255)
				model:DrawModel()
				render.SetBlend(1)
				render.SetColorModulation(1, 1, 1)

				if (v.surpresslightning) then
					render.SuppressEngineLighting(false)
				end

			elseif (v.type == "Sprite" and sprite) then

				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				render.SetMaterial(sprite)
				render.DrawSprite(drawpos, v.size.x, v.size.y, v.color)

			elseif (v.type == "Quad" and v.draw_func) then

				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)

				cam.Start3D2D(drawpos, ang, v.size)
					v.draw_func( self )
				cam.End3D2D()

			end

		end

	end

	SWEP.wRenderOrder = nil
	function SWEP:DrawWorldModel()

		if (self.ShowWorldModel == nil or self.ShowWorldModel) then
			self:DrawModel()
		end

		if (!self.WElements) then return end

		if (!self.wRenderOrder) then

			self.wRenderOrder = {}

			for k, v in pairs( self.WElements ) do
				if (v.type == "Model") then
					table.insert(self.wRenderOrder, 1, k)
				elseif (v.type == "Sprite" or v.type == "Quad") then
					table.insert(self.wRenderOrder, k)
				end
			end

		end

		if (IsValid(self.Owner)) then
			bone_ent = self.Owner
		else
			// when the weapon is dropped
			bone_ent = self
		end

		for k, name in pairs( self.wRenderOrder ) do

			local v = self.WElements[name]
			if (!v) then self.wRenderOrder = nil break end
			if (v.hide) then continue end

			local pos, ang

			if (v.bone) then
				pos, ang = self:GetBoneOrientation( self.WElements, v, bone_ent )
			else
				pos, ang = self:GetBoneOrientation( self.WElements, v, bone_ent, "ValveBiped.Bip01_R_Hand" )
			end

			if (!pos) then continue end

			local model = v.modelEnt
			local sprite = v.spriteMaterial

			if (v.type == "Model" and IsValid(model)) then

				model:SetPos(pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z )
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)

				model:SetAngles(ang)
				//model:SetModelScale(v.size)
				local matrix = Matrix()
				matrix:Scale(v.size)
				model:EnableMatrix( "RenderMultiply", matrix )

				if (v.material == "") then
					model:SetMaterial("")
				elseif (model:GetMaterial() != v.material) then
					model:SetMaterial( v.material )
				end

				if (v.skin and v.skin != model:GetSkin()) then
					model:SetSkin(v.skin)
				end

				if (v.bodygroup) then
					for k, v in pairs( v.bodygroup ) do
						if (model:GetBodygroup(k) != v) then
							model:SetBodygroup(k, v)
						end
					end
				end

				if (v.surpresslightning) then
					render.SuppressEngineLighting(true)
				end

				render.SetColorModulation(v.color.r/255, v.color.g/255, v.color.b/255)
				render.SetBlend(v.color.a/255)
				model:DrawModel()
				render.SetBlend(1)
				render.SetColorModulation(1, 1, 1)

				if (v.surpresslightning) then
					render.SuppressEngineLighting(false)
				end

			elseif (v.type == "Sprite" and sprite) then

				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				render.SetMaterial(sprite)
				render.DrawSprite(drawpos, v.size.x, v.size.y, v.color)

			elseif (v.type == "Quad" and v.draw_func) then

				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)

				cam.Start3D2D(drawpos, ang, v.size)
					v.draw_func( self )
				cam.End3D2D()

			end

		end

	end

	function SWEP:GetBoneOrientation( basetab, tab, ent, bone_override )

		local bone, pos, ang
		if (tab.rel and tab.rel != "") then

			local v = basetab[tab.rel]

			if (!v) then return end

			// Technically, if there exists an element with the same name as a bone
			// you can get in an infinite loop. Let's just hope nobody's that stupid.
			pos, ang = self:GetBoneOrientation( basetab, v, ent )

			if (!pos) then return end

			pos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
			ang:RotateAroundAxis(ang:Up(), v.angle.y)
			ang:RotateAroundAxis(ang:Right(), v.angle.p)
			ang:RotateAroundAxis(ang:Forward(), v.angle.r)

		else

			bone = ent:LookupBone(bone_override or tab.bone)

			if (!bone) then return end

			pos, ang = Vector(0,0,0), Angle(0,0,0)
			local m = ent:GetBoneMatrix(bone)
			if (m) then
				pos, ang = m:GetTranslation(), m:GetAngles()
			end

			if (IsValid(self.Owner) and self.Owner:IsPlayer() and
				ent == self.Owner:GetViewModel() and self.ViewModelFlip) then
				ang.r = -ang.r // Fixes mirrored models
			end

		end

		return pos, ang
	end

	function SWEP:CreateModels( tab )

		if (!tab) then return end

		// Create the clientside models here because Garry says we can't do it in the render hook
		for k, v in pairs( tab ) do
			if (v.type == "Model" and v.model and v.model != "" and (!IsValid(v.modelEnt) or v.createdModel != v.model) and
					string.find(v.model, ".mdl") and file.Exists (v.model, "GAME") ) then

				v.modelEnt = ClientsideModel(v.model, RENDER_GROUP_VIEW_MODEL_OPAQUE)
				if (IsValid(v.modelEnt)) then
					v.modelEnt:SetPos(self:GetPos())
					v.modelEnt:SetAngles(self:GetAngles())
					v.modelEnt:SetParent(self)
					v.modelEnt:SetNoDraw(true)
					v.createdModel = v.model
				else
					v.modelEnt = nil
				end

			elseif (v.type == "Sprite" and v.sprite and v.sprite != "" and (!v.spriteMaterial or v.createdSprite != v.sprite)
				and file.Exists ("materials/"..v.sprite..".vmt", "GAME")) then

				local name = v.sprite.."-"
				local params = { ["$basetexture"] = v.sprite }
				// make sure we create a unique name based on the selected options
				local tocheck = { "nocull", "additive", "vertexalpha", "vertexcolor", "ignorez" }
				for i, j in pairs( tocheck ) do
					if (v[j]) then
						params["$"..j] = 1
						name = name.."1"
					else
						name = name.."0"
					end
				end

				v.createdSprite = v.sprite
				v.spriteMaterial = CreateMaterial(name,"UnlitGeneric",params)

			end
		end

	end

	local allbones
	local hasGarryFixedBoneScalingYet = false

	function SWEP:UpdateBonePositions(vm)

		if self.ViewModelBoneMods then

			if (!vm:GetBoneCount()) then return end

			// !! WORKAROUND !! //
			// We need to check all model names :/
			local loopthrough = self.ViewModelBoneMods
			if (!hasGarryFixedBoneScalingYet) then
				allbones = {}
				for i=0, vm:GetBoneCount() do
					local bonename = vm:GetBoneName(i)
					if (self.ViewModelBoneMods[bonename]) then
						allbones[bonename] = self.ViewModelBoneMods[bonename]
					else
						allbones[bonename] = {
							scale = Vector(1,1,1),
							pos = Vector(0,0,0),
							angle = Angle(0,0,0)
						}
					end
				end

				loopthrough = allbones
			end
			// !! ----------- !! //

			for k, v in pairs( loopthrough ) do
				local bone = vm:LookupBone(k)
				if (!bone) then continue end

				// !! WORKAROUND !! //
				local s = Vector(v.scale.x,v.scale.y,v.scale.z)
				local p = Vector(v.pos.x,v.pos.y,v.pos.z)
				local ms = Vector(1,1,1)
				if (!hasGarryFixedBoneScalingYet) then
					local cur = vm:GetBoneParent(bone)
					while(cur >= 0) do
						local pscale = loopthrough[vm:GetBoneName(cur)].scale
						ms = ms * pscale
						cur = vm:GetBoneParent(cur)
					end
				end

				s = s * ms
				// !! ----------- !! //

				if vm:GetManipulateBoneScale(bone) != s then
					vm:ManipulateBoneScale( bone, s )
				end
				if vm:GetManipulateBoneAngles(bone) != v.angle then
					vm:ManipulateBoneAngles( bone, v.angle )
				end
				if vm:GetManipulateBonePosition(bone) != p then
					vm:ManipulateBonePosition( bone, p )
				end
			end
		else
			self:ResetBonePositions(vm)
		end

	end

	function SWEP:ResetBonePositions(vm)

		if (!vm:GetBoneCount()) then return end
		for i=0, vm:GetBoneCount() do
			vm:ManipulateBoneScale( i, Vector(1, 1, 1) )
			vm:ManipulateBoneAngles( i, Angle(0, 0, 0) )
			vm:ManipulateBonePosition( i, Vector(0, 0, 0) )
		end

	end

	/**************************
		Global utility code
	**************************/

	// Fully copies the table, meaning all tables inside this table are copied too and so on (normal table.Copy copies only their reference).
	// Does not copy entities of course, only copies their reference.
	// WARNING: do not use on tables that contain themselves somewhere down the line or you'll get an infinite loop
	function table.FullCopy( tab )

		if (!tab) then return nil end

		local res = {}
		for k, v in pairs( tab ) do
			if (type(v) == "table") then
				res[k] = table.FullCopy(v) // recursion ho!
			elseif (type(v) == "Vector") then
				res[k] = Vector(v.x, v.y, v.z)
			elseif (type(v) == "Angle") then
				res[k] = Angle(v.p, v.y, v.r)
			else
				res[k] = v
			end
		end

		return res

	end

end


--[[if ( SERVER ) then
	AddCSLuaFile()
	SWEP.Weight = 5
	CreateConVar("ta_enable_secondary","1",{FCVAR_ARCHIVE,FCVAR_REPLICATED,FCVAR_SERVER_CAN_EXECUTE})
	CreateConVar("ta_allow_sticksound","1",{FCVAR_ARCHIVE,FCVAR_REPLICATED,FCVAR_SERVER_CAN_EXECUTE})
	CreateConVar("ta_allow_stickblood","1",{FCVAR_ARCHIVE,FCVAR_REPLICATED,FCVAR_SERVER_CAN_EXECUTE})
end

if ( CLIENT ) then
	SWEP.PrintName		= "Тест Топор"
	SWEP.Author		    = "Hds46"
	SWEP.Category		= "Other"
	SWEP.Slot			= 0
	SWEP.SlotPos		= 3
	SWEP.IconLetter		= "x"
    SWEP.ViewModelFOV          = 54
	killicon.Add(  "weapon_throwable_axe","killicon/fireaxe", Color( 255, 255, 255, 255 ))
	killicon.Add(  "sent_throwable_axe","killicon/fireaxe", Color( 255, 255, 255, 255 ))
	local texture_hud=surface.GetTextureID("backpack/weapons/c_models/c_fireaxe_pyro/c_fireaxe_pyro_large")
	function SWEP:DrawWeaponSelection( x, y, wide, tall, alpha )
    draw.RoundedBox( 6, x, y, wide, tall - 25, Color( 50, 50, 50, alpha ) )
    surface.SetTexture(texture_hud)
    surface.SetDrawColor(255,255,255,alpha)
    surface.DrawTexturedRect(x,y - 12,wide,tall)
    return true
	end
end

sound.Add(
{
 name = "Weapon_FireAxe.Miss",
 channel = CHAN_WEAPON,
 volume = 0.6,
 level = 64,
 sound = "weapons/cbar_miss1.wav"
} )

sound.Add(
{
 name = "Weapon_FireAxe.HitFlesh1",
 channel = CHAN_STATIC,
 volume = 1.0,
 level = SNDLVL_NORM,
 sound = "weapons/axe_hit_flesh1.wav"
} )
sound.Add(
{
 name = "Weapon_FireAxe.HitFlesh2",
 channel = CHAN_STATIC,
 volume = 1.0,
 level = SNDLVL_NORM,
 sound = "weapons/axe_hit_flesh2.wav"
} )
sound.Add(
{
 name = "Weapon_FireAxe.HitFlesh3",
 channel = CHAN_STATIC,
 volume = 1.0,
 level = SNDLVL_NORM,
 sound = "weapons/axe_hit_flesh3.wav"
} )

sound.Add(
{
 name = "Weapon_Crowbar.Single1",
 channel = CHAN_STATIC,
 volume = 1.0,
 level = SNDLVL_NORM,
 sound = "weapons/cbar_hit1.wav"
} )
sound.Add(
{
 name = "Weapon_Crowbar.Single2",
 channel = CHAN_STATIC,
 volume = 1.0,
 level = SNDLVL_NORM,
 sound = "weapons/cbar_hit2.wav"
} )
sound.Add(
{
 name = "Weapon_FireAxe.Draw",
 channel = CHAN_AUTO,
 volume = 0.5,
 level = 74,
 sound = "weapons/draw_melee.wav"
} )


------------General Swep Info---------------
SWEP.Author         = "Hds46"
SWEP.Contact        = "Steam Workshop"
SWEP.Purpose        = "Just like one from COD:BO2"
SWEP.Instructions   = "Left Click - Swing"
SWEP.Spawnable      = false
SWEP.AdminOnly      = false
SWEP.DrawAmmo		= false
-----------------------------------------------

-----------------Models---------------------------
SWEP.ViewModel             = Model("models/weapons/c_models/c_pyro_arms.mdl")
SWEP.WorldModel            = Model("models/weapons/w_crowbar.mdl")
SWEP.CModel                = Model("models/weapons/c_models/c_fireaxe_pyro/c_fireaxe_pyro.mdl")
SWEP.UseHands = false

SWEP.HoldType			    = "melee2"

-----------------------------------------------


-------------Primary Fire Attributes----------------------------------------
SWEP.Primary.Delay		    = 20
SWEP.Primary.ClipSize		= 50
SWEP.Primary.DefaultClip	= 50
SWEP.Primary.Automatic   	= true
SWEP.Primary.Ammo         	= "AirboatGun"
-------------End Primary Fire Attributes------------------------------------

-------------Secondary Fire Attributes-------------------------------------
SWEP.Secondary.Delay	    = 6
SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic   	= true
SWEP.Secondary.Ammo         = "none"
-------------End Secondary Fire Attributes--------------------------------
SWEP.AnimTime = 0

SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelBoneMods = {}
SWEP.WElements = {
	["axe"] = { type = "Model", model = "models/weapons/c_models/c_fireaxe_pyro/c_fireaxe_pyro.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.997, 1.029, 3.628), angle = Angle(1.159, 0, 174.865), size = Vector(0.698, 0.698, 0.698), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

function SWEP:Deploy()
    self:TFAnim("fa_draw")
	local anim, duration
	anim,duration = self.Owner:GetViewModel():LookupSequence("fa_draw")
    self:SetNextPrimaryFire(CurTime() + (duration - 1))
    if(SERVER)then
	self:CallOnClient("CreateModel","")
	end
    if(CLIENT and !IsValid(self.Axe))then
        self:CreateModel()
    end
end

function SWEP:TFAnim(anim)
    self:ResetSequenceInfo()
    self.Owner:GetViewModel():SetSequence(0)
    self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
    local duration
    self.Anim,duration = self.Owner:GetViewModel():LookupSequence(anim)
    self.AnimTime = CurTime() + duration
end

function SWEP:CreateModel()
    if(CLIENT)then
        self.Axe=ClientsideModel(self.CModel,RENDERGROUP_OPAQUE)
        self.Axe:SetOwner(self.Owner:GetViewModel())
        self.Axe:SetParent(self.Owner:GetViewModel())
        self.Axe:AddEffects(bit.bor(EF_BONEMERGE, EF_NODRAW))
    end
end

function SWEP:RemoveModels()
    SafeRemoveEntity(self.Axe)
end

function SWEP:Reload()
end

function SWEP:Think()
    if(self.Anim != nil and self.AnimTime != nil) and SERVER then
        self.Owner:GetViewModel():SetPlaybackRate(1)
		self.Owner:GetViewModel():SetSequence(self.Anim)
    end
    if(!IsValid(self.Axe) and IsValid(self.Owner) and self.Owner:IsPlayer()) then
        self:CreateModel()
    end
	if (self:GetNextPrimaryFire()- 0.05) < CurTime() then
    self.Owner:GetViewModel():SetPlaybackRate(1)
	self.Owner:GetViewModel():SetSequence((self.Owner:GetViewModel():LookupSequence("fa_idle")))
	self.AnimTime=nil
    self.Anim=nil
	self:SendWeaponAnim(ACT_VM_IDLE)
	end
end

function SWEP:Equip()
end

function SWEP:PrimaryAttack()
if self:GetNextPrimaryFire() < CurTime() then
	self.Primary.ClipSize = self.Primary.ClipSize - 1
	if self.Primary.ClipSize > 0 then

	self.Weapon:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
	self.Weapon:SetNextSecondaryFire(CurTime() + self.Primary.Delay)
	self.Weapon:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
	self.Owner:SetAnimation( PLAYER_ATTACK1 )
	local anim
	local duration
	if math.random(1,100) >= 40 then
	self:TFAnim("fa_swing_b")
	anim,duration = self.Owner:GetViewModel():LookupSequence("fa_swing_b")
	self.Owner:GetViewModel():SetSequence(self.Owner:GetViewModel():LookupSequence("fa_swing_b"))
	else
	self:TFAnim("fa_swing_c")
	anim,duration = self.Owner:GetViewModel():LookupSequence("fa_swing_c")
	self.Owner:GetViewModel():SetSequence(self.Owner:GetViewModel():LookupSequence("fa_swing_c"))
	end
	self.Weapon:SetNextPrimaryFire(CurTime() + duration - 0.5)
	self.Weapon:SetNextSecondaryFire(CurTime() + duration - 0.5)
	timer.Create("attackfunc" .. self:EntIndex(),0.28,1,function()
	if IsValid(self) and IsValid(self.Owner) and SERVER then
	local trworldx = {
	start = self.Owner:EyePos(),
	endpos = self.Owner:EyePos() + self.Owner:GetAimVector() * 80,
	filter = self.Owner
	}
	local trace = util.TraceLine(trworldx)
	local trace2 = util.TraceLine(trworldx)
	if !trace.Hit or trace.HitWorld then
	trace = util.TraceHull( {
		start = self.Owner:EyePos(),
		endpos = self.Owner:EyePos() + self.Owner:GetAimVector() * 80,
		filter = {self.Owner},
		mins = Vector( -20, 0, -20 ),
		maxs = Vector( 20, 0, 20 )
	} )
	end
	if trace.Hit then
	if trace.HitWorld then
	self.Owner:EmitSound("Weapon_Crowbar.Single")
	if trace2.Hit then
	local bullet = {}
	bullet.Num = 1
	bullet.Src = self.Owner:GetShootPos()
	bullet.Dir = self.Owner:GetAimVector()
	bullet.Spread = Vector(0,0,0)
	bullet.Tracer = 0
	bullet.Force  = 0
	bullet.Damage = 1
	bullet.Callback = function(attacker, trx, dmginfo)
	dmginfo:SetDamageType(DMG_DIRECT)
	end
	self.Owner:FireBullets( bullet )
	end
	else
	if trace2.Hit then
	if IsValid(trace.Entity) and IsValid(trace2.Entity) and trace2.Entity == trace.Entity then
	local bullet = {}
	bullet.Num = 1
	bullet.Src = self.Owner:GetShootPos()
	bullet.Dir = self.Owner:GetAimVector()
	bullet.Spread = Vector(0,0,0)
	bullet.Tracer = 0
	bullet.Force  = 0
	bullet.Damage = 0
	bullet.Callback = function(attacker, trx, dmginfo)
	dmginfo:SetDamageType(DMG_DIRECT)
	end
	self.Owner:FireBullets( bullet )
	end
	end
	if IsValid(trace.Entity) then
	local dmginfo = DamageInfo()
	dmginfo:SetDamage( 1 )
	dmginfo:SetDamageType(DMG_GENERIC)
	dmginfo:SetDamagePosition( trace2.HitPos )
	dmginfo:SetDamageForce( self.Owner:GetForward()*(10*1000) )
	dmginfo:SetAttacker( self.Owner )
	dmginfo:SetInflictor( self )
	trace.Entity:DispatchTraceAttack( dmginfo, trace.HitPos, trace2.HitPos )
	if (trace.Entity:IsPlayer() or trace.Entity:IsNPC() or type( trace.Entity ) == "NextBot") then
	self.Owner:EmitSound("Weapon_FireAxe.HitFlesh")
	else
	self.Owner:EmitSound("Weapon_Crowbar.Single")
	if IsValid(trace.Entity:GetPhysicsObject()) then
	trace.Entity:GetPhysicsObject():ApplyForceCenter(self.Owner:GetForward()*8000)
	end
	end
	end
	end
	else
	self.Owner:EmitSound("Weapon_FireAxe.Miss")
	end
	end
	end)

	else
		--self.Owner:Say('/rem')
		--self:Remove()
		--self.Owner:StripWeapon('weapon_wood_axe_hp')
	end

	end

end

hook.Add("ScaleNPCDamage","NPCAxeFixHeadHit",function(npc, hitgroup, dmginfo)
if IsValid(npc) and IsValid(dmginfo:GetInflictor()) and dmginfo:GetInflictor():IsPlayer() and dmginfo:GetDamageType() == DMG_DIRECT then
dmginfo:ScaleDamage( 0 )
end
end)

/********************************************************
	SWEP Construction Kit base code
		Created by Clavus
	Available for public use, thread at:
	   facepunch.com/threads/1032378


	DESCRIPTION:
		This script is meant for experienced scripters
		that KNOW WHAT THEY ARE DOING. Don't come to me
		with basic Lua questions.

		Just copy into your SWEP or SWEP base of choice
		and merge with your own code.

		The SWEP.VElements, SWEP.WElements and
		SWEP.ViewModelBoneMods tables are all optional
		and only have to be visible to the client.
********************************************************/

function SWEP:Initialize()

	// other initialize code goes here
	self:SetWeaponHoldType( self.HoldType )
    if CLIENT and !IsValid(self.AxeThowable) and self.Owner and self.Owner:IsPlayer() then
        self:CreateModel()
    end

	if CLIENT then

		// Create a new table for every weapon instance
		self.VElements = table.FullCopy( self.VElements )
		self.WElements = table.FullCopy( self.WElements )
		self.ViewModelBoneMods = table.FullCopy( self.ViewModelBoneMods )

		self:CreateModels(self.VElements) // create viewmodels
		self:CreateModels(self.WElements) // create worldmodels

		// init view model bone build function
		if IsValid(self.Owner) then
			local vm = self.Owner:GetViewModel()
			if IsValid(vm) then
				self:ResetBonePositions(vm)

				// Init viewmodel visibility
				if (self.ShowViewModel == nil or self.ShowViewModel) then
					vm:SetColor(Color(255,255,255,255))
				else
					// we set the alpha to 1 instead of 0 because else ViewModelDrawn stops being called
					vm:SetColor(Color(255,255,255,1))
					// ^ stopped working in GMod 13 because you have to do Entity:SetRenderMode(1) for translucency to kick in
					// however for some reason the view model resets to render mode 0 every frame so we just apply a debug material to prevent it from drawing
					vm:SetMaterial("Debug/hsv")
				end
			end
		end

	end

end

function SWEP:Holster()

    if SERVER then
    if game.SinglePlayer()then
    self:CallOnClient("Holster","")
	end
	end
    self:RemoveModels()

	if CLIENT and IsValid(self.Owner) then
		local vm = self.Owner:GetViewModel()
		if IsValid(vm) then
			self:ResetBonePositions(vm)
		end
	end

	return true
end

function SWEP:OnRemove()
	self:Holster()
end

if CLIENT then

	SWEP.vRenderOrder = nil
	function SWEP:ViewModelDrawn()
		if IsValid(self.Axe) then
        self.Axe:DrawModel()
		end

		local vm = self.Owner:GetViewModel()
		if !IsValid(vm) then return end

		if (!self.VElements) then return end

		self:UpdateBonePositions(vm)

		if (!self.vRenderOrder) then

			// we build a render order because sprites need to be drawn after models
			self.vRenderOrder = {}

			for k, v in pairs( self.VElements ) do
				if (v.type == "Model") then
					table.insert(self.vRenderOrder, 1, k)
				elseif (v.type == "Sprite" or v.type == "Quad") then
					table.insert(self.vRenderOrder, k)
				end
			end

		end

		for k, name in ipairs( self.vRenderOrder ) do

			local v = self.VElements[name]
			if (!v) then self.vRenderOrder = nil break end
			if (v.hide) then continue end

			local model = v.modelEnt
			local sprite = v.spriteMaterial

			if (!v.bone) then continue end

			local pos, ang = self:GetBoneOrientation( self.VElements, v, vm )

			if (!pos) then continue end

			if (v.type == "Model" and IsValid(model)) then

				model:SetPos(pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z )
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)

				model:SetAngles(ang)
				//model:SetModelScale(v.size)
				local matrix = Matrix()
				matrix:Scale(v.size)
				model:EnableMatrix( "RenderMultiply", matrix )

				if (v.material == "") then
					model:SetMaterial("")
				elseif (model:GetMaterial() != v.material) then
					model:SetMaterial( v.material )
				end

				if (v.skin and v.skin != model:GetSkin()) then
					model:SetSkin(v.skin)
				end

				if (v.bodygroup) then
					for k, v in pairs( v.bodygroup ) do
						if (model:GetBodygroup(k) != v) then
							model:SetBodygroup(k, v)
						end
					end
				end

				if (v.surpresslightning) then
					render.SuppressEngineLighting(true)
				end

				render.SetColorModulation(v.color.r/255, v.color.g/255, v.color.b/255)
				render.SetBlend(v.color.a/255)
				model:DrawModel()
				render.SetBlend(1)
				render.SetColorModulation(1, 1, 1)

				if (v.surpresslightning) then
					render.SuppressEngineLighting(false)
				end

			elseif (v.type == "Sprite" and sprite) then

				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				render.SetMaterial(sprite)
				render.DrawSprite(drawpos, v.size.x, v.size.y, v.color)

			elseif (v.type == "Quad" and v.draw_func) then

				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)

				cam.Start3D2D(drawpos, ang, v.size)
					v.draw_func( self )
				cam.End3D2D()

			end

		end

	end

	SWEP.wRenderOrder = nil
	function SWEP:DrawWorldModel()

		if (self.ShowWorldModel == nil or self.ShowWorldModel) then
			self:DrawModel()
		end

		if (!self.WElements) then return end

		if (!self.wRenderOrder) then

			self.wRenderOrder = {}

			for k, v in pairs( self.WElements ) do
				if (v.type == "Model") then
					table.insert(self.wRenderOrder, 1, k)
				elseif (v.type == "Sprite" or v.type == "Quad") then
					table.insert(self.wRenderOrder, k)
				end
			end

		end

		if (IsValid(self.Owner)) then
			bone_ent = self.Owner
		else
			// when the weapon is dropped
			bone_ent = self
		end

		for k, name in pairs( self.wRenderOrder ) do

			local v = self.WElements[name]
			if (!v) then self.wRenderOrder = nil break end
			if (v.hide) then continue end

			local pos, ang

			if (v.bone) then
				pos, ang = self:GetBoneOrientation( self.WElements, v, bone_ent )
			else
				pos, ang = self:GetBoneOrientation( self.WElements, v, bone_ent, "ValveBiped.Bip01_R_Hand" )
			end

			if (!pos) then continue end

			local model = v.modelEnt
			local sprite = v.spriteMaterial

			if (v.type == "Model" and IsValid(model)) then

				model:SetPos(pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z )
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)

				model:SetAngles(ang)
				//model:SetModelScale(v.size)
				local matrix = Matrix()
				matrix:Scale(v.size)
				model:EnableMatrix( "RenderMultiply", matrix )

				if (v.material == "") then
					model:SetMaterial("")
				elseif (model:GetMaterial() != v.material) then
					model:SetMaterial( v.material )
				end

				if (v.skin and v.skin != model:GetSkin()) then
					model:SetSkin(v.skin)
				end

				if (v.bodygroup) then
					for k, v in pairs( v.bodygroup ) do
						if (model:GetBodygroup(k) != v) then
							model:SetBodygroup(k, v)
						end
					end
				end

				if (v.surpresslightning) then
					render.SuppressEngineLighting(true)
				end

				render.SetColorModulation(v.color.r/255, v.color.g/255, v.color.b/255)
				render.SetBlend(v.color.a/255)
				model:DrawModel()
				render.SetBlend(1)
				render.SetColorModulation(1, 1, 1)

				if (v.surpresslightning) then
					render.SuppressEngineLighting(false)
				end

			elseif (v.type == "Sprite" and sprite) then

				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				render.SetMaterial(sprite)
				render.DrawSprite(drawpos, v.size.x, v.size.y, v.color)

			elseif (v.type == "Quad" and v.draw_func) then

				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)

				cam.Start3D2D(drawpos, ang, v.size)
					v.draw_func( self )
				cam.End3D2D()

			end

		end

	end

	function SWEP:GetBoneOrientation( basetab, tab, ent, bone_override )

		local bone, pos, ang
		if (tab.rel and tab.rel != "") then

			local v = basetab[tab.rel]

			if (!v) then return end

			// Technically, if there exists an element with the same name as a bone
			// you can get in an infinite loop. Let's just hope nobody's that stupid.
			pos, ang = self:GetBoneOrientation( basetab, v, ent )

			if (!pos) then return end

			pos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
			ang:RotateAroundAxis(ang:Up(), v.angle.y)
			ang:RotateAroundAxis(ang:Right(), v.angle.p)
			ang:RotateAroundAxis(ang:Forward(), v.angle.r)

		else

			bone = ent:LookupBone(bone_override or tab.bone)

			if (!bone) then return end

			pos, ang = Vector(0,0,0), Angle(0,0,0)
			local m = ent:GetBoneMatrix(bone)
			if (m) then
				pos, ang = m:GetTranslation(), m:GetAngles()
			end

			if (IsValid(self.Owner) and self.Owner:IsPlayer() and
				ent == self.Owner:GetViewModel() and self.ViewModelFlip) then
				ang.r = -ang.r // Fixes mirrored models
			end

		end

		return pos, ang
	end

	function SWEP:CreateModels( tab )

		if (!tab) then return end

		// Create the clientside models here because Garry says we can't do it in the render hook
		for k, v in pairs( tab ) do
			if (v.type == "Model" and v.model and v.model != "" and (!IsValid(v.modelEnt) or v.createdModel != v.model) and
					string.find(v.model, ".mdl") and file.Exists (v.model, "GAME") ) then

				v.modelEnt = ClientsideModel(v.model, RENDER_GROUP_VIEW_MODEL_OPAQUE)
				if (IsValid(v.modelEnt)) then
					v.modelEnt:SetPos(self:GetPos())
					v.modelEnt:SetAngles(self:GetAngles())
					v.modelEnt:SetParent(self)
					v.modelEnt:SetNoDraw(true)
					v.createdModel = v.model
				else
					v.modelEnt = nil
				end

			elseif (v.type == "Sprite" and v.sprite and v.sprite != "" and (!v.spriteMaterial or v.createdSprite != v.sprite)
				and file.Exists ("materials/"..v.sprite..".vmt", "GAME")) then

				local name = v.sprite.."-"
				local params = { ["$basetexture"] = v.sprite }
				// make sure we create a unique name based on the selected options
				local tocheck = { "nocull", "additive", "vertexalpha", "vertexcolor", "ignorez" }
				for i, j in pairs( tocheck ) do
					if (v[j]) then
						params["$"..j] = 1
						name = name.."1"
					else
						name = name.."0"
					end
				end

				v.createdSprite = v.sprite
				v.spriteMaterial = CreateMaterial(name,"UnlitGeneric",params)

			end
		end

	end

	local allbones
	local hasGarryFixedBoneScalingYet = false

	function SWEP:UpdateBonePositions(vm)

		if self.ViewModelBoneMods then

			if (!vm:GetBoneCount()) then return end

			// !! WORKAROUND !! //
			// We need to check all model names :/
			local loopthrough = self.ViewModelBoneMods
			if (!hasGarryFixedBoneScalingYet) then
				allbones = {}
				for i=0, vm:GetBoneCount() do
					local bonename = vm:GetBoneName(i)
					if (self.ViewModelBoneMods[bonename]) then
						allbones[bonename] = self.ViewModelBoneMods[bonename]
					else
						allbones[bonename] = {
							scale = Vector(1,1,1),
							pos = Vector(0,0,0),
							angle = Angle(0,0,0)
						}
					end
				end

				loopthrough = allbones
			end
			// !! ----------- !! //

			for k, v in pairs( loopthrough ) do
				local bone = vm:LookupBone(k)
				if (!bone) then continue end

				// !! WORKAROUND !! //
				local s = Vector(v.scale.x,v.scale.y,v.scale.z)
				local p = Vector(v.pos.x,v.pos.y,v.pos.z)
				local ms = Vector(1,1,1)
				if (!hasGarryFixedBoneScalingYet) then
					local cur = vm:GetBoneParent(bone)
					while(cur >= 0) do
						local pscale = loopthrough[vm:GetBoneName(cur)].scale
						ms = ms * pscale
						cur = vm:GetBoneParent(cur)
					end
				end

				s = s * ms
				// !! ----------- !! //

				if vm:GetManipulateBoneScale(bone) != s then
					vm:ManipulateBoneScale( bone, s )
				end
				if vm:GetManipulateBoneAngles(bone) != v.angle then
					vm:ManipulateBoneAngles( bone, v.angle )
				end
				if vm:GetManipulateBonePosition(bone) != p then
					vm:ManipulateBonePosition( bone, p )
				end
			end
		else
			self:ResetBonePositions(vm)
		end

	end

	function SWEP:ResetBonePositions(vm)

		if (!vm:GetBoneCount()) then return end
		for i=0, vm:GetBoneCount() do
			vm:ManipulateBoneScale( i, Vector(1, 1, 1) )
			vm:ManipulateBoneAngles( i, Angle(0, 0, 0) )
			vm:ManipulateBonePosition( i, Vector(0, 0, 0) )
		end

	end

	/**************************
		Global utility code
	**************************/

	// Fully copies the table, meaning all tables inside this table are copied too and so on (normal table.Copy copies only their reference).
	// Does not copy entities of course, only copies their reference.
	// WARNING: do not use on tables that contain themselves somewhere down the line or you'll get an infinite loop
	function table.FullCopy( tab )

		if (!tab) then return nil end

		local res = {}
		for k, v in pairs( tab ) do
			if (type(v) == "table") then
				res[k] = table.FullCopy(v) // recursion ho!
			elseif (type(v) == "Vector") then
				res[k] = Vector(v.x, v.y, v.z)
			elseif (type(v) == "Angle") then
				res[k] = Angle(v.p, v.y, v.r)
			else
				res[k] = v
			end
		end

		return res

	end

end

]]--