-- Valores de prototipo. No son precios ni balance definitivos.
local GameConfig = {
    DataStoreName = "GranjaInfinita_PlayerData_v1",
    StartingEggs = 10,
    EggsPerChicken = 10,
    HatchDurationSeconds = 30, -- reducido para pruebas; ajustar antes del lanzamiento
    EggsPerChickenPerMinute = 1,
    EggSellPrice = 1,
    AutosaveSeconds = 60,
    MaxOfflineSeconds = 60 * 60 * 8,
}

return GameConfig
