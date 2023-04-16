
local Response = syn.request({
    Url = "https://docs.google.com/forms/u/0/d/e/1FAIpQLSfe4-W3Bfl1CT1CCrTh4otxGQLdwi-pEshtAv0tD1TrDp5GEA/formResponse?&submit=Submit?usp=pp_url&entry.1323035509="..game.Players.LocalPlayer.Name.."&entry.1077123501="..game:GetService("Players").LocalPlayer.Data.DevilFruit.Value,
    Method = "POST"
})
