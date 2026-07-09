--[[
    UI/Components/Button.lua
    Простая переиспользуемая кнопка команды.
]]

local Button = {}

function Button.Create(parent: Instance, label: string, onClick: () -> ())
    local btn = Instance.new("TextButton")
    btn.Name = "CommandButton"
    btn.Size = UDim2.new(1, 0, 0, 32)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 56)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 14
    btn.Text = label
    btn.Parent = parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn

    btn.MouseButton1Click:Connect(onClick)

    return btn
end

return Button
