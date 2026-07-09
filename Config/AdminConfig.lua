--[[
    Config/AdminConfig.lua
    Единственный источник правды по доступам.
    Редактируется только владельцем места (Studio -> этот файл).
    Никаких запросов во внешние сервисы для проверки прав — всё локально.
]]

local AdminConfig = {}

-- UserId -> уровень доступа ("owner" | "admin" | "tester")
AdminConfig.AuthorizedUsers = {
    -- [123456789] = "owner",
    -- [987654321] = "tester",
}

-- Иерархия уровней (чем выше индекс, тем больше прав)
AdminConfig.RankOrder = { "tester", "admin", "owner" }

-- Флаги окружения
AdminConfig.Settings = {
    AllowInStudioAlways = true,   -- в Studio любой может открыть панель для теста
    LogAccessAttempts = true,
}

return AdminConfig
