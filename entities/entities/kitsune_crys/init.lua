--[[AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( "shared.lua" )
--"models/niksacokica/items/red_crystal.mdl"
function ENT:Initialize()
    self:SetModel('models/statua/starwars/crystals/orange.mdl')
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetMaterial(MAT_GLASS)
    self:SetUseType(SIMPLE_USE)

    self:SetMaxHealth(500)
    self:SetHealth(500)

    local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end

    phys:EnableMotion( false )
end

function ENT:Use( activator, Caller )
    if activator:IsPlayer() and activator:GetActiveWeapon():GetClass() == 'weapon_stunstick' then
        Crys.Begin(activator, self)
    else
        activator:PrintMessage(4, "Вам нужна кирка для добычи кристаллов!")
    end
end

function ENT:OnTakeDamage(dmginfo, cal)
    local CurHealth = self:Health()
    self:TakePhysicsDamage(dmginfo)
    local cal = dmginfo:GetAttacker()
    if cal:GetActiveWeapon():GetClass() == 'weapon_stunstick' then
        local Damage = math.random(5, 15)
        local NewHealth = math.Clamp(CurHealth - Damage, -500, 500)

        self:SetHealth(NewHealth)

        if NewHealth <= 0 then
            self:SetColor(Color (0, 0, 0, 0))
            self:SetRenderMode(RENDERMODE_TRANSCOLOR)
            self:SetCollisionGroup(10)
            self:EmitSound("ambient/materials/footsteps_glass1.wav")

            timer.Simple(1800, function()
                self:SetColor(Color(255, 255, 255, 255))
                self:SetRenderMode(RENDERMODE_TRANSCOLOR)
                self:SetCollisionGroup(0)
                self:SetHealth(500)
            end)
        end
    end
end]]--
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")


function ENT:SpawnFunction(ply, tr, cn)
    local ent = ents.Create(cn)
    ent:SetPos(tr.HitPos + tr.HitNormal)
    ent:Spawn()
    return ent
end

modelrandcrys = {
    "models/statua/starwars/crystals/blue.mdl",
    "models/statua/starwars/crystals/green.mdl",
    "models/statua/starwars/crystals/orange.mdl"
}

function ENT:Initialize()
    self:SetModel(table.Random(modelrandcrys))

    --[[if self:GetClothType() == 1 then
        self:SetColor(Color(255,125,0))
    elseif self:GetClothType() == 2 then
        self:SetColor(Color(0,50,255))
    elseif self:GetClothType() == 3 then
        self:SetColor(Color(255,51,255))
    elseif self:GetClothType() == 4 then
        self:SetColor(Color(160,160,160))
    elseif self:GetClothType() == 5 then
        self:SetColor(Color(255,255,51))
    end]]--

    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetMaterial(MAT_GLASS)

    self:SetMaxHealth(500)
    self:SetHealth( 500 )

    local phys = self:GetPhysicsObject()
    if (phys:IsValid()) then
        phys:Wake()
    end
end

function ENT:OnTakeDamage(dmginfo, cal)
    local HP = self:SetMaxHealth(500)
    local CurHealth = self:Health()
    self:TakePhysicsDamage( dmginfo )
    local cal = dmginfo:GetAttacker()
    if cal:GetActiveWeapon():GetClass() == 'weapon_pickaxe' then
        local Damage = math.random(1, 10)
        local NewHealth = math.Clamp( CurHealth - Damage , -500, 500 )
        local pos = self:LocalToWorld(self:OBBCenter())
        local ang = self:GetAngles()
        local crys = ents.Create("dispencer_axe")

            self:SetHealth( NewHealth )

        if math.random(1, 24) == 1 then
        elseif math.random(2, 24) == 2 then
        elseif math.random(3, 24) == 3 then
        elseif math.random(4, 24) == 4 then
        elseif math.random(5, 24) == 5 then
        elseif math.random(6, 24) == 6 then
        elseif math.random(7, 24) == 7 then
        elseif math.random(8, 24) == 8 then
        elseif math.random(9, 24) == 9 then
        elseif math.random(10, 24) == 10 then
        elseif math.random(11, 24) == 11 then
        elseif math.random(12, 24) == 12 then
        elseif math.random(13, 24) == 13 then
        elseif math.random(14, 24) == 14 then
        elseif math.random(15, 24) == 15 then
            if not crys:IsValid() then return end
            crys:SetPos(dmginfo:GetDamagePosition())
            crys:SetAngles(self:GetAngles())
            if math.random(1, 5) == 1 then
            crys:SetClothType(1)
            elseif math.random(2, 5) == 2 then
            crys:SetClothType(2)
            elseif math.random(3, 5) == 3 then
            crys:SetClothType(3)
            elseif math.random(4, 5) == 4 then
            crys:SetClothType(4)
            else
            crys:SetClothType(5)
            end
            crys:SetClean(true)
            crys:Spawn()
        elseif math.random(16, 24) == 16 then
        elseif math.random(17, 24) == 17 then
        elseif math.random(18, 24) == 18 then
        elseif math.random(19, 24) == 19 then
        elseif math.random(20, 24) == 20 then
        elseif math.random(21, 24) == 21 then
        elseif math.random(22, 24) == 22 then
        elseif math.random(23, 24) == 23 then
        else
        end

        if NewHealth <= 0 then
            --if not self:IsDestroyed() then
                self.FinalAttacker = dmginfo:GetAttacker()
                self.FinalInflictor = dmginfo:GetInflictor()

                --self:Destroy()
                local vPoint = Vector( 0, 0, 0 )
                local effectdata = EffectData()
                effectdata:SetOrigin( dmginfo:GetDamagePosition() )
                self:SetColor ( Color (0, 0, 0, 0))
                self:SetRenderMode (RENDERMODE_TRANSCOLOR)
                self:SetCollisionGroup(10)
                util.Effect("AirboatGunImpact" , effectdata)
                self:EmitSound( "ambient/materials/footsteps_glass1.wav")

                timer.Simple( 1800, function()
                    self:SetColor ( Color (255, 255, 255, 255))
                    self:SetRenderMode (RENDERMODE_TRANSCOLOR)
                    self:SetCollisionGroup(0)
                    self:SetHealth(500)
                end)
            --end
        end

    --[[    if NewHealth <= -self:GetMaxHP() then
            self:Explode()
        end]]--
    else
        cal:PrintMessage( 4, "Ваше оружие неэффективно для добычи кристаллов!" )
    end
end
