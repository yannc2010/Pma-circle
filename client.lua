local voiceRanges = {
    [1] = {distance = 1.5, color = {0, 255, 127}},   -- chuchoter (Flash Palm vert)
    [2] = {distance = 3.0, color = {0, 255, 127}},   -- normal (Flash Palm vert)
    [3] = {distance = 6.0, color = {0, 255, 127}}   -- crier (Flash Palm vert)
}

local currentMode = 2  -- par défaut "normal"
local showCircle = false

-- Afficher cercle si la voix change
RegisterNetEvent("pma-voice:setTalkingMode", function(mode)
    currentMode = mode
    showCircle = true

    -- On masque le cercle après quelques secondes (optionnel)
    CreateThread(function()
        Wait(4000)
        showCircle = false
    end)
end)

-- Boucle pour dessiner le cercle
CreateThread(function()
    while true do
        Wait(0)
        if showCircle then
            local playerPed = PlayerPedId()
            local coords = GetEntityCoords(playerPed)
            local info = voiceRanges[currentMode]
            DrawMarker(1, coords.x, coords.y, coords.z - 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, info.distance * 2.0, info.distance * 2.0, 0.2, info.color[1], info.color[2], info.color[3], 100, false, true, 2, false, nil, nil, false)
        end
    end
end)
