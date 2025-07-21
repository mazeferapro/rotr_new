local ui = {}
ui.UI = ui.UI or nil

local LIB = PAW_MODULE('lib')

local defaultBtns = {
    ['Персонажи'] = {
        sortOrder = 1,
        active = true,
        click = function(pnl)
            ui:chars(pnl:GetParent(), nil)
            pnl:Remove()
        end
    },
    ['Устав'] = {
        sortOrder = 2,
        active = false,
        click = function(pnl)
            gui.OpenURL(l'WebSite')
        end
    },
    ['Discord'] = {
        sortOrder = 3,
        active = false,
        click = function(pnl)
            gui.OpenURL(l'Discord')
        end
    },
    ['Коллекция'] = {
        sortOrder = 5,
        active = false,
        click = function(pnl)
            gui.OpenURL(l'SteamCollection')
        end
    },
    ['Закрыть'] = {
        sortOrder = 99,
        active = false,
        click = function()
            ui.UI:Remove()
        end,
        align = RIGHT
    }
}
local chars = {
    {
        create = true
    }
}

local message = {
    col = Color(0, 255, 0),
    text = 'Персонажи успешно получены!'
}

local textWrap = NextRP.Utils.textWrap

function ui:Line(nHeight, tColor)
    local line = TDLib('DPanel')
        :Stick(TOP)
        :ClearPaint()
        :Background(tColor or NextRP.Style.Theme.Accent)

    line:SetHeight(nHeight)

    return line
end

function ui:open(btns)
    if IsValid(ui.UI) then ui.UI:Remove() end

    ui.UI = TDLib('DFrame')
        :ClearPaint()
        :On('Paint', function(s, w, h)
            surface.SetMaterial(NextRP.Style.Materials.CharacterSystemBackground)
            surface.SetDrawColor(150, 150, 150, 255)

            surface.DrawTexturedRect(0, 0, w, h)

            surface.SetDrawColor(NextRP.Style.Theme.Accent)
            surface.DrawRect(0, 0, w, 5)
            surface.DrawRect(0, h - 5, w, 5)
        end)
    ui.UI:SetSize(ScrW(), ScrH())
    ui.UI:Center()
    ui.UI:MakePopup()
    ui.UI:SetTitle('')
    ui.UI:ShowCloseButton(false)
    ui.UI:SetDraggable(false)

    local pn = ui:chars(ui.UI)
end

