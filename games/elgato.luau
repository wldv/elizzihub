--// ElizziHub El Gato Tower by Wldv

if game.CoreGui:FindFirstChild("ElizziHub") then
    game.CoreGui.ElGatoHub:Destroy()
end

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local Player = Players.LocalPlayer


local Speed = 60
local Flying = false
local Minimized = false

local Up = false
local Down = false

local BG = Color3.fromRGB(17,17,25)
local Panel = Color3.fromRGB(27,25,40)
local Purple = Color3.fromRGB(145,85,255)
local White = Color3.fromRGB(245,245,255)
local Green = Color3.fromRGB(65,210,140)
local Red = Color3.fromRGB(235,75,95)
local Gray = Color3.fromRGB(135,135,155)


local Gui = Instance.new("ScreenGui")
Gui.Name = "ElizziHub"
Gui.ResetOnSpawn = false
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Gui.Parent = game.CoreGui

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0,300,0,265)
Main.Position = UDim2.new(0.5,-150,0.5,-132)
Main.BackgroundColor3 = BG
Main.BorderSizePixel = 0
Main.Parent = Gui

Instance.new("UICorner",Main).CornerRadius = UDim.new(0,14)

local Stroke = Instance.new("UIStroke",Main)
Stroke.Color = Purple
Stroke.Thickness = 1.5


local Header = Instance.new("Frame")
Header.Size = UDim2.new(1,0,0,46)
Header.BackgroundColor3 = Panel
Header.BorderSizePixel = 0
Header.Parent = Main

Instance.new("UICorner",Header).CornerRadius = UDim.new(0,14)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,-55,1,0)
Title.Position = UDim2.new(0,14,0,0)
Title.BackgroundTransparency = 1
Title.Text = "ElizziHub"
Title.TextColor3 = White
Title.TextSize = 18
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

local Minimize = Instance.new("TextButton")
Minimize.Size = UDim2.new(0,30,0,30)
Minimize.Position = UDim2.new(1,-39,0,8)
Minimize.BackgroundColor3 = Color3.fromRGB(43,39,60)
Minimize.Text = "—"
Minimize.TextColor3 = White
Minimize.TextSize = 20
Minimize.Font = Enum.Font.GothamBold
Minimize.Parent = Header

Instance.new("UICorner",Minimize).CornerRadius = UDim.new(0,8)


local function Label(text,y)
    local L = Instance.new("TextLabel")
    L.Size = UDim2.new(1,-28,0,22)
    L.Position = UDim2.new(0,14,0,y)
    L.BackgroundTransparency = 1
    L.Text = text
    L.TextColor3 = Gray
    L.TextSize = 11
    L.Font = Enum.Font.GothamBold
    L.TextXAlignment = Enum.TextXAlignment.Left
    L.Parent = Main
    return L
end

local function Button(text,x,y,w,h,color)
    local B = Instance.new("TextButton")
    B.Size = UDim2.new(0,w,0,h)
    B.Position = UDim2.new(0,x,0,y)
    B.BackgroundColor3 = color
    B.Text = text
    B.TextColor3 = White
    B.TextSize = 14
    B.Font = Enum.Font.GothamBold
    B.BorderSizePixel = 0
    B.Parent = Main

    Instance.new("UICorner",B).CornerRadius = UDim.new(0,9)
    return B
end

Label("FLIGHT SCRIPT",55)

local FlyButton = Button("FLY : OFF",14,84,272,40,Red)

local SpeedLabel = Label("FLIGHT SPEED: 60",137)

local Minus = Button("-",14,165,55,34,Panel)
local Plus = Button("+",77,165,55,34,Panel)

local Status = Label("DISABLED",220)


local Controls = Instance.new("Frame")
Controls.Size = UDim2.new(0,75,0,112)
Controls.Position = UDim2.new(1,-95,0.5,-56)
Controls.BackgroundTransparency = 1
Controls.Visible = false
Controls.Parent = Gui

