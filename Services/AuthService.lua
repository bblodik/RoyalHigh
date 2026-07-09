--[[
    Services/AuthService.lua
    Отвечает ТОЛЬКО за вопрос "имеет ли этот Player право на доступ".
    Не знает ничего про UI и про конкретные admin-функции.
]]

local RunService = game:GetService("RunService")

local AdminConfig = require(script.Parent.Parent.Config.AdminConfig)

local AuthService = {}

-- Возвращает ранг игрока ("tester" | "admin" | "owner") или nil, если нет доступа
function AuthService.GetRank(player: Player): string?
    if AdminConfig.Settings.AllowInStudioAlways and RunService:IsStudio() then
        return "owner"
    end

    return AdminConfig.AuthorizedUsers[player.UserId]
end

function AuthService.HasAccess(player: Player): boolean
    return AuthService.GetRank(player) ~= nil
end

-- Проверка "достаточно ли ранга" с учётом иерархии AdminConfig.RankOrder
function AuthService.HasAtLeastRank(player: Player, requiredRank: string): boolean
    local rank = AuthService.GetRank(player)
    if not rank then
        return false
    end

    local order = AdminConfig.RankOrder
    local rankIndex, requiredIndex

    for i, r in ipairs(order) do
        if r == rank then rankIndex = i end
        if r == requiredRank then requiredIndex = i end
    end

    return rankIndex ~= nil and requiredIndex ~= nil and rankIndex >= requiredIndex
end

return AuthService
