ContextMenu = ContextMenu or {}

Config = {
    Main = {
        {
            name = "Действия",
            imgur = "dwWkGGK",
            func = function() ContextMenu:Create(Config.DoStuff.Main) end,
            requirement = function() return true end,
        },
        {
            name = "Админ",
            imgur = "In0pyst",
            func = function() ContextMenu:Create(Config.AdminStuff) end,
            requirement = function() return LocalPlayer():IsAdmin() end,
        },
        {
            name = "Настройки",
            imgur = "WToD4Bg",
            func = function() ContextMenu:Create(Config.Settings) end,
            requirement = function() return true end,
        },
        {
            name = "Таланты",
            imgur = "vkZG4pZ",
            func = function() RunConsoleCommand('say', '/talents') end,
            requirement = function() return true end,
        },
        {
            name = "Настройки интерфейса",
            imgur = "WToD4Bg",
            func = function() NextRPSetOpenUI() end,
            requirement = function() return true end,
        },
        {
            name = "Стандартное меню",
            imgur = "wrCQ6fr", -- Можно заменить на более подходящую иконку
            func = function() 
                -- Закрываем текущее меню
                if ContextMenu.Radial then
                    ContextMenu.Radial:Close()
                end
                
                -- Отключаем наш хук, чтобы позволить стандартному контекстному меню работать
                hook.Remove('OnContextMenuOpen', 'CustomContextMenu')
                
                -- Добавляем временный хук, который будет восстанавливать наш кастомный хук
                hook.Add('OnContextMenuClose', 'RestoreCustomContextMenu', function()
                    hook.Remove('OnContextMenuClose', 'RestoreCustomContextMenu')
                    
                    timer.Simple(0.1, function()
                        -- Восстанавливаем наш кастомный хук
                        hook.Add('OnContextMenuOpen', 'CustomContextMenu', function()
                            ContextMenu:Create(Config.Main)
                            return true
                        end)
                    end)
                end)
                
                -- Активируем стандартное контекстное меню без закрытия
                RunConsoleCommand("+menu_context")
                
                -- НЕ добавляем закрытие меню
                -- Теперь оно будет оставаться открытым, пока пользователь сам не закроет его
            end,
            requirement = function() return LocalPlayer():IsAdmin() end,
        }
    },
    DoStuff = {
        Main = {
            {
                name = "Другое",
                imgur = "aSYv82C",
                func = function() ContextMenu:Create(Config.DoStuff.Second) end,
                requirement = function() return true end,
            },
            {
                name = "Тактические",
                imgur = "wXph4sB",
                func = function() ContextMenu:Create(Config.DoStuff.Tactic) end,
                requirement = function() return true end,
            }
        },
        Tactic = {
            {
                name = "Воинское приветствие",
                imgur = "Ie2K1PV",
                func = function() RunConsoleCommand('say', '/salute') end,
                requirement = function() return true end,
            },
            {
                name = 'Сигнал "Стоп"',
                imgur = "bra84f5",
                func = function() RunConsoleCommand('say', '/halt') end,
                requirement = function() return true end,
            },
            {
                name = 'Сигнал "Вперед"',
                imgur = "IIn2ocl",
                func = function() RunConsoleCommand('say', '/forward') end,
                requirement = function() return true end,
            },
            {
                name = 'Сигнал "Сгруппироваться"',
                imgur = "d8jCK2X",
                func = function() RunConsoleCommand('say', '/group') end,
                requirement = function() return true end,
            },
            {
                name = "Указать",
                imgur = "XXegDWX",
                func = function() RunConsoleCommand('say', '/point') end,
                requirement = function() return true end,
            },
            {
                name = "Поклониться",
                imgur = "j1mgdpx",
                func = function() RunConsoleCommand('say', '/bow') end,
                requirement = function() return true end,
            }
        },
        Second = {
            {
                name = "Поднять руки",
                imgur = "88ejtsz",
                func = function() RunConsoleCommand('anim', 'surrunder') end,
                requirement = function() return true end,
            },
            {
                name = "Руки перед собой",
                imgur = "f8SQCgE",
                func = function() RunConsoleCommand('anim', 'arms_infront') end,
                requirement = function() return true end,
            },
            {
                name = "Руки за спину",
                imgur = "NhksvQx",
                func = function() RunConsoleCommand('anim', 'arms_back') end,
                requirement = function() return true end,
            },
            {
                name = "Документы",
                imgur = "yyRFxss",
                func = function() RunConsoleCommand('say', '/docs') end,
                requirement = function() return true end,
            },
            {
                name = "Снять шлем",
                imgur = "HFZBwqE",
                func = function() RunConsoleCommand('say', '/helmet') end,
                requirement = function() return true end,
            }
        }
    },
    AdminStuff = {
        {
            name = "Управление персонажами",
            imgur = "4GKTbKq",
            func = function() NextRP.Ranks:OpenAdminUI() end,
            requirement = function() return true end,
        },
        {
            name = "GTS",
            imgur = "9EQhAke",
            func = function() RunConsoleCommand('say', '!gts') end,
            requirement = function() return true end,
        },
        {
            name = "NoClip",
            imgur = "vC7tHFk",
            func = function() RunConsoleCommand('ulx', 'noclip') end,
            requirement = function() return true end,
        },
        {
            name = "Menu",
            imgur = "7YDlgFl",
            func = function() RunConsoleCommand('say', '!menu') end,
            requirement = function() return true end,
        },
        {
            name = "Warns",
            imgur = "a1SyJ40",
            func = function() RunConsoleCommand('say', '!warn') end,
            requirement = function() return true end,
        },
        {
            name = "God",
            imgur = "omqRubY",
            func = function() RunConsoleCommand('say', '!god') end,
            requirement = function() return true end,
        },
        {
            name = "Spectate",
            imgur = "7mH7aJv",
            func = function() RunConsoleCommand('say', '!spectate') end,
            requirement = function() return true end,
        },
        {
            name = "Погода",
            imgur = "GhCxGAQ",
            func = function() RunConsoleCommand('stormfox2_controller') end,
            requirement = function() return true end,
        },
    },
    Settings = {
        {
            name = "Управление кодами",
            imgur = "9EQhAke",
            func = function() NextRP.Codes:OpenUI() end,
            requirement = function()
                local CONTROL
                local pPlayer = LocalPlayer()
                if isbool(pPlayer:getJobTable().control) then CONTROL = 'CONTROL_GAR' else CONTROL = pPlayer:getJobTable().control end
                if NextRP.Config.Codes.Permissions[CONTROL] then
                    local perms = NextRP.Config.Codes.Permissions[CONTROL][pPlayer:Team()]
                    if istable(perms) then
                        if perms[pPlayer:GetNWString('nrp_rankid')] then
                            return true
                        end
                        return false
                    end

                    if isbool(perms) and perms then
                        return true
                    end
                end

                return false
            end,
        },
        {
            name = "Точки интереса",
            imgur = "wrCQ6fr",
            func = function() NextRP.ControlPoints:OpenCPList() end,
            requirement = function() return true end,
        },
                {
            name = "LSCS",
            imgur = "WToD4Bg",
            func = function() RunConsoleCommand('lscs_openmenu') end,
            requirement = function() return true end,
        },
        {
            name = "LVS",
            imgur = "JJVGTh9",
            func = function() RunConsoleCommand('lvs_openmenu') end,
            requirement = function() return true end,
        },
        {
            name = 'Timer',
            imgur = "pYl614O",
            func = function()
                if UtimePanel and UtimePanel:IsSelected() then
                    UtimePanel:SetSelected(false)
                    UtimePanel:Remove()
                else
                    UtimePanel = TDLib('DPanel')
                        :Stick(TOP)
                        :ClearPaint()

                    UtimePanel:SetSize(1, 120)
                    UtimePanel:DockPadding(9, 80, 0, 0)

                    local UTimeInfo = TDLib('DPanel', UtimePanel)
                        :Stick(FILL)
                        :ClearPaint()
                        :DualText('Сессия: '..Utime.timeToStr(LocalPlayer():GetUTimeSessionTime()), 'font_sans_21', PawsUI.Theme.Gray or NextRP.Style.Theme.Accent, 'Всего: '..Utime.timeToStr(LocalPlayer():GetUTimeTotalTime()), 'font_sans_21', PawsUI.Theme.Gray, TEXT_ALIGN_LEFT)

                    UtimePanel:SetSelectable(true)
                    UtimePanel:SetSelected(true)
                    return UtimePanel
                end
            end,
            requirement = function() return true end,
        },
        {
            name = "ThirdPerson Settings",
            imgur = "Wlo9glA",
            func = function() RunConsoleCommand('simple_thirdperson_menu') end,
            requirement = function() return true end,
        },
        {
            name = "Ссылки",
            imgur = "VvVcWVT",
            func = function() chat.AddText(NextRP.Config.Link.VK..'\n'..NextRP.Config.Link.Discord..'\n'..NextRP.Config.Link.SteamCollection) end,
            requirement = function() return true end,
        }
    }
}


