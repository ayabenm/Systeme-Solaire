import 'package:flutter/material.dart';
import '../planet.dart';

class PlanetDetailScreen extends StatelessWidget {
  final Planet planet;

  PlanetDetailScreen({required this.planet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Définition de l'arrière-plan avec une image
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bac.jpg'), // Votre image de fond
            fit: BoxFit.cover, // L'image couvre toute la surface de l'écran
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5),
                BlendMode.darken), // Ajout d'un filtre sombre
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Utilisation de Hero pour une animation fluide
              Hero(
                tag: planet.name,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    planet.image,
                    fit: BoxFit.cover,
                    height: 250, // Hauteur de l'image augmentée
                    width: double.infinity,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Description de la planète avec amélioration de la lisibilité
              Container(
                decoration: BoxDecoration(
                  color: Colors.white
                      .withOpacity(0.7), // Fond blanc semi-transparent
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  planet.description,
                  style: TextStyle(
                      fontSize: 18, height: 1.5, color: Colors.black87),
                ),
              ),
              SizedBox(height: 20),
              // Titre pour les faits amusants avec une meilleure typographie
              Text(
                'حقائق ممتعة:',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [Shadow(blurRadius: 10, color: Colors.black)],
                ),
              ),
              SizedBox(height: 10),
              // Liste des faits amusants avec des cartes
              ...planet.funFacts.map((fact) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Card(
                      color: Colors.white.withOpacity(0.8),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          fact,
                          style: TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                      ),
                    ),
                  )),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(planet.name),
        backgroundColor:
            Colors.transparent, // Transparence pour laisser voir l'arrière-plan
        centerTitle: true,
        elevation: 0, // Supprimer l'ombre de l'AppBar
      ),
    );
  }
}
