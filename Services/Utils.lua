--[[
    Services/Utils.lua
    Небольшие переиспользуемые хелперы, не привязанные к доменной логике.
]]

local Utils = {}

function Utils.SafeCall(fn, ...)
    local ok, err = pcall(fn, ...)
    if not ok then
        warn(("[AdminSuite] Ошибка выполнения: %s"):format(tostring(err)))
    end
    return ok
end

function Utils.FindPlayerByPartialName(input: string): Player?
    input = input:lower()
    for _, plr in ipairs(game:GetService("Players"):GetPlayers()) do
        if plr.Name:lower():sub(1, #input) == input then
            return plr
        end
    end
    return nil
end

return Utils
