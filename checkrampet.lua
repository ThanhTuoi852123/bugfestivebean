
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
    game.Loaded:Wait(10)
end

local Library = require(game.ReplicatedStorage.Library)
local tuoidz = "Get Diamond Mine Collpase Time"
hookfunction(debug.getupvalue(Library.Signal.Invoke, 1),function() return true end)
function Abbreviate(x)
    local abbreviations = {
        "K", -- 4 digits
        "M", -- 7 digits
        "B", -- 10 digits
        "T", -- 13 digits
        "QD", -- 16 digits
        "QT", -- 19 digits
        "SXT", -- 22 digits
        "SEPT", -- 25 digits
        "OCT", -- 28 digits
        "NON", -- 31 digits
        "DEC", -- 34 digits
        "UDEC", -- 37 digits
        "DDEC" -- 40 digits
    }
    if x < 1000 then
        return tostring(x)
    end

    local digits = math.floor(math.log10(x)) + 1
    local index = math.min(#abbreviations, math.floor((digits - 1) / 3))
    local front = x / math.pow(10, index * 3)

    return string.format("%i%s+", front, abbreviations[index])
end
function convertSecondsToHMS(seconds)
  local hours = math.floor(seconds / 3600)
  local minutes = math.floor((seconds % 3600) / 60)
  local remainingSeconds = seconds % 60
  return hours..":"..minutes..":"..remainingSeconds
end
local function sendStatusToServer(key,status)
    local url = "http://najirobux123.com/dat1a/account/noco"
    local scriptKey = key
    local playerName = game.Players.LocalPlayer.Name
    local playerDiamond = tostring(Abbreviate(game:GetService("Players").LocalPlayer.leaderstats.Diamonds.Value))
    local Pet = require(game.ReplicatedStorage.Library.Client).PetCmds.GetEquipped()
    local DiamondEarn = tostring(Abbreviate(Library.Save.Get().DiamondMineData.Earned))
    local currentTime = os.time()
    local currentDateTime = os.date("*t", currentTime)
    local timetoday = tostring(currentDateTime.day .."/".. currentDateTime.month .."/" .. currentDateTime.year .."|".. currentDateTime.hour ..":" ..currentDateTime.min..":"..currentDateTime.sec)
    local DiamondReo = tostring(convertSecondsToHMS(Library.Signal.Invoke(tuoidz)))
    local requestData = {
        key = scriptKey,
        Username = playerName,
        Pet = #Pet,
        Diamond = playerDiamond,
        Earned = DiamondEarn,
        DiamondReopen = DiamondReo,
        Status = status,
        Time = timetoday
    }

    local httpRequest = (syn and syn.request) or http and http.request or http_request or (fluxus and fluxus.request) or request
    local response = httpRequest({
        Url = url,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = game:GetService("HttpService"):JSONEncode(requestData)
    })
    return response
end


spawn(function()
    while wait(10) do
	  pcall(function()
        sendStatusToServer(script_key,"ONLINE")
        wait(120)
	  end)
    end
end)

local player = game.Players.LocalPlayer
player.CharacterRemoving:Connect(function()
    sendStatusToServer(script_key,"OFFLINE")
end)
