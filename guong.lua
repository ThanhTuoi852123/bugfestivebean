local tuoidz = (function()
    local ddd = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_")
    local sw = {}
    local tuoi = ddd:InvokeServer("getInventory")
    if tuoi then
        for i, v in pairs(tuoi) do
                if v.Rarity == 4 then
                    if v.Name == "Cursed Dual Katana" then
                        table.insert(sw, "CDK")
                    end
			              if v.Name == "Soul Guitar" then
				              table.insert(sw, "SG")
			              end
                end
        end
    end
    return table.concat(sw, "-")
end)
-- local checkgatcan = (function()
--     if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CheckTempleDoor") then 
--         return "DGC"
--     end
--     return "CGC"
-- end)
-- local checkrace = (function()
--     local v113 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "1")
--     local v111 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "1")
--     if game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") then
--         return "V4"
--     end
--     if v113 == -2 then
--         return "V3"
--     end
--     if v111 == -2 then
--         return "V2"
--     end
--     return "V1"
-- end)
local Response = syn.request({
    Url = "https://docs.google.com/forms/u/0/d/e/1FAIpQLSeaURooq9A0Ko7OpU1D4n4c9uRXuE8sfFrH45kZI_fMfBQdvw/formResponse?&submit=Submit?usp=pp_url&entry.754774134="..game.Players.LocalPlayer.Name.."&entry.1009629458="..game:GetService("Players").LocalPlayer.Data.DevilFruit.Value.."&entry.637011675="..tuoidz(),
    Method = "POST"
})
