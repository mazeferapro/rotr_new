local chars = NextRP.Chars or {}

function chars:NewChar(pPlayer, tData)
    local number = tData['number'] or '####'
    local nickname = tData['nickname'] or 'Unset'

    local start_team = tData.startteam or START_TEAMS[tData['faction']] or 1001
    local start_team_id = (NextRP.Jobs[start_team] or {id = 'none'}).id
    local start_rank = tData.startrank or (NextRP.Jobs[start_team] or {default_rank = 'none'}).default_rank
    local rpid = number -- chars:GenerateID(tData['faction'])

    local flags = tData.startflags or {}

    local steamid = pPlayer:SteamID() -- не используеться
    local playerid = pPlayer:GetNVar('nrp_id')

    local curChars = pPlayer.Characters or {}

    if start_team == 1001 then
        netstream.Start(pPlayer, 'NextRP::OpenCharsMenu', curChars, {col = Color(224, 164, 43), text = 'Эта фракция не настроена, обратитесь к тех. администратору!'})
        return
    end

    local maxChars = pPlayer:GetNVar('nrp_slots') or 1

    if pPlayer:IsAdmin() then
        maxChars = maxChars + 1
    end

    if #curChars >= maxChars then return end

    MySQLite.query(string.format('SELECT * FROM `nextrp_characters` WHERE rpid = %s', 
        MySQLite.SQLStr(rpid)
    ), function(result)
        if istable(result) and rpid ~= '####' then
            netstream.Start(pPlayer, 'NextRP::OpenCharsMenu', curChars, {col = Color(194, 54, 22), text = 'Персонаж с номером '.. tostring(number) ..' уже существует, выберите другой номер!'})
            return
        else
            MySQLite.query(string.format('INSERT INTO `nextrp_characters`(player_id, rpid, rankid, flag, character_nickname, team_id, model, money, level, exp, inventory) VALUES(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);',
                playerid,
                MySQLite.SQLStr(rpid),
                MySQLite.SQLStr(start_rank),
                MySQLite.SQLStr(util.TableToJSON(flags)),
                MySQLite.SQLStr(nickname),
                MySQLite.SQLStr(start_team_id),
                MySQLite.SQLStr(util.TableToJSON({})),
                NextRP.Config.StartMoney or 500,
                1,
                0,
                MySQLite.SQLStr(util.TableToJSON({}))
            ), function(e, char_id)
                local newChar = {
                    player_id = playerid,
                    character_id = char_id,
                    rpid = rpid,
                    rankid = start_rank,
                    team_id = start_team_id,
                    character_nickname = nickname,
                    model = {},
                    level = 1,
                    exp = 0,
                    money = NextRP.Config.StartMoney or 500,
                    flag = {},
                    inventory = {}
                }

                curChars[#curChars + 1] = newChar
                chars.Cache[char_id] = newChar

                -- TODO: Отправить на клиент новый список персонажей
                pPlayer:RequestCharacters(function(characters)
                    pPlayer.Characters = characters or {}
                    netstream.Start(pPlayer, 'NextRP::OpenCharsMenu', characters, {col = Color(0, 255, 0), text = 'Персонаж создан!'})
                end)

                hook.Run('NextRP::CharacterCreated', pPlayer, character_id)
            end,
            function(e) print(e) end)
        end
    end)
end

netstream.Hook('NextRP::CreateNewChar', function(pPlayer, tData)   
    if not IsValid(pPlayer) then print(1) return end
    if not istable(tData) then print(2) return end

    chars:NewChar(pPlayer, tData)
end)

function chars:DeleteChar(pPlayer, tData)
    local can_remove = true
    local charid = tData.character_id
    local char = pPlayer:CharacterByID(charid)

    if pPlayer:GetNVar('nrp_charid') == charid then
        pPlayer:RequestCharacters(function(characters)
            pPlayer.Characters = characters
            netstream.Start(pPlayer, 'NextRP::OpenCharsMenu', characters, {text = 'Вы не можете удалить персонажа, играя за него!', col = Color(255, 0, 0)})
        end)
        return
    end

    -- for k, char in pairs(pPlayer.Characters) do
    --     if char.c_id ~= charid then continue end
    --     if NextRP:getTeamByID(char.c_id).start ~= true then
    --         -- TODO: Отправить ошибку на клитентский интерфейс
    --         -- 'Вы не можете удалить персонажа с стартовой профессией.'

    --         break 
    --     else
    --         can_remove = true
    --         break
    --     end
    -- end

    if can_remove == true then
        chars.Cache[charid] = nil
        MySQLite.query(string.format('DELETE FROM `nextrp_characters` WHERE character_id = %s;', charid), function()
            pPlayer:RequestCharacters(function(characters)
                pPlayer.Characters = characters
                netstream.Start(pPlayer, 'NextRP::OpenInitCharsMenu', characters)
                hook.Run('NextRP::CharacterDeleted', pPlayer, charid)

                local shouldRemove = true
                
                for k, v in pairs(pPlayer.Characters) do
                    if char.team_id == v.team_id then 
                        shouldRemove = false
                        break
                    end
                end

                if shouldRemove then
                    local job = NextRP.GetJob(char.team_index)
                    if job.type == TYPE_JEDI then
                        -- Discord:JobRank(pPlayer:SteamID64(), 'job:jedi', 'job:noadd')
                    else
                        -- Discord:JobRank(pPlayer:SteamID64(), 'job:'..char.team_id, 'job:noadd')
                    end
                end
            end)
        end)

        -- hook.Run('wOS.ALCS.PlayerDeleteData', pPlayer, tonumber(charid))
    end
end

netstream.Hook('NextRP::DeleteChar', function(pPlayer, tData)
    if not IsValid(pPlayer) then return end
    if not istable(tData) then return end

    chars:DeleteChar(pPlayer, tData)
end)

function chars:ChooseChar(pPlayer, tData)
    if pPlayer:IsHandcuffed() then
        netstream.Start(pPlayer, 'NextRP::OpenCharsMenu', pPlayer.Characters, {text = 'Вы не можете сменить персонажа пока находитесь в наручниках!', col = Color(255, 0, 0)})
        return 
    end
    if not pPlayer:Alive() then
        netstream.Start(pPlayer, 'NextRP::OpenCharsMenu', pPlayer.Characters, {text = 'Вы не можете сменить персонажа пока вы мертвы!', col = Color(255, 0, 0)})
        return 
    end

    local old_character_id = pPlayer:GetNVar('nrp_charid')
    local character_id = tData.character_id

    if not character_id then return end
    if not pPlayer:CharacterByID(character_id) then return end

    if character_id == -1 and not pPlayer:IsAdmin() then
        pPlayer:RequestCharacters(function(characters)
            pPlayer.Characters = characters
            netstream.Start(pPlayer, 'NextRP::OpenCharsMenu', characters, {text = 'Вы не можете использовать этого персонажа!', col = Color(255, 0, 0)})
        end)
        return
    end

    -- hook.Run('wOS.ALCS.PlayerLoadData', pPlayer)

    pPlayer:SetNVar('nrp_tempjob', false)
    
    pPlayer:LoadCharacter(function(char)
        hook.Run('NextRP::CharacterSelected', pPlayer, character_id, old_character_id)

        pPlayer:StripWeapons()
        pPlayer:Spawn()
    end, character_id)
end

netstream.Hook('NextRP::ChooseChar', function(pPlayer, tData)
    if not IsValid(pPlayer) then return end
    if not istable(tData) then return end

    chars:ChooseChar(pPlayer, tData)
end)

function chars:RenameChar(pPlayer, sName, tData)
    local character_id = tData.character_id

    if not character_id then return end
    if not pPlayer:CharacterByID(character_id) then return end

    if character_id == -1 then
        pPlayer:RequestCharacters(function(characters)
            pPlayer.Characters = characters
            netstream.Start(pPlayer, 'NextRP::OpenCharsMenu', characters, {text = 'Вы не можете изменять этого персонажа!', col = Color(255, 0, 0)})
        end)
        return
    end

    if pPlayer:GetNVar('Arrested') then
        return
    end

    pPlayer:SetCharValue('character_nickname', sName, function()
        local c = pPlayer:CharacterByID(character_id)
        c.character_nickname = sName

        pPlayer:RequestCharacters(function(characters)
            pPlayer.Characters = characters or {}
            netstream.Start(pPlayer, 'NextRP::OpenCharsMenu', characters, {col = Color(0, 255, 0), text = 'Персонаж переименован!'})
        end)
    end, character_id)
end

netstream.Hook('NextRP::RenameChar', function(pPlayer, sName, tData)
    if not IsValid(pPlayer) then return end
    if not istable(tData) then return end

    chars:RenameChar(pPlayer, sName, tData)
end)

function chars:SetCharValue( charid, name, value, cb )
    value = value and value or error('NoValue')

    charid = charid and MySQLite.SQLStr(charid) or Error('No charid!')
    NextRP.Chars.Cache[tonumber(string.Replace(charid, '"', ''))][name] = value

    local str = isnumber(value) and '%d' or '%s'
    value = isnumber(value) and value or MySQLite.SQLStr(value)

    MySQLite.query( string.format( 'UPDATE nextrp_characters SET %s = '..str..' WHERE character_id = %s;',
        name,
        value,
        charid
    ), function()
        if cb then cb() end
    end)
end

netstream.Hook('NextRP::BuyNewSlot', function(pPlayer)
    local ITEM = IGS.GetItemByUID('charslot')
    local curr_price = ITEM:PriceInCurrency()

    if IGS.CanAfford(pPlayer, curr_price) then
        pPlayer:AddIGSFunds(-curr_price, 'P: charslot')
        IGS.PlayerPurchasedItem(pPlayer, ITEM)

        pPlayer:RequestCharacters(function(characters)
            pPlayer.Characters = characters or {}
            netstream.Start(pPlayer, 'NextRP::OpenCharsMenu', characters, {col = Color(0, 255, 0), text = 'Слот успешно куплен!'})
        end)
    end
end)