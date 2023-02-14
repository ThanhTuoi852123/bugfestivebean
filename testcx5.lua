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
local RAMAccount =
    loadstring(game:HttpGet "https://raw.githubusercontent.com/ic3w0lf22/Roblox-Account-Manager/master/RAMAccount.lua")(

)
local MyAccount = RAMAccount.new(game:GetService "Players".LocalPlayer.Name)
local sea1 = 2753915549
local sea2 = 4442272183
local sea3 = 7449423635
local checksea
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
                    if v.Name == "True Triple Katana" then
				table.insert(sw, "TTK")
			  end
                end
        end
    end
    return table.concat(sw, "-")
end)
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
local GHM = (function()
    local GHMC = {}
    if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyGodhuman", true) == 1 then
        table.insert(GHMC, "GHM")
    end
    return table.concat(GHMC, "-")
end)
local GHM1 = (function()
    if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyGodhuman", true) == 1 then
        return true
    end
    return false
end)
local tuoiddz = (function()
    local tuoiddzs = {}
    if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuySharkmanKarate", true) == 1 then
        table.insert(tuoiddzs, "Sharkman Karate")
    end
    if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDeathStep", true) == 1 then
        table.insert(tuoiddzs, "Death Step")
    end
    if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyElectricClaw", true) == 1 then
        table.insert(tuoiddzs, "Electric Claw")
    end
    if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon", true) == 1 then
        table.insert(tuoiddzs, "Dragon Talon")
    end
    if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuySuperhuman", true) == 1 then
        table.insert(tuoiddzs, "Superhuman")
    end
    if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyGodhuman", true) == 1 then
        table.insert(tuoiddzs, "God Human")
    end
    return table.concat(tuoiddzs, ", ")
end)
local getawaken = (function()
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

if game.PlaceId == sea1 then
    checksea = "Sea 1"
elseif game.PlaceId == sea2 then
    checksea = "Sea 2"
elseif game.PlaceId == sea3 then
    checksea = "Sea 3"
end
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
    local tuoidz3 = (function()
        if MyAccount then
            local ddr = game:GetService("Players").LocalPlayer.Data.DevilFruit.Value
            local level = game:GetService("Players").LocalPlayer.Data.Level.Value
            local beli = game:GetService("Players").LocalPlayer.Data.Beli.Value
            local fragment = game:GetService("Players").LocalPlayer.Data.Fragments.Value
            local tuoi = {}
            local tuoi2 = {}
		table.insert(tuoi2,level)
		table.insert(tuoi2,tuoidz())
		table.insert(tuoi2,GHM())
            table.insert(tuoi,"MONEY: "..beli)
            table.insert(tuoi, "FRAG: " .. fragment)
            table.insert(tuoi,"MELEE: ".. tuoiddz())
            table.insert(tuoi, "FRUIT: " .. tuoidz1())
            table.insert(tuoi, "Fruit Ðang Dùng: " .. ddr)
            table.insert(tuoi, "Awaken: " .. getawaken())
            
            MyAccount:SetAlias(table.concat(tuoi2, "-"))
            MyAccount:SetDescription(table.concat(tuoi, "\n"))
        end
    end)
spawn(function()
    while wait(100) do
        if GHM1() == true then
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

