--[[
    Registry/CommandRegistry.lua

    Ключевой элемент расширяемости архитектуры.
    UI не вызывает Admin/-модули напрямую — он спрашивает реестр:
    "какие команды доступны игроку с таким рангом?" и вызывает их по имени.

    Чтобы добавить новую фичу в панель:
      1. Написать функцию в Admin/... (или новом модуле)
      2. Зарегистрировать её здесь одной записью
      3. UI подхватит её автоматически, никаких правок в PanelBuilder не нужно
]]

local TeleportActions = require(script.Parent.Parent.Admin.TeleportActions)
local PlayerActions = require(script.Parent.Parent.Admin.PlayerActions)

local CommandRegistry = {}

-- requiredRank сверяется через AuthService.HasAtLeastRank
CommandRegistry.Commands = {
    {
        id = "teleport_spawn",
        label = "Телепорт: Спавн",
        requiredRank = "tester",
        execute = function(player)
            return TeleportActions.TeleportToNamed(player, "Spawn")
        end,
    },
    {
        id = "reset_stats",
        label = "Сбросить параметры",
        requiredRank = "tester",
        execute = function(player)
            return PlayerActions.ResetToDefaults(player)
        end,
    },
    {
        id = "set_speed_50",
        label = "Скорость x3 (тест)",
        requiredRank = "admin",
        execute = function(player)
            return PlayerActions.SetWalkSpeed(player, 48)
        end,
    },
}

function CommandRegistry.GetAvailableCommands(authService, player)
    local available = {}
    for _, command in ipairs(CommandRegistry.Commands) do
        if authService.HasAtLeastRank(player, command.requiredRank) then
            table.insert(available, command)
        end
    end
    return available
end

return CommandRegistry
