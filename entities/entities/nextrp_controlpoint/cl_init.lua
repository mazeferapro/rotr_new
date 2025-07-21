include('shared.lua')

function ENT:Draw()
    self:DrawModel()
end

local function InverseLerp( pos, p1, p2 )
	local range = 0
	range = p2-p1
	if range == 0 then return 1 end
	return ((pos - p1)/range)
end

local locals = CONTROL_LOCALIZATIONS 

local function draw_circle( x, y, radius, color, percent )
    percent = percent or 1

    render.SetScissorRect( x - radius, y - radius + radius * 2 * ( 1 - percent ), x + radius, y + radius * 2, true )
        draw.RoundedBox( radius, x - radius, y - radius, radius * 2, radius * 2, color or color_white )
    render.SetScissorRect( 0, 0, 0, 0, false )
end

ENT.curCol = c'Accent'
local dist = 800000

local mat_lightcone = Material( "models/Jellyton/BF2/Misc/Props/Command_Post/M_LightCone_01_Hi_D" )
local mat_postbase = Material( "models/Jellyton/BF2/Misc/Props/Command_Post/M_REP_CommandPost_01" )
local mat_sepinsignia = Material( "models/Jellyton/BF2/Misc/Props/Command_Post/M_SEP_Insignia" )
local mat_repinsignia = Material( "models/Jellyton/BF2/Misc/Props/Command_Post/M_REP_Insignia" )

ENT.RepublicColor = Vector(0.3, 0.72, 1)
ENT.CISColor = Vector(0, 1, 0)

local white = Vector(1, 1, 1)
function ENT:Draw()
	self:DrawModel()

	local faction = self:GetControl()
    
    if faction == CONTROL_GAR then
        mat_lightcone:SetVector( "$color2", self.RepublicColor )
        mat_repinsignia:SetVector( "$color2", self.RepublicColor )
        mat_postbase:SetVector( "$emissiveBlendTint", Vector(0, 0.45, 1) )
    elseif faction == CONTROL_CIS then
        mat_lightcone:SetVector( "$color2", self.CISColor )
        mat_sepinsignia:SetVector( "$color2", self.CISColor )
        mat_postbase:SetVector( "$emissiveBlendTint", self.CISColor )
    else
        local col = NextRP.Config.ControlsColors[faction] and NextRP.Config.ControlsColors[faction]:ToVector() or white
        mat_lightcone:SetVector( "$color2", col)
        mat_repinsignia:SetVector( "$color2", white )
        mat_sepinsignia:SetVector( "$color2", white )
        mat_postbase:SetVector( "$emissiveBlendTint", Vector(0, 0, 0) )
    end

	local pos = self:GetPos() + Vector(0, 0, 250)
    render.SetAmbientLight( 0, 0, 1 )
    render.SetMaterial( mat_lightcone )
    render.SetModelLighting( BOX_FRONT, 0,0,255 )
    render.DrawBeam(pos, pos + Vector(0, 0, 250), 300, 0, 1)

    local distance = LocalPlayer():GetPos():DistToSqr(self:GetPos())
	if(distance > dist) then return end

	local ang = LocalPlayer():EyeAngles()
	local pos = self:EyePos() + ang:Up() + Vector(0, 0, 200)

	ang:RotateAroundAxis(ang:Forward(), 90)
	ang:RotateAroundAxis(ang:Right(), 90)

	local alpha = math.Clamp(math.Remap(distance, dist/4, dist, 255, 0), 0, 255)

	cam.Start3D2D(pos, Angle(0, ang.y, 90), .5)
		local col = NextRP.Config.ControlsColors[self:GetControl()] or c'Accent'
        
        if self.curCol ~= col then
            self.curCol = PawsUI:LerpColor(FrameTime() * 3, self.curCol, col)
        end

		draw.SimpleText(self:GetTitle(), 'font_sans_56', 0, -550, ColorAlpha(self.curCol, alpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 3, ColorAlpha(Color(255,255,255), alpha) )
		draw.SimpleText(self:GetDescription(), 'font_sans_18', 0, -525, ColorAlpha(color_white, alpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 3, ColorAlpha(Color(255,255,255), alpha) )
		draw.SimpleText(locals[self:GetControl()] or 'Нейтральная', 'font_sans_26', 0, -500, ColorAlpha(color_white, alpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 3, ColorAlpha(Color(255,255,255), alpha) )

		draw.NoTexture()
		
		for i = 1, 8 do
			draw.Arc(0, -260, 30, 30, i * 45, i * 45 + 45, 8, ColorAlpha(c'Background', alpha)) 
		end
		for i = 1, 8 do
			if i > self:GetPoints() then break end
			draw.Arc(0, -260, 30, 30, i * 45 + 45, i * 45 + 90, 8, ColorAlpha(self.curCol, alpha)) 
		end
	cam.End3D2D()
end