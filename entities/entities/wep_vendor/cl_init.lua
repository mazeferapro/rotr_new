include('shared.lua')

function ENT:Draw()
    self:DrawModel()
end

local cTable = {
    ['Гранаты'] = {
        ['arccw_k_nade_bacta'] = 800,
        ['arccw_k_nade_thermal'] = 900,
        ['arccw_k_nade_shock'] = 500,
        ['arccw_k_nade_impact'] = 1200,
    },
    ['Тяжелое вооружение'] = {
        ['arccw_k_launcher_smartlauncher'] = 50000,
        ['arccw_k_z6'] = 25000,
        ['arccw_sops_republic_z6chaingun'] = 26000,
        ['arccw_k_launcher_rps6'] = 40000,
        ['arccw_k_launcher_plx1'] = 42000,
    },
    ['Бластерные пистолеты'] = {
        ['arccw_k_dc17ext'] = 2500,
        ['arccw_k_dc17'] = 2000,
        ['arccw_k_dc17sa'] = 2700,
        ['arccw_sops_galactic_a180'] = 2500,
    },
    ['Двойное вооружение'] = {
        ['arccw_k_dc17_akimbo'] = 5008,
        ['arccw_k_dc17ext_akimbo'] = 5700,
        ['arccw_k_dc17sa_dual'] = 6000,
    },
    ['Бластерные винтовки'] = {
        ['arccw_k_dc15a'] = 10000,
        ['arccw_k_dc15s_grenadier'] = 11080,
        ['arccw_k_dc15le'] = 12000,
        ['arccw_k_republic_e9'] = 10000,
        ['arccw_k_dp24'] = 11000,
        ['arccw_sops_galactic_galaar15'] = 7000,
    },
    ['Снайперские винтовки'] = {
        ['arccw_k_dc15x'] = 15000,
        ['arccw_k_valken38'] = 19000,
        ['arccw_sops_galactic_mandorifle'] = 20000,
    },
    ['Дробовики'] = {
        ['arccw_k_sb2'] = 7000,
        ['arccw_k_dp23'] = 10000,
        ['arccw_sops_galactic_wookieslug'] = 5000,
    },
    ['Прочее'] = {
        ['realistic_hook'] = 5000,
        ['jet_mk5'] = 15000,
        ['weapon_bactainjector'] = 6000,
        ['arccw_sops_vibroknife'] = 9500,
        ['weapon_cuff_elastic'] = 3000,
        ['fort_datapad'] = 5500,
        ['arccw_eq_mortar'] = 150000
    }
}


