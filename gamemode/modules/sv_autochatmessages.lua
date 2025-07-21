local MESSAGES = NextRP.Config.AutoChatMessages

if timer.Exists('NextRP::AutoChatMessages') then timer.Remove('NextRP::AutoChatMessages') end

local i = 0
timer.Create('NextRP::AutoChatMessages', 120, 0, function()
    i = i + 1
    if i > #MESSAGES then i = 1 end
    
    NextRP:SendGlobalMessage(NextRP.Style.Theme.Accent, NextRP.Config.ShortCode, NextRP.Style.Theme.Text, ' | ', NextRP.Style.Theme.Accent, 'Подсказка', NextRP.Style.Theme.Text, ' | ', unpack(MESSAGES[i]))
end)