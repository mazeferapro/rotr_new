if CLIENT then
    SWEP.PrintName = "Кирка" -- For english translate this to Pickaxe
    SWEP.Slot = 1
    SWEP.SlotPos = 5
    SWEP.DrawAmmo = false
    SWEP.DrawCrosshair = false
end

-- Variables that are used on both client and server

SWEP.Author = "Kitsune"
SWEP.Instructions = "Clic gauche pour détruire les roches" -- For english translate this to Left click to destroy rocks
SWEP.Contact = ""
SWEP.Purpose = ""

SWEP.ViewModelFOV = 62
SWEP.ViewModelFlip = false
SWEP.ViewModel = Model("models/weapons/v_mgs_pickaxe.mdl")
SWEP.WorldModel = Model("models/weapons/w_mgs_pickaxe.mdl")
SWEP.HoldType = "melee";

SWEP.UseHands = true

SWEP.Spawnable = false
SWEP.AdminOnly = true
SWEP.Category = "DarkRP Minage" -- For english translate this to DarkRP Mining

--SWEP.Sound = Sound("physics/wood/wood_box_impact_hard3.wav")

SWEP.Primary.DefaultClip = 0;
SWEP.Primary.Automatic = false;
SWEP.Primary.ClipSize = -1;
SWEP.Primary.Damage = 1;
SWEP.Primary.Delay = 0.5;
SWEP.Primary.Ammo = "";

--[[-------------------------------------------------------
Name: SWEP:Initialize()
Desc: Called when the weapon is first loaded
---------------------------------------------------------]]
function SWEP:Initialize()
    self:SendWeaponAnim(ACT_VM_HOLSTER);
end

function SWEP:DoHitEffects()
    local trace = self.Owner:GetEyeTraceNoCursor();
    
    if (((trace.Hit or trace.HitWorld) and self.Owner:GetShootPos():Distance(trace.HitPos) <= 64)) then
        self:SendWeaponAnim(ACT_VM_HITCENTER);
        --self:EmitSound("weapons/crossbow/hitbod2.wav");
    else
        self:SendWeaponAnim(ACT_VM_MISSCENTER);
        --self:EmitSound("npc/vort/claw_swing2.wav");
    end;
end;

function SWEP:DoAnimations(idle)
    if (!idle) then
        self.Owner:SetAnimation(PLAYER_ATTACK1);
    end;
end;

--[[-------------------------------------------------------
Name: SWEP:PrimaryAttack()
Desc: +attack1 has been pressed
---------------------------------------------------------]]
function SWEP:PrimaryAttack()
    self:SetNextPrimaryFire(CurTime() + self.Primary.Delay);
    self:DoAnimations();
    self:DoHitEffects();
    
    if (SERVER) then
        if (self.Owner.LagCompensation) then
            self.Owner:LagCompensation(true);
        end;
        
        local trace = self.Owner:GetEyeTraceNoCursor();
        
        if (self.Owner:GetShootPos():Distance(trace.HitPos) <= 64) then
            if (IsValid(trace.Entity)) then
                self.Owner:FireBullets({
                    Spread = Vector(0, 0, 0),
                    Damage = 1,
                    Tracer = 0,
                    Force = 1,
                    Num = 1,
                    Src = self.Owner:GetShootPos(),
                    Dir = self.Owner:GetAimVector()
                });
            end;
        end;
        
        if (self.Owner.LagCompensation) then
            self.Owner:LagCompensation(false);
        end;
    end;
end

function SWEP:Holster()
    return true
end

function SWEP:Think()
end

function SWEP:DrawHUD()
end

function SWEP:SecondaryAttack()
end
--[[SWEP.PrintName              = "Кирка"
SWEP.Author                 = "Kitsune"
SWEP.Purpose                = ""
SWEP.Instructions           = ""

SWEP.Category               = "Kitsune Weapon"
SWEP.Spawnable              = false

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo		    = "none"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo		    = "none"

SWEP.Weight			        = 5
SWEP.AutoSwitchTo		    = false
SWEP.AutoSwitchFrom		    = false

SWEP.Slot			        = 1
SWEP.SlotPos			    = 5
SWEP.DrawAmmo			    = false
SWEP.DrawCrosshair		    = true
--models/weapons/w_mgs_pickaxe.mdl
--models/weapons/v_mgs_pickaxe.mdl
SWEP.ViewModel			    = "models/weapons/v_mgs_pickaxe.mdl"
SWEP.WorldModel			    = "models/weapons/w_mgs_pickaxe.mdl"

function SWEP:Initialize()
    self:SetHoldType( "melee" )
end

function SWEP:PrimaryAttack()
    if CLIENT then return end
    if not IsFirstTimePredicted() then return end

    self:SetNextPrimaryFire( CurTime() + 1 )

    local ent = self.Owner:GetEyeTrace().Entity
    if not IsValid( ent ) then return end
    if ent:GetClass() == "cityworker_leak" or ( ent:GetClass() == "cityworker_hydrant" and ent:GetLeaking() ) then
        if ent:GetPos():Distance( self.Owner:GetPos() ) > 200 then return end

        CITYWORKER.Begin( self.Owner, ent )
    end
end

function SWEP:SecondaryAttack()
    return
end

function SWEP:Reload()
    return
end

function SWEP:DrawWorldModel()
    if not IsValid( self.Owner ) then return end

    local pos, ang = self.Owner:GetBonePosition( self.Owner:LookupBone( "ValveBiped.Bip01_R_Hand" ) )
    local offsetPos = ang:Right() * 1 + ang:Forward() * 3 + ang:Up() * -2

    ang:RotateAroundAxis( ang:Right(), 0 )
    ang:RotateAroundAxis( ang:Forward(), 90 )
    ang:RotateAroundAxis( ang:Up(), 180 )

    self:SetRenderOrigin( pos + offsetPos )
    self:SetRenderAngles( ang )

    self:DrawModel()
end

function SWEP:GetViewModelPosition( pos, ang )
    pos = pos + ang:Right() * 9 + ang:Forward() * 18 + ang:Up() * -9

    ang:RotateAroundAxis( ang:Right(), 90 )
    ang:RotateAroundAxis( ang:Up(), -90 )

    return pos, ang
end]]--
