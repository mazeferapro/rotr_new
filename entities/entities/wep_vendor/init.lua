AddCSLuaFile( 'cl_init.lua' ) -- Make sure clientside
AddCSLuaFile( 'shared.lua' )  -- and shared scripts are sent.

include('shared.lua')

function ENT:Initialize()

    self:SetModel( 'models/reizer_props/srsp/sci_fi/armory_01/armory_01.mdl' )
    --self:SetCollisionGroup(COLLISION_GROUP_WEAPON)
    --self:CapabilitiesAdd(CAP_ANIMATEDFACE)
    self:PhysicsInit( SOLID_VPHYSICS )      -- Make us work with physics,
    self:SetMoveType( MOVETYPE_VPHYSICS )   -- after all, gmod is a physics
    self:SetSolid( SOLID_VPHYSICS )         -- Toolbox
    local phys = self:GetPhysicsObject()
    if (phys:IsValid()) then
        phys:Wake()
    end

    self:SetUseType(SIMPLE_USE)
end

ENT.LastUsed = 0

function ENT:Use( activator, caller )
    if activator:getJobTable().type == TYPE_ADMIN then activator:SendMessage(MESSAGE_TYPE_ERROR, 'Клонам здесь не рады!') return end
    if activator:IsPlayer() and self.LastUsed < CurTime() then
        local t = activator:Team()
        if not file.IsDir('kitsune/weplist', 'DATA') then file.CreateDir('kitsune/weplist') end
        local sPath = 'kitsune/weplist/'..activator:SteamID64()..'.txt'
        local dPath = file.Exists(sPath,'DATA')
        if not dPath then file.Write(sPath, '[]') end
        local tData = dPath and file.Read(sPath) or 'empty'
        if tData ~= 'empty' then tData = util.JSONToTable(tData)[team.GetName(t)] or {} end
        netstream.Start(activator, 'NextRP::WepVendorStart', activator, isstring(tData) and tData or util.TableToJSON(tData))
        self.LastUsed = CurTime() + 1
    end
end


if SERVER then
    netstream.Hook('NextRP::BuyOrGiveWeapon', function(pPlayer, wep, price, sell)
        local sPath = 'kitsune/weplist/'..pPlayer:SteamID64()..'.txt'
        local dPath = file.Exists(sPath,'DATA')
        local tData = dPath and util.JSONToTable(file.Read(sPath)) or {}
        local t = pPlayer:Team()
        local weplist = tData[team.GetName(t)] or {}
        if sell then
            pPlayer:StripWeapon(wep)
            weplist[wep] = nil
            tData[team.GetName(t)] = weplist
            file.Write(sPath, util.TableToJSON(tData))
            pPlayer:SendMessage(MESSAGE_TYPE_SUCCESS, 'Вы продали '..weapons.Get(wep).PrintName..' за '..(price/2)..' CR!')
            pPlayer:AddMoney(price/2)
            return
        end
        if isstring(price) then
            if price == 'give' then
                if pPlayer:HasWeapon(wep) then pPlayer:SendMessage(MESSAGE_TYPE_ERROR, 'Вы уже несете это оружие!') return end
                local picked = pPlayer:GetNWInt('picked') or 0
                local weight = weapons.Get(wep).Weight or 5
                pPlayer:Give(wep)
                pPlayer:SetNWInt('picked', picked + weight)
            else
                wep = util.JSONToTable(wep)
                for sWep, _ in pairs(wep) do
                    local picked = pPlayer:GetNWInt('picked') or 0
                    local weight = weapons.Get(sWep).Weight or 5
                    pPlayer:Give(sWep)
                    pPlayer:SetNWInt('picked', picked + weight)
                end
                pPlayer:SendMessage(MESSAGE_TYPE_SUCCESS, 'Вы взяли все купленное вооружение!')
            end
        else
            if pPlayer:CanAfford(price) then
                weplist[wep] = true
                pPlayer:AddMoney(-price)
                tData[team.GetName(t)] = weplist
                pPlayer:SendMessage(MESSAGE_TYPE_SUCCESS, 'Вы купили '..weapons.Get(wep).PrintName..' за '..price..' CR!')
                file.Write(sPath, util.TableToJSON(tData))
            else
                pPlayer:SendMessage(MESSAGE_TYPE_ERROR, 'Вы не можете себе это позволить!')
            end
        end
    end)
end