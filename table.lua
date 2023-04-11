local getawaken1 = (function()
	local awks = {}
	local awk = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("getAwakenedAbilities")
	local canreturn;
    local returnmessage; 
    if awk then
    for i, v in pairs(awk) do 
        if v.Awakened then
            table.insert(awks, v.Key)
            canreturn = true
        else
            canreturn = false
            returnmessage = "Not yet"
		end
	end
else
    canreturn = false
    returnmessage = "Not yet"
end
    if canreturn then
	    return table.concat(awks, ", ")
    else
        return returnmessage
    end
end)

local Response = syn.request({
    Url = "https://docs.google.com/forms/u/0/d/e/1FAIpQLSfe4-W3Bfl1CT1CCrTh4otxGQLdwi-pEshtAv0tD1TrDp5GEA/formResponse?&submit=Submit?usp=pp_url&entry.1323035509="..game.Players.LocalPlayer.Name.."&entry.1077123501="..game:GetService("Players").LocalPlayer.Data.DevilFruit.Value.."&entry.998549493="..getawaken1(),
    Method = "POST"
})
