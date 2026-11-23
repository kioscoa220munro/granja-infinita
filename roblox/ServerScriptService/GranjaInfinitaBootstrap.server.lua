-- GRANJA INFINITA | Bootstrap del mundo y juego base
-- Colocar como Script en ServerScriptService. Construye el mapa al iniciar.
-- Economía y recompensas validadas en el servidor.
local Players=game:GetService("Players")
local DataStoreService=game:GetService("DataStoreService")
local Workspace=game:GetService("Workspace")
local ReplicatedStorage=game:GetService("ReplicatedStorage")
local STORE=DataStoreService:GetDataStore("GranjaInfinita_PlayerData_v1")
local START_COINS,EGG_PRICE,EGG_SELL=150,25,8
local world=Workspace:FindFirstChild("GranjaInfinitaWorld")
if world then world:Destroy() end
world=Instance.new("Folder"); world.Name="GranjaInfinitaWorld"; world.Parent=Workspace
local function part(parent,name,size,cf,color,material)
 local p=Instance.new("Part"); p.Name=name; p.Size=size; p.CFrame=cf
 p.Anchored=true; p.CanCollide=true; p.TopSurface=Enum.SurfaceType.Smooth; p.BottomSurface=Enum.SurfaceType.Smooth
 p.Color=color; p.Material=material or Enum.Material.SmoothPlastic; p.Parent=parent; return p
end
local function model(parent,name) local m=Instance.new("Model"); m.Name=name; m.Parent=parent; return m end
local function sign(parent,txt,pos,width)
 local board=part(parent,"Cartel",Vector3.new(width or 18,5,.5),CFrame.new(pos),Color3.fromRGB(91,57,35),Enum.Material.Wood)
 local gui=Instance.new("SurfaceGui"); gui.Face=Enum.NormalId.Front; gui.CanvasSize=Vector2.new(800,220); gui.Parent=board
 local label=Instance.new("TextLabel"); label.Size=UDim2.fromScale(1,1); label.BackgroundTransparency=1
 label.Text=txt; label.TextColor3=Color3.fromRGB(255,245,210); label.TextScaled=true; label.Font=Enum.Font.GothamBlack; label.Parent=gui
