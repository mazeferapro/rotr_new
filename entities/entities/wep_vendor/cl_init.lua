include('shared.lua')

function ENT:Draw()
    self:DrawModel()
end

local cTable = {
    ['Гранаты'] = {
        ['arccw_k_nade_bacta'] = 50,
        ['arccw_k_nade_thermal'] = 25,
        ['arccw_k_nade_shock'] = 30,
        ['arccw_k_nade_impact'] = 20,
    },
    ['Тяжелое вооружение'] = {
        ['arccw_k_launcher_smartlauncher'] = 1300,
        ['arccw_k_z6'] = 1450,
        ['arccw_sops_republic_z6chaingun'] = 1700,
        ['arccw_k_launcher_rps6'] = 1200,
        ['arccw_k_launcher_plx1'] = 1900,
    },
    ['Бластерные пистолеты'] = {
        ['arccw_k_dc17ext'] = 150,
        ['arccw_k_dc17'] = 100,
        ['arccw_k_dc17sa'] = 170,
        ['arccw_sops_galactic_a180'] = 95,
    },
    ['Двойное вооружение'] = {
        ['arccw_k_dc17_akimbo'] = 258,
        ['arccw_k_dc17ext_akimbo'] = 270,
        ['arccw_k_dc17sa_dual'] = 300,
    },
    ['Бластерные винтовки'] = {
        ['arccw_k_dc15a'] = 400,
        ['arccw_k_dc15s_grenadier'] = 480,
        ['arccw_k_dc15le'] = 500,
        ['arccw_k_republic_e9'] = 500,
        ['arccw_k_dp24'] = 560,
        ['arccw_sops_galactic_galaar15'] = 550,
    },
    ['Снайперские винтовки'] = {
        ['arccw_k_dc15x'] = 3000,
        ['arccw_k_valken38'] = 1500,
        ['arccw_sops_galactic_mandorifle'] = 5500,
    },
    ['Дробовики'] = {
        ['arccw_k_sb2'] = 700,
        ['arccw_k_dp23'] = 1000,
        ['arccw_sops_galactic_wookieslug'] = 1400,
    },
    ['Прочее'] = {
        ['realistic_hook'] = 500,
        ['jet_mk5'] = 1500,
        ['weapon_bactainjector'] = 600,
        ['arccw_sops_vibroknife'] = 950,
        ['weapon_cuff_elastic'] = 300,
        ['fort_datapad'] = 550,
        ['arccw_eq_mortar'] = 950
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
        local sell = false
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
                if LocalPlayer():HasWeapon(wep) and tWeapons[wep] then
                    s:Text('Продать за '..(price/2)..' CR', 'font_sans_21')
                    sell = true
                else
                    s:Text(tWeapons[wep] and 'Получить' or 'Купить за '..price..' CR', 'font_sans_21')
                end
            end)
            :On('DoClick', function()
                if tWeapons[wep] and !sell then price = 'give' end
                netstream.Start('NextRP::BuyOrGiveWeapon', wep, price, sell or nil)
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
    if tWeapons == 'empty' then tWeapons = {} else tWeapons = util.JSONToTable(tWeapons) end
    VendorMenu(tWeapons)
end)