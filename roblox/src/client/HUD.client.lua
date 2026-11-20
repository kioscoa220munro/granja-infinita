-- Interfaz temporal del prototipo. La interfaz no decide ni entrega recursos.
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local remotes = ReplicatedStorage:WaitForChild("GranjaRemotes")
local RequestAction = remotes:WaitForChild("RequestAction")
local StateUpdate = remotes:WaitForChild("StateUpdate")

local gui = Instance.new("ScreenGui")
gui.Name = "GranjaInfinitaHUD"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local panel = Instance.new("Frame")
panel.Name = "Panel"
panel.Size = UDim2.fromOffset(300, 220)
panel.Position = UDim2.new(0, 18, 0.5, -110)
panel.BackgroundColor3 = Color3.fromRGB(27, 54, 39)
panel.BorderSizePixel = 0
panel.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 14)
corner.Parent = panel

local function makeLabel(name, text, y, height)
    local label = Instance.new("TextLabel")
    label.Name = name
    label.Size = UDim2.new(1, -24, 0, height or 30)
    label.Position = UDim2.fromOffset(12, y)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.GothamBold
    label.TextSize = 16
    label.TextColor3 = Color3.fromRGB(245, 247, 230)
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Text = text
    label.Parent = panel
    return label
end

makeLabel("Title", "GRANJA INFINITA", 10, 28)
local stats = makeLabel("Stats", "Cargando granja...", 45, 62)
stats.TextWrapped = true
stats.TextYAlignment = Enum.TextYAlignment.Top

local hatch = Instance.new("TextButton")
hatch.Name = "HatchButton"
hatch.Size = UDim2.new(1, -24, 0, 38)
hatch.Position = UDim2.fromOffset(12, 116)
hatch.BackgroundColor3 = Color3.fromRGB(180, 211, 83)
hatch.TextColor3 = Color3.fromRGB(27, 54, 39)
hatch.Font = Enum.Font.GothamBold
hatch.TextSize = 15
hatch.Text = "INCUBAR 10 HUEVOS"
hatch.Parent = panel
Instance.new("UICorner", hatch).CornerRadius = UDim.new(0, 9)

local sell = Instance.new("TextButton")
sell.Name = "SellButton"
sell.Size = UDim2.new(1, -24, 0, 38)
sell.Position = UDim2.fromOffset(12, 164)
sell.BackgroundColor3 = Color3.fromRGB(246, 199, 91)
sell.TextColor3 = Color3.fromRGB(50, 43, 25)
sell.Font = Enum.Font.GothamBold
sell.TextSize = 15
sell.Text = "VENDER HUEVOS"
sell.Parent = panel
Instance.new("UICorner", sell).CornerRadius = UDim.new(0, 9)

hatch.Activated:Connect(function()
    RequestAction:FireServer("Hatch")
end)

sell.Activated:Connect(function()
    RequestAction:FireServer("SellEggs")
end)

StateUpdate.OnClientEvent:Connect(function(state)
    stats.Text = string.format(
        "Monedas: %d\nHuevos: %d\nGallinas: %d\nProducción: %d huevos/min",
        state.Coins or 0,
        state.Eggs or 0,
        state.Chickens or 0,
        state.EggsPerMinute or 0
    )

    if (state.IncubatingUntil or 0) > (state.ServerTime or 0) then
        hatch.Text = "INCUBANDO..."
    else
        hatch.Text = "INCUBAR 10 HUEVOS"
    end
end)