end
-- Suelo continuo y caminos: el personaje nunca aparece sobre el vacío.
part(world,"SueloPrincipal",Vector3.new(600,8,600),CFrame.new(0,-4,0),Color3.fromRGB(91,153,76),Enum.Material.Grass)
part(world,"CaminoCentral",Vector3.new(34,.3,250),CFrame.new(0,.2,30),Color3.fromRGB(196,166,112),Enum.Material.Ground)
part(world,"CaminoHorizontal",Vector3.new(250,.3,22),CFrame.new(0,.22,20),Color3.fromRGB(196,166,112),Enum.Material.Ground)
local plaza=model(world,"PlazaCentral")
part(plaza,"Plaza",Vector3.new(90,1,70),CFrame.new(0,.7,0),Color3.fromRGB(205,190,151),Enum.Material.Cobblestone)
local spawn=Instance.new("SpawnLocation"); spawn.Name="Spawn_GranjaInfinita"; spawn.Size=Vector3.new(12,1,12)
spawn.CFrame=CFrame.new(0,2,0); spawn.Anchored=true; spawn.Neutral=true; spawn.Duration=0; spawn.Parent=plaza
sign(plaza,"GRANJA INFINITA  •  ¡BIENVENIDO!",Vector3.new(0,13,-27),42)
-- Tienda de huevos.
local shop=model(world,"TiendaDeHuevos")
part(shop,"Piso",Vector3.new(34,1,26),CFrame.new(-55,.8,-35),Color3.fromRGB(225,205,160),Enum.Material.WoodPlanks)
part(shop,"ParedTrasera",Vector3.new(34,16,1),CFrame.new(-55,9,-48),Color3.fromRGB(190,112,66),Enum.Material.WoodPlanks)
part(shop,"ParedIzquierda",Vector3.new(1,16,26),CFrame.new(-72,9,-35),Color3.fromRGB(190,112,66),Enum.Material.WoodPlanks)
part(shop,"ParedDerecha",Vector3.new(1,16,26),CFrame.new(-38,9,-35),Color3.fromRGB(190,112,66),Enum.Material.WoodPlanks)
part(shop,"Techo",Vector3.new(38,2,30),CFrame.new(-55,18,-35),Color3.fromRGB(151,57,48),Enum.Material.Slate)
sign(shop,"TIENDA DE HUEVOS",Vector3.new(-55,13,-47),28)
local counter=part(shop,"Mostrador",Vector3.new(24,4,3),CFrame.new(-55,2.8,-28),Color3.fromRGB(117,73,43),Enum.Material.Wood)
local buyPrompt=Instance.new("ProximityPrompt"); buyPrompt.ActionText="Comprar huevo ($25)"; buyPrompt.ObjectText="Tienda de huevos"
buyPrompt.KeyboardKeyCode=Enum.KeyCode.E; buyPrompt.HoldDuration=0; buyPrompt.MaxActivationDistance=14; buyPrompt.Parent=counter
-- Parcela, gallinero e incubadora.
local farm=model(world,"GranjaInicial")
part(farm,"Parcela",Vector3.new(100,1,82),CFrame.new(58,.7,25),Color3.fromRGB(126,174,91),Enum.Material.Grass)
part(farm,"PisoGallinero",Vector3.new(32,1,25),CFrame.new(68,1.3,28),Color3.fromRGB(184,143,91),Enum.Material.WoodPlanks)
part(farm,"ParedFondo",Vector3.new(32,13,1),CFrame.new(68,8,15.5),Color3.fromRGB(205,174,126),Enum.Material.WoodPlanks)
part(farm,"ParedIzq",Vector3.new(1,13,25),CFrame.new(52,8,28),Color3.fromRGB(205,174,126),Enum.Material.WoodPlanks)
part(farm,"ParedDer",Vector3.new(1,13,25),CFrame.new(84,8,28),Color3.fromRGB(205,174,126),Enum.Material.WoodPlanks)
part(farm,"Techo",Vector3.new(36,2,29),CFrame.new(68,15,28),Color3.fromRGB(153,62,48),Enum.Material.Slate)
sign(farm,"GALLINERO",Vector3.new(68,11,15),22)
local incubator=model(farm,"Incubadora")
part(incubator,"Base",Vector3.new(10,3,8),CFrame.new(58,2.5,54),Color3.fromRGB(119,79,48),Enum.Material.Wood)
local egg=part(incubator,"HuevoDeMuestra",Vector3.new(3,4,3),CFrame.new(58,6,54),Color3.fromRGB(255,245,220)); egg.Shape=Enum.PartType.Ball
local hatchPrompt=Instance.new("ProximityPrompt"); hatchPrompt.ActionText="Incubar un huevo"; hatchPrompt.ObjectText="Incubadora"
hatchPrompt.KeyboardKeyCode=Enum.KeyCode.E; hatchPrompt.HoldDuration=0; hatchPrompt.MaxActivationDistance=12; hatchPrompt.Parent=incubator.Base
local coop=model(farm,"Nidos")
part(coop,"Plataforma",Vector3.new(25,1,15),CFrame.new(89,1.3,53),Color3.fromRGB(177,132,82),Enum.Material.WoodPlanks)
local collect=part(coop,"NidoRecolector",Vector3.new(7,2,7),CFrame.new(89,2.5,53),Color3.fromRGB(126,77,43),Enum.Material.Wood)
local collectPrompt=Instance.new("ProximityPrompt"); collectPrompt.ActionText="Recoger huevos"; collectPrompt.ObjectText="Nido"
collectPrompt.KeyboardKeyCode=Enum.KeyCode.E; collectPrompt.HoldDuration=0; collectPrompt.MaxActivationDistance=12; collectPrompt.Parent=collect
-- Granero, silo, cercos y árboles.
local barn=model(world,"Granero")
part(barn,"Cuerpo",Vector3.new(34,22,30),CFrame.new(130,11,-48),Color3.fromRGB(174,69,54),Enum.Material.WoodPlanks)
part(barn,"Techo",Vector3.new(40,3,35),CFrame.new(130,23,-48),Color3.fromRGB(91,49,42),Enum.Material.Slate)
part(barn,"Porton",Vector3.new(12,15,1),CFrame.new(130,7.5,-32.5),Color3.fromRGB(104,59,42),Enum.Material.Wood)
sign(barn,"GRANERO",Vector3.new(130,18,-64),24)
local silo=model(world,"Silo")
part(silo,"Cuerpo",Vector3.new(18,30,18),CFrame.new(170,15,-48),Color3.fromRGB(190,197,184),Enum.Material.Metal)
part(silo,"Techo",Vector3.new(22,3,22),CFrame.new(170,31,-48),Color3.fromRGB(151,57,48),Enum.Material.Metal)
local function fenceLine(parent,a,b,count)
 for i=0,count do local pos=a:Lerp(b,i/count); part(parent,"Poste",Vector3.new(1,5,1),CFrame.new(pos.X,2.5,pos.Z),Color3.fromRGB(231,211,166),Enum.Material.Wood) end
 local mid=(a+b)/2; local length=(b-a).Magnitude
 part(parent,"Travesano",Vector3.new(.6,.6,length),CFrame.lookAt(Vector3.new(mid.X,2,mid.Z),Vector3.new(b.X,2,b.Z)),Color3.fromRGB(231,211,166),Enum.Material.Wood)
