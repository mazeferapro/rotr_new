include("shared.lua")

function ENT:Draw()
  if not IsValid(self) or not IsValid(LocalPlayer()) then return end

  self:DrawModel()

  local pos = self:GetPos()
  local ang = self:GetAngles()
  ang:RotateAroundAxis(ang:Up(), 0)
  ang:RotateAroundAxis(ang:Forward(), 85)

  if LocalPlayer():GetPos():DistToSqr(self:GetPos()) < 40000 then
    cam.Start3D2D(pos + ang:Up()*0-Vector(0,0,30), Angle(0, LocalPlayer():EyeAngles().y-90, 90), 0.025)

      --draw.RoundedBoxEx(16, -500, -3100, 1000, 170, AAS.Colors["background"], true, true, false, false)
      --draw.RoundedBox(0, -500, -2950, 1000, 20, AAS.Colors["black150"])

      draw.SimpleText('Нажмите [Е] для добычи', "font_sans_72", 0, -3085, color_white, TEXT_ALIGN_CENTER)

    cam.End3D2D()
  end
end