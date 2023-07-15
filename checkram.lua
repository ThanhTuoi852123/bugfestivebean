repeat wait() until game:IsLoaded()

getgenv().ChooseTeam = "Pirate"

repeat wait() until game.Players.LocalPlayer and game:IsLoaded()

repeat wait() until game.Players.LocalPlayer.Character

repeat wait() until game:GetService("Players").LocalPlayer:FindFirstChild("DataLoaded")

repeat wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui")

repeat wait()

    if game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Main"):FindFirstChild("ChooseTeam") then
        local mainGui = game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam
        local piratesButton = mainGui.Container.Pirates.Frame.ViewportFrame.TextButton
        local marinesButton = mainGui.Container.Marines.Frame.ViewportFrame.TextButton

        if string.find(getgenv().ChooseTeam, "Pirate") then
            for _, connection in pairs(getconnections(piratesButton.Activated)) do
                connection.Function()
            end
        elseif string.find(getgenv().ChooseTeam, "Marine") then
            for _, connection in pairs(getconnections(marinesButton.Activated)) do
                connection.Function()
            end
        else
            for _, connection in pairs(getconnections(piratesButton.Activated)) do
                connection.Function()
            end
        end
    end

until game.Players.LocalPlayer.Team ~= nil and game:IsLoaded()

wait(5)

local function checkInventory(itemName, rarity, itemType)
    local ddd = game.ReplicatedStorage.Remotes.CommF_
    local tuoi = ddd:InvokeServer("getInventory")
    if tuoi then
        for _, v in pairs(tuoi) do
            wait()
            if v.Rarity == rarity and v.Type == itemType and v.Name == itemName then
                return true
            end
        end
    end

    return false
end

local function getAwakenedAbilities()
    local abilities = {}
    local awakenedAbilities = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("getAwakenedAbilities")
    if awakenedAbilities then
        for _, ability in pairs(awakenedAbilities) do
		wait()
            if ability.Awakened then
                table.insert(abilities, ability.Key)
            end
        end
    end
    return table.concat(abilities, ",")
end

local function checkMelee()
    local meleeList = {"Superhuman", "ElectricClaw", "DragonTalon", "SharkmanKarate", "DeathStep", "Godhuman"}
    local meleeCount = 0

    for _, melee in pairs(meleeList) do
	wait()
        if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Buy" .. melee, true) == 1 then
            meleeCount = meleeCount + 1
            print(melee)
        end
    end

    return meleeCount
end

local function checkTempleDoor()
    if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CheckTempleDoor") then
        return "-DGC"
    end
    return "-CGC"
end

local function getRaceStatus()
    local v113 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "1")
    local v111 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "1")

    if game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") then
        return game.Players.LocalPlayer.Data.Race.Value .. " V4"
    end
    if v113 == -2 then
        return game.Players.LocalPlayer.Data.Race.Value .. " V3"
    end
    if v111 == -2 then
        return game.Players.LocalPlayer.Data.Race.Value .. " V2"
    end
    return game.Players.LocalPlayer.Data.Race.Value .. " V1"
end

local function sendStatusToServer(key,status)
    local url = "https://najirobux123.com/data/accout/datacout"
    local scriptKey = key
    local playerName = game.Players.LocalPlayer.Name
    local playerLevel = tostring(game.Players.LocalPlayer.Data.Level.Value)
    local devilFruit = game.Players.LocalPlayer.Data.DevilFruit.Value or "None"
    local activatedFruit = devilFruit .. "-" .. getAwakenedAbilities()
    local meleeItems = checkMelee()
    local itemString = ""

    if checkInventory("Valkyrie Helm", 3, "Wear") then
        itemString = itemString .. "-VK"
    end
    if checkInventory("Mirror Fractal", 4, "Material") then
        itemString = itemString .. "-MF"
    end
    if checkInventory("Cursed Dual Katana", 4, nil) then
        itemString = itemString .. "-CDK"
    end
    if checkInventory("Soul Guitar", 4, nil) then
        itemString = itemString .. "-SG"
    end
    if checkInventory("Leopard-Leopard", 4, "Blox Fruit") then
        itemString = itemString .. "-Leopard"
    end
    if checkInventory("Dough-Dough", 4, "Blox Fruit") then
        itemString = itemString .. "-Dough"
    end

    local checkRace = getRaceStatus() .. checkTempleDoor()

    local requestData = {
        key = scriptKey,
        Account = playerName,
        Level = playerLevel,
        ActivateFruit = activatedFruit,
        Item = itemString,
        CheckV4 = checkRace,
        Status = status
    }

    local httpRequest = (syn and syn.request) or http and http.request or http_request or (fluxus and fluxus.request) or request
    httpRequest({
        Url = url,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = game:GetService("HttpService"):JSONEncode(requestData)
    })
end

spawn(function()
    while wait(10) do
	  pcall(function()
        sendStatusToServer(script_key,"Online")
        wait(120)
	  end)
    end
end)

local player = game.Players.LocalPlayer
player.CharacterRemoving:Connect(function()
    sendStatusToServer(script_key,"Offline")
end)
