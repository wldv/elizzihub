--// ElizziHub

if game.CoreGui:FindFirstChild("FarmGui") then
    game.CoreGui.FarmGui:Destroy()
end

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local TARGET_POSITION = Vector3.new(21163, 64, -772)

local farmEnabled = false
local minimized = false

local function startFarm()
    getgenv().farm = true

    task.spawn(function()
        while getgenv().farm do
            local character = player.Character or player.CharacterAdded:Wait()

            if character and character:FindFirstChild("HumanoidRootPart") then
                character:PivotTo(CFrame.new(TARGET_POSITION))
            end

            task.wait(1)
        end
    end)
end

local function stopFarm()
    getgenv().farm = false
end

--// COLORS
local Background = Color3.fromRGB(17, 17, 25)
local Panel = Color3.fromRGB(25, 25, 37)
local Purple = Color3.fromRGB(145, 85, 255)
local White = Color3.fromRGB(245, 245, 255)
local Gray = Color3.fromRGB(135, 135, 155)
local Red = Color3.fromRGB(235, 75, 95)
local Green = Color3.fromRGB(65, 210, 140)

--// GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FarmGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game.CoreGui

--// MAIN FRAME
local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.new(0, 310, 0, 205)
Main.Position = UDim2.new(0.5, -155, 0.5, -102)
Main.BackgroundColor3 = Background
Main.BorderSizePixel = 0
Main.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = Main

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Purple
MainStroke.Thickness = 1.4
MainStroke.Transparency = 0.35
MainStroke.Parent = Main

--// HEADER
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 48)
Header.BackgroundColor3 = Panel
Header.BorderSizePixel = 0
Header.Parent = Main

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 14)
HeaderCorner.Parent = Header

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -90, 1, 0)
Title.Position = UDim2.new(0, 16, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "ElizziHub"
Title.TextColor3 = White
Title.TextSize = 19
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

local Minimize = Instance.new("TextButton")
Minimize.Size = UDim2.new(0, 30, 0, 30)
Minimize.Position = UDim2.new(1, -40, 0, 9)
Minimize.BackgroundColor3 = Color3.fromRGB(43, 39, 60)
Minimize.Text = "—"
Minimize.TextColor3 = White
Minimize.TextSize = 20
Minimize.Font = Enum.Font.GothamBold
Minimize.BorderSizePixel = 0
Minimize.Parent = Header

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 8)
MinCorner.Parent = Minimize

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(1, -30, 0, 25)
Subtitle.Position = UDim2.new(0, 16, 0, 58)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "AUTOMATION  •  FARM SYSTEM"
Subtitle.TextColor3 = Gray
Subtitle.TextSize = 10
Subtitle.Font = Enum.Font.GothamBold
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.Parent = Main

local FarmPanel = Instance.new("Frame")
FarmPanel.Size = UDim2.new(1, -28, 0, 85)
FarmPanel.Position = UDim2.new(0, 14, 0, 94)
FarmPanel.BackgroundColor3 = Panel
FarmPanel.BorderSizePixel = 0
FarmPanel.Parent = Main

local FarmCorner = Instance.new("UICorner")
FarmCorner.CornerRadius = UDim.new(0, 11)
FarmCorner.Parent = FarmPanel

local FarmTitle = Instance.new("TextLabel")
FarmTitle.Size = UDim2.new(0.6, 0, 0, 25)
FarmTitle.Position = UDim2.new(0, 13, 0, 12)
FarmTitle.BackgroundTransparency = 1
FarmTitle.Text = "Auto Farm"
FarmTitle.TextColor3 = White
FarmTitle.TextSize = 15
FarmTitle.Font = Enum.Font.GothamBold
FarmTitle.TextXAlignment = Enum.TextXAlignment.Left
FarmTitle.Parent = FarmPanel

local FarmDescription = Instance.new("TextLabel")
FarmDescription.Size = UDim2.new(0.7, 0, 0, 20)
FarmDescription.Position = UDim2.new(0, 13, 0, 37)
FarmDescription.BackgroundTransparency = 1
FarmDescription.Text = "Teleport automation"
FarmDescription.TextColor3 = Gray
FarmDescription.TextSize = 11
FarmDescription.Font = Enum.Font.Gotham
FarmDescription.TextXAlignment = Enum.TextXAlignment.Left
FarmDescription.Parent = FarmPanel


local Toggle = Instance.new("TextButton")
Toggle.Size = UDim2.new(0, 83, 0, 34)
Toggle.Position = UDim2.new(1, -96, 0.5, -17)
Toggle.BackgroundColor3 = Red
Toggle.Text = "OFF"
Toggle.TextColor3 = White
Toggle.TextSize = 13
Toggle.Font = Enum.Font.GothamBold
Toggle.BorderSizePixel = 0
Toggle.AutoButtonColor = false
Toggle.Parent = FarmPanel

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 8)
ToggleCorner.Parent = Toggle

--// STATUS
local Status = Instance.new("TextLabel")
Status.Size = UDim2.new(1, -30, 0, 18)
Status.Position = UDim2.new(0, 16, 1, -25)
Status.BackgroundTransparency = 1
Status.Text = "Script is disabled"
Status.TextColor3 = Gray
Status.TextSize = 10
Status.Font = Enum.Font.Gotham
Status.TextXAlignment = Enum.TextXAlignment.Left
Status.Parent = Main

Toggle.MouseButton1Click:Connect(function()
    farmEnabled = not farmEnabled

    if farmEnabled then
        startFarm()

        Toggle.Text = "ON"
        Status.Text = "Script is running"
        Status.TextColor3 = Green

        TweenService:Create(Toggle, TweenInfo.new(0.2), {
            BackgroundColor3 = Green
        }):Play()
    else
        stopFarm()

        Toggle.Text = "OFF"
        Status.Text = "Script is disabled"
        Status.TextColor3 = Gray

        TweenService:Create(Toggle, TweenInfo.new(0.2), {
            BackgroundColor3 = Red
        }):Play()
    end
end)


Minimize.MouseButton1Click:Connect(function()
    minimized = not minimized

    if minimized then
        FarmPanel.Visible = false
        Subtitle.Visible = false
        Status.Visible = false

        TweenService:Create(Main, TweenInfo.new(0.25), {
            Size = UDim2.new(0, 310, 0, 48)
        }):Play()

        Minimize.Text = "+"
    else
        Main.Size = UDim2.new(0, 310, 0, 48)
        FarmPanel.Visible = true
        Subtitle.Visible = true
        Status.Visible = true

        TweenService:Create(Main, TweenInfo.new(0.25), {
            Size = UDim2.new(0, 310, 0, 205)
        }):Play()

        Minimize.Text = "—"
    end
end)

local dragging = false
local dragStart
local startPosition

Header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then

        dragging = true
        dragStart = input.Position
        startPosition = Main.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch
    ) then

        local delta = input.Position - dragStart

        Main.Position = UDim2.new(
            startPosition.X.Scale,
            startPosition.X.Offset + delta.X,
            startPosition.Y.Scale,
            startPosition.Y.Offset + delta.Y
        )
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)