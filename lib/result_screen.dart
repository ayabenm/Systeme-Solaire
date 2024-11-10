import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int total;

  ResultScreen({required this.score, required this.total});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('النتيجة'),
        backgroundColor: Colors.transparent, // Rendre l'AppBar transparente
        elevation: 0, // Pas d'ombre pour l'AppBar
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/back.jpeg'), // Votre image de fond
            fit: BoxFit.cover, // Pour que l'image couvre toute la zone
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5),
                BlendMode.darken), // Applique un filtre sombre
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Résultat
              Text(
                'نتيجتك: $score / $total',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors
                      .white, // Texte en blanc pour ressortir sur le fond sombre
                  shadows: [
                    Shadow(
                        blurRadius: 5,
                        color: Colors.black,
                        offset: Offset(2, 2))
                  ], // Ombre légère pour le texte
                ),
              ),
              SizedBox(height: 20),
              // Bouton de retour à la page d'accueil
              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: Text('العودة إلى الصفحة الرئيسية'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
