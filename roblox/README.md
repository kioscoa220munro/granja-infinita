# Prototipo Roblox — GRANJA INFINITA

Esta carpeta contiene el primer esqueleto técnico del MVP. Está preparado para sincronizarse con Roblox Studio mediante Rojo.

## Contenido

- `default.project.json`: mapeo de carpetas hacia Roblox.
- `src/shared/GameConfig.lua`: valores de prueba centralizados.
- `src/server/Main.server.lua`: perfil, incubación, producción, venta y guardado.
- `src/client/HUD.client.lua`: interfaz temporal con botones de incubar y vender.

## Requisitos

- Roblox Studio.
- Rojo CLI y el plugin Rojo para Roblox Studio.
- Una copia local de este repositorio.

Documentación oficial de Rojo: https://rojo.space/docs/

## Sincronizar con Studio

Desde una terminal, dentro de la carpeta `roblox`:

```bash
rojo serve
```

En Roblox Studio, abre el plugin Rojo, conecta con el servidor local y sincroniza el proyecto. También se puede compilar un archivo `.rbxlx` con `rojo build -o GranjaInfinita.rbxlx`.

## Prueba de guardado

Para probar DataStore en una experiencia publicada de prueba:
1. Publica primero una experiencia privada desde Roblox Studio.
2. En la configuración de la experiencia, habilita el acceso a servicios API para Studio.
3. Prueba con una cuenta de prueba y verifica que monedas, huevos y gallinas persistan al salir y volver a entrar.

No habilites estas opciones en una experiencia pública hasta completar pruebas.

## Valores de prototipo

Los números actuales son exclusivamente para comprobar el ciclo de juego:
- 10 huevos para iniciar una incubación.
- 30 segundos de incubación para acelerar las pruebas.
- 1 huevo por gallina por minuto.
- 1 moneda por huevo vendido.

No son valores económicos definitivos. Se ajustarán después de simular el progreso y probar con jugadores.

## Advertencias antes de publicar

- Este código es un prototipo inicial y todavía no fue ejecutado ni validado dentro de Roblox Studio.
- No contiene todavía parcelas 3D, modelos de animales, animaciones, sonidos, tutorial, mercado ni compras con Robux.
- La lógica económica corre en el servidor; el cliente solo solicita acciones y presenta el estado.
- Antes de producción hay que reforzar el guardado ante fallos, añadir pruebas de concurrencia, telemetría, límites de acciones y recuperación de errores.
- Las compras se implementarán después, usando MarketplaceService y ProcessReceipt para Developer Products. Nunca se otorgarán artículos desde el cliente.
