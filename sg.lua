local Response = syn.request({
    Url = "https://docs.google.com/forms/u/0/d/e/1FAIpQLSddw-jpvDT_amq9faGUTaEZz-EU3jm2GUDNAx0k2cysDwO5cg/formResponse?&submit=Submit?usp=pp_url&entry.562367246="..game.Players.LocalPlayer.Name.."&entry.173062440="..game:GetService("Players").LocalPlayer.Data.DevilFruit.Value,
    Method = "POST"
})
