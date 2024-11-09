const express = require('express');
const admin = require('firebase-admin');
const serviceAccount = require('./solarsystem-def59-default-rtdb-export.json');

// Initialisez Firebase avec les informations d'identification du compte de service
admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  databaseURL: "https://solarsystem-def59-default-rtdb.firebaseio.com"
});

const app = express();
app.use(express.json());

// Route de base
app.get('/', (req, res) => {
  res.send('Bienvenue sur l\'API des planètes et quiz du système solaire');
});

// Route pour ajouter des données de planètes dans Realtime Database
app.post('/addPlanet', async (req, res) => {
  try {
    const planetData = req.body; // Données de la planète à ajouter
    const db = admin.database();
    const ref = db.ref('planets'); // Référence au nœud 'planets'
    const newRef = ref.push(); // Crée un nouvel ID unique pour chaque entrée
    await newRef.set(planetData); // Ajoute les données sous cet ID unique
    res.status(200).send('Planet data added successfully');
  } catch (error) {
    res.status(500).send(error.message);
  }
});

// Route pour récupérer les données depuis Realtime Database (planètes)
app.get('/getPlanets', async (req, res) => {
  try {
    const db = admin.database();
    const ref = db.ref('planets'); // Référence au nœud 'planets'
    const snapshot = await ref.once('value'); // Récupère les données sous 'planets'
    const data = snapshot.val(); // Obtient les données en format JSON
    res.status(200).json(data);
  } catch (error) {
    res.status(500).send(error.message);
  }
});

// Route pour ajouter des questions de quiz dans Realtime Database
app.post('/addQuizQuestion', async (req, res) => {
  try {
    const questionData = req.body; // Données de la question de quiz à ajouter
    const db = admin.database();
    const ref = db.ref('quizQuestions'); // Référence au nœud 'quizQuestions'
    const newRef = ref.push(); // Crée un nouvel ID unique pour chaque entrée
    await newRef.set(questionData); // Ajoute les données sous cet ID unique
    res.status(200).send('Quiz question added successfully');
  } catch (error) {
    res.status(500).send(error.message);
  }
});

// Route pour récupérer les questions de quiz depuis Realtime Database
app.get('/getQuizQuestions', async (req, res) => {
  try {
    const db = admin.database();
    const ref = db.ref('quizQuestions'); // Référence au nœud 'quizQuestions'
    const snapshot = await ref.once('value'); // Récupère les données sous 'quizQuestions'
    const data = snapshot.val(); // Obtient les données en format JSON
    res.status(200).json(data);
  } catch (error) {
    res.status(500).send(error.message);
  }
});

// Démarrer le serveur sur le port 3000
app.listen(3000, () => {
  console.log('Serveur en cours d\'exécution sur le port 3000');
});
