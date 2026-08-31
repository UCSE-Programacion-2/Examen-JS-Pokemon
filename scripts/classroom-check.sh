#!/usr/bin/env bash
# Verificaciones automáticas — Examen JS Pokemon.
set -u

HTML="index.html"
JS="js/script.js"
CSS="css/styles.css"

fail() {
  echo "$1" >&2
  exit 1
}

ok() {
  echo CORRECTO
}

clean_js() {
  grep -v '^\s*//' "$JS"
}

case "${1:-}" in
  link-css-js)
    [[ -f "$HTML" ]] || fail "No se encontró index.html en la raíz del proyecto."
    [[ -f "$CSS" ]]  || fail "No se encontró el archivo css/styles.css."
    [[ -f "$JS" ]]   || fail "No se encontró el archivo js/script.js."
    grep -qiE '<link[^>]*href=["'"'"'].*css/styles\.css["'"'"']' "$HTML" \
      || fail "Falta vincular el archivo css/styles.css con una etiqueta <link> en el <head> de index.html."
    grep -qiE '<script[^>]*src=["'"'"'].*js/script\.js["'"'"']' "$HTML" \
      || fail "Falta vincular el archivo js/script.js con una etiqueta <script> en index.html."
    ok
    ;;
  fetch-api)
    [[ -f "$JS" ]] || fail "No se encontró el archivo js/script.js."
    js_code="$(clean_js)"
    if echo "$js_code" | grep -qiE 'fetch\s*\('; then
      :
    elif echo "$js_code" | grep -qiE 'async.*await'; then
      :
    else
      fail "No se encontró la llamada a la API usando fetch() o async/await en js/script.js."
    fi
    echo "$js_code" | grep -qiE '(/api/pokemon|/api/generaciones|localhost:3000)' \
      || fail "No se encontró la consulta a las rutas del backend (/api/pokemon o /api/generaciones) en js/script.js."
    ok
    ;;
  render-dom)
    [[ -f "$JS" ]] || fail "No se encontró el archivo js/script.js."
    js_code="$(clean_js)"
    echo "$js_code" | grep -qiE '(pokemonSprite|guessInput|feedback|score|generationSelector|hintContent|historyContainer)' \
      || fail "No se encontró la selección de los elementos del DOM (pokemonSprite, guessInput, feedback, etc.)."
    if echo "$js_code" | grep -qiE '(src|innerHTML|appendChild|createElement|textContent|classList)'; then
      :
    else
      fail "No se encontró manipulación del DOM para renderizar el sprite del Pokémon o los modales."
    fi
    ok
    ;;
  events-logic)
    [[ -f "$JS" ]] || fail "No se encontró el archivo js/script.js."
    js_code="$(clean_js)"
    echo "$js_code" | grep -qiE 'addEventListener\s*\(\s*["'"'"'](click|submit|change)["'"'"']' \
      || fail "No se encontró la escucha de eventos (click, submit o change) en js/script.js."
    echo "$js_code" | grep -qiE '(toLowerCase|trim|===|score|puntaje)' \
      || fail "No se encontró la lógica de validación de respuesta y cálculo de puntaje."
    ok
    ;;
  storage-history)
    [[ -f "$JS" ]] || fail "No se encontró el archivo js/script.js."
    js_code="$(clean_js)"
    echo "$js_code" | grep -qiE 'localStorage\s*\.\s*setItem\s*\(' \
      || fail "No se encontró el uso de localStorage.setItem() para persistir el historial o puntaje."
    echo "$js_code" | grep -qiE 'localStorage\s*\.\s*getItem\s*\(' \
      || fail "No se encontró el uso de localStorage.getItem() para recuperar el historial o puntaje."
    echo "$js_code" | grep -qiE 'JSON\s*\.\s*(stringify|parse)' \
      || fail "No se encontró el uso de JSON.stringify() o JSON.parse() para el almacenamiento."
    echo "$js_code" | grep -qiE '(removeItem|clear)' \
      || fail "No se encontró la lógica para limpiar el historial con removeItem() o clear()."
    ok
    ;;
  all)
    bash "$0" link-css-js >/dev/null || fail "Falló la prueba link-css-js"
    bash "$0" fetch-api >/dev/null || fail "Falló la prueba fetch-api"
    bash "$0" render-dom >/dev/null || fail "Falló la prueba render-dom"
    bash "$0" events-logic >/dev/null || fail "Falló la prueba events-logic"
    bash "$0" storage-history >/dev/null || fail "Falló la prueba storage-history"
    ok
    ;;
  *)
    echo "Prueba automática no reconocida. Avisale al docente." >&2
    exit 2
    ;;
esac
