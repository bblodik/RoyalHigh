--[[
    Admin/TeleportActions.lua
    Функции телепортации для тестирования уровней/зон.
    Каждая функция принимает player, которого перемещаем, и опциональные аргументы.
]]

local Utils = require(script.Parent.Parent.Services.Utils)

local TeleportActions = {}

-- Точки телепортации задаются как модель/Folder в Workspace с частями-маркерами,
-- либо здесь статическим списком координат — что удобнее для вашей игры.
TeleportActions.NamedLocations = {
    Spawn = CFrame.new(0, 5, 0),
    -- TestZoneA = CFrame.new(120, 10, -45),
}

function TeleportActions.TeleportToPosition(player: Player, cframe: CFrame)
    local character = player.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then
        return false, "У игрока нет активного персонажа"
    end

    character:PivotTo(cframe)
    return true
end

function TeleportActions.TeleportToNamed(player: Player, locationName: string)
    local cframe = TeleportActions.NamedLocations[locationName]
    if not cframe then
        return false, "Неизвестная локация: " .. tostring(locationName)
    end
    return TeleportActions.TeleportToPosition(player, cframe)
end

function TeleportActions.TeleportToPlayer(fromPlayer: Player, targetName: string)
    local target = Utils.FindPlayerByPartialName(targetName)
    if not target or not target.Character then
        return false, "Целевой игрок не найден"
    end
    return TeleportActions.TeleportToPosition(fromPlayer, target.Character:GetPivot())
end

return TeleportActions
