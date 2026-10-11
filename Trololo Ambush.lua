local Creator = loadstring(game:HttpGet(
    "https://pastebin.com/raw/0fSnvfGt"
))()

local SoundService = game:GetService("SoundService")

-- Arrival warning sound
local arrivalSound = Instance.new("Sound")
arrivalSound.Name = "TrololoAmbushArrival"
arrivalSound.SoundId = "rbxassetid://8389041427"
arrivalSound.Volume = 1
arrivalSound.Parent = SoundService

-- Create Trololo Ambush
local entity = Creator.createEntity({
    CustomName = "Trololo Ambush",

    Model = "https://raw.githubusercontent.com/Ilikerobloxdoors/Trololo-Ambush/main/TROLOLO%20AMBUSH.rbxm",

    Speed = 375,
    DelayTime = 4,
    HeightOffset = 0,

    CanKill = true,
    KillRange = 40,

    BreakLights = true,
    BackwardsMovement = false,

    FlickerLights = {
        false,
        1,
    },

    Cycles = {
        Min = 3,
        Max = 7,
        WaitTime = 0.03,
    },

    CamShake = {
        true,
        {5.5, 15, 0.25, 1.2},
        100,
    },

    Jumpscare = {
        true,
        {
            Image1 = "rbxassetid://11824127159",
            Image2 = "rbxassetid://11824127159",

            Shake = false,

            Sound1 = {
                8389041427,
                {Volume = 35},
            },

            Sound2 = {
                8389041427,
                {Volume = 35},
            },

            Flashing = {
                true,
                Color3.fromRGB(0, 255, 64),
            },

            Tease = {
                false,
                Min = 4,
                Max = 4,
            },
        },
    },

    CustomDialog = {
        "You died to Trololo Ambush..."
    },
})

-- Advanced debug callbacks

entity.Debug.OnEntitySpawned = function(entityTable)
    print("Trololo Ambush spawned:", entityTable.Model)
end

entity.Debug.OnEntityDespawned = function(entityTable)
    print("Trololo Ambush despawned:", entityTable.Model)
end

entity.Debug.OnEntityStartMoving = function(entityTable)
    print("Trololo Ambush started moving:", entityTable.Model)
end

entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("Trololo Ambush finished rebound:", entityTable.Model)
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("Trololo Ambush entered room:", room)
end

entity.Debug.OnLookAtEntity = function(entityTable)
    print("Player looked at Trololo Ambush:", entityTable.Model)
end

entity.Debug.OnDeath = function(entityTable)
    warn("Player died to Trololo Ambush.")
end

-- Play the arrival warning before running the entity
arrivalSound:Play()

-- Wait for the warning to finish before spawning
arrivalSound.Ended:Wait()
arrivalSound:Destroy()

-- Run Trololo Ambush
Creator.runEntity(entity)
