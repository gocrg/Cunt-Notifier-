--// Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local lp = Players.LocalPlayer
local char = lp.Character or lp.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

-- Flag to prevent notify stacking
local NotifyBusy = false

--// Notify Function (only one allowed at a time)
function Notify(titletxt, text, time)
    if NotifyBusy then return end
    NotifyBusy = true

    local GUI = Instance.new("ScreenGui")
    local Main = Instance.new("Frame", GUI)
    local title = Instance.new("TextLabel", Main)
    local message = Instance.new("TextLabel", Main)

    GUI.Name = "NotificationOof"
    GUI.ResetOnSpawn = false
    GUI.Parent = game.CoreGui

    Main.Name = "MainFrame"
    Main.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Main.BorderSizePixel = 0
    Main.Position = UDim2.new(1, 5, 0, 50)
    Main.Size = UDim2.new(0, 330, 0, 100)

    title.BackgroundColor3 = Color3.new(0, 0, 0)
    title.BackgroundTransparency = 0.9
    title.Size = UDim2.new(1, 0, 0, 30)
    title.Font = Enum.Font.SourceSansSemibold
    title.Text = titletxt
    title.TextColor3 = Color3.new(1, 1, 1)
    title.TextSize = 17

    message.BackgroundColor3 = Color3.new(0, 0, 0)
    message.BackgroundTransparency = 1
    message.Position = UDim2.new(0, 0, 0, 30)
    message.Size = UDim2.new(1, 0, 1, -30)
    message.Font = Enum.Font.SourceSans
    message.Text = text
    message.TextColor3 = Color3.new(1, 1, 1)
    message.TextSize = 16
    message.TextWrapped = true

    task.wait(0.1)
    Main:TweenPosition(UDim2.new(1, -335, 0, 50), "Out", "Sine", 0.4)
    task.wait(time)
    Main:TweenPosition(UDim2.new(1, 5, 0, 50), "Out", "Sine", 0.4)
    task.wait(0.5)
    GUI:Destroy()
    NotifyBusy = false
end

--// Find Nearest Player (Cunt)
function GetNearestCunt()
    local nearestCunt = nil
    local shortestDistance = math.huge

    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= lp and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Humanoid") then
            local dist = (plr.Character.HumanoidRootPart.Position - hrp.Position).Magnitude
            if dist < shortestDistance and dist <= 40 then
                shortestDistance = dist
                nearestCunt = plr
            end
        end
    end

    return nearestCunt
end

--// 40 Cunt Detection Messages
local messages = {
    "There's a cunt breathing way too close to you.\nName: %s\nHealth: %s\nBackpack: %s",
    "Another cunt has entered your zone.\nName: %s\nHealth: %s\nBackpack: %s",
    "Cunt alert. You got company.\nName: %s\nHealth: %s\nBackpack: %s",
    "Ugh, this cunt again?\nName: %s\nHealth: %s\nBackpack: %s",
    "One more cunt pulled up like they own the place.\nName: %s\nHealth: %s\nBackpack: %s",
    "Hey. Look sharp. A certified cunt is nearby.\nName: %s\nHealth: %s\nBackpack: %s",
    "You already know this cunt's gonna cause problems.\nName: %s\nHealth: %s\nBackpack: %s",
    "Cunt approaching your location. Brace yourself.\nName: %s\nHealth: %s\nBackpack: %s",
    "Damn, can't get peace without some cunt sniffin' around.\nName: %s\nHealth: %s\nBackpack: %s",
    "You got unwanted company. A cunt.\nName: %s\nHealth: %s\nBackpack: %s",
    "There they go again. Cunt detected.\nName: %s\nHealth: %s\nBackpack: %s",
    "Cunt vibes increasing nearby.\nName: %s\nHealth: %s\nBackpack: %s",
    "Another random cunt in range. Eyes open.\nName: %s\nHealth: %s\nBackpack: %s",
    "Here comes a fresh cunt with bad intentions.\nName: %s\nHealth: %s\nBackpack: %s",
    "This one thinks they're slick. Nah. Cunt.\nName: %s\nHealth: %s\nBackpack: %s",
    "Area breach by some cunt. Deal with it.\nName: %s\nHealth: %s\nBackpack: %s",
    "You've been located by a wandering cunt.\nName: %s\nHealth: %s\nBackpack: %s",
    "This cunt probably packing something dumb.\nName: %s\nHealth: %s\nBackpack: %s",
    "They brought their whole ego. Cunt detected.\nName: %s\nHealth: %s\nBackpack: %s",
    "Random cunt just entered your personal space.\nName: %s\nHealth: %s\nBackpack: %s",
    "You really can't go anywhere without a cunt showing up.\nName: %s\nHealth: %s\nBackpack: %s",
    "Yup. Another waste of air nearby. Cunt mode.\nName: %s\nHealth: %s\nBackpack: %s",
    "You hear that? That’s a cunt creeping in.\nName: %s\nHealth: %s\nBackpack: %s",
    "Local cunt thinks this is their turf.\nName: %s\nHealth: %s\nBackpack: %s",
    "Incoming cunt. Don’t say I didn’t warn you.\nName: %s\nHealth: %s\nBackpack: %s",
    "They’re back. And yep, still a cunt.\nName: %s\nHealth: %s\nBackpack: %s",
    "Something's off. Probably a cunt lurking.\nName: %s\nHealth: %s\nBackpack: %s",
    "A cunt’s trying to be sneaky.\nName: %s\nHealth: %s\nBackpack: %s",
    "Backpack full of trash? Must be a cunt.\nName: %s\nHealth: %s\nBackpack: %s",
    "You smell that? That’s a low effort cunt.\nName: %s\nHealth: %s\nBackpack: %s",
    "Warning: close-range cunt just got closer.\nName: %s\nHealth: %s\nBackpack: %s",
    "This one might swing first. Typical cunt behavior.\nName: %s\nHealth: %s\nBackpack: %s",
    "Get ready. A pissed off cunt is in range.\nName: %s\nHealth: %s\nBackpack: %s",
    "Another day, another dumbass cunt.\nName: %s\nHealth: %s\nBackpack: %s",
    "Cunt has tools. Not brains.\nName: %s\nHealth: %s\nBackpack: %s",
    "They came armed. Still a cunt.\nName: %s\nHealth: %s\nBackpack: %s",
    "Brace yourself for nonsense. Cunt nearby.\nName: %s\nHealth: %s\nBackpack: %s",
    "Cunt has entered the server and the zone.\nName: %s\nHealth: %s\nBackpack: %s",
    "They're packing junk and bad decisions.\nName: %s\nHealth: %s\nBackpack: %s",
    "Say hello to another broke-ass cunt.\nName: %s\nHealth: %s\nBackpack: %s",
    "Oh great. This cunt again. Keep watch.\nName: %s\nHealth: %s\nBackpack: %s",
    "Who invited this loud cunt?\nName: %s\nHealth: %s\nBackpack: %s",
}

--// Loop that checks every few seconds
task.spawn(function()
    while task.wait(3) do
        local cunt = GetNearestCunt()
        if cunt then
            local health = math.floor(cunt.Character:FindFirstChildOfClass("Humanoid").Health)
            local items = {}
            for _, tool in pairs(cunt.Backpack:GetChildren()) do
                if tool:IsA("Tool") then
                    table.insert(items, tool.Name)
                end
            end
            local backpackString = #items > 0 and table.concat(items, ", ") or "Empty"
            local chosen = messages[math.random(1, #messages)]
            local finalMessage = string.format(chosen, cunt.Name, health, backpackString)

            Notify("Cunt Detected", finalMessage, 5)
        end
    end
end)
