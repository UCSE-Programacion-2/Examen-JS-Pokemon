const express = require('express');
const cors = require('cors');
const path = require('path');
const pokemonList = require('./data/pokemon.json');

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());

// Ruta base
app.get('/', (req, res) => {
  res.send('Servidor de Poké-Quiz corriendo. Pokémon en /api/pokemon');
});

// Obtener generaciones disponibles
app.get('/api/generaciones', (req, res) => {
  const generaciones = [
    { id: 1, nombre: 'Gen I (Kanto)' },
    { id: 2, nombre: 'Gen II (Johto)' },
    { id: 3, nombre: 'Gen III (Hoenn)' },
    { id: 4, nombre: 'Gen IV (Sinnoh)' },
    { id: 6, nombre: 'Gen VI (Kalos)' },
  ];
  res.json(generaciones);
});

// Obtener lista de Pokémon o uno aleatorio por generación
app.get('/api/pokemon', (req, res) => {
  const { generacion, random } = req.query;
  let resultado = pokemonList;

  if (generacion) {
    resultado = resultado.filter((p) => p.generacion === Number(generacion));
  }

  if (random === 'true' && resultado.length > 0) {
    const randomIndex = Math.floor(Math.random() * resultado.length);
    return res.json(resultado[randomIndex]);
  }

  return res.json(resultado);
});

// Obtener Pokémon por ID
app.get('/api/pokemon/:id', (req, res) => {
  const { id } = req.params;
  const pokemon = pokemonList.find(
    (p) => p.id === Number(id) || p.nombre.toLowerCase() === id.toLowerCase(),
  );

  if (!pokemon) {
    return res.status(404).json({ error: 'Pokémon no encontrado' });
  }

  return res.json(pokemon);
});

app.use('/data', express.static(path.join(__dirname, 'data')));

app.listen(PORT, () => {
  console.log(`Servidor de Pokémon escuchando en http://localhost:${PORT}`);
  console.log(`API Pokémon: http://localhost:${PORT}/api/pokemon`);
});
