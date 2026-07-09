--[[
    UI/PanelBuilder.lua

    Собирает панель ПОСЛЕ успешной авторизации.
    Ничего не знает про AuthService или про то, как проверялся доступ —
    ему просто передают player и список уже отфильтрованных команд.
]]

local Window = require(script.Parent.Components.Window)
local Button = require(script.Parent.Components.Button)

local PanelBuilder = {}

function PanelBuilder.Build(player: Player, commands: {any})
    local playerGui = player:WaitForChild("PlayerGui")

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "AdminSuitePanel"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = playerGui

    local _, content = Window.Create(screenGui, "Admin Suite")

    for index, command in ipairs(commands) do
        local button = Button.Create(content, command.label, function()
            local ok, err = command.execute(player)
            if not ok and err then
                warn(("[AdminSuite] %s: %s"):format(command.id, err))
            end
        end)
        button.LayoutOrder = index
    end

    return screenGui
end

return PanelBuilder
