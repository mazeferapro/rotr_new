local function PayDay()
    for k, v in pairs(player.GetHumans()) do
        local tJob = v:getJobTable()
        if not tJob then continue end

        if not tJob.Salary or tJob.Salary == 0 then
            v:SendNotification('Вы не получаете зп!', 0, 3, NextRP.Style.Theme.Accent, NextRP.Style.Theme.Text)
            continue
        end

        local charID = v:GetNVar('nrp_charid')
        local curMoney = v:GetMoney()
        local newMoney = curMoney + tJob.Salary

        v:SetMoney(newMoney)

        v:SendNotification('Вы получили '..tJob.Salary..' CR!', 0, 3, NextRP.Style.Theme.Accent, NextRP.Style.Theme.Text)
    end
end

timer.Create('NextRP::SalaryTimer', 600, 0, PayDay)

