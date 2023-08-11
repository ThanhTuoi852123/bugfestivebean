repeat wait() until game:IsLoaded()
repeat wait() until game.Players.LocalPlayer and game:IsLoaded()
repeat wait() until game.Players.LocalPlayer.Character

local HttpRequest = (syn and syn.request) or http and http.request or http_request or (fluxus and fluxus.request) or request
local HttpService = game:GetService("HttpService")
function accountonl()
local data = {
    name = game.Players.LocalPlayer.Name,
    status = "ONLINE"
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
while sss do
    pcall(function()
        	accountonl()
        	wait(60)
    end)
    for _,v in pairs(game.CoreGui.RobloxPromptGui.promptOverlay:GetChildren()) do
		  if v.Name == "ErrorPrompt" then
			  sss = false
		  end
	  end
end
game.CoreGui.RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
   if child.Name == "ErrorPrompt" then
       sss = false
   end
end)
