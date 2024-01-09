M = {
    name = "BetterControl",
    ready = false,
}

function onPlayerAction(self, action, consumer, wrapped)
    local actionName = action:GetName().value
    local modName, modAction = string.match(actionName, "^CET/(.+)/(.+)$")
    if not modName or not modAction then
        return wrapped(action, consumer)
    end

    local mod = GetMods()[modName]
    if not mod then
        return wrapped(action, consumer)
    end
    local handler = mod.inputHandlers[modAction]
    if not handler then
        return wrapped(action, consumer)
    end
    local isPressed = (action:GetType() == gameinputActionType.BUTTON_PRESSED)
    handler.callback(isPressed)
end

registerForEvent("onInit", function()
    Override("SettingsMainGameController", "IsBlockedByActionWithoutAssignedKey", function() return false end) -- Allow unbound actions
    Override("PlayerPuppet", "OnAction", onPlayerAction)

    M.ready = true
end)

return M