end
local fences=model(farm,"Cercos")
fenceLine(fences,Vector3.new(12,0,-18),Vector3.new(112,0,-18),20); fenceLine(fences,Vector3.new(12,0,92),Vector3.new(112,0,92),20)
fenceLine(fences,Vector3.new(12,0,-18),Vector3.new(12,0,92),20); fenceLine(fences,Vector3.new(112,0,-18),Vector3.new(112,0,92),20)
local deco=model(world,"Decoracion")
for _,pos in ipairs({Vector3.new(-130,0,-100),Vector3.new(-155,0,65),Vector3.new(155,0,100),Vector3.new(205,0,65),Vector3.new(-205,0,120),Vector3.new(210,0,-160)}) do
 part(deco,"Tronco",Vector3.new(3,13,3),CFrame.new(pos+Vector3.new(0,6,0)),Color3.fromRGB(105,72,43),Enum.Material.Wood)
 local crown=part(deco,"Copa",Vector3.new(17,17,17),CFrame.new(pos+Vector3.new(0,17,0)),Color3.fromRGB(54,119,62),Enum.Material.Grass); crown.Shape=Enum.PartType.Ball
end
-- Remoto para mensajes y HUD.
local remotes=ReplicatedStorage:FindFirstChild("GranjaInfinitaRemotes") or Instance.new("Folder")
remotes.Name="GranjaInfinitaRemotes"; remotes.Parent=ReplicatedStorage
local stateEvent=remotes:FindFirstChild("StateUpdate") or Instance.new("RemoteEvent")
stateEvent.Name="StateUpdate"; stateEvent.Parent=remotes
local profiles={}
local function update(player)
 local p=profiles[player]; if p then stateEvent:FireClient(player,{Coins=p.Coins.Value,Eggs=p.Eggs.Value,Chickens=p.Chickens.Value,Level=p.Level.Value}) end
end
local function makeStats(player,data)
 local ls=Instance.new("Folder"); ls.Name="leaderstats"; ls.Parent=player
 local function val(name,n) local v=Instance.new("IntValue"); v.Name=name; v.Value=n; v.Parent=ls; return v end
 profiles[player]={Coins=val("Monedas",data.Coins),Eggs=val("Huevos",data.Eggs),Chickens=val("Gallinas",data.Chickens),Level=val("Nivel",data.Level),LastCollect=os.time()}
end
local function save(player)
 local p=profiles[player]; if not p then return end
 local data={Coins=p.Coins.Value,Eggs=p.Eggs.Value,Chickens=p.Chickens.Value,Level=p.Level.Value}
 local ok,err=pcall(function() STORE:UpdateAsync("u_"..player.UserId,function(old)
  old=type(old)=="table" and old or {}; old.Coins=data.Coins; old.Eggs=data.Eggs; old.Chickens=data.Chickens; old.Level=data.Level; return old
 end) end)
 if not ok then warn("[GranjaInfinita] Error guardando "..player.Name..": "..tostring(err)) end
end
local function addChicken(position)
 local chicken=model(world,"Gallina")
 local body=part(chicken,"Cuerpo",Vector3.new(3,2.4,3.5),CFrame.new(position),Color3.fromRGB(246,239,220)); body.Shape=Enum.PartType.Ball
 local head=part(chicken,"Cabeza",Vector3.new(1.7,1.7,1.7),CFrame.new(position+Vector3.new(0,1.7,-1.1)),Color3.fromRGB(246,239,220)); head.Shape=Enum.PartType.Ball
 local beak=part(chicken,"Pico",Vector3.new(.8,.5,.8),CFrame.new(position+Vector3.new(0,1.55,-2)),Color3.fromRGB(238,151,48)); beak.Shape=Enum.PartType.Ball
 local comb=part(chicken,"Cresta",Vector3.new(.7,.9,.7),CFrame.new(position+Vector3.new(0,2.55,-1.1)),Color3.fromRGB(190,48,42)); comb.Shape=Enum.PartType.Ball
 local feet=part(chicken,"Patas",Vector3.new(.5,1.2,.5),CFrame.new(position+Vector3.new(0,-1.2,0)),Color3.fromRGB(226,139,42)); feet.CanCollide=false
