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
    game.Loaded:Wait()
end
wait(10)

local function gettime()
local currentTime = os.date("*t")
local totalSeconds = currentTime.hour * 3600 + currentTime.min * 60 + currentTime.sec
return totalSeconds
end

getgenv().StopUpdate = false
local GuiService = game:GetService('GuiService')
local start = true
spawn(function()
    while wait(60) do
	for _,v in pairs(game.CoreGui.RobloxPromptGui.promptOverlay:GetChildren()) do
		if v.Name == "ErrorPrompt" then
			start = false
  			getgenv().StopUpdate = true
		end
	end
	local ErrorCode = GuiService:GetErrorCode().Value
	if ErrorCode >= Enum.ConnectionError.DisconnectErrors.Value then
		start = false
		getgenv().StopUpdate = true
   	end
    end
end)
spawn(function()
while wait(1) do 
    if not getgenv().StopUpdate and game.Players.LocalPlayer.Parent and 	game.Players.LocalPlayer:FindFirstChild("PlayerScripts") then 
        local s,e = pcall(function() 
            writefile("Time.txt",tostring(gettime()))
        end)
    end
end
end)
spawn(function()
for _,v in pairs(game.CoreGui.RobloxPromptGui.promptOverlay:GetChildren()) do
	if v.Name == "ErrorPrompt" then
		start = false
	end
end
end)
game.CoreGui.RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
   if child.Name == "ErrorPrompt" then
       start = false
   end
end)

print("CheckRAMOnline")