local function generateWeapons(scrollPanel, tWeapons, sWeapons, cat)
    local DCategory = TDLib('DCollapsibleCategory', scrollPanel)
        :Stick(TOP, 2)
        :ClearPaint()
        :On('OnToggle', function(self)
            if self:GetExpanded() then
                self.Header:TDLib()
                    :ClearPaint()
                    :Background(NextRP.Style.Theme.Accent)
            else
                self.Header:TDLib()
                    :ClearPaint()
                    :Background(NextRP.Style.Theme.DarkBlue)
            end
        end)

    DCategory.Header:TDLib()
        :ClearPaint()
        :Text(cat or 'Error!', 'font_sans_21')

    if DCategory:GetExpanded() then
        DCategory.Header:TDLib():Background(NextRP.Style.Theme.Accent)
    else
        DCategory.Header:TDLib():Background(NextRP.Style.Theme.DarkBlue)
    end

    DCategory.Header:SetTall(25)

    local contents = vgui.Create('DPanelList', DCategory)
    contents:SetPadding(0)
    contents:SetSpacing(4)
    DCategory:SetContents(contents)

    for wep, price in pairs(sWeapons) do
        local tWep = weapons.Get(wep)
        if tWep == nil then continue end

        local pnl = vgui.Create('PawsUI.Panel')
            :Stick(TOP, 1)
            :Background(Color(53 + 15, 57 + 15, 68 + 15, 100))

        local wepMat = Material('entities/'..wep..'.png', 'smooth')

        local icon = vgui.Create('PawsUI.Panel', pnl)
            :Stick(LEFT, 2)

        PAW_MODULE('lib'):Download('nw/noicon.png', 'https://i.imgur.com/yaqb1ND.png', function(dPath)
            local mat = Material(dPath, 'smooth')
            if wepMat:IsError() then
                icon:Material(mat)
            else
                icon:Material(wepMat)
            end
        end)

        icon:SetWide(64)

        local title = vgui.Create('PawsUI.Panel', pnl)
            :Stick(TOP, 2)

        title:On('Paint', function(s, w, h)
            draw.DrawText(tWep.PrintName or wep, 'font_sans_21', 1, 5, NextRP.Style.Theme.Text, nil, TEXT_ALIGN_LEFT)
        end)

        local reciveButton = TDLib('DButton', pnl)
            :ClearPaint()
            :SetRemove(scrollPanel:GetParent())
            :Stick(FILL, 2)
            :Background(NextRP.Style.Theme.Background)
            :FadeHover(NextRP.Style.Theme.Accent)
            :LinedCorners()
            :On('Think', function(s)
                local hasValidAccess = false
                local timeText = ""
                
                if tWeapons[wep] and istable(tWeapons[wep]) and tWeapons[wep].expiry then
                    hasValidAccess = os.time() < tWeapons[wep].expiry
                    
                    if hasValidAccess then
                        local timeLeft = tWeapons[wep].expiry - os.time()
                        local hours = math.floor(timeLeft / 3600)
                        local minutes = math.floor((timeLeft % 3600) / 60)
                        local seconds = timeLeft % 60
                        timeText = string.format(" (%02d:%02d:%02d)", hours, minutes, seconds)
                    end
                end
                
                if LocalPlayer():HasWeapon(wep) and hasValidAccess then
                    s:Text('У вас уже есть это оружие', 'font_sans_21')
                    s:SetEnabled(false)
                elseif hasValidAccess then
                    s:Text('Получить' .. timeText, 'font_sans_21')
                    s:SetEnabled(true)
                else
                    s:Text('Купить за '..price..' CR (30 дней)', 'font_sans_21')
                    s:SetEnabled(true)
                end
            end)
            :On('DoClick', function()
                local hasValidAccess = false
                if tWeapons[wep] and istable(tWeapons[wep]) and tWeapons[wep].expiry then
                    hasValidAccess = os.time() < tWeapons[wep].expiry
                end
                
                if LocalPlayer():HasWeapon(wep) and hasValidAccess then
                    return -- Ничего не делаем, если оружие уже есть
                elseif hasValidAccess then
                    price = 'give'
                end
                
                netstream.Start('NextRP::BuyOrGiveWeapon', wep, price, nil)
            end)

        pnl:SetTall(64 + 2)
        contents:Add(pnl)
    end
end

local function VendorMenu(tWeapons)
    local frame = vgui.Create('PawsUI.Frame')
    frame:SetTitle('Галактический аукцион')
    frame:SetSize(700, 700)
    frame:MakePopup()
    frame:Center()
    frame:ShowSettingsButton(false)

    local info = vgui.Create('PawsUI.Panel', frame)
        :Stick(FILL)

    local scrollPanel = TDLib('DScrollPanel', frame)
        :Stick(FILL, 2)

    local reciveAllButton = TDLib('DButton', scrollPanel)
        :ClearPaint()
        :SetRemove(scrollPanel:GetParent())
        :Stick(TOP, 3)
        :Background(NextRP.Style.Theme.Background)
        :FadeHover(NextRP.Style.Theme.Accent)
        :Text('Взять все купленное вооружение', 'font_sans_21')
        :On('DoClick', function()
            PrintTable(tWeapons)
            netstream.Start('NextRP::BuyOrGiveWeapon', util.TableToJSON(tWeapons), 'giveall')
        end)

    reciveAllButton:SetTall(64 + 2)

    local scrollPanelBar = scrollPanel:GetVBar()
    scrollPanelBar:TDLib()
        :ClearPaint()
        :Background(NextRP.Style.Theme.DarkScroll)

    scrollPanelBar.btnUp:TDLib()
        :ClearPaint()
        :Background(NextRP.Style.Theme.DarkScroll)
        :CircleClick()

    scrollPanelBar.btnDown:TDLib()
        :ClearPaint()
        :Background(NextRP.Style.Theme.DarkScroll)
        :CircleClick()

    scrollPanelBar.btnGrip:TDLib()
        :ClearPaint()
        :Background(NextRP.Style.Theme.Scroll)
        :CircleClick()

    for k, v in pairs(cTable) do
        generateWeapons(scrollPanel, tWeapons, v, k)
    end
end

netstream.Hook('NextRP::WepVendorStart', function(pPlayer, tWeapons)
    if tWeapons == 'empty' then 
        tWeapons = {} 
    else 
        tWeapons = util.JSONToTable(tWeapons) 
    end
    VendorMenu(tWeapons)
end)