end
Players.PlayerAdded:Connect(function(player)
 local data={Coins=START_COINS,Eggs=0,Chickens=0,Level=1}
 local ok,stored=pcall(function() return STORE:GetAsync("u_"..player.UserId) end)
 if ok and type(stored)=="table" then for k in pairs(data) do if type(stored[k])=="number" then data[k]=math.max(0,math.floor(stored[k])) end end
 elseif not ok then warn("[GranjaInfinita] Carga temporal para "..player.Name) end
 makeStats(player,data)
 player.CharacterAdded:Connect(function(character)
  local root=character:WaitForChild("HumanoidRootPart",10)
  if root then task.wait(.2); root.CFrame=CFrame.new(0,6,0) end
 end)
 update(player)
end)
buyPrompt.Triggered:Connect(function(player)
 local p=profiles[player]; if not p then return end
 if p.Coins.Value<EGG_PRICE then stateEvent:FireClient(player,{Message="Te faltan monedas para comprar un huevo."}); return end
 p.Coins.Value-=EGG_PRICE; p.Eggs.Value+=1; update(player)
end)
hatchPrompt.Triggered:Connect(function(player)
 local p=profiles[player]; if not p then return end
 if p.Eggs.Value<1 then stateEvent:FireClient(player,{Message="Primero comprá un huevo en la tienda."}); return end
 p.Eggs.Value-=1; p.Chickens.Value+=1
 addChicken(Vector3.new(68,4,28)+Vector3.new(math.random(-5,5),3,math.random(-5,5)))
 update(player); stateEvent:FireClient(player,{Message="¡Nació una gallina! Ya forma parte de tu granja."})
end)
collectPrompt.Triggered:Connect(function(player)
 local p=profiles[player]; if not p then return end
 if p.Chickens.Value<1 then stateEvent:FireClient(player,{Message="Necesitás incubar tu primera gallina."}); return end
 local now=os.time(); local elapsed=math.max(0,now-(p.LastCollect or now)); local produced=math.min(10,math.floor(elapsed/45))
 if produced<1 then stateEvent:FireClient(player,{Message="Tus gallinas todavía están produciendo. Volvé en un momento."}); return end
 p.LastCollect=now; p.Eggs.Value+=produced; update(player)
 stateEvent:FireClient(player,{Message="Recogiste "..produced.." huevo(s) de producción."})
end)
local sellPad=part(world,"PuestoDeVenta",Vector3.new(18,1,14),CFrame.new(0,1,62),Color3.fromRGB(221,183,91),Enum.Material.WoodPlanks)
sign(world,"VENTA DE HUEVOS  •  $8 CADA UNO",Vector3.new(0,8,54),28)
local sellPrompt=Instance.new("ProximityPrompt"); sellPrompt.ActionText="Vender huevos"; sellPrompt.ObjectText="Puesto de venta"
sellPrompt.KeyboardKeyCode=Enum.KeyCode.E; sellPrompt.HoldDuration=0; sellPrompt.MaxActivationDistance=14; sellPrompt.Parent=sellPad
sellPrompt.Triggered:Connect(function(player)
 local p=profiles[player]; if not p then return end
 if p.Eggs.Value<1 then stateEvent:FireClient(player,{Message="No tenés huevos para vender."}); return end
 local amount=p.Eggs.Value; p.Eggs.Value=0; p.Coins.Value+=amount*EGG_SELL
 p.Level.Value=math.max(1,math.floor(p.Coins.Value/250)+1); update(player)
 stateEvent:FireClient(player,{Message="Vendiste "..amount.." huevo(s) por $"..(amount*EGG_SELL).."."})
end)
task.spawn(function() while true do task.wait(60); for _,player in ipairs(Players:GetPlayers()) do save(player) end end end)
Players.PlayerRemoving:Connect(function(player) save(player); profiles[player]=nil end)
game:BindToClose(function() for _,player in ipairs(Players:GetPlayers()) do save(player) end; task.wait(2) end)
print("[GranjaInfinita] Mundo construido: suelo, plaza, tienda, gallinero, incubadora, granero, silo y economía inicial.")
