--[[
    UI/Components/Window.lua
    Базовый контейнер панели. Максимально простой визуал —
    задача этого модуля дать структуру, а не красоту.
]]

local Window = {}

function Window.Create(parentGui: ScreenGui, title: string)
    local frame = Instance.new("Frame")
    frame.Name = "AdminWindow"
    frame.Size = UDim2.new(0, 260, 0, 360)
    frame.Position = UDim2.new(0.5, -130, 0.5, -180)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 34)
    frame.BorderSizePixel = 0
    frame.Parent = parentGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, 0, 0, 32)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 16
    titleLabel.Parent = frame

    local listLayout = Instance.new("UIListLayout")
    listLayout.Padding = UDim.new(0, 6)
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder

    local content = Instance.new("Frame")
    content.Name = "Content"
    content.Size = UDim2.new(1, -16, 1, -40)
    content.Position = UDim2.new(0, 8, 0, 36)
    content.BackgroundTransparency = 1
    content.Parent = frame
    listLayout.Parent = content

    return frame, content
end

return Window
