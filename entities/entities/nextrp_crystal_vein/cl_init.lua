-- gamemode/modules/generator/entities/crystal_vein_entity/cl_init.lua

include("shared.lua")

function ENT:Initialize()
    self.CrystalAmount = NextRP.Generator.Config.Crystals.VeinCapacity or 10
end

local function InverseLerp(pos, p1, p2)
    local range = p2 - p1
    if range == 0 then return 1 end
    return ((pos - p1) / range)
end

function ENT:Draw()
    self:DrawModel()

    local alpha = 255
    local viewdist = 250

    -- calculate alpha
    local max = viewdist
    local min = viewdist * 0.75

    local dist = LocalPlayer():EyePos():Distance(self:GetPos())

    if dist > min and dist < max then
        local frac = InverseLerp(dist, max, min)
        alpha = alpha * frac
    elseif dist > max then
        alpha = 0
    end

    if alpha > 0 then
        local oang = self:GetAngles()
        local ang = self:GetAngles()
        local pos = self:GetPos()

        ang:RotateAroundAxis(oang:Up(), 90)
        ang:RotateAroundAxis(oang:Right(), -90)

        pos = pos + oang:Up() * 60

        cam.Start3D2D(pos, ang, 0.025)
            local crystalPercent = self.CrystalAmount / (NextRP.Generator.Config.Crystals.VeinCapacity or 10)
            
            -- Название
            draw.SimpleText('Жила кристаллов', 'font_sans_3d2d_large', 0, 0, Color(225, 177, 44, alpha), TEXT_ALIGN_CENTER)
            
            -- Полоса кристаллов
            local barW, barH = 400, 20
            draw.RoundedBox(4, -barW/2, 100, barW, barH, Color(60, 60, 60, alpha))
            
            local barColor = Color(0, 255, 0, alpha)
            if crystalPercent <= 0.2 then
                barColor = Color(255, 0, 0, alpha)
            elseif crystalPercent <= 0.5 then
                barColor = Color(255, 255, 0, alpha)
            end
            
            if crystalPercent > 0 then
                draw.RoundedBox(4, -barW/2 + 2, 102, (barW - 4) * crystalPercent, barH - 4, barColor)
            end
            
            -- Количество кристаллов
            draw.SimpleText('Кристаллы: ' .. self.CrystalAmount .. '/' .. (NextRP.Generator.Config.Crystals.VeinCapacity or 10), 'font_sans_3d2d_small', 0, 140, Color(255, 255, 255, alpha), TEXT_ALIGN_CENTER)
            
            -- Подсказка
            draw.SimpleText('Нажмите [E] для добычи кристалла.', 'font_sans_3d2d_small', 0, 180, Color(255, 255, 255, alpha), TEXT_ALIGN_CENTER)
        cam.End3D2D()
    end
end

-- Получение обновлений количества кристаллов
net.Receive("Generator_UpdateVeinCrystals", function()
    local vein = net.ReadEntity()
    local crystalAmount = net.ReadInt(8)
    
    if IsValid(vein) then
        vein.CrystalAmount = crystalAmount
        print("[Generator] Обновлено количество кристаллов в жиле:", crystalAmount)
    end
end)