local function HeightButton(text,y)
    local B = Instance.new("TextButton")
    B.Size = UDim2.new(0,65,0,48)
    B.Position = UDim2.new(0,5,0,y)
    B.BackgroundColor3 = Purple
    B.Text = text
    B.TextColor3 = White
    B.TextSize = 23
    B.Font = Enum.Font.GothamBold
    B.Parent = Controls

    Instance.new("UICorner",B).CornerRadius = UDim.new(0,12)
    return B
end

local UpButton = HeightButton("↑",0)
local DownButton = HeightButton("↓",58)

local function BindHeight(button,key)
    button.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
            if key == "Up" then
                Up = true
            else
                Down = true
            end
        end
    end)

    button.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
            if key == "Up" then
                Up = false
            else
                Down = false
            end
        end
    end)
end

BindHeight(UpButton,"Up")
BindHeight(DownButton,"Down")


local Keys = {
    W = false,
    A = false,
    S = false,
    D = false,
    Space = false,
    Ctrl = false
}

UIS.InputBegan:Connect(function(input,processed)
    if processed then return end

    if input.KeyCode == Enum.KeyCode.W then Keys.W = true end
    if input.KeyCode == Enum.KeyCode.A then Keys.A = true end
    if input.KeyCode == Enum.KeyCode.S then Keys.S = true end
    if input.KeyCode == Enum.KeyCode.D then Keys.D = true end
    if input.KeyCode == Enum.KeyCode.Space then Keys.Space = true end

    if input.KeyCode == Enum.KeyCode.LeftControl
    or input.KeyCode == Enum.KeyCode.RightControl then
        Keys.Ctrl = true
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.W then Keys.W = false end
    if input.KeyCode == Enum.KeyCode.A then Keys.A = false end
    if input.KeyCode == Enum.KeyCode.S then Keys.S = false end
    if input.KeyCode == Enum.KeyCode.D then Keys.D = false end
    if input.KeyCode == Enum.KeyCode.Space then Keys.Space = false end

    if input.KeyCode == Enum.KeyCode.LeftControl
    or input.KeyCode == Enum.KeyCode.RightControl then
        Keys.Ctrl = false
    end
end)


local Attachment
local Velocity
local Orientation
local Connection

local function StopFly()
    Flying = false
    Up = false
    Down = false

    for key in pairs(Keys) do
        Keys[key] = false
    end

    if Connection then
        Connection:Disconnect()
        Connection = nil
    end

    if Velocity then
        Velocity:Destroy()
        Velocity = nil
    end

    if Orientation then
        Orientation:Destroy()
        Orientation = nil
    end

    if Attachment then
        Attachment:Destroy()
        Attachment = nil
    end

    
    local Character = Player.Character

    if Character then
        local Root = Character:FindFirstChild("HumanoidRootPart")
        local Humanoid = Character:FindFirstChildOfClass("Humanoid")

        if Root then
            Root.AssemblyLinearVelocity = Vector3.zero
            Root.AssemblyAngularVelocity = Vector3.zero
        end

        if Humanoid then
            Humanoid.PlatformStand = false
            Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
        end
    end

    Controls.Visible = false

    FlyButton.Text = "FLY : OFF"
    FlyButton.BackgroundColor3 = Red

    Status.Text = "DISABLED"
    Status.TextColor3 = Gray
end

