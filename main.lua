-- [ Настройки ключа и репозитория ] --
local VALID_KEY = "Bladya2026" -- Сюда впиши свой секретный ключ
local MENU_URL = "https://raw.githubusercontent.com/bblodik/RoyalHigh/main/src/menu.lua"

-- [ Логика загрузки меню ] --
local function loadMenu()
    local success, result = pcall(function()
        -- Подтягиваем код с GitHub
        return loadstring(game:HttpGet(MENU_URL))()
    end)
    
    if not success then
        warn("Ошибка при загрузке menu.lua: " .. tostring(result))
    end
end

-- [ Создание UI для ключа ] --
local CoreGui = game:GetService("CoreGui")
local KeyGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local KeyInput = Instance.new("TextBox")
local SubmitBtn = Instance.new("TextButton")

-- Защита от дубликатов
if CoreGui:FindFirstChild("RoyalHighKeySystem") then
    CoreGui.RoyalHighKeySystem:Destroy()
end
KeyGui.Name = "RoyalHighKeySystem"
KeyGui.Parent = CoreGui

-- Дизайн и позиционирование (центр экрана)
MainFrame.Parent = KeyGui
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 300, 0, 150)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "ВВЕДИТЕ КЛЮЧ"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18

KeyInput.Parent = MainFrame
KeyInput.Position = UDim2.new(0.1, 0, 0.35, 0)
KeyInput.Size = UDim2.new(0.8, 0, 0, 35)
KeyInput.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.PlaceholderText = "Секретный ключ..."
KeyInput.Text = ""
KeyInput.Font = Enum.Font.Gotham
KeyInput.TextSize = 14
local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 4)
InputCorner.Parent = KeyInput

SubmitBtn.Parent = MainFrame
SubmitBtn.Position = UDim2.new(0.25, 0, 0.65, 0)
SubmitBtn.Size = UDim2.new(0.5, 0, 0, 35)
SubmitBtn.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.Text = "ВОЙТИ"
SubmitBtn.Font = Enum.Font.GothamBold
SubmitBtn.TextSize = 14
local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 4)
BtnCorner.Parent = SubmitBtn

-- [ Обработка нажатия ] --
SubmitBtn.MouseButton1Click:Connect(function()
    if KeyInput.Text == VALID_KEY then
        SubmitBtn.Text = "УСПЕШНО"
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(85, 255, 127)
        task.wait(0.5)
        KeyGui:Destroy() -- Закрываем окно ключа
        loadMenu()       -- Запускаем меню с GitHub
    else
        SubmitBtn.Text = "ОШИБКА"
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(255, 85, 85)
        KeyInput.Text = ""
        task.wait(1)
        SubmitBtn.Text = "ВОЙТИ"
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
    end
end)