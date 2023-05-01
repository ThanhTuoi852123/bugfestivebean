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
    game.IsLoaded:Wait(10)
end
local RAMAccount =
    loadstring(game:HttpGet "https://raw.githubusercontent.com/ic3w0lf22/Roblox-Account-Manager/master/RAMAccount.lua")(

)
local MyAccount = RAMAccount.new(game:GetService "Players".LocalPlayer.Name)
local sea1 = 2753915549
local sea2 = 4442272183
local sea3 = 7449423635
local checksea
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
                        return "-CDK"
                    end
                end
        end
    end
    return ""
end)
local tuoidz122 = (function()
    local ddd = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_")
    local sw = {}
    local tuoi = ddd:InvokeServer("getInventory")
    if tuoi then
        for i, v in pairs(tuoi) do
		wait()
                if v.Rarity == 4 then
                    if v.Name == "Soul Guitar" then
                      wait()
                        return "-SG"
                    end
                end
        end
    end
    return ""
end)
local leopardd = (function()
    local ddd =  game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_")
    local fr = {}
    local tuoi = ddd:InvokeServer("getInventory")
    if tuoi then
        for i, v in pairs(tuoi) do
            if v.Type == "Blox Fruit" then
                if v.Rarity == 4 and v.Name == "Leopard-Leopard" then
                    return "Leopard"
                end
            end
        end
    end
    return false
end)
local GHM1 = (function()
    if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyGodhuman", true) == 1 then
        return "-GOD"
    end
    return ""
end)
local Vktuoidz = (function()
    local ddd = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_")
    local sw = {}
    local tuoi = ddd:InvokeServer("getInventory")
    for i, v in pairs(tuoi) do
        if v.Rarity == 3 and v.Type == "Wear" and v.Name == "Valkyrie Helm" then
            return true
        end
    end
    return false
end)
local MFtuoidz = (function()
    local ddd = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_")
    local sw = {}
    local tuoi = ddd:InvokeServer("getInventory")
    for i, v in pairs(tuoi) do
        if v.Rarity == 4 and v.Type == "Material" and v.Name == "Mirror Fractal"  then
            return true
        end
    end
    return false
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
            returnmessage = "Notyet"
		end
	end
else
    canreturn = false
    returnmessage = "Notyet"
end
    if canreturn then
	    return table.concat(awks, ",")
    else
        return returnmessage
    end
end)
function checkgatcan()
    if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CheckTempleDoor") then 
        return "-DGC"
    end
    return "-CGC"
end
function CheckRace()
    local v113 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "1")
    local v111 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "1")
    if game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") then
        return game:GetService("Players").LocalPlayer.Data.Race.Value .. " V4"
    end
    if v113 == -2 then
        return game:GetService("Players").LocalPlayer.Data.Race.Value .. " V3"
    end
    if v111 == -2 then
        return game:GetService("Players").LocalPlayer.Data.Race.Value .. " V2"
    end
    return game:GetService("Players").LocalPlayer.Data.Race.Value .. " V1"
end
if game.PlaceId == sea1 then
    checksea = "Sea 1"
elseif game.PlaceId == sea2 then
    checksea = "Sea 2"
elseif game.PlaceId == sea3 then
    checksea = "Sea 3"
end
local tuoiwebhook = (function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ThanhTuoi852123/bugfestivebean/main/table.lua"))()
end)
local tuoiwebhook1 = (function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ThanhTuoi852123/bugfestivebean/main/sg.lua"))()
end)
local tuoiwebhook2 = (function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ThanhTuoi852123/bugfestivebean/main/guong.lua"))()
end)
local HttpService = game:GetService("HttpService")
    local tuoidz3 = (function()
        if MyAccount then
            local ddr = game:GetService("Players").LocalPlayer.Data.DevilFruit.Value
            local level = game:GetService("Players").LocalPlayer.Data.Level.Value
            MyAccount:SetAlias(level .. "-" .. ddr .. getawaken() .. GHM1() .. tuoidz12() .. tuoidz122() .. Vktuoidz() .. MFtuoidz() .. checkgatcan().. CheckRace() .. leopardd())
        end
    end)

spawn(function()
   while wait(300) do
    tuoidz3()
   end
end)

