# Instalar el prototipo jugable de Granja Infinita en Roblox Studio

## Importante
La web de GitHub es la presentación del juego. Los archivos de roblox/ son scripts Luau para construir y ejecutar el prototipo dentro de Roblox Studio; GitHub Pages no ejecuta un juego Roblox.

## Instalación
1. Abrí Roblox Studio y creá una experiencia nueva con plantilla Baseplate.
2. En ServerScriptService, creá un Script llamado GranjaInfinitaBootstrap.
3. Pegá el contenido de roblox/ServerScriptService/GranjaInfinitaBootstrap.server.lua.
4. En StarterPlayer > StarterPlayerScripts, creá un LocalScript llamado GranjaInfinitaHUD.
5. Pegá el contenido de roblox/StarterPlayer/StarterPlayerScripts/GranjaInfinitaHUD.client.lua.
6. Podés borrar la baseplate original: el script crea su propio suelo de 600 x 600 studs.
7. Guardá el lugar como GranjaInfinita.rbxl o .rbxlx.

## Probar
- Pulsá Play (no solo Run).
- El personaje debe aparecer en la plaza central, sobre el suelo.
- Acercate a la tienda, pulsá E y comprá un huevo ($25).
- Acercate a la incubadora y pulsá E para obtener una gallina.
- Esperá al menos 45 segundos y usá el nido para recoger huevos.
- En el puesto de venta, pulsá E para venderlos ($8 cada uno).
- Monedas, huevos, gallinas y nivel aparecen en el HUD y en la tabla de jugadores.

## Guardado
El script guarda monedas, huevos, gallinas y nivel con DataStoreService y UpdateAsync.
Para probar persistencia en Studio:
1. Publicá primero la experiencia (File > Publish to Roblox).
2. En Game Settings > Security, habilitá Enable Studio Access to API Services para pruebas.
3. No uses datos reales de producción para probar; Roblox puede limitar solicitudes de DataStore.

## Incluye y pendientes
Incluye mundo 3D generado por servidor, suelo colisionable, SpawnLocation, plaza, caminos, tienda, gallinero, incubadora, nidos, granero, silo, cercos, árboles, compra/incubación/producción/venta básica, HUD y guardado inicial.

Todavía no es el lanzamiento completo: faltan parcelas privadas por jugador, catálogo completo de especies, jefes de campaña, cooperativas, mercado entre jugadores, regalos diarios/racha de 365 días, animales dorados y pruebas multijugador/antiabuso. Debe probarse en Roblox Studio antes de publicarse.
