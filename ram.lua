repeat
    wait(120)
until game:IsLoaded()

getgenv().ChooseTeam = "Pirate"

repeat
    wait()
until game:IsLoaded()

repeat
    wait()
until game.Players

repeat
    wait()
until game:IsLoaded() and game.Players.LocalPlayer

repeat
    wait()
until game:GetService("Players").LocalPlayer:FindFirstChild("DataLoaded")

repeat
    wait()
until game.Players.LocalPlayer:FindFirstChild("PlayerGui")

repeat
    wait()

    if game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Main"):FindFirstChild("ChooseTeam") then
        if game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Main"):FindFirstChild("ChooseTeam") then
            if string.find(getgenv().ChooseTeam, "Pirate") then
                for i, v in pairs(
                    getconnections(
                        game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Activated
                    )
                ) do
                    v.Function()
                end
            elseif string.find(getgenv().ChooseTeam, "Marine") then
                for i, v in pairs(
                    getconnections(
                        game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton.Activated
                    )
                ) do
                    v.Function()
                end
            else
                for i, v in pairs(
                    getconnections(
                        game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Activated
                    )
                ) do
                    v.Function()
                end
            end
        end
    end
until game.Players.LocalPlayer.Team ~= nil and game:IsLoaded()

wait(5)

local RAMAccount = loadstring(game:HttpGet "https://raw.githubusercontent.com/ic3w0lf22/Roblox-Account-Manager/master/RAMAccount.lua")()
local MyAccount = RAMAccount.new(game:GetService "Players".LocalPlayer.Name)

if MyAccount then
local Vktuoidz = (function()
    local ddd = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_")
    local sw = {}
    local tuoi = ddd:InvokeServer("getInventory")
    for i, v in pairs(tuoi) do
        if v.Rarity == 3 and v.Type == "Wear" and v.Name == "Valkyrie Helm" then
            return "-VK"
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
                    return "-leopard"
                end
            end
        end
    end
    return ""
end)
local leopardd1 = (function()
    local ddd =  game:GetService("Players").LocalPlayer.Data.DevilFruit.Value
    if ddd == "Leopard-Leopard" then
		return "-LEOPARD"
    end
    return ""
end)
local MFtuoidz = (function()
    local ddd = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_")
    local sw = {}
    local tuoi = ddd:InvokeServer("getInventory")
    for i, v in pairs(tuoi) do
        if v.Rarity == 4 and v.Type == "Material" and v.Name == "Mirror Fractal"  then
            return "-MF"
        end
    end
    return ""
end)
    function CheckItem(Item)
        have = false

        for i, v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory")) do
            if v.Name == Item then
                have = true

                for i2, v2 in pairs(v) do
                    print(i2, v2)

                    if type(v2) == "table" then
                        for i3, v3 in pairs(v2) do
                            print(i2, v2)
                        end
                    end
                end
            end
        end

        for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("Tool") and v.Name == Item then
                have = true
            end
        end

        for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") and v.Name == Item then
                have = true
            end
        end

        return have
    end

    function checkCDK()
        textreturn = ""

        if CheckItem("Cursed Dual Katana") == true then
            textreturn = "-CDK"
        end

        return textreturn
    end

    function checkSG()
        textreturn = ""

        if CheckItem("Soul Guitar") == true then
            textreturn = "-SG"
        end

        return textreturn
    end

    function checkMelee()
        local MeleeList = {"Superhuman", "ElectricClaw", "DragonTalon", "SharkmanKarate", "DeathStep", "Godhuman"}
        Meleecount = 0
        for i, v in pairs(MeleeList) do
            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buy" .. v, true) == 1 then
                Meleecount = Meleecount + 1
                print(v)
            end
        end
        return Meleecount
    end
	
    function checkLeopard()
        local hasLeopard = false
        for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryFruits")) do
            if v.Price >= 5000000 then  
                hasLeopard = true
            end
        end

        if hasLeopard then
            return "-Leopard"
        else
            return ""
        end
    end

	function checkMochi()
		-- kiem tra neu nhu dung trai mochi
		if game:GetService("Players").LocalPlayer.Data.DevilFruit.Value == "Dough-Dough" then
			
			local Awaked = 0
			local AwakedAbilComF = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getAwakenedAbilities")
			if AwakedAbilComF then 
				for i, v in pairs(AwakedAbilComF) do 
					if v["Awakened"] then 
						Awaked = Awaked + 1 
					end 
				end
			end

			FullAwakeCheck = false

			if Awaked == 6 then
				FullAwakeCheck = true
			end

			if FullAwakeCheck then
				return "-Mochi [V2]"
			else
				return "-Mochi [".. Awaked .."/6]"
			end
		else
			return ""
		end
	end

    while wait() do
        MyAccount:SetAlias(game.Players.LocalPlayer.Data.Level.Value .. "-" .. checkMelee() .. checkCDK() .. checkSG() .. checkMochi()  .. Vktuoidz() .. MFtuoidz() .. leopardd() .. leopardd1())
        wait(120)
    end
end
