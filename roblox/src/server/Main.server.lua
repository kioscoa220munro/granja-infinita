-- GRANJA INFINITA — prototipo server-authoritative.
-- Toda modificación de monedas, huevos y gallinas ocurre en el servidor.

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DataStoreService = game:GetService("DataStoreService")

local Config = require(ReplicatedStorage:WaitForChild("Shared"):WaitForChild("GameConfig"))
local Store = DataStoreService:GetDataStore(Config.DataStoreName)

local remotesFolder = ReplicatedStorage:FindFirstChild("GranjaRemotes")
if not remotesFolder then
    remotesFolder = Instance.new("Folder")
    remotesFolder.Name = "GranjaRemotes"
    remotesFolder.Parent = ReplicatedStorage
end

local function getRemote(name)
    local remote = remotesFolder:FindFirstChild(name)
    if not remote then
        remote = Instance.new("RemoteEvent")
        remote.Name = name
        remote.Parent = remotesFolder
    end
    return remote
end

local RequestAction = getRemote("RequestAction")
local StateUpdate = getRemote("StateUpdate")

local profiles = {}
local lastActionAt = {}
local HATCH_ACTION_COOLDOWN = 2
local SELL_ACTION_COOLDOWN = 1

local function newProfile()
    return {
        Coins = 0,
        Eggs = Config.StartingEggs,
        Chickens = 0,
        IncubatingUntil = 0,
        LastProductionAt = os.time(),
        LastSeenAt = os.time(),
    }
end

local function sanitize(data)
    if type(data) ~= "table" then
        return newProfile()
    end

    local clean = newProfile()
    clean.Coins = math.max(0, math.floor(tonumber(data.Coins) or 0))
    clean.Eggs = math.max(0, math.floor(tonumber(data.Eggs) or Config.StartingEggs))
    clean.Chickens = math.max(0, math.floor(tonumber(data.Chickens) or 0))
    clean.IncubatingUntil = math.max(0, math.floor(tonumber(data.IncubatingUntil) or 0))
    clean.LastProductionAt = math.max(0, math.floor(tonumber(data.LastProductionAt) or os.time()))
    clean.LastSeenAt = math.max(0, math.floor(tonumber(data.LastSeenAt) or os.time()))
    return clean
end

local function applyOfflineProduction(profile)
    local now = os.time()
    local elapsed = math.clamp(now - (profile.LastProductionAt or now), 0, Config.MaxOfflineSeconds)
    local wholeMinutes = math.floor(elapsed / 60)
    profile.Eggs += wholeMinutes * profile.Chickens * Config.EggsPerChickenPerMinute
    profile.LastProductionAt = now
end

local function sendState(player)
    local profile = profiles[player]
    if not profile then return end

    StateUpdate:FireClient(player, {
        Coins = profile.Coins,
        Eggs = profile.Eggs,
        Chickens = profile.Chickens,
        IncubatingUntil = profile.IncubatingUntil,
        EggsPerMinute = profile.Chickens * Config.EggsPerChickenPerMinute,
        ServerTime = os.time(),
    })
end

local function savePlayer(player)
    local profile = profiles[player]
    if not profile then return end

    local snapshot = table.clone(profile)
    snapshot.LastSeenAt = os.time()

    local success, err = pcall(function()
        Store:UpdateAsync("player_" .. player.UserId, function()
            return snapshot
        end)
    end)

    if not success then
        warn("[GranjaInfinita] No se pudo guardar a " .. player.Name .. ": " .. tostring(err))
    end
end

Players.PlayerAdded:Connect(function(player)
    local loaded
    local success, result = pcall(function()
        return Store:GetAsync("player_" .. player.UserId)
    end)

    if success then
        loaded = sanitize(result)
    else
        warn("[GranjaInfinita] Error al cargar datos de " .. player.Name .. "; se usa perfil temporal.")
        loaded = newProfile()
    end

    applyOfflineProduction(loaded)
    profiles[player] = loaded
    sendState(player)
end)

Players.PlayerRemoving:Connect(function(player)
    savePlayer(player)
    profiles[player] = nil
    lastActionAt[player] = nil
end)

RequestAction.OnServerEvent:Connect(function(player, action)
    if type(action) ~= "string" then return end
    local profile = profiles[player]
    if not profile then return end

    local now = os.clock()
    local previous = lastActionAt[player] or 0

    if action == "Hatch" then
        if now - previous < HATCH_ACTION_COOLDOWN then return end
        lastActionAt[player] = now

        if profile.IncubatingUntil > os.time() then
            sendState(player)
            return
        end
        if profile.Eggs < Config.EggsPerChicken then
            sendState(player)
            return
        end

        profile.Eggs -= Config.EggsPerChicken
        profile.IncubatingUntil = os.time() + Config.HatchDurationSeconds
        sendState(player)

    elseif action == "SellEggs" then
        if now - previous < SELL_ACTION_COOLDOWN then return end
        lastActionAt[player] = now

        local quantity = profile.Eggs
        if quantity <= 0 then
            sendState(player)
            return
        end

        profile.Eggs = 0
        profile.Coins += quantity * Config.EggSellPrice
        sendState(player)
    end
end)

task.spawn(function()
    while true do
        task.wait(1)
        local now = os.time()

        for player, profile in pairs(profiles) do
            if profile.IncubatingUntil > 0 and now >= profile.IncubatingUntil then
                profile.IncubatingUntil = 0
                profile.Chickens += 1
                profile.LastProductionAt = now
                sendState(player)
            end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(60)
        local now = os.time()

        for player, profile in pairs(profiles) do
            local elapsedMinutes = math.floor((now - profile.LastProductionAt) / 60)
            if elapsedMinutes > 0 then
                profile.Eggs += elapsedMinutes * profile.Chickens * Config.EggsPerChickenPerMinute
                profile.LastProductionAt += elapsedMinutes * 60
                sendState(player)
            end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(Config.AutosaveSeconds)
        for player in pairs(profiles) do
            savePlayer(player)
        end
    end
end)

game:BindToClose(function()
    for player in pairs(profiles) do
        savePlayer(player)
    end
end)
