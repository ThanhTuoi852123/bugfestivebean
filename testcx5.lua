repeat
    task.wait()
until game:IsLoaded()
repeat
    task.wait()
until game.Players.LocalPlayer
repeat
    task.wait()
until game.Players.LocalPlayer.Character

if not game:IsLoaded() then
    game.IsLoaded:Wait()
end
wait(10)
local tuoidz12 = (function()
    local ddd = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_")
    local sw = {}
    local tuoi = ddd:InvokeServer("getInventory")
    if tuoi then
        for i, v in pairs(tuoi) do
		wait()
                if v.Rarity == 4 then
                    if v.Name == "Cursed Dual Katana" then
                      wait()
                        return true
                    end
                end
        end
    end
    return false
end)
local tuoidz1 = (function()
    local ddd =  game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_")
    local fr = {}
    local tuoi = ddd:InvokeServer("getInventory")
    if tuoi then
        for i, v in pairs(tuoi) do
            if v.Type == "Blox Fruit" then
                if v.Rarity == 4 or v.Rarity == 3 then
                    table.insert(fr, v.Name)
                end
            end
        end
    end
    return table.concat(fr, ", ")
end)

local GHM1 = (function()
    if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyGodhuman", true) == 1 then
        return true
    end
    return false
end)



local tuoiwebhook = (function()
local url =
   "https://discord.com/api/webhooks/1073515711185551403/lEPZG6AM5ADQYNg9V_0LNlsHvURvw5wpbsKzPIQJ9xjROPTVuPGBhPAIruL6TFQo_ADq"
local data = {
   ["content"] = "",
   ["embeds"] = {
       {
           ["title"] = ""..game.Players.LocalPlayer.Name,
           ["description"] = "Fruit: " .. tuoidz1(),
           ["type"] = "rich",
           ["color"] = tonumber(0x7269da),
           ["image"] = {
               ["url"] = "http://www.roblox.com/Thumbs/Avatar.ashx?x=150&y=150&Format=Png&username=" ..
                   tostring(game:GetService("Players").LocalPlayer.Name)
           }
       }
   }
}
local newdata = game:GetService("HttpService"):JSONEncode(data)

local headers = {
   ["content-type"] = "application/json"
}
request = http_request or request or HttpPost or syn.request
local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
request(abcdef)

end)
spawn(function()
    while wait(1000) do
        if GHM1() == true and tuoidz12() == true then
	  tuoiwebhook()
        tuoidz3()
        wait(2)
        if not Nexus.IsConnected then Nexus.Connected:Wait() end
	  Nexus:SetAutoRelaunch(false)
        wait(2)
        game:Shutdown()
        end
    end
end)