function ui:header(pnl, buttons)
    local header = TDLib('DPanel', pnl)
        :ClearPaint()
        :Stick(TOP)
        :On('Paint', function(s, w, h)
            surface.SetDrawColor(NextRP.Style.Theme.Accent)
            surface.DrawRect(0, 66, w, 2)
            surface.DrawRect(0, 66 + 24, w, 2)
            draw.SimpleText(message.text, 'font_sans_16', w * .5, 66 + 12, message.col, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end)

    header:SetTall(92)

    local buttonsBase = TDLib('DPanel', header)
        :ClearPaint()
        :Stick(TOP)


    buttonsBase:SetTall(68)

    local logo = TDLib('DPanel', buttonsBase)
        :ClearPaint()
        :On('Paint', function(s, w, h)
            surface.SetMaterial(NextRP.Style.Materials.LogoWatermark)
            surface.SetDrawColor(255, 255, 255, 255)

            surface.DrawTexturedRect(0, h*.5 - 32 + 2, 64, 64)
        end)

    logo:Dock(LEFT)
    logo:DockMargin(0, 1, 0, 1)
    logo:SetWide(64)

    for k, v in SortedPairsByMemberValue(buttons, 'sortOrder', false) do
        local genButton = TDLib('DButton', buttonsBase)
            :Stick(v.align or LEFT, 4)
            :ClearPaint()

        if v.active then
            genButton:TDLib()
                :Text(k, 'font_sans_21', color_white)
                --:SideBlock(color_white, 4, BOTTOM)
                :On('DoClick', function()
                    if v.click then v.click(pnl) end
                end)
                :On('Paint', function(s, w, h)
                    surface.SetDrawColor(255, 255, 255, 255)
                    surface.DrawRect(0, h-15, w, 4)
                end)
        else
            genButton.color = Color(181, 181, 181)
            genButton:TDLib()
                :Text('')
                :BarHover(Color(181, 181, 181), 4, nil, 15)
                :On('DoClick', function()
                    if v.click then v.click(pnl) end
                end)
                :On('Think', function(s)
                    s.color = TDLibUtil.LerpColor(FrameTime() * 12, s.color, s:IsHovered() and color_white or Color(181, 181, 181))
                end)
                :On('Paint', function(s)
                    draw.SimpleText(k, 'font_sans_21', s:GetWide() * 0.5, s:GetTall() * 0.5, s.color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                end)
        end

        surface.SetFont('font_sans_21')
        local w = surface.GetTextSize(k)

        genButton:SetWide(w + 14)
    end
end

function ui:chars(pnl, buttons)
    local content = TDLib('DPanel', pnl)
        :ClearPaint()

    content:SetPos(0, 0)
    content:SetSize(pnl:GetWide(), pnl:GetTall())

    ui:header(content, buttons or defaultBtns)

    local charBase = TDLib('DHorizontalScroller', content)
        :Stick(FILL, 7)
        :ClearPaint()

    charBase:SetOverlap(-13)

    -- Стрелочки, влево и вправо. Ну ты понял.
    local LEFTSwitch = charBase.btnLeft:TDLib()
        :Stick(LEFT, 5)
        :ClearPaint()
    LIB:Download('thr/left.png', 'https://i.imgur.com/4BvAFTn.png', function(dPath)
        local mat = Material(dPath, 'smooth')
        LEFTSwitch.s = 32
        LEFTSwitch.col = Color(181, 181, 181)
        LEFTSwitch
            :On('Paint', function(s)
                surface.SetMaterial(mat)
                surface.SetDrawColor(s.col)
                surface.DrawTexturedRect(s:GetWide() * 0.5 - s.s * 0.5, s:GetTall() * 0.5 - s.s * 0.5, s.s, s.s)
            end)
            :On('Think', function(s)
                s.col = TDLibUtil.LerpColor(FrameTime() * 12, s.col, s:IsHovered() and color_white or Color(181, 181, 181))
                s.s = Lerp(FrameTime() * 12, s.s, s:IsHovered() and 48 or 32)

                s:SetWide(40) -- это ебаный костыль, но мне похуй
                s:AlignLeft( 0 )
            end)
    end)
    local RIGHTSwitch = charBase.btnRight:TDLib()
        :Stick(RIGHT)
        :ClearPaint()

    LIB:Download('thr/right.png', 'https://i.imgur.com/FHqpFEU.png', function(dPath)
        local mat = Material(dPath, 'smooth')
        RIGHTSwitch.s = 32
        RIGHTSwitch.col = Color(181, 181, 181)
        RIGHTSwitch
            :On('Paint', function(s)
                surface.SetMaterial(mat)
                surface.SetDrawColor(s.col)
                surface.DrawTexturedRect(s:GetWide() * 0.5 - s.s * 0.5, s:GetTall() * 0.5 - s.s * 0.5, s.s, s.s)
            end)
            :On('Think', function(s)
                s.col = TDLibUtil.LerpColor(FrameTime() * 12, s.col, s:IsHovered() and color_white or Color(181, 181, 181))
                s.s = Lerp(FrameTime() * 12, s.s, s:IsHovered() and 48 or 32)

                s:SetWide(40) -- это ебаный костыль, но мне похуй
                s:AlignRight( 0 )
            end)
    end)

    -- Добавляем панели с персонажами
    -- TODO: Сделать код не таким говном
    for k, v in ipairs(chars) do
        local char = TDLib('DPanel')
            :ClearPaint()
            :Background(Color(47, 54, 64, 25))

        char:SetWide((charBase:GetWide() - 40) / 4)

        charBase:AddPanel(char) -- Добавить в скроллер

        if v.create then
            local icon = TDLib('DPanel', char)
                :ClearPaint()

            -- инфа для анимаций
            icon.s = 64
            icon.col = color_white

            -- позиционирование
            icon:SetSize(char:GetWide(), 240)
            icon:SetPos(char:GetWide() * 0.5 - icon:GetWide() * 0.5, char:GetTall() * 0.5 - 180 * 0.5)

            LIB:Download('nw/add_v2.png', 'https://i.imgur.com/q8OyHg8.png', function(dPath)
                local mat = Material(dPath, 'smooth noclamp')

                icon
                    :On('Paint', function(s)
                        surface.SetMaterial(mat)
                        surface.SetDrawColor(icon.col)
                        surface.DrawTexturedRect(icon:GetWide() * 0.5 - icon.s * 0.5, 180 * 0.5 - icon.s * 0.5, icon.s, icon.s)

                        draw.DrawText(textWrap('Нажмите сюда, что-бы создать нового персонажа.', 'font_sans_21', icon:GetWide() - 20), 'font_sans_21', s:GetWide() * 0.5, icon.s * 0.5 + 100, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    end)
            end)

            local chooseButton = TDLib('DButton', char)
                :ClearPaint()
                :Text('')
                :LinedCorners(Color(181, 181, 181), 50)
                :On('Think', function(s)
                    icon.col = TDLibUtil.LerpColor(FrameTime() * 12, icon.col, s:IsHovered() and NextRP.Style.Theme.Accent or color_white)
                    icon.s = Lerp(FrameTime() * 12, icon.s, s:IsHovered() and 128 or 64)
                end)
                :On('DoClick', function(s)
                    content:Remove()
                    ui:new(pnl)
                end)

            chooseButton:SetSize(char:GetSize())

        elseif v.locked then
            local icon = TDLib('DPanel', char)
                :ClearPaint()
            -- инфа для анимаций
            icon.s = 64
            icon.col = color_white

            -- позиционирование
            icon:SetSize(char:GetWide(), 250)
            icon:SetPos(char:GetWide() * 0.5 - icon:GetWide() * 0.5, char:GetTall() * 0.5 - 180 * 0.5)

            LIB:Download('nw/locked.png', 'https://i.imgur.com/IBCN0UC.png', function(dPath)
                icon.mat = Material(dPath, 'smooth noclamp')
                icon.text = 'Недоступный слот.\nПриобрести дополнительный слот вы можете обратившись в дискорде к донат менеджеру.'
                icon.cantafford = false

                icon
                    :On('Paint', function(s)
                        surface.SetMaterial(icon.mat)
                        surface.SetDrawColor(icon.col)
                        surface.DrawTexturedRect(icon:GetWide() * 0.5 - icon.s * 0.5, 180 * 0.5 - icon.s * 0.5, icon.s, icon.s)

                        draw.DrawText(textWrap(icon.text, 'font_sans_21', icon:GetWide() - 20), 'font_sans_21', s:GetWide() * 0.5, icon.s * 0.5 + 100, icon.cantafford and icon.col or color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    end)
            end)

            local chooseButton = TDLib('DButton', char)
                :ClearPaint()
                :Text('')
                :LinedCorners(Color(181, 181, 181), 50)
                :On('Think', function(s)
                    icon.col = TDLibUtil.LerpColor(FrameTime() * 12, icon.col, s:IsHovered() and (icon.cantafford and Color(255, 69, 69) or Color(194, 54, 22)) or color_white)
                    icon.s = Lerp(FrameTime() * 12, icon.s, s:IsHovered() and 128 or 64)
                end)
                :On('DoClick', function(s)
                    local ITEM = IGS.GetItemByUID('charslot')
                    local curr_price = ITEM:PriceInCurrency()


                    if IGS.CanAfford(LocalPlayer(), curr_price) then
                        NextRP:QuerryDonate('Дополнительный слот', curr_price, function()
                            netstream.Start('NextRP::BuyNewSlot')
                        end)
                    else
                        LIB:Download('nw/nomoney.png', 'https://i.imgur.com/d9kzsoO.png', function(dPath)
                            icon.mat = Material(dPath, 'smooth noclamp')
                            icon.text = 'У вас недостаточно средств для покупки дополнительного слота! Пополнить свой счёт вы можете повторно нажав на эту кнопку.'
                            icon.cantafford = true

                            s
                                :On('DoClick', function(s)
                                    gui.OpenURL('https://discord.com/invite/dPpvB9sxqf'..LocalPlayer():SteamID64())

                                    content:Remove() -- костыль что-бы вернуться в изначальное положение, похуй
                                    ui:chars(pnl)
                                end)
                        end)
                    end
                end)

            chooseButton:SetSize(char:GetSize())
        else
            local job = NextRP.GetJob(v.team_index)
            local formatedName = {}
            formatedName[#formatedName + 1] = v.rankid
            if (job.type != TYPE_JEDI) and (job.type != TYPE_ADMIN) then
                formatedName[#formatedName + 1] = v.rpid
            end
            formatedName[#formatedName + 1] = v.character_nickname

            formatedName = table.concat(formatedName, ' ')

            local name = TDLib('DPanel', char)
                :Stick(TOP)
                :ClearPaint()
                :On('Paint', function(s)
                    draw.DrawText(formatedName, 'font_sans_24', s:GetWide()/2, 5, nil, TEXT_ALIGN_CENTER)
                end)
            name:SetTall(30)
            name:DockMargin(0, 15, 0, 0)
            local money = TDLib('DPanel', char)
                :Stick(TOP)
                :ClearPaint()
                :On('Paint', function(s)
                    draw.DrawText(job.category, 'font_sans_21', s:GetWide()/2, 20, nil, TEXT_ALIGN_CENTER)
                end)
            money:SetTall(100)

            local model
            if not job.ranks[v.rankid] then
                model = 'models/gman_high.mdl'
            else
                model = istable(job.ranks[v.rankid].model) and table.Random(job.ranks[v.rankid].model) or job.ranks[v.rankid].model
            end
            local icon = TDLib( 'DModelPanel', char )
                :Stick(FILL)

            icon:SetModel( model or 'models/gman_high.mdl' )
            icon:SetFOV(25)

            local headpos = ((icon.Entity:GetBonePosition(icon.Entity:LookupBone('ValveBiped.Bip01_Head1') or 0)) - Vector(0,0,5)) or Vector(0, 0, 0)

            icon:SetLookAt(headpos)
            icon:SetCamPos(headpos - Vector(-45, 0, 0))

            if v.model then
                if v.model.model then
                    icon:SetModel(v.model.model)
                end

                if v.model.skin then
                    icon.Entity:SetSkin(tonumber(v.model.skin))
                end

                if v.model.bodygroups then
                    for k, v in pairs(v.model.bodygroups) do
                        icon.Entity:SetBodygroup(tonumber(k), tonumber(v))
                    end
                end
            end

            function icon:LayoutEntity( Entity )
                return
            end

            local chooseButton = TDLib('DButton', char)
                :ClearPaint()
                :Text('')
                :LinedCorners(Color(181, 181, 181), 50)
                :On('Think', function(s)
                    s.L = LerpVector(FrameTime() * 6, s.L, headpos - Vector(s:IsHovered() and -40 or -45, 0, 0))
                    icon:SetCamPos(s.L)
                end)
                :On('DoClick', function()
                    content:Clear()

                    ui:header(content, defaultBtns)

                    local confirm = TDLib('DButton', content)
                        :ClearPaint()
                        :Stick(TOP, 5)
                        :Background(Color(53 - 15, 57 - 15, 68 - 15, 100))
                        :FadeHover(Color(255, 255, 255, 50))
                        :LinedCorners()
                        :Text('Выбрать ' .. formatedName, 'font_sans_21')
                        :FadeIn(.2)
                        :On('DoClick', function()
                            -- NextRP::ChooseChar
                            netstream.Start('NextRP::ChooseChar', v)
                            ui.UI:Remove()
                            -- ui:open()
                        end)

                    confirm:SetTall(75)

                    local changeName = TDLib('DButton', content)
                        :ClearPaint()
                        :Stick(TOP, 5)
                        :Background(Color(53 - 15, 57 - 15, 68 - 15, 100))
                        :FadeHover(Color(255, 255, 255, 50))
                        :LinedCorners()
                        :Text('Изменить имя ' .. formatedName, 'font_sans_21')
                        :FadeIn(.2)
                        :On('DoClick', function()
                            -- NextRP::ChooseChar

                            PAW_MODULE('lib'):DoStringRequest('Изменение имени', 'Введите имя, которое вы хотите установить.\nВНИМАНИЕ! Это поле НЕ меняет номер и звание.\nНарушение форматирования имени может привести к наказанию!', v.character_nickname, function(sValue)
                                netstream.Start('NextRP::RenameChar', sValue, v)
                                print(1)
                                ui.UI:Remove()
                            end)
                            -- ui:open()
                        end)


                    changeName:SetTall(75)

                    if v.character_id ~= -1 then
                        local delete = TDLib('DButton', content)
                        :ClearPaint()
                        :Stick(TOP, 5)
                        :Background(Color(53 - 15, 57 - 15, 68 - 15, 100))
                        :FadeHover(Color(255, 255, 255, 50))
                        :LinedCorners(Color(255, 0, 0))
                        :Text('Удалить ' .. formatedName, 'font_sans_21')
                        :On('DoClick', function()
                            NextRP:QuerryWarning('Вы собираетесь удалить персонажа '..formatedName,
                            function()
                                netstream.Start('NextRP::DeleteChar', v)
                            end,
                            function()
                                ui:open()
                            end)
                        end)
                        :FadeIn(.3)

                        delete:SetTall(75)
                    end

                    local back = TDLib('DButton', content)
                        :ClearPaint()
                        :Stick(TOP, 5)
                        :Background(Color(53 - 15, 57 - 15, 68 - 15, 100))
                        :FadeHover(Color(255, 255, 255, 50))
                        :LinedCorners()
                        :Text('Назад к выбору', 'font_sans_21')
                        :FadeIn(.4)
                        :On('DoClick', function()
                            ui:open()
                        end)

                    back:SetTall(75)
                end)

            chooseButton.L = Vector(headpos-Vector(-45, 0, 0))
            chooseButton:SetSize(char:GetSize())
        end
    end



    return content
end

function ui:new(pnl, buttons)
    local details = {}

    local content = TDLib('DPanel', pnl)
        :ClearPaint()

    content:SetPos(0, 0)
    content:SetSize(pnl:GetWide(), pnl:GetTall())

    ui:header(content, buttons or defaultBtns)

    local title = TDLib('DPanel', content)
        :Stick(TOP)
        :ClearPaint()
        :Background(Color(53 - 15, 57 - 15, 68 - 15, 100))
        :LinedCorners(Color(181, 181, 181), 35)

        :Text(' Создание персонажа', 'font_sans_26', nil, TEXT_ALIGN_LEFT) // тут ебаный костыль с пробелом, нада офсетнуть по иксу, как-то похуй, потом сделаю

    title:DockMargin(5,5,5,0)
    title:SetTall(45)

    local nameBase = TDLib('DPanel', content)
        :Stick(TOP, 5)
        :ClearPaint()
        :Background(Color(53 - 15, 57 - 15, 68 - 15, 150))
        :LinedCorners(Color(181, 181, 181), 35)
    nameBase:SetTall(75)

    local namePH = TDLib('DLabel', nameBase)
        :ClearPaint()
        :Stick(TOP)
        :Text('Имя персонажа', 'font_sans_21')

    namePH:DockMargin(5, 5, 0, 0)

    namePH:SizeToContents()

    local surname = TDLib('DTextEntry', nameBase)
        :ReadyTextbox()
        :BarHover()
        :Background(Color(53 - 15, 57 - 15, 68 - 15, 150))
        :Stick(LEFT, 5)

    surname:SetTextColor(color_white)
    surname:SetCursorColor( Color(181, 181, 181) )
    surname:SetFont('font_sans_21')
    surname:SetUpdateOnType(true)
    surname:SetPlaceholderText('Имя персонажа')

    function surname:OnValueChange(value)
        details['surname'] = value
    end

    surname:SetWide(175)

    local name = TDLib('DTextEntry', nameBase)
        :ReadyTextbox()
        :BarHover()
        :Background(Color(53 - 15, 57 - 15, 68 - 15, 150))
        :Stick(LEFT, 5)

    name:SetTextColor(color_white)
    name:SetCursorColor( Color(181, 181, 181) )
    name:SetFont('font_sans_21')
    name:SetUpdateOnType(true)
    name:SetPlaceholderText('Номер персонажа')

    function name:OnValueChange(value)
        details['name'] = value
    end

    name:SetWide(175)

    local pre = TDLib('DTextEntry', nameBase)
        :ReadyTextbox()
        :BarHover()
        :Background(Color(53 - 15, 57 - 15, 68 - 15, 100))
        :Stick(LEFT, 5)
        :On('Think', function(s)
            s:SetValue(string.Trim(name:GetValue()) .. ' ' .. string.Trim(surname:GetValue()))
        end)


    pre:SetTextColor(color_white)
    pre:SetCursorColor( Color(181, 181, 181) )
    pre:SetFont('font_sans_21')
    pre:SetEditable(false)
    pre:SetPlaceholderText('Предпросмотр')

    pre:SetWide(175 * 3)

    local factionInfoBase = TDLib('DPanel', content)
        :Stick(TOP, 5)
        :ClearPaint()
        :Background(Color(53 - 15, 57 - 15, 68 - 15, 100))
        :LinedCorners(Color(181, 181, 181), 35)


    local factionInfoPH = TDLib('DLabel', factionInfoBase)
        :ClearPaint()
        :Stick(TOP)
        :Text('Информация о фракциях', 'font_sans_21')

    factionInfoPH:DockMargin(5, 5, 0, 0)

    factionInfoPH:SizeToContents()

    local total = 27

    for k, v in pairs({
        [1] = {
            title = 'ВАР',
            text = 'ВАР - Великая Армия Республики.'
        }
    }) do
        local bFactionInfoBase = TDLib('DPanel', factionInfoBase)
            :ClearPaint()
            :Stick(TOP, 5)
            :Background(Color(53 - 15, 57 - 15, 68 - 15, 100))

        bFactionInfoBase:SetTall(62)

        total = total + 62

        local bFactionInfoHeader = TDLib('DLabel', bFactionInfoBase)
            :Stick(TOP)
            :Text(v.title, 'font_sans_18')

        bFactionInfoHeader:DockMargin(3, 0, 0, 0)

        local bFactionInfoDesc = TDLib('DPanel', bFactionInfoBase)
            :ClearPaint()
            :Stick(TOP)
            :On('Paint', function(s)
                //draw.SimpleText('Похуй\n+\nпохуй', 'font_sans_16', 5, 0)

                draw.DrawText(textWrap(v.text, 'font_sans_16', s:GetWide() - 10 ), 'font_sans_16', 5, 0)
            end)
        bFactionInfoDesc:SetTall(80 - 14)
    end

    factionInfoBase:SetTall(total)

    local confirm = TDLib('DButton', content)
        :Stick(TOP, 5)
        :ClearPaint()
        :Text('Заполните форму создания персонажа!', 'font_sans_24')
        :On('DoClick', function()
            netstream.Start('NextRP::CreateNewChar', {
                faction = FACTION_GAR or 1,
                number = string.Trim(details['name']),
                nickname = string.Trim(details['surname'])
            })
        end)
        :On('Think', function(s)
            if s:IsEnabled() then
                if details['name'] == nil or
                details['name'] == '' or
                details['surname'] == nil or
                details['surname'] == '' then
                    s:SetEnabled(false)
                end
            else
                if details['name'] ~= nil and
                details['name'] ~= '' and
                details['surname'] ~= nil and
                details['surname'] ~= '' then
                    s:SetEnabled(true)
                end
            end
        end)

    confirm:SetTall(35)

    local oldSetEnabled = confirm.SetEnabled
    local oldBarHover = confirm.BarHover
    function confirm:SetEnabled(b)
        if confirm:IsEnabled() == b then return end

        oldSetEnabled(self, b)
        print(b)

        confirm
            :ClearPaint()
            :Text(b and 'Создать!' or 'Заполните форму создания персонажа!', 'font_sans_24')
            :Background(b and Color(53 - 15, 57 - 15, 68 - 15, 100) or Color(84, 32, 32, 100))

        oldBarHover(self)

        confirm:SetCursor(b and 'hand' or 'no')
    end

    confirm:SetEnabled(false)
end

function ui:rules(pnl, buttons)
    buttons = table.Copy(defaultBtns)
    buttons['Персонажи'].active = false
    buttons['Правила'].active = true

    local content = TDLib('DPanel', pnl)
        :ClearPaint()
        :Text('Загружаем правила...', 'font_sans_35')

    content:SetPos(0, 0)
    content:SetSize(pnl:GetWide(), pnl:GetTall())

    ui:header(content, buttons or defaultBtns)

    local rl = TDLib('HTML', content)
        :Stick(FILL)

    rl:OpenURL( 'http://wiki.thr.gmod-mvp.ru/ru/правила-сервера' )


    return content
end

local oldbtns = defaultBtns

netstream.Hook('NextRP::OpenCharsMenu', function(tChars, tMessages)
    tChars = tChars or {}

    local slots = LocalPlayer():GetNVar('nrp_slots') or 1
    if #tChars < (LocalPlayer():IsAdmin() and (slots + 1) or slots) then tChars[#tChars + 1] = { create = true } end
    if #tChars >= (LocalPlayer():IsAdmin() and (slots + 1) or slots) then tChars[#tChars + 1] = { locked = true } end

    chars = tChars
    defaultBtns = oldbtns
    if tMessages then message = tMessages end
    ui:open()
end)

netstream.Hook('NextRP::OpenInitCharsMenu', function(tChars, tMessages)
    tChars = tChars or {}

    local slots = LocalPlayer():GetNVar('nrp_slots') or 1
    if #tChars < (LocalPlayer():IsAdmin() and (slots + 1) or slots) then tChars[#tChars + 1] = { create = true } end
    if #tChars >= (LocalPlayer():IsAdmin() and (slots + 1) or slots) then tChars[#tChars + 1] = { locked = true } end

    chars = tChars
    defaultBtns = {
        ['Персонажи'] = {
            sortOrder = 1,
            active = true,
            click = function(pnl)
                ui:chars(pnl:GetParent(), nil)
                pnl:Remove()
            end
        },
        ['Правила'] = {
            sortOrder = 2,
            active = false,
            click = function(pnl)
                ui:rules(pnl:GetParent(), nil)
                pnl:Remove()
            end
        },
        ['Discord'] = {
            sortOrder = 3,
            active = false,
            click = function(pnl)
                gui.OpenURL('https://discord.gg/ypcneuwY4Q')
            end
        },
        ['VK'] = {
            sortOrder = 4,
            active = false,
            click = function(pnl)
                gui.OpenURL('https://vk.com/nwrpgmod')
            end
        },
        ['Отключиться'] = {
            sortOrder = 99,
            active = false,
            click = function(pnl)
                RunConsoleCommand('disconnect')
            end,
            align = RIGHT
        },
    }
    if tMessages then message = tMessages end
    ui:open()
end)