local function StartFly()
    local Character = Player.Character
    if not Character then return end

    local Root = Character:FindFirstChild("HumanoidRootPart")
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")

    if not Root or not Humanoid then return end

    Flying = true

    Attachment = Instance.new("Attachment")
    Attachment.Parent = Root

    Velocity = Instance.new("LinearVelocity")
    Velocity.Attachment0 = Attachment
    Velocity.MaxForce = math.huge
    Velocity.VectorVelocity = Vector3.zero
    Velocity.Parent = Root

    Orientation = Instance.new("AlignOrientation")
    Orientation.Attachment0 = Attachment
    Orientation.Mode = Enum.OrientationAlignmentMode.OneAttachment
    Orientation.MaxTorque = math.huge
    Orientation.Responsiveness = 20
    Orientation.Parent = Root

    Controls.Visible = UIS.TouchEnabled

    FlyButton.Text = "FLY : ON"
    FlyButton.BackgroundColor3 = Green

    Status.Text = "FLYING"
    Status.TextColor3 = Green

    Connection = RunService.RenderStepped:Connect(function()
        if not Root.Parent or not Humanoid.Parent then
            StopFly()
            return
        end

        local Camera = workspace.CurrentCamera
        local Direction = Vector3.zero

        
        if UIS.TouchEnabled then
            Direction += Humanoid.MoveDirection
        end

        
        if Keys.W then
            Direction += Camera.CFrame.LookVector
        end

        if Keys.S then
            Direction -= Camera.CFrame.LookVector
        end

        if Keys.A then
            Direction -= Camera.CFrame.RightVector
        end

        if Keys.D then
            Direction += Camera.CFrame.RightVector
        end

        
        local GamepadState = UIS:GetGamepadState(Enum.UserInputType.Gamepad1)

        for _,input in ipairs(GamepadState) do
            if input.KeyCode == Enum.KeyCode.Thumbstick1 then
                local X = input.Position.X
                local Y = input.Position.Y

                if math.abs(X) > 0.15 or math.abs(Y) > 0.15 then
                    Direction += Camera.CFrame.RightVector * X
                    Direction += Camera.CFrame.LookVector * Y
                end
            end

            if input.KeyCode == Enum.KeyCode.ButtonR2 then
                Direction += Vector3.yAxis * input.Position.Z
            end

            if input.KeyCode == Enum.KeyCode.ButtonL2 then
                Direction -= Vector3.yAxis * input.Position.Z
            end
        end

        
        if Up or Keys.Space then
            Direction += Vector3.yAxis
        end

        if Down or Keys.Ctrl then
            Direction -= Vector3.yAxis
        end

        if Direction.Magnitude > 1 then
            Direction = Direction.Unit
        end

        Velocity.VectorVelocity = Direction * Speed
        Orientation.CFrame = Camera.CFrame.Rotation
    end)
end


FlyButton.MouseButton1Click:Connect(function()
    if Flying then
        StopFly()
    else
        StartFly()
    end
end)

Minus.MouseButton1Click:Connect(function()
    Speed = math.max(10,Speed-10)
    SpeedLabel.Text = "FLIGHT SPEED: "..Speed
end)

Plus.MouseButton1Click:Connect(function()
    Speed = math.min(200,Speed+10)
    SpeedLabel.Text = "FLIGHT SPEED: "..Speed
end)


Minimize.MouseButton1Click:Connect(function()
    Minimized = not Minimized

    for _,Object in ipairs(Main:GetChildren()) do
        if Object ~= Header
        and not Object:IsA("UICorner")
        and not Object:IsA("UIStroke") then
            Object.Visible = not Minimized
        end
    end

    Main:TweenSize(
        Minimized and UDim2.new(0,300,0,46)
        or UDim2.new(0,300,0,265),
        Enum.EasingDirection.Out,
        Enum.EasingStyle.Quad,
        0.2,true
    )

    Minimize.Text = Minimized and "+" or "—"
end)


Player.CharacterAdded:Connect(function()
    StopFly()
end)


local Dragging = false
local DragStart
local StartPosition

Header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
    or input.UserInputType == Enum.UserInputType.MouseButton1 then

        Dragging = true
        DragStart = input.Position
        StartPosition = Main.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if Dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then

        local Delta = input.Position - DragStart

        Main.Position = UDim2.new(
            StartPosition.X.Scale,
            StartPosition.X.Offset + Delta.X,
            StartPosition.Y.Scale,
            StartPosition.Y.Offset + Delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
    or input.UserInputType == Enum.UserInputType.MouseButton1 then
        Dragging = false
    end
end)