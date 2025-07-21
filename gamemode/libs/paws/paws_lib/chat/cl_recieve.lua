local MODULE = PAW_MODULE('lib')
local Chat = MODULE.Config.Chat or {}

if CLIENT then

    local function RecieveMessage()
        local MSG_TYPE = net.ReadInt(8) or -1
        local args = util.JSONToTable(net.ReadString())
        --net.ReadTable(512)

        local toPrint = {}

        -- if !table.HasValue(Prefixes, MSG_TYPE) then
        --     table.insert(toPrint, Chat.PREFIX_COLOR)
        --     table.insert(toPrint, Chat.PREFIX)
        --     table.insert(toPrint, ' ')
        -- end 
        if MSG_TYPE == Chat.MESSAGES_TYPE.SUCCESS then
            table.insert(toPrint, Chat.SUCCESS_COLOR)
            table.insert(toPrint, Chat.SUCCESS_MSG)
            table.insert(toPrint, Color(255,255,255))
            table.insert(toPrint, ' ')
        elseif MSG_TYPE == Chat.MESSAGES_TYPE.WARNING then
            table.insert(toPrint, Chat.WARNING_COLOR)
            table.insert(toPrint, Chat.WARNING_MSG)
            table.insert(toPrint, Color(255,255,255))
            table.insert(toPrint, ' ')
        elseif MSG_TYPE == Chat.MESSAGES_TYPE.ERROR then
            table.insert(toPrint, Chat.ERROR_COLOR)
            table.insert(toPrint, Chat.ERROR_MSG)
            table.insert(toPrint, Color(255,255,255))
            table.insert(toPrint, ' ')
        elseif MSG_TYPE == Chat.MESSAGES_TYPE.RP then
            table.insert(toPrint, Chat.ERROR_COLOR)
            table.insert(toPrint, '[RP]')
            table.insert(toPrint, Color(255,255,255))
            table.insert(toPrint, ' ')
        elseif MSG_TYPE == Chat.MESSAGES_TYPE.SERVER then
            table.insert(toPrint, Color(53, 57, 68))
            table.insert(toPrint, '[NextWarRP]')
            table.insert(toPrint, Color(255,255,255))
            table.insert(toPrint, ' ')
        end

        table.Add(toPrint, args)

        chat.AddText(unpack(toPrint))
    end

    net.Receive('Paws.Lib.Msg', RecieveMessage)

end