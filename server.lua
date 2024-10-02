
-- Load the configuration file using LoadResourceFile
local configFile = LoadResourceFile(GetCurrentResourceName(), "config.lua")
assert(load(configFile))()

-- Function to send notification to all players
local function sendNotificationToAllPlayers(message)
    for _, playerId in ipairs(GetPlayers()) do
        TriggerClientEvent('chat:addMessage', playerId, {
            color = {255, 0, 0},
            multiline = true,
            args = {"Random Encounter", message}
        })
    end
end

-- Function to spawn enemies based on player count or difficulty
function spawnEnemies(encounterType)
    local npcCount = math.random(Config.NPCCountRange.Min, Config.NPCCountRange.Max)
    local playerCount = #GetPlayers()

    if Config.DynamicEnemyScaling then
        npcCount = npcCount * playerCount
    end

    for i = 1, npcCount do
        local spawnPoint = Config.SpawnPoints[math.random(#Config.SpawnPoints)]
        local ped = CreatePed(28, "a_m_m_skater_01", spawnPoint.x, spawnPoint.y, spawnPoint.z, true, true)

        if encounterType == "Aggressive" or encounterType == "Ambush" then
            TaskCombatPed(ped, GetPlayerPed(-1), 0, 16)  -- Aggressive and Ambush scenarios
        elseif encounterType == "Neutral" then
            TaskWanderStandard(ped, true, true)  -- Neutral scenario
        elseif encounterType == "TreasureHunt" then
            TaskWanderStandard(ped, true, true)  -- Treasure Hunt scenario (NPCs just wander)
        else
            TaskStandStill(ped, -1)  -- Peaceful scenario, NPCs do nothing
        end
    end
end

-- Function to trigger the encounter without any time checks
function triggerRandomEncounter()
    local chance = math.random(1, 10)

    if chance <= Config.EncounterProbability then
        local encounterType = Config.EncounterTypes[math.random(1, 5)]
        spawnEnemies(encounterType)

        -- Notification based on encounter type
        local notification = Config.Scenarios[encounterType]
        sendNotificationToAllPlayers(notification)
    else
        sendNotificationToAllPlayers("Nothing seems to happen...")
    end
end

-- Command to trigger the encounter manually
RegisterCommand("randomencounter", function(source, args, rawCommand)
    triggerRandomEncounter()
end)

-- Random interval encounter triggers (optional)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(math.random(Config.RandomTimeIntervals.Min * 60000, Config.RandomTimeIntervals.Max * 60000))
        triggerRandomEncounter()
    end
end)
