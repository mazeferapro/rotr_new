-- gamemode/modules/generator/entities/generator_entity/cl_init.lua

include("shared.lua")

local function InverseLerp(pos, p1, p2)
    local range = p2 - p1
    if range == 0 then return 1 end
    return ((pos - p1) / range)
end

function ENT:Initialize()
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

        pos = pos + oang:Up() * 80

        cam.Start3D2D(pos, ang, 0.025)
            -- Название
            draw.SimpleText('Генератор', 'font_sans_3d2d_large', 0, 0, Color(225, 177, 44, alpha), TEXT_ALIGN_CENTER)
            
            -- Проверяем существование модуля генератора
            if NextRP and NextRP.Generator and NextRP.Generator.FuelLevel then
                -- Полоса заряда генератора
                local barW, barH = 400, 20
                draw.RoundedBox(4, -barW/2, 100, barW, barH, Color(60, 60, 60, alpha))
                
                local fuelPercent = NextRP.Generator.FuelLevel / 100
                local barColor = Color(0, 255, 0, alpha)
                if NextRP.Generator.FuelLevel <= 10 then
                    barColor = Color(255, 0, 0, alpha)
                elseif NextRP.Generator.FuelLevel <= 25 then
                    barColor = Color(255, 255, 0, alpha)
                end
                
                if fuelPercent > 0 then
                    draw.RoundedBox(4, -barW/2 + 2, 102, (barW - 4) * fuelPercent, barH - 4, barColor)
                end
                
                -- Уровень заряда
                draw.SimpleText('Заряд: ' .. math.Round(NextRP.Generator.FuelLevel, 1) .. '%', 'font_sans_3d2d_small', 0, 140, Color(255, 255, 255, alpha), TEXT_ALIGN_CENTER)
            else
                -- Если модуль не загружен, показываем базовую информацию
                draw.SimpleText('Загрузка...', 'font_sans_3d2d_small', 0, 140, Color(255, 255, 0, alpha), TEXT_ALIGN_CENTER)
            end
            
            -- Подсказки
            draw.SimpleText('Заправка генератора кристаллами.', 'font_sans_3d2d_small', 0, 180, Color(255, 255, 255, alpha), TEXT_ALIGN_CENTER)
            draw.SimpleText('Нажмите [E] что бы заправить.', 'font_sans_3d2d_small', 0, 180 + 72, Color(255, 255, 255, alpha), TEXT_ALIGN_CENTER)
        cam.End3D2D()
    end
end