# Sistema de regalos diarios, rachas y animales personales
Versión 0.1 · Diseño funcional

## Objetivo
Crear un motivo positivo para volver a GRANJA INFINITA cada día mediante un regalo gratuito sorpresa y una recompensa de fidelidad de largo plazo. El sistema no debe exigir compras, Robux ni sesiones prolongadas.

## 1. Regalo diario sorpresa
- Cada jugador puede reclamar un regalo gratuito por día de calendario del juego.
- El regalo puede contener distintas cantidades de huevos: por ejemplo 1, 2, 7 o 1.000.
- Los valores son ejemplos; las cantidades y probabilidades definitivas se fijarán mediante simulación económica y pruebas.
- Las probabilidades y el contenido posible se mostrarán de forma clara en la interfaz.
- La recompensa se determina y entrega en el servidor, nunca en el cliente.
- El servidor registra la fecha del último reclamo y el resultado entregado.
- Reclamar no requiere comprar nada ni ver publicidad.
- El regalo no se acumula indefinidamente si no se reclama.
- El sistema no debe anunciar una probabilidad falsa ni cambiarla de forma oculta.

### Diseño de probabilidades
No fijar todavía porcentajes. Preparar una tabla de configuración versionada con:
- cantidad de huevos por premio;
- peso/probabilidad de cada resultado;
- valor económico equivalente;
- versión de tabla aplicada al reclamo.

El premio de 1.000 huevos debe ser muy raro y su impacto debe probarse contra la producción normal y el tiempo de progresión. No se venderán tiradas, probabilidades ni intentos adicionales con Robux.

## 2. Calendario y racha
- Una racha suma un día cuando el jugador reclama el regalo diario en días consecutivos del calendario del juego.
- La racha no depende de permanecer conectado durante horas: entrar y reclamar es suficiente.
- El día de juego usa una zona horaria fija y documentada para todos los jugadores, preferentemente UTC, con contador visible hasta el próximo reinicio.
- El servidor valida el cambio de día; cambiar la hora del dispositivo o cambiar de servidor no concede otro regalo.
- Si se omite un día, la racha vuelve a cero. Se podrá evaluar una protección gratuita y limitada más adelante, pero no vender salvadores de racha.
- Mostrar días consecutivos actuales, récord personal y progreso hacia los 365 días.
- Al alcanzar 365 reclamos diarios consecutivos, se desbloquea la recompensa legendaria personal.

## 3. Recompensa de 365 días
Premio propuesto: Gallina Dorada Ancestral (nombre de trabajo).
- Se concede una sola vez por cuenta.
- Tiene aspecto, animación, sonido y ficha de colección exclusivos.
- Su ficha guarda fecha de obtención, identificador único y UserId propietario.
- Es una recompensa de fidelidad; no se vende por Robux y no se puede comprar.
- Debe seguir siendo obtenible jugando, sin gasto obligatorio.
- El premio se acredita en el servidor con una operación idempotente para impedir duplicaciones.

## 4. Límite de dos animales dorados personales
Regla propuesta por el creador:
- Cada cuenta puede conservar como máximo dos animales dorados personales de esta categoría.
- Si el jugador ya posee dos y obtiene la posibilidad de recibir un tercero, el servidor no debe borrar ni reemplazar animales automáticamente.
- Se presenta una decisión segura: vender uno al sistema por un valor anunciado o cancelar/posponer el reclamo hasta liberar un espacio.
- El usuario confirma antes de vender; nunca se destruye un animal sin consentimiento.
- La venta debe ser una transacción atómica y registrada.
- El límite se aplica en el servidor y en el inventario persistente, no solo en la interfaz.

### Aclaración de diseño pendiente
Definir si los dos espacios son para:
A. dos animales dorados personales de cualquier especie, o
B. dos animales por especie dorada.
La implementación inicial asumirá A: máximo dos animales dorados personales en total por cuenta.

También definir si "vender" significa vender al sistema del juego o permitir comercio entre jugadores. Recomendación inicial: venta al sistema únicamente; no transferibles, porque son premios personales de fidelidad.

## 5. Protección contra abuso
- Un único reclamo diario por UserId.
- Operación de reclamo idempotente; reintentos de red no duplican huevos ni racha.
- Actualización persistente con UpdateAsync y control de concurrencia.
- Registro de cada premio: UserId, fecha del juego, resultado, versión de probabilidades y estado de entrega.
- Validar el inventario antes de conceder el premio.
- Limitar solicitudes y rechazar datos enviados por el cliente que pretendan elegir la cantidad.
- No penalizar desconexiones durante el reclamo; si el servidor confirmó la operación, la recompensa queda registrada.
- No usar cuentas alternativas, bots ni actividad artificial para inflar métricas.

## 6. Interfaz
En el lobby y en la granja:
- Panel "Regalo de hoy".
- Botón "Reclamar" solo si está disponible.
- Animación breve de apertura y cantidad obtenida.
- Contador de racha: "Día consecutivo 24 / 365".
- Próximo reinicio con cuenta regresiva.
- Progreso hacia la Gallina Dorada Ancestral.
- Álbum de animales con la fecha y procedencia del ejemplar.
- Si el inventario dorado está completo, explicar la decisión necesaria sin borrar ni vender automáticamente.

## 7. Métricas
Medir:
- porcentaje de jugadores elegibles que reclaman;
- retención D1, D7, D30 y D365;
- distribución real de premios;
- impacto de cada premio en la inflación de huevos;
- jugadores que alcanzan hitos de racha;
- errores, reclamos repetidos y discrepancias de inventario.

La racha es una herramienta de fidelización, no una obligación ni un mecanismo de presión. Evitar mensajes culpabilizantes y notificaciones engañosas.

## 8. Estado
Diseño aprobado como dirección del producto. Falta:
1. simular y decidir probabilidades;
2. definir precio de recompra del animal dorado por el sistema;
3. implementar el servicio diario seguro en Luau;
4. añadir interfaz y pruebas de concurrencia;
5. revisar las políticas vigentes de Roblox antes del lanzamiento.
