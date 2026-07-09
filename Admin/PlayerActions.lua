--[[
    Admin/PlayerActions.lua
    Управление игровыми параметрами персонажа для тестирования
    (здоровье, скорость, прыжок и т.д.)
]]

local PlayerActions = {}

local function getHumanoid(player: Player): Humanoid?
    local character = player.Character
    return character and character:FindFirstChildOfClass("Humanoid")
end

function PlayerActions.SetWalkSpeed(player: Player, speed: number)
    local humanoid = getHumanoid(player)
    if not humanoid then return false, "Нет Humanoid" end
    humanoid.WalkSpeed = speed
    return true
end

function PlayerActions.SetJumpPower(player: Player, power: number)
    local humanoid = getHumanoid(player)
    if not humanoid then return false, "Нет Humanoid" end
    humanoid.UseJumpPower = true
    humanoid.JumpPower = power
    return true
end

function PlayerActions.SetHealth(player: Player, health: number)
    local humanoid = getHumanoid(player)
    if not humanoid then return false, "Нет Humanoid" end
    humanoid.Health = math.clamp(health, 0, humanoid.MaxHealth)
    return true
end

function PlayerActions.ResetToDefaults(player: Player)
    local humanoid = getHumanoid(player)
    if not humanoid then return false, "Нет Humanoid" end
    humanoid.WalkSpeed = 16
    humanoid.JumpPower = 50
    humanoid.Health = humanoid.MaxHealth
    return true
end

return PlayerActions
