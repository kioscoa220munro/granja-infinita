# Diseño del juego — GRANJA INFINITA

**Versión:** 0.2 · Documento vivo  
**Visión:** De un huevo a un imperio viviente.

## 1. Fantasía principal

El jugador transforma una pequeña parcela en una granja extraordinaria. Cada decisión permite producir, reinvertir, descubrir, intercambiar o colaborar. La experiencia debe ser fácil de comprender al comenzar y ofrecer nuevas metas a largo plazo.

**Regla de progresión:** todo comienza comprando huevos. Al subir de nivel se desbloquean nuevas tiendas, especies, instalaciones, herramientas y desafíos. Los animales tienen funciones distintas: producción, velocidad, transporte, automatización, almacenamiento, exploración y apoyo.

## 2. Bucle principal

1. Comprar huevos de incubación.
2. Incubar y conseguir animales.
3. Alimentar y cuidar animales.
4. Recoger productos y utilizar habilidades.
5. Vender productos o completar pedidos.
6. Reinvertir en instalaciones y ampliar la granja.
7. Subir de nivel y desbloquear tiendas y desafíos.
8. Descubrir especies exóticas y colaborar con otros jugadores.

## 3. Recursos y economía

- **Huevos de incubación:** se compran y se usan para obtener animales.
- **Huevos de producción:** los generan las gallinas; pueden venderse o utilizarse en pedidos.
- **Monedas:** unidad general para instalaciones, mejoras, parcelas y servicios.
- **Productos procesados:** leche convertida en queso, lana en tejidos, miel, etc.

El jugador recibe monedas iniciales suficientes para comprar su primer huevo básico. Los huevos y su contenido deben explicarse claramente; no se ocultarán probabilidades ni se venderán oportunidades de criaturas raras.

No se fijan todavía precios definitivos. Antes de programarlos se simularán producción, costes, demanda, capacidad, tiempo hasta cada desbloqueo y efecto de ventajas.

## 4. Especies y progresión

Cada animal debe aportar una utilidad clara. Las gallinas producen huevos; vacas leche; ovejas lana; abejas polinizan; caballos aceleran desplazamientos; burros aumentan carga; perros pastores reúnen rebaños; gatos reducen pérdidas por plagas; y otros animales abren rutas de productos, desafíos y exploración.

El catálogo completo, ventajas, tiendas por nivel, desafíos y animales dorados está en [Catálogo de animales y progresión](CATALOGO_ANIMALES_Y_PROGRESION.md).

## 5. Animales dorados y hallazgos extraordinarios

Los animales dorados son exóticos, poderosos y no comprables. No aparecen en tiendas y no se venden por Robux ni monedas. Se obtienen por hallazgos extraordinarios durante acciones legítimas o por hitos especiales de constancia, como la recompensa de 365 días consecutivos.

**Límite aprobado: máximo dos animales dorados por cuenta en todo el juego, sumando todas las especies.** No son dos por especie. Si se produce un tercer hallazgo, queda pendiente: no se borra, reemplaza ni vende automáticamente ningún animal.

Ejemplo de poder acordado: una Vaca Dorada produce diez veces la leche de una vaca normal equivalente. Los multiplicadores definitivos y topes deben simularse para evitar romper la economía. En la primera versión, los dorados serán personales y no comerciables.

Los hallazgos se calculan en el servidor, con límites antiabuso y sin compras de probabilidades.

## 6. Mundo social

- Cada jugador tiene una granja persistente.
- Las granjas pueden visitarse con permisos configurables.
- Una plaza comercial funciona como punto de encuentro.
- Cooperativas pequeñas para objetivos compartidos.
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
- Los animales dorados personales no se comercian en la primera versión.

## 8. Progresión y regreso voluntario

- Objetivos cortos para sesiones breves.
- Metas semanales y proyectos cooperativos.
- Regalo diario gratuito con racha y recompensa de 365 días.
- Producción offline limitada por capacidad y mejoras.
- Recolección al regresar, sin exigir conexión permanente.
- Eventos temporales con recompensas alcanzables jugando normalmente.

El sistema diario está descrito en [Regalos diarios y rachas](REGALOS_DIARIOS_Y_RACHAS.md).

## 9. Monetización responsable

Posibles productos opcionales: decoración, apariencias, efectos, emotes, personalización de vehículos y pases cosméticos. Las ventajas de comodidad deben ser transparentes y no romper el equilibrio.

No vender animales dorados, probabilidades de hallazgo ni niveles para saltarse la progresión principal. El contenido principal debe poder conseguirse jugando sin pagar.

## 10. Arquitectura técnica prevista

- Roblox Studio + Luau.
- Servidor como autoridad para economía, inventario, hallazgos y comercio.
- DataStoreService para persistencia con manejo de errores y reintentos.
- RemoteEvents/RemoteFunctions con validación de tipos, permisos y frecuencia.
- Operaciones comerciales idempotentes y registros de auditoría.
- Pruebas de carga y compatibilidad con dispositivos móviles.

## 11. Fases de desarrollo

1. Prototipo económico: huevos, incubación, gallinas, producción, venta, niveles y guardado.
2. Tiendas y primeras especies adicionales.
3. Instalaciones, productos procesados y animales de apoyo.
4. Desafíos, expediciones y mundo social.
5. Hallazgos exóticos, cupo dorado y recompensas diarias.
6. Pruebas, balance, seguridad y lanzamiento.

## 12. Métricas a observar

- Retención D1, D7 y D30.
- Satisfacción y duración de sesiones.
- Tiempo hasta la primera gallina y primera expansión.
- Tiempo para desbloquear cada tienda.
- Porcentaje de jugadores que usan las distintas familias de animales.
- Distribución de riqueza y producción.
- Participación en cooperativas y eventos.
- Frecuencia real de hallazgos raros.
- Errores, fraude y operaciones fallidas.

**Principio rector:** que cada jugador tenga una historia propia que valga la pena continuar, sin convertir el juego en una obligación.