function ContextMenu:Create(sTable)
    self.Radial = vgui.Create("SummeFixed.Radial")
    self.Radial:SetSize(ScrW(), ScrH())
    self.Radial:Center()
    self.Radial:MakePopup()
    self.Radial:SetKeyboardInputEnabled(false)
    self.Radial:SetTitle("Меню")
    self.Radial:SetPrimaryColor(Color(40, 40, 40, 200))
    self.Radial:SetBackgroundColor(Color(40, 40, 40, 150)) -- ФОН
    --self.Radial:SetWorldClicker( true )
    --gui.EnableScreenClicker(true)

    for k, v in ipairs(sTable) do
        if not v.requirement() then continue end
        self.Radial:AddContent({
            display = {
                type = "imgur",
                text = v.name,
                imgur = v.imgur,
            },
            func = v.func,
        })
    end

    function ContextMenu.Radial:Think()
        local keyDown = input.IsKeyDown(KEY_C)
        if keyDown then return end
        --gui.EnableScreenClicker(false)
        --self:GetParent():SetWorldClicker(true)
        self:Close()
    end
end


hook.Add('OnContextMenuOpen', 'CustomContextMenu', function()
    ContextMenu:Create(Config.Main)
    return true
end)

hook.Add('OnContextMenuClose', 'CustomContextMenu', function()
end)