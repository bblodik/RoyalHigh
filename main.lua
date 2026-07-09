--[[
    main.lua  (Script, ServerScriptService/AdminSuite)

    Точка входа. Задача этого файла — ТОЛЬКО оркестрация:
        1. Дождаться игрока
        2. Спросить AuthService, есть ли доступ
        3. Если есть — получить список разрешённых команд из CommandRegistry
        4. Отдать их в PanelBuilder

    main.lua не знает КАК проверяются права, КАКИЕ есть команды
    и КАК рисуется UI — это всё инкапсулировано в соответствующих модулях.
    Благодаря этому файл остаётся маленьким и стабильным при росте функционала.
]]

local Players = game:GetService("Players")
local ServerScriptService = game:GetService("ServerScriptService")

local Root = ServerScriptService:WaitForChild("AdminSuite")

local AuthService = require(Root.Services.AuthService)
local CommandRegistry = require(Root.Registry.CommandRegistry)
local PanelBuilder = require(Root.UI.PanelBuilder)
local Utils = require(Root.Services.Utils)

local function onPlayerReady(player: Player)
    if not AuthService.HasAccess(player) then
        return -- обычный игрок, панель не выдаём и не сообщаем о её существовании
    end

    local availableCommands = CommandRegistry.GetAvailableCommands(AuthService, player)

    Utils.SafeCall(function()
        PanelBuilder.Build(player, availableCommands)
    end)
end

local function onPlayerAdded(player: Player)
    -- Ждём персонажа, т.к. часть команд (телепорт, параметры) требуют Character
    if player.Character then
        onPlayerReady(player)
    else
        player.CharacterAdded:Connect(function()
            onPlayerReady(player)
        end)
    end
end

Players.PlayerAdded:Connect(onPlayerAdded)

for _, player in ipairs(Players:GetPlayers()) do
    onPlayerAdded(player)
end
