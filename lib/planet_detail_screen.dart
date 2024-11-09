import 'package:flutter/material.dart';
import '../planet.dart';

class PlanetDetailScreen extends StatelessWidget {
  final Planet planet;

  PlanetDetailScreen({required this.planet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(planet.name),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: planet.name,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(planet.image, fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 20),
            Text(
              planet.description,
              style:
                  TextStyle(fontSize: 18, height: 1.5, color: Colors.black87),
            ),
            SizedBox(height: 20),
            Text(
              'حقائق ممتعة:',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurpleAccent),
            ),
            ...planet.funFacts.map((fact) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(fact,
                      style: TextStyle(fontSize: 16, color: Colors.black54)),
                )),
          ],
        ),
      ),
    );
  }
}
