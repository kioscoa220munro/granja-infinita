# Diseño del juego — GRANJA INFINITA

**Versión:** 0.1 · Documento vivo  
**Visión:** De un huevo a un imperio viviente.

## 1. Fantasía principal

El jugador transforma una pequeña parcela en una granja extraordinaria. Cada decisión permite producir, reinvertir, descubrir, intercambiar o colaborar. La experiencia debe ser fácil de comprender al comenzar y ofrecer nuevas metas a largo plazo.

## 2. Bucle principal

1. Obtener huevos para incubar.
2. Incubar y conseguir animales.
3. Recoger la producción de los animales.
4. Elegir entre reinvertir, vender o completar pedidos.
5. Mejorar instalaciones y ampliar la granja.
6. Desbloquear nuevas especies y sistemas.
7. Visitar, comerciar y colaborar con otros jugadores.

La reinversión debe ser atractiva, pero vender también debe tener utilidad. No se debe castigar al jugador por elegir una ruta distinta.

## 3. Recursos y economía

Para evitar confusiones, el diseño separa:

- **Huevos de incubación:** recurso destinado a incubar animales.
- **Huevos de producción:** recurso generado por las gallinas; puede venderse, utilizarse en pedidos o convertirse según las reglas del juego.
- **Monedas:** unidad general para instalaciones, mejoras, parcelas y servicios.

No se fijan todavía precios definitivos. Antes de programarlos se construirá una simulación con estas variables:

- Producción por animal y por intervalo.
- Coste de incubación y tiempo de incubación.
- Precio de venta y demanda de pedidos.
- Capacidad de almacenamiento.
- Coste y beneficio marginal de cada mejora.
- Tiempo esperado para alcanzar la siguiente meta.
- Producción offline y límite de almacenamiento.

### Reglas de balance

- Cada especie nueva debe aportar una ventaja clara, sin volver inútiles instantáneamente a las anteriores.
- El tiempo para alcanzar una meta debe crecer de manera gradual y comprensible.
- La economía debe tener salidas: mejoras, pedidos, ampliaciones, cosméticos y proyectos cooperativos.
- Evitar inflación ilimitada mediante demanda, costes de mantenimiento razonables y sumideros opcionales.
- El jugador que no paga debe poder acceder a todas las especies y descubrimientos principales.
- No usar probabilidades pagas para criaturas raras.

### Fórmulas de simulación

Producción bruta por período:

`produccion = cantidad_animales × produccion_por_animal × períodos`

Producción neta disponible:

`neto = producción_bruta - consumo - pérdidas_por_capacidad`

Tiempo aproximado para una meta:

`tiempo_meta = (objetivo - saldo_actual) / ganancia_neta_por_período`

Estas fórmulas son una primera herramienta de análisis; el modelo final tendrá en cuenta reinversión, mejoras, topes y cambios de demanda.

## 4. Evolución de especies

La evolución debe representar decisiones estratégicas y no una conversión arbitraria de cantidades. Cada transición tendrá:

- Requisito de animales o recursos.
- Tiempo y coste de preparación.
- Producción o utilidad de la nueva especie.
- Espacio e instalaciones necesarias.
- Posibilidad de conservar parte de las especies anteriores.

Árbol inicial a investigar: gallinas → vacas / ovejas / cerdos → caballos y especies avanzadas. Las proporciones se decidirán después de simular retorno, tiempo y utilidad.

## 5. Hallazgos extraordinarios

Los hallazgos pueden ocurrir durante actividades legítimas de cualquier etapa: recoger producción, alimentar, completar encargos, explorar, comerciar o participar en eventos. No deben depender exclusivamente de tener gallinas.

### Reglas propuestas

- Las oportunidades se calculan en servidor, nunca en el cliente.
- Cada oportunidad corresponde a una acción válida y con límites; no a cada segundo ni a clics repetidos.
- Las probabilidades se calibran mediante simulaciones y pruebas.
- No se compran oportunidades ni probabilidades con Robux.
- La criatura se asigna con un identificador único y una transacción persistente.
- Se mantiene un registro de descubrimiento y fecha.
- Los anuncios públicos respetan la privacidad del jugador.

