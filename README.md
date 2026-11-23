# GRANJA INFINITA

**De un huevo a un imperio viviente.**

Sitio de presentación y proyecto de videojuego multijugador para Roblox.

## Concepto

Granja Infinita combina simulación agrícola, progresión económica, colección de animales extraordinarios, comercio entre jugadores y cooperación.

El jugador comienza con huevos y su primera gallina. A partir de ahí produce, reinvierte, expande su granja, descubre especies y participa de una comunidad.

## Estado del proyecto

- [x] Repositorio inicializado.
- [x] Landing page responsive en español.
- [x] Identidad visual inicial.
- [x] Concepto y pilares del juego documentados.
- [x] Scripts iniciales del prototipo Roblox: mundo 3D, tienda, incubadora, producción, venta, HUD y guardado base (pendiente de prueba en Studio).
- [ ] Economía inicial simulada y balanceada.
- [ ] Persistencia y guardado seguro.
- [ ] Cooperativas y comercio.
- [ ] Sistema de hallazgos legendarios.
- [ ] Pruebas y lanzamiento.

## Prototipo Roblox

Los scripts Luau y la guía de instalación están en la carpeta `roblox/`. El servidor genera el suelo, la plaza, la tienda, el gallinero, la incubadora, el puesto de venta y edificios decorativos. Consultá `roblox/INSTALACION_Y_PRUEBAS.md` para instalarlos en Roblox Studio. El prototipo todavía requiere pruebas reales y no equivale al juego completo publicado.

## Sitio web

La página inicial está en `index.html` y no requiere dependencias ni proceso de compilación.

Se puede publicar con GitHub Pages desde **Settings → Pages → Deploy from a branch → main → / (root)**.

## Tecnología prevista para el juego

- Roblox Studio y Luau.
- DataStoreService para persistencia.
- Lógica económica y validación de transacciones en servidor.
- RemoteEvents con validación y límites de frecuencia.
- Registro de transacciones para prevenir duplicaciones y abusos.

## Principios de diseño

1. El progreso gratuito debe ser viable.
2. Las compras opcionales no deben ser necesarias para conseguir criaturas raras.
3. Las oportunidades legendarias no se compran con Robux.
4. El comercio debe ser transparente y seguro.
5. La progresión debe ser atractiva sin exigir sesiones interminables.
6. Las cifras económicas se validarán con simulaciones antes de implementarse.

## Nombre

**GRANJA INFINITA** es el nombre de trabajo del proyecto. La marca, los personajes y los recursos visuales se desarrollarán como propiedad original, sin copiar contenido de otros juegos.

---
Proyecto independiente de otros repositorios.