# Sistema de regalos diarios, rachas y animales dorados personales
Versión 1.0 · Diseño funcional

## Objetivo
Crear un motivo positivo para volver a GRANJA INFINITA mediante un regalo gratuito y una recompensa de fidelidad. No requiere compras, Robux ni sesiones prolongadas.

## 1. Regalo diario sorpresa
- Cada jugador puede reclamar un regalo gratuito por día de calendario del juego.
- El regalo puede contener distintas cantidades de huevos, por ejemplo 1, 2, 7 o 1.000. Son ejemplos, no probabilidades definitivas.
- Las cantidades y probabilidades se mostrarán claramente en la interfaz.
- La recompensa se determina y entrega en el servidor, nunca en el cliente.
- Se registra fecha, resultado y versión de tabla aplicada.
- No requiere comprar ni ver publicidad y no se acumula indefinidamente.
- El premio de 1.000 huevos debe ser extraordinario y simularse contra la economía antes de activarse.
- No se venden tiradas, probabilidades ni intentos adicionales.

## 2. Calendario y racha
- Una racha suma un día cuando se reclama el regalo en días consecutivos.
- Entrar y reclamar es suficiente; no hace falta permanecer conectado.
- El día de juego usa UTC para todos, con contador hasta el próximo reinicio.
- El servidor valida el cambio de día. Cambiar el reloj del dispositivo no concede otro regalo.
- Si se omite un día, la racha vuelve a cero.
- Se muestran racha actual, récord y progreso a 365 días.

## 3. Recompensa de 365 días
Al completar 365 reclamos diarios consecutivos se desbloquea una criatura dorada personal, inicialmente llamada **Gallina Dorada Ancestral**.
- Recompensa garantizada por constancia; no es una tirada.
- No se compra ni se vende por Robux o monedas.
- Tiene apariencia, animación, sonido y ficha de colección exclusivos.
- Se acredita en el servidor con operación idempotente.

## 4. Cupo global de animales dorados

**Regla confirmada por el creador: máximo dos animales dorados en toda la cuenta, sumando todas las especies.** No son dos por especie.

- Los dorados son exóticos, poderosos y no comprables.
- Se obtienen por hallazgos extraordinarios durante acciones legítimas o por hitos especiales como los 365 días.
- En primera versión son personales y no transferibles.
- Si el jugador ya tiene dos y aparece un tercer hallazgo, se registra como pendiente. No se borra, reemplaza ni vende automáticamente ninguno de los dos existentes.
- El jugador deberá liberar un espacio de forma voluntaria mediante una regla de gestión que se diseñará antes de habilitarla. Hasta entonces, no se destruye la recompensa ni se duplica el inventario.
- Cada ejemplar tiene identificador único, fecha y procedencia.

## 5. Protección contra abuso
- Un único reclamo diario por UserId.
- Operación idempotente para impedir duplicaciones.
- Actualización persistente con UpdateAsync y control de concurrencia.
- Registro de usuario, día, resultado, versión de probabilidades y estado de entrega.
- Validación del inventario antes de conceder el premio.
- El cliente no elige la cantidad ni la recompensa.
- Límites a solicitudes repetidas y controles contra bots.

## 6. Interfaz
- Panel "Regalo de hoy" con botón reclamar.
- Animación breve y detalle del premio.
- Contador de racha y récord personal.
- Próximo reinicio en UTC.
- Progreso hacia 365 días y vista de la recompensa.
- Álbum de animales con fecha y procedencia.
- Aviso claro si el cupo de dorados está completo.

## 7. Métricas
- Porcentaje de jugadores elegibles que reclaman.
- Retención D1, D7, D30 y D365.
- Distribución real de premios.
- Impacto económico de cada premio.
- Hitos de racha alcanzados.
- Errores, reclamos repetidos y discrepancias de inventario.

La racha es una recompensa amable, no una obligación. Evitar mensajes culpabilizantes o presión para conectarse.

## 8. Estado
Diseño funcional actualizado. Falta simular probabilidades, implementar el servicio seguro en Luau, diseñar cómo gestionar un tercer dorado sin pérdida y probar persistencia/concurrencia en Roblox Studio.
