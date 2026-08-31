# ⚡ Examen: Pokédex y Batalla Pokémon con JavaScript

## 📋 Objetivo del Examen

En este examen práctico deberás desarrollar una **aplicación web interactiva de Pokédex y arena de batalla Pokémon**, conectando una interfaz frontend desarrollada con **HTML, CSS y JavaScript Vanilla** a un **servidor backend local en Node.js/Express**.

La aplicación debe permitir:

1. Consultar el listado de Pokémon y sus tipos elementales desde el servidor backend local (`/api/pokemon` o `/api/tipos`).
2. Filtrar Pokémon por nombre (búsqueda en tiempo real) y por tipo elemental (Fuego, Agua, Planta, Eléctrico, etc.).
3. Renderizar las tarjetas de los Pokémon en el DOM con sus estadísticas clave (nombre, tipo, HP, Ataque, Defensa, imagen).
4. Permitir seleccionar dos Pokémon para simular una batalla por turnos o por puntos de combate (CP / Ataque vs Defensa).
5. Persistir el historial de batallas ganadas en el navegador mediante `localStorage` y permitir su limpieza interactiva.

---

## 📌 Tabla de Entregas / Issues de GitHub

Cada entrega se corresponde con un **issue automático** en tu repositorio de GitHub. Para cerrar cada issue automáticamente, incluye el commit sugerido exacto al subir tu solución a la rama principal (`main`).

| Entrega | Tarea a Realizar                                                                                                  | Commit Sugerido                                                         |
| :------ | :---------------------------------------------------------------------------------------------------------------- | :---------------------------------------------------------------------- |
| **#1**  | Vincular `css/styles.css` y `js/script.js` en `index.html`.                                                       | `feat(html): vincular css y script js al html`                          |
| **#2**  | Consumir la API local (`/api/pokemon`) usando `fetch` y `async/await`.                                            | `feat(js): consumir api de pokemon con fetch y async await`             |
| **#3**  | Renderizar dinámicamente las tarjetas de Pokémon y poblar el filtro de tipos en el DOM.                           | `feat(js): renderizar tarjetas de pokemon y filtros en el dom`          |
| **#4**  | Implementar filtrado en tiempo real y la arena de combate entre 2 Pokémon.                                        | `feat(js): implementar filtrado y arena de batalla pokemon`             |
| **#5**  | Persistir las batallas en `localStorage`, mostrar el historial y permitir su limpieza con `#btnLimpiarHistorial`. | `feat(js): persistir y gestionar historial de batallas en localstorage` |

---

## 🛠️ Especificación Técnica y Requerimientos

### 1. Servidor Backend Local

El servidor Express provisto corre en el puerto `3000` con CORS habilitado:

- **`GET http://localhost:3000/api/pokemon`**: Devuelve la lista completa de Pokémon con sus estadísticas e imágenes.
- **`GET http://localhost:3000/api/tipos`**: Devuelve la lista de tipos elementales.

Para iniciar el servidor backend:

```bash
npm start
```

### 2. Elementos Clave del DOM

- **`#inputBusqueda`**: Input de texto para filtrar Pokémon por nombre.
- **`#filtroTipo`**: `<select>` para filtrar por tipo elemental.
- **`#pokedexGrid`**: Contenedor donde se insertan las tarjetas de Pokémon (`.pokemon-card`).
- **`#pokemon1`** y **`#pokemon2`**: Selectores para elegir los contrincantes.
- **`#btnPelear`**: Botón para simular el duelo y determinar al ganador según la fórmula de poder `(ataque + hp - defensa)`.
- **`#resultadoBatalla`**: Contenedor donde se muestra el resultado.
- **`#historialLista`**: Lista `<ul>` donde se registran las batallas guardadas.
- **`#btnLimpiarHistorial`**: Botón para vaciar el historial en `localStorage`.

### 3. Almacenamiento Local (`localStorage`)

- **Clave obligatoria**: `'pokedex_batallas'`
- **Estructura**: Arreglo de objetos con `{ pokemon1, pokemon2, ganador, fecha }`.
- Utilizar `JSON.stringify()` para guardar y `JSON.parse()` para leer.

---

## 🧪 Comandos de Prueba y Autoevaluación

Antes de entregar, podés autoevaluar tu trabajo localmente:

```bash
# Ejecutar todas las pruebas automáticas
npm test

# Ejecutar una prueba individual
npm run test:link
npm run test:fetch
npm run test:render
npm run test:events
npm run test:storage

# Validar estilo y calidad de código
npm run lint
npm run format:check
```

---

## 🚀 Instrucciones para la Ejecución Local

1. Instalar dependencias:
   ```bash
   npm install
   ```
2. Iniciar el servidor local:
   ```bash
   npm start
   ```
3. Abrir `index.html` en el navegador (usando la extensión **Live Server** de VS Code).
4. Abrir la consola de herramientas de desarrollador (**F12**) para verificar peticiones de red y depurar posibles errores.
