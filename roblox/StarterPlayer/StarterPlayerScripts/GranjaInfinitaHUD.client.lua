-- GRANJA INFINITA | HUD inicial
-- Colocar como LocalScript en StarterPlayer > StarterPlayerScripts.
local Players=game:GetService("Players")
local ReplicatedStorage=game:GetService("ReplicatedStorage")
local player=Players.LocalPlayer
local remote=ReplicatedStorage:WaitForChild("GranjaInfinitaRemotes"):WaitForChild("StateUpdate")
local gui=Instance.new("ScreenGui"); gui.Name="GranjaInfinitaHUD"; gui.ResetOnSpawn=false; gui.Parent=player:WaitForChild("PlayerGui")
local panel=Instance.new("Frame"); panel.Name="Panel"; panel.Size=UDim2.fromOffset(310,112); panel.Position=UDim2.new(0,18,0,18)
panel.BackgroundColor3=Color3.fromRGB(35,53,37); panel.BackgroundTransparency=.08; panel.Parent=gui
local corner=Instance.new("UICorner"); corner.CornerRadius=UDim.new(0,14); corner.Parent=panel
local stroke=Instance.new("UIStroke"); stroke.Color=Color3.fromRGB(191,220,139); stroke.Thickness=2; stroke.Parent=panel
local title=Instance.new("TextLabel"); title.BackgroundTransparency=1; title.Size=UDim2.new(1,-20,0,30); title.Position=UDim2.fromOffset(10,5)
title.Font=Enum.Font.GothamBlack; title.Text="🌱 GRANJA INFINITA"; title.TextColor3=Color3.fromRGB(232,244,207); title.TextSize=18; title.TextXAlignment=Enum.TextXAlignment.Left; title.Parent=panel
local stats=Instance.new("TextLabel"); stats.Name="Estadisticas"; stats.BackgroundTransparency=1; stats.Size=UDim2.new(1,-20,0,38); stats.Position=UDim2.fromOffset(10,39)
stats.Font=Enum.Font.GothamBold; stats.Text="Cargando granja..."; stats.TextColor3=Color3.new(1,1,1); stats.TextSize=14; stats.TextXAlignment=Enum.TextXAlignment.Left; stats.TextWrapped=true; stats.Parent=panel
local message=Instance.new("TextLabel"); message.Name="Mensaje"; message.AnchorPoint=Vector2.new(.5,1); message.Size=UDim2.new(.8,0,0,48); message.Position=UDim2.new(.5,0,1,-24)
message.BackgroundColor3=Color3.fromRGB(35,53,37); message.BackgroundTransparency=.12; message.TextColor3=Color3.new(1,1,1); message.Font=Enum.Font.GothamBold
message.TextSize=16; message.TextWrapped=true; message.Visible=false; message.Parent=gui
local mc=Instance.new("UICorner"); mc.CornerRadius=UDim.new(0,12); mc.Parent=message
local function refresh(data)
 if data.Coins then stats.Text=("💰 $%d     🥚 %d\n🐔 %d gallinas     ⭐ Nivel %d"):format(data.Coins,data.Eggs or 0,data.Chickens or 0,data.Level or 1) end
 if data.Message then message.Text=data.Message; message.Visible=true; task.delay(3.5,function() message.Visible=false end) end
end
remote.OnClientEvent:Connect(refresh)
task.spawn(function()
 local ls=player:WaitForChild("leaderstats",20); if not ls then return end
 local function render()
  local c,e,h,l=ls:FindFirstChild("Monedas"),ls:FindFirstChild("Huevos"),ls:FindFirstChild("Gallinas"),ls:FindFirstChild("Nivel")
  if c and e and h and l then refresh({Coins=c.Value,Eggs=e.Value,Chickens=h.Value,Level=l.Value}) end
 end
 for _,v in ipairs(ls:GetChildren()) do v.Changed:Connect(render) end
 ls.ChildAdded:Connect(function(v) v.Changed:Connect(render); render() end); render()
end)
