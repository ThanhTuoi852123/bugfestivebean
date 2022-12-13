repeat wait() until game:IsLoaded()
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
game:GetService("ReplicatedStorage").Events.GiveQuest:FireServer("B.B.M. Mission")
game:GetService("ReplicatedStorage").Events.CompleteQuest:FireServer("B.B.M. Mission")
local tuoidz = workspace.FlowerZones["Clover Field"].CFrame
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = tuoidz
wait(2)
local A = {

                ["Name"] = "Festive Bean"
            }
            local Event = game:GetService("ReplicatedStorage").Events.PlayerActivesCommand
            Event:FireServer(A)
wait(2)
if not Nexus.IsConnected then Nexus.Connected:Wait() end
Nexus:SetAutoRelaunch(false)
wait(2)
game:Shutdown()