### Unicidad y comercio

Hay dos clases posibles, que se mantendrán separadas:

1. **Vínculo personal:** criatura ligada a la cuenta que la descubrió; no se puede transferir.
2. **Edición comerciable:** ejemplar con identificador único y reglas explícitas de propiedad.

La regla de “una por jugador” debe aplicarse a una categoría definida. Para objetos comerciables se debe decidir qué sucede con el cupo del vendedor y del receptor antes de habilitar transferencias.

### Primer ejemplo: Gallina Dorada

- Apariencia, animación y efectos propios.
- Producción especial y huevos distintivos.
- Valor de colección y registro histórico.
- Rareza extrema, no comprable.
- No se le asigna todavía un multiplicador económico definitivo: se balanceará para que sea emocionante sin destruir la economía.

Otras familias visuales posibles: Vaca de Cristal, Oveja Arcoíris, Cerdo Imperial y Caballo Celestial.

## 6. Mundo social

Modelo inicial recomendado:

- Cada jugador tiene una granja persistente.
- Las granjas pueden visitarse con permisos configurables.
- Una plaza comercial funciona como punto de encuentro.
- Cooperativas de hasta cinco integrantes en la primera versión.
- Depósito compartido opcional, con permisos y registro de movimientos.
- Misiones de cooperación que recompensan la contribución real.

## 7. Mercado seguro

- Ofertas con precio y contenido claramente visibles.
- Intercambio bilateral con pantalla de resumen.
- Confirmación de ambas partes.
- Bloqueo temporal de los objetos involucrados durante la operación.
- Validación final en servidor y registro idempotente.
- Límites de frecuencia y detección de operaciones sospechosas.
- Nunca confiar en cantidades o precios enviados por el cliente.

## 8. Progresión y regreso voluntario

- Objetivos cortos para sesiones breves.
- Metas semanales y proyectos cooperativos.
- Producción offline limitada por capacidad y mejoras.
- Recolección al regresar, sin exigir conexión permanente.
- Eventos temporales con recompensas alcanzables jugando normalmente.

## 9. Monetización responsable

Posibles productos opcionales: decoración, apariencias, efectos, emotes, personalización de vehículos y pases cosméticos.

No vender probabilidades de hallazgo ni hacer que pagar sea requisito para acceder a especies fundamentales. Cualquier ventaja de comodidad deberá ser transparente y no romper el equilibrio del juego.

## 10. Arquitectura técnica prevista

- Roblox Studio + Luau.
- Servidor como autoridad para economía, inventario, hallazgos y comercio.
- DataStoreService para persistencia con manejo de errores y reintentos.
- RemoteEvents/RemoteFunctions con validación de tipos, permisos y frecuencia.
- Operaciones comerciales idempotentes y registros de auditoría.
- Pruebas de carga y compatibilidad con dispositivos móviles.

## 11. Fases de desarrollo

### Fase 1 — Prototipo económico
Terreno, huevo, incubación, gallina, producción, venta, reinversión y guardado.

### Fase 2 — Primera experiencia social
Visitas, permisos, ayuda entre jugadores y cooperativas.

### Fase 3 — Mercado y expansión
Nuevas especies, pedidos, comercio seguro, instalaciones y parcelas.

### Fase 4 — Hallazgos y eventos
Sistema legendario, álbum, anuncios, ferias y objetivos globales.

### Fase 5 — Pruebas y lanzamiento
Balance, rendimiento, seguridad, accesibilidad, telemetría y actualización continua.

## 12. Métricas a observar

- Retención D1, D7 y D30.
- Duración y frecuencia de sesiones, interpretadas junto con satisfacción.
- Tiempo hasta conseguir la primera gallina y la primera expansión.
- Porcentaje de jugadores que reinvierten, venden o comercian.
- Distribución de riqueza y producción.
- Participación en cooperativas y eventos.
- Frecuencia real de hallazgos raros.
- Reportes de errores, fraude y operaciones fallidas.

**Principio rector:** que cada jugador tenga una historia propia que valga la pena continuar, sin convertir el juego en una obligación.