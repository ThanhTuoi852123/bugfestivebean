repeat wait() until game:IsLoaded()

getgenv().ChooseTeam = "Pirate"

repeat wait() until game.Players.LocalPlayer and game:IsLoaded()

repeat wait() until game.Players.LocalPlayer.Character

repeat wait() until game:GetService("Players").LocalPlayer:FindFirstChild("DataLoaded")

repeat wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui")

repeat wait()

    if game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Main"):FindFirstChild("ChooseTeam") then
        local v99 = game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam
        local v52 = v99.Container.Pirates.Frame.TextButton
        local v123 = v99.Container.Marines.Frame.TextButton

        if string.find(getgenv().ChooseTeam, "Pirate") then
            for _, connection in pairs(getconnections(v52.Activated)) do
                connection.Function()
            end
        elseif string.find(getgenv().ChooseTeam, "Marine") then
            for _, connection in pairs(getconnections(v123.Activated)) do
                connection.Function()
            end
        else
            for _, connection in pairs(getconnections(v52.Activated)) do
                connection.Function()
            end
        end
    end

until game.Players.LocalPlayer.Team ~= nil and game:IsLoaded()
local function k123()
    local v113 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "1")
    local v111 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "1")

    if game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") then
        return game.Players.LocalPlayer.Data.Race.Value .. "-V4"
    end
    if v113 == -2 then
        return game.Players.LocalPlayer.Data.Race.Value .. "-V3"
    end
    if v111 == -2 then
        return game.Players.LocalPlayer.Data.Race.Value .. "-V2"
    end
    return game.Players.LocalPlayer.Data.Race.Value .. " V1"
end
local function k34()
    local v99 = {}
    local v100 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("getAwakenedAbilities")
    if v100 then
        for _, k90 in pairs(v100) do
		wait()
            if k90.Awakened then
                table.insert(v99, k90.Key)
            end
        end
    end
    return table.concat(v99, ", ")
end
local function j99()
    local v231 = {"Superhuman", "ElectricClaw", "DragonTalon", "SharkmanKarate", "DeathStep", "Godhuman"}
    local k98 = ""

    for _, v11 in pairs(v231) do
        if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Buy" .. v11, true) == 1 then
            k98 = k98 .. v11 ..", "
        end
    end

    return k98
end
function v908(k111)
local a = ""
local ddd = game.ReplicatedStorage.Remotes.CommF_
local tuoi = ddd:InvokeServer("getInventory")
if tuoi then
    for _, v in pairs(tuoi) do
        if v.Rarity >= 3 and v.Type == k111 then
            a = a .. v.Name .. ", "
        end
    end
end
return a
end
function v999()
local a = "\n	"
local ddd = game.ReplicatedStorage.Remotes.CommF_
local tuoi = ddd:InvokeServer("getInventory")
if tuoi then
    for _, v in pairs(tuoi) do
        if v.Rarity >= 2 and v.Type == "Material" then
            a = a .. v.Name .. ": ".. v.Count .. ","
        end
    end
end
return a
end
local HttpService = game:GetService("HttpService")
function tuoiiiii()
local placeId = game.PlaceId
print(placeId)
local sea = 2
if placeId == 2753915549 then
sea = 1
end
if placeId == 7449423635 then
sea = 3
end
local data = {
  ["Player Name"] = game.Players.LocalPlayer.Name,
  ["Level"] = tostring(game.Players.LocalPlayer.Data.Level.Value):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", ""),
  ["Beli"] = tostring(game.Players.LocalPlayer.Data.Beli.Value):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", ""),
  ["Frag"] = tostring(game.Players.LocalPlayer.Data.Fragments.Value):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", ""),
  ["Devil Fruit"] = tostring(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value),
  ["Bounty/Honor"] = tostring(game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", ""),
  ["Race"] = k123(),
  ["Awakened Skills"] = k34(),
  ["Melee(s)"] = j99(),
  ["Sword(s)"] = v908("Sword"),
  ["Gun(s)"] = v908("Gun"),
  ["Accessory(s)"] = v908("Wear"),
  ["Fruit(s)"] = v908("Blox Fruit"),
  ["Materials(s)"] = v999(),
  ["Sea"] = sea
}

return data
end
while true do
pcall(function()
local data = tuoiiiii()
local jsonData = HttpService:JSONEncode(data)
writefile("data.json", jsonData)
wait(10)
end)
end
