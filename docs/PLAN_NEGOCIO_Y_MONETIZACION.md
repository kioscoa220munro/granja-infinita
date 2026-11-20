# GRANJA INFINITA — Plan de negocio y monetización
Versión 0.1 · 20 de noviembre de 2026

## Objetivo
Construir una experiencia gratuita de Roblox que pueda generar ingresos sostenibles en Robux y, si se cumplen los requisitos de Roblox, convertir Robux ganados en dinero real mediante DevEx. No se promete una cantidad de ingresos ni un éxito garantizado: se trabajará con métricas, pruebas y mejoras.

## Modelo de negocio
La fuente principal debe ser una experiencia divertida que consiga:
1. Que nuevos jugadores entiendan el objetivo en el primer minuto.
2. Que consigan su primera gallina y su primera recompensa rápidamente.
3. Que tengan metas de corto, medio y largo plazo.
4. Que vuelvan por progreso real, eventos, visitas a granjas y cooperación.
5. Que una parte de los jugadores elija comprar extras opcionales.

La entrada será gratuita. No venderemos probabilidades de animales raros ni haremos que pagar sea obligatorio para progresar.

## Fuentes de ingresos que evaluaremos

### 1. Pases permanentes (Game Passes)
Compras únicas en Robux. Candidatos:
- Granjero Plus: mejoras de comodidad y cosméticos exclusivos.
- Ampliación estética de granja: decoración y variantes visuales.
- Espacio adicional de exhibición para animales, sin ventaja económica desmedida.
- Herramientas visuales o emotes exclusivos.

Roblox indica que el creador recibe el 70% de los Robux gastados en sus propios pases; el resto corresponde a la tarifa de Marketplace. Revisar siempre las condiciones vigentes antes de publicar.

### 2. Productos de desarrollador (Developer Products)
Compras repetibles en Robux. Candidatos para evaluar:
- Paquete de alimento o fertilizante de duración limitada.
- Recolección asistida durante un período corto.
- Decoraciones consumibles para eventos.
- Paquetes de recursos con contenido y cantidades claramente indicados.

Reglas de diseño:
- Mostrar precio y contenido antes de comprar.
- Entregar exactamente lo comprado y registrar la transacción en el servidor.
- No vender huevos aleatorios, cajas sorpresa pagas ni probabilidades de rareza en esta primera versión.
- No permitir que una compra rompa la economía o haga inútil el juego gratuito.

### 3. Suscripción
Más adelante se puede evaluar una suscripción en Robux con beneficios mensuales claros, sostenibles y no acumulativos de forma abusiva. Roblox documenta suscripciones en Robux desde 49 Robux y un pago al creador del 70%. Las suscripciones en moneda local no están disponibles en Argentina según la documentación consultada; por eso no serán parte del plan inicial.

### 4. Creator Rewards
Roblox ofrece recompensas por engagement diario y expansión de audiencia, sujetas a requisitos. La documentación vigente indica:
- 5 Robux por día cuando un Active Spender elegible juega 10 minutos o más, si la experiencia está entre las primeras tres que visita ese día.
- Audience Expansion puede compartir el 35% de las primeras compras calificadas de usuarios nuevos o reactivados atribuidos al enlace, con condiciones adicionales, incluyendo mantener un promedio de 100+ DAU durante 60 días y verificación de identidad para la elegibilidad.

No construiremos el negocio suponiendo que estos premios están garantizados. Se consideran ingresos complementarios sujetos a las reglas y métricas de Roblox. Nunca usaremos bots, cuentas alternativas ni actividad artificial.

### 5. UGC y contenido adicional
En una etapa posterior, estudiar accesorios y artículos de avatar relacionados con la identidad de GRANJA INFINITA, respetando las reglas de Marketplace y los derechos de propiedad intelectual.

## Política comercial del juego
- Free-to-play real: se puede conseguir cada especie jugando.
- Ningún animal legendario será exclusivo de pago.
- No vender probabilidades ni ventajas de azar pagadas.
- No bloquear el progreso básico detrás de compras.
- Evitar anuncios invasivos y ventanas de compra constantes.
- Las compras deben ser transparentes, opcionales y fáciles de entender.
- No prometer Robux ni dinero real a los jugadores por jugar.
- No ofrecer canje de monedas del juego por dinero real.

## Embudo de lanzamiento
1. Descubrimiento: icono, miniatura, título y descripción claros.
2. Primer minuto: tutorial corto, terreno propio y objetivo visible.
3. Primera sesión: incubar y obtener la primera gallina; producir y vender huevos.
4. Retorno: objetivos diarios razonables, progreso offline limitado y eventos.
5. Comunidad: visitar granjas, cooperativas y metas compartidas.
6. Monetización: mostrar la tienda después de que el jugador comprenda el valor del juego, sin interrumpir el tutorial.

## Métricas que vamos a medir
- Visitas y jugadores únicos.
- Retención D1 y D7.
- Duración media de sesión.
- Porcentaje que completa el tutorial.
- Tiempo hasta conseguir la primera gallina.
- Porcentaje que vuelve al día siguiente.
- Conversión de jugadores a compradores.
- Ingreso medio por usuario y por usuario pagador.
- Reembolsos, errores de compra y quejas.
- Rendimiento por dispositivo y país.

No fijaremos precios definitivos hasta tener el prototipo y datos de pruebas. Los precios se probarán con cuidado y se revisará el impacto en retención y satisfacción, no solo en ingresos.

## Hitos

### Hito 1 — Prototipo jugable
- Parcela individual.
- Huevo inicial e incubadora.
- Primera gallina y producción.
- Inventario, venta y reinversión.
- Guardado seguro en servidor.
- Sin tienda paga todavía.

### Hito 2 — Prueba cerrada
- Probar con jugadores reales.
- Corregir errores y exploits.
- Medir el tiempo hasta la primera recompensa.
- Ajustar producción, precios y progresión.

### Hito 3 — Lanzamiento público
- Página de Roblox completa.
- Icono, miniaturas, tutorial y descripción.
- Telemetría y métricas.
- Primeros pases cosméticos y productos opcionales, solo si la experiencia ya funciona.

### Hito 4 — Escala
- Cooperativas, mercado y eventos.
- Suscripción en Robux si los beneficios pueden sostenerse.
- UGC y campañas de creadores.
- Optimización de precios y expansión internacional.

## Seguridad técnica y comercial
- Las compras se validan y otorgan exclusivamente en el servidor usando MarketplaceService y ProcessReceipt para Developer Products.
- Las transacciones deben ser idempotentes: una compra no puede duplicar ni perder recompensas.
- Inventarios, monedas, hallazgos y comercio son autoritativos del servidor.
- No almacenar credenciales de Roblox ni pedir contraseñas.
- Cumplir las políticas de Roblox, especialmente monetización, artículos virtuales aleatorios, privacidad y seguridad infantil.

## Fuentes oficiales consultadas
- https://create.roblox.com/docs/get-started/monetization
- https://create.roblox.com/docs/creator-rewards
- https://create.roblox.com/docs/production/monetization
- https://create.roblox.com/docs/production/monetization/subscriptions
- https://create.roblox.com/docs/production/monetization/developer-exchange

Este documento es una estrategia inicial. Antes de implementar cualquier producto, se verificará la política vigente en Creator Hub.
