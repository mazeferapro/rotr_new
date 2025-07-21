local MODULE = NextRP

local meta = {}
function meta.__call( self, var )
	return self
end 

local m = {
    command = 'newcommand',
    Title = 'New Command',
    Description = 'New Command Description',

    Run = function(self, pPlayer, sText)
        -- To edit
    end,

    OnRun = function(self, pPlayer, sText)
        self.Run(pPlayer, sText)
        hook.Run('Paws.Lib.CommandRun', self.command, pPlayer, sText)
    end,

    SetCommand = function(self, sString)
        self.command = sString
        return self
    end,
    SetTitle = function(self, sString)
        self.Title = sString
        return self
    end,
    SetDescription = function(self, sString)
        self.Description = sString
        return self
    end,

    SetOnRunFunction = function(self, fFuntion)
        self.Run = fFuntion
        return self
    end
}

meta.__index = m

function MODULE:Command(command, get)

    get = get or false

    self.Commands = self.Commands or {} // MODULE.Commands = MODULE.Comands or {}
    
    for k, v in ipairs(self.Commands) do
        if v.command == command then return self.Commands[k] end
    end

    if get then
        return nil
    end

    local CommandTable = {
        command = command or nil
    }

    setmetatable(CommandTable, meta)

    local i = table.insert(self.Commands, CommandTable)

    return self.Commands[i]
end

function NextRP:AddCommand(sCommand, fCallback)
    local cmd = MODULE:Command(sCommand, false)
    cmd:SetOnRunFunction(fCallback)
end

NextRP:AddCommand('helmet', function(pPlayer)
    local helmetbodys = { 'Helmet', 'Head', 'helmet', 'head' }
    local bbody = true
    for k, data in pairs(pPlayer:GetBodyGroups()) do
        if table.HasValue(helmetbodys, data.name) then
            bbody = pPlayer:GetBodygroup(data.id)
            pPlayer:SetBodygroup(data.id, pPlayer:GetBodygroup(data.id) == 0 and 1 or 0 )
            pPlayer:Say(bbody == 0 and '/me снял шлем' or '/me надел шлем')
        end
    end
end)

NextRP:AddCommand('visor', function(pPlayer)
    local helmetbodys = { 'visor', 'Visor', 'binos', 'Binos' }
    local bbody = true
    for k, data in pairs(pPlayer:GetBodyGroups()) do
        if table.HasValue(helmetbodys, data.name) then
            bbody = pPlayer:GetBodygroup(data.id)
            if bbody == 0 then
                MODULE:SendNotify(pPlayer, 'Вы не можете взаимодействовать с визором!', nil, 4, MODULE.Config.Colors.Red)
                return
            end
            pPlayer:SetBodygroup(data.id, pPlayer:GetBodygroup(data.id) == 1 and 2 or 1 )
            pPlayer:Say(bbody == 2 and '/me снял визор' or '/me надел визор')
        end
    end
end)


NextRP:AddCommand('visori', function(pPlayer)
    print('stat')
    --local tbl = Comlink.Channels
    --for k, v in pairs(tbl) do
        --pPlayer:ChatPrint(k..' '..v)
       hook.Call("Comlink.CreateChannels")
   -- end
end)

NextRP:AddCommand('visori2', function(pPlayer)
    print(tprint(pPlayer:getJobTable()))
    --local tbl = Comlink.Channels
    --for k, v in pairs(tbl) do
        --pPlayer:ChatPrint(k..' '..v)
   -- end
end)

NextRP:AddCommand('test', function(pPlayer, sText)
end)

NextRP:AddCommand('setclaimertitle', function(pPlayer, sText)
    if not pPlayer:IsAdmin() then return end
    if sText == '' then return end
    local tr = pPlayer:GetEyeTrace().Entity
    tr:SetTitle(sText)
end)

NextRP:AddCommand('docs', function(pPlayer)
    local tDocsInfo = {}

    local tJob = pPlayer:getJobTable()
    --local tFactionConfig = MODULE.Config.Factions[tJob.faction] or MODULE.Config.Factions.Default

    table.insert(tDocsInfo, '['..tJob.category..']')

    table.insert(tDocsInfo, '['..pPlayer:GetRank()..']')

    table.insert(tDocsInfo, '['..pPlayer:GetNumber()..']')

    table.insert(tDocsInfo, '['..pPlayer:GetNickname()..']')

    PAW_MODULE('lib'):SendMessageDist(pPlayer, 4, 250, Color(90, 200, 90), '[Docs] ', color_white, unpack(tDocsInfo) )
end)