--[[function tprint (tbl, indent)
  if not indent then indent = 0 end
  local toprint = string.rep(" ", indent) .. "{\r\n"
  indent = indent + 2
  for k, v in pairs(tbl) do
    toprint = toprint .. string.rep(" ", indent)
    if (type(k) == "number") then
      toprint = toprint .. "[" .. k .. "] = "
    elseif (type(k) == "string") then
      toprint = toprint  .. k ..  "= "
    end
    if (type(v) == "number") then
      toprint = toprint .. v .. ",\r\n"
    elseif (type(v) == "string") then
      toprint = toprint .. "\"" .. v .. "\",\r\n"
    elseif (type(v) == "table") then
      toprint = toprint .. tprint(v, indent + 2) .. ",\r\n"
    else
      toprint = toprint .. "\"" .. tostring(v) .. "\",\r\n"
    end
  end
  toprint = toprint .. string.rep(" ", indent-2) .. "}"
  return toprint
end

local function TestItem(w, h)
    local item = {
        w = w,
        h = h,
        color = ColorRand(),
        GetSize = function(self)
            return self.w, self.h
        end,
        GetColor = function(self)
            return self.color
        end,

        GetPanel = function(self)
            return self.Container or false
        end,
        SetPanel = function(self, Panel)
            print('SET', 'Container', Panel)
            self.Container = Panel 
        end
    }

    item.__index = item

    return setmetatable({}, item)
end

local ply = LocalPlayer()
ply.Inv = {}
ply.Inv.Backpack = {}
ply.Inv.ItemPanels = {}
ply.Inv.Equipped = {} 
ply.Inv.Weight = 0

for i = 1, 8 do
    ply.Inv.Backpack[i] = {}
    ply.Inv.ItemPanels[i] = {}
end

local check = false
for k, v in pairs(ply.Inv.Backpack) do
    if not check then print(tprint(ply.Inv)) check = true end
    for i = 1, 2 do
        ply.Inv.Backpack[k][i] = false
        ply.Inv.ItemPanels[k][i] = false
    end
end

local plyMeta = FindMetaTable('Player')
function plyMeta:GetItem(x, y)
    return ply.Inv.Backpack[x][y]
end

local function TestInventory()
    local frame = vgui.Create('DFrame')
    frame:SetSize(600, 200)
    frame:Center()

    frame:MakePopup()

    for k, v in pairs(ply.Inv.Backpack) do
        for kk, vv in pairs(v) do
            local slot = vgui.Create('DPanel', frame)

            slot:SetSize(48,48)
            slot:SetPos(50 * k, 50 * kk)

            slot:Receiver('nrp_item', function(self, tPanels, bDropped, nMenuIndex, nXCurPox, nYCurPos)
                if not bDropped then return end
                
                local ItemPanel = tPanels[1]
                local Item = ItemPanel:GetItem()

                local x, y = self:GetCoords()
                local itmw, itmh = Item:GetSize()

                local full = false
                local slots = {}

                if itmw > 1 or itmh > 1 then
                    for i1 = x, ( x + itmw ) - 1 do
                        if full then break end

                        for i2 = y, ( y + itmh ) - 1 do
                            if not ply.Inv.ItemPanels[i1] or not ply.Inv.ItemPanels[i1][i2] then
                                full = true
                                break 
                            end
                            if ply.Inv.ItemPanels[i1][i2]:GetItem() then
                                full = true
                            else 
                                slots[#slots + 1] = ply.Inv.ItemPanels[i1][i2]
                            end
                        end
                    end
                end

                if not full then
                    if Item.MorePanels then
                        for k, v in pairs(Item.MorePanels) do
                            v:SetItem(false)
                        end
                    end

                    if slots then
                        Item.MorePanels = slots
                        for k, v in pairs(slots) do
                            v:SetItem(Item)
                        end
                    end    
                    
                    self:SetItem(ItemPanel)

                    ply.Inv.Backpack[k][kk] = Item

                    -- Позиция
                    ItemPanel:SetPos(self:GetPos())

                    -- Перенос предмета! Нетворк в студию!
                    if Item:GetPanel() then Item:GetPanel():SetItem(false) print('removed from old slot') end
                    Item:SetPanel(self)
                end
            end)

            function slot:SetItem(panel)
                self.ItemPanel = panel
            end
            function slot:GetItem()
                return self.ItemPanel or false
            end
            function slot:SetCoords(x, y)
                slot.posX = x 
                slot.posY = y
            end
            function slot:GetCoords()
                return self.posX, self.posY
            end

            slot:SetCoords(k, kk)

            function slot:Paint(w, h)
                local x, y = self:GetCoords()
                 
                draw.RoundedBox(4, 0, 0, w, h, self.ItemPanel and Color(255,0,255) or Color(255,255,255))
                draw.SimpleText(x .. ' ' .. y, 'DermaDefault', 0, 0, Color(0,0,0))

            end

            ply.Inv.ItemPanels[k][kk] = slot
        end
    end

    local test = vgui.Create('DPanel', frame)
    test:Droppable('nrp_item')

    test:SetSize(48, 48)
    test.Item = TestItem(2, 2)

    function test:GetItem()
        return test.Item
    end

    local test = vgui.Create('DPanel', frame)
    test:Droppable('nrp_item')

    test:SetSize(48, 48)
    test.Item = TestItem(2, 1)

    function test:GetItem()
        return test.Item
    end

    local test = vgui.Create('DPanel', frame)
    test:Droppable('nrp_item')

    test:SetSize(48, 48)
    test.Item = TestItem(1, 2)

    function test:GetItem()
        return test.Item
    end
end]]--

-- TestInventory()