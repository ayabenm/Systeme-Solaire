import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      // Couleurs principales
      primaryColor: Colors.deepPurple, // Teintes de violet adaptées

      // Couleurs de fond
      scaffoldBackgroundColor: Colors.white,

      // Typographie personnalisée
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: Colors.black87,
          fontSize: 16,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.normal,
        ),
        titleLarge: TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto', // Police moderne
        ),
        titleMedium: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        bodyMedium: TextStyle(
          color: Colors.black54,
          fontSize: 14,
        ),
      ),

      // Boutons et éléments interactifs
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.deepPurple,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
      ),

      // AppBar améliorée
      appBarTheme: AppBarTheme(
        color: Colors.deepPurple,
        elevation: 4,
        iconTheme: IconThemeData(color: Colors.white), // Icônes blanches
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto',
        ),
      ),

      // Conteneurs et Cartes
      cardTheme: CardTheme(
        color: Colors.white,
        shadowColor: Colors.black45,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),

      // TextField et Input
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.deepPurple),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.deepPurpleAccent),
        ),
        hintStyle: TextStyle(color: Colors.black45),
      ),

      // Design général des switches, sliders et autres éléments interactifs
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(Colors.deepPurple),
        trackColor: MaterialStateProperty.all(Colors.deepPurple[100]),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: Colors.deepPurple,
        inactiveTrackColor: Colors.deepPurple[100],
        thumbColor: Colors.deepPurpleAccent,
        overlayColor: Colors.deepPurple.withOpacity(0.2),
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Colors.orangeAccent, // Couleur secondaire vive
        surface: Colors.white, // Fond des éléments surélevés
        onSurface: Colors.black, // Couleur pour le texte sur fond élevé
      ));
}
