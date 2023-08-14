repeat wait() until game:IsLoaded()
repeat wait() until game.Players.LocalPlayer and game:IsLoaded()
repeat wait() until game.Players.LocalPlayer.Character
wait(10)
local HttpRequest = (syn and syn.request) or http and http.request or http_request or (fluxus and fluxus.request) or request
local HttpService = game:GetService("HttpService")
function accountonl(status)
local data = {
    name = game.Players.LocalPlayer.Name,
    status = status
}

local response = HttpRequest(
   {
       Url = "http://localhost:5000/post",  -- This website helps debug HTTP requests
       Method = "POST",
       Headers = {
           ["Content-Type"] = "application/json"  -- When sending JSON, set this!
       },
       Body = HttpService:JSONEncode(data)
   }
)
end
local sss = true
local GuiService = game:GetService('GuiService')
spawn(function()
while true do
    pcall(function()
        accountonl("ONLINE")
        print("Dang chay")
    end)
    wait(60)
end
end)
print("ONLINE")
