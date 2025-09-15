# Examen JS – Pokédex Quiz

Este examen replica la estructura de `Examen-JS-Billetera-Virtual` pero con temática Pokémon y uso de PokéAPI.

## Objetivo
Construir un mini-quiz: “¿Quién es ese Pokémon?” que:
- Obtenga un Pokémon aleatorio por generación desde PokéAPI.
- Permita ingresar el nombre y valide si es correcto.
- Gestione puntaje e historial en `localStorage`.
- Muestre pistas (tipos, altura, peso, primera letra).

## Endpoints usados
- `GET https://pokeapi.co/api/v2/pokemon/{id}` – Datos del Pokémon, sprite, tipos, altura y peso. Documentación: [PokéAPI](https://pokeapi.co/)

## Estructura esperada del proyecto
- `index.html`: maquetado, header con puntaje y selector de generación, acciones (Nuevo, Pista, Historial), sección de quiz con imagen, input y feedback, modales de pista e historial.
- `css/styles.css`: estilos base, colores y tipografía “Pokemon Solid”, estados de interacción y modales.
- `js/app.js`: implementación completa de la lógica del examen (sin librerías externas).

## Requisitos funcionales (obligatorios)
1. Al cargar la página se debe mostrar un Pokémon aleatorio correspondiente a la generación seleccionada.
2. El botón “Nuevo Pokémon” debe cargar otro Pokémon aleatorio de la generación actual.
3. Al confirmar una respuesta:
   - Si el nombre coincide exactamente con el oficial de PokéAPI (sin mayúsculas/minúsculas), sumar puntaje.
   - Si no coincide, restar puntaje sin que baje de cero.
   - Debe mostrarse un mensaje de feedback con el resultado.
4. Pista debe mostrar: primera letra del nombre, tipos, altura en metros y peso en kilogramos del Pokémon actual.
5. Historial debe listar los intentos (fecha/hora, generación, nombre real, si fue correcto y el intento ingresado), persistiendo en `localStorage`.
6. El puntaje debe persistir en `localStorage` y reflejarse en pantalla en todo momento.
7. Debe manejarse el estado de carga (deshabilitar acciones mientras se hace la petición) y errores de red con mensajes claros.

## Requisitos técnicos
- Usar `fetch` para consumir PokéAPI.
- No utilizar frameworks ni librerías de JS; sólo JavaScript nativo.
- No modificar la estructura básica de `index.html` (puedes agregar atributos necesarios, pero mantén las secciones y elementos claves).
- Mantener estilos coherentes con la estética Pokémon provista.

## Almacenamiento local
- Clave sugerida para puntaje: `pk_score` (número entero ≥ 0).
- Clave sugerida para historial: `pk_history` (arreglo con objetos de intento con fecha, generación, nombre real, acierto y valor ingresado).
- Límite sugerido del historial: 50 elementos (el más reciente primero).

## Selección por generación
- El selector de generación define el rango de IDs de Pokémon a sortear. Usa rangos aproximados por generación (ejemplo Gen I: 1–151, Gen II: 152–251, etc.). Debes evitar IDs que no devuelvan sprite y reintentar si ocurre.

## Validaciones y UX
- Validar entrada vacía antes de chequear la respuesta.
- Comparar insensible a mayúsculas/minúsculas.
- Mantener el input enfocado al cargar un nuevo Pokémon.
- Proveer mensajes de error entendibles ante fallos de red o datos.
- Deshabilitar botones durante las cargas para prevenir acciones repetidas.

## Accesibilidad mínima
- Asegurar que los elementos interactivos sean alcanzables por teclado.
- Proveer texto alternativo en la imagen del Pokémon con su nombre.

## Pasos sugeridos de implementación
1. Preparación del estado: puntaje actual, Pokémon actual, bandera de carga.
2. Lectura inicial desde `localStorage` y sincronización del puntaje con la UI.
3. Cálculo del rango de IDs en función de la generación seleccionada.
4. Obtención de un ID aleatorio dentro del rango y solicitud a PokéAPI.
5. Manejo de reintentos si el sprite no está disponible.
6. Renderizado de la imagen y reseteo del input/feedback.
7. Verificación de la respuesta y actualización de puntaje/historial.
8. Renderizado del historial en el modal correspondiente.
9. Cálculo y presentación de la pista en el modal correspondiente.
10. Manejo de errores y estados de deshabilitado de botones.

## Criterios de evaluación (rúbrica)
- Correctitud funcional del flujo principal (nuevo Pokémon, responder, puntaje, pista, historial).
- Uso adecuado de `fetch` y manejo de errores de red.
- Persistencia correcta en `localStorage` y sincronización con la UI.
- Estructura del código: funciones claras, nombres descriptivos y bajo acoplamiento.
- Accesibilidad y UX básica (focus, mensajes, deshabilitado de acciones durante carga).
- Calidad visual consistente con los estilos del proyecto.

## Pruebas manuales mínimas
- Cambiar de generación y verificar que los Pokémon coincidan con el rango esperado.
- Forzar varios “Nuevo Pokémon” para validar reintentos ante sprites faltantes.
- Ingresar respuesta correcta e incorrecta y observar cambios en feedback y puntaje.
- Refrescar la página y confirmar persistencia del puntaje e historial.
- Abrir los modales de Pista e Historial y verificar su contenido.

## Bonificaciones (opcionales)
- Normalizar entradas del usuario (trimming, manejo de espacios, tolerar guiones).
- Modo contrarreloj o límite de intentos por Pokémon.
- Sonidos o animaciones sutiles al acertar o errar.
- Soporte de nombres en otro idioma con una estrategia clara de validación.

## Entrega
- Implementa toda la solución en `js/app.js` sin fragmentos de código en este `readme.md`.
- No se aceptan librerías externas de JS.
- Asegúrate de que el proyecto se abra correctamente en un servidor estático y que la PokéAPI responda.

---
Créditos: Datos provistos por [PokéAPI](https://pokeapi.co/).
