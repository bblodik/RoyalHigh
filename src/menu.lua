-- [ Инициализация главного меню ] --
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local MenuGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local SpeedBtn = Instance.new("TextButton")
local JumpBtn = Instance.new("TextButton")
local CloseBtn = Instance.new("TextButton")

-- Защита от дубликатов
if CoreGui:FindFirstChild("RoyalHighMenu") then
    CoreGui.RoyalHighMenu:Destroy()
end
MenuGui.Name = "RoyalHighMenu"
MenuGui.Parent = CoreGui

-- Дизайн главного окна
MainFrame.Parent = MenuGui
MainFrame.Position = UDim2.new(0.1, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0, 250, 0, 200)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.Active = true
MainFrame.Draggable = true -- Делаем меню перемещаемым

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "ROYAL HIGH MENU"
Title.TextColor3 = Color3.fromRGB(170, 85, 255)
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 16

-- Кнопка: Быстрый бег
SpeedBtn.Parent = MainFrame
SpeedBtn.Position = UDim2.new(0.1, 0, 0.25, 0)
SpeedBtn.Size = UDim2.new(0.8, 0, 0, 35)
SpeedBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
SpeedBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedBtn.Text = "WalkSpeed: 50"
SpeedBtn.Font = Enum.Font.Gotham
SpeedBtn.TextSize = 14
Instance.new("UICorner", SpeedBtn).CornerRadius = UDim.new(0, 4)

SpeedBtn.MouseButton1Click:Connect(function()
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoid = character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = 50
    end
end)

-- Кнопка: Высокий прыжок
JumpBtn.Parent = MainFrame
JumpBtn.Position = UDim2.new(0.1, 0, 0.5, 0)
JumpBtn.Size = UDim2.new(0.8, 0, 0, 35)
JumpBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
JumpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
JumpBtn.Text = "JumpPower: 100"
JumpBtn.Font = Enum.Font.Gotham
JumpBtn.TextSize = 14
Instance.new("UICorner", JumpBtn).CornerRadius = UDim.new(0, 4)

JumpBtn.MouseButton1Click:Connect(function()
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoid = character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.UseJumpPower = true
        humanoid.JumpPower = 100
    end
end)

-- Кнопка: Закрыть меню
CloseBtn.Parent = MainFrame
CloseBtn.Position = UDim2.new(0.1, 0, 0.75, 0)
CloseBtn.Size = UDim2.new(0.8, 0, 0, 35)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 85, 85)
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Text = "Закрыть скрипт"
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 14
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 4)

CloseBtn.MouseButton1Click:Connect(function()
    MenuGui:Destroy()
end)