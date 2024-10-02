
Config = {}

-- Probability of encounter (1 to 10 scale)
Config.EncounterProbability = 5

-- Dynamic enemy scaling based on player count (true or false)
Config.DynamicEnemyScaling = true

-- Time of Day for Encounters
-- Options: "Day", "Night", "Evening", "Random"
Config.EncounterTime = "Random"

-- NPC Count Range for random encounters (min and max number of NPCs)
Config.NPCCountRange = {
    Min = 2,
    Max = 6
}

-- Possible spawn points for encounters
Config.SpawnPoints = {
    { x = -1000.0, y = 500.0, z = 50.0 },
    { x = -900.0, y = 600.0, z = 50.0 },
    { x = -1100.0, y = 700.0, z = 50.0 },
    { x = -1200.0, y = 800.0, z = 50.0 }
}

-- Encounter Types: 1 = Aggressive, 2 = Neutral, 3 = Peaceful, 4 = Ambush, 5 = Treasure Hunt
Config.EncounterTypes = {
    [1] = "Aggressive",
    [2] = "Neutral",
    [3] = "Peaceful",
    [4] = "Ambush",
    [5] = "Treasure Hunt"
}

-- Scenario based settings (randomized scenarios)
Config.Scenarios = {
    Aggressive = "Enemies have appeared! Stay alert!",
    Neutral = "Strangers have arrived, but they seem peaceful.",
    Peaceful = "A quiet moment... No danger in sight.",
    Ambush = "You've been ambushed! Prepare for a fight!",
    TreasureHunt = "A hidden treasure is nearby, find it before others do!"
}

-- Enable advanced AI behavior for enemies (taking cover, etc.)
Config.AdvancedAI = true

-- Time intervals for encounters (in minutes) when using 'Random' mode
Config.RandomTimeIntervals = {
    Min = 10,
    Max = 30
}
