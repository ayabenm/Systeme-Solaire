import 'package:flutter/material.dart';
import '../planets_data.dart';
import '../planet_card.dart';
import 'planet_detail_screen.dart';
import 'quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'النظام الشمسي',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              Shadow(
                  blurRadius: 5, color: Colors.black26, offset: Offset(2, 2)),
            ],
          ),
        ),
        backgroundColor: Colors.transparent, // AppBar transparent
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Fond d'écran avec une image de l'espace
          Positioned.fill(
            child: Image.asset(
              'assets/images/backend.jpeg', // Remplacez cette ligne par votre image de fond
              fit: BoxFit.cover,
            ),
          ),
          // Ajout d'un dégradé léger pour assombrir l'arrière-plan et améliorer la lisibilité
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.5), // Légère ombre en haut
                    Colors.transparent,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          // Contenu de la page
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'استكشاف الكواكب',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                          blurRadius: 5,
                          color: Colors.black26,
                          offset: Offset(2, 2)),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                    ),
                    itemCount: planets.length,
                    itemBuilder: (context, index) {
                      return PlanetCard(
                        planet: planets[index],
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PlanetDetailScreen(planet: planets[index]),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                // Bouton avec animation et effet visuel
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QuizScreen()),
                      );
                    },
                    child: Text('انطلق في اختبار النظام الشمسي'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple[400],
                      padding: EdgeInsets.symmetric(vertical: 18),
                      textStyle:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // Bord arrondi
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
