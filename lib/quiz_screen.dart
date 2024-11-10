import 'package:flutter/material.dart';
import '../quiz_data.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;
  bool isAnswered = false;
  String userAnswer = '';
  bool isCorrect = false;

  void checkAnswer(String answer) {
    setState(() {
      isAnswered = true;
      userAnswer = answer;
      isCorrect = answer == quizQuestions[currentQuestionIndex].answer;
      if (isCorrect) score++;
    });
  }

  void nextQuestion() {
    if (currentQuestionIndex + 1 < quizQuestions.length) {
      setState(() {
        isAnswered = false;
        userAnswer = '';
        currentQuestionIndex++;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ResultScreen(score: score, total: quizQuestions.length),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = quizQuestions[currentQuestionIndex];

    return Scaffold(
      // Arrière-plan avec une image de fond et un dégradé
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bac.jpg'),
            fit: BoxFit.cover, // Cela permet de remplir toute la zone
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5),
                BlendMode.darken), // Applique un filtre sombre
          ),
          gradient: LinearGradient(
            colors: [Colors.blue.shade400, Colors.purple.shade600],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0.0,
              0.6
            ], // Empêche le dégradé de couvrir complètement l'image
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Circular Progress Indicator
              SizedBox(
                height: 100,
                width: 100,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CircularProgressIndicator(
                      value: (currentQuestionIndex + 1) / quizQuestions.length,
                      strokeWidth: 8,
                      backgroundColor: Colors.grey[300],
                      color: Colors.deepPurple.shade500, // Deep Purple
                    ),
                    Center(
                      child: Text(
                        "${currentQuestionIndex + 1} / ${quizQuestions.length}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color:
                              Colors.white, // Texte en blanc pour le contraste
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Question Card avec bord arrondi
              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.white.withOpacity(0.9), // Fond blanc avec opacité
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    question.question,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Réponses sous forme de liste
              Expanded(
                child: ListView(
                  children: question.options.map((option) {
                    bool isSelected = isAnswered && option == userAnswer;
                    bool isCorrectAnswer =
                        isAnswered && option == question.answer;
                    return GestureDetector(
                      onTap: isAnswered ? null : () => checkAnswer(option),
                      child: Card(
                        color: isSelected
                            ? (isCorrect
                                ? Colors.greenAccent[200]
                                : Colors.redAccent[200])
                            : Colors.white,
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            option,
                            style: TextStyle(
                              fontSize: 18,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 10),
              if (isAnswered)
                Text(
                  isCorrect
                      ? 'صحيح!'
                      : 'خطأ! الإجابة الصحيحة هي ${question.answer}.',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              Icon(
                isCorrect ? Icons.check_circle : Icons.error,
                color: isCorrect ? Colors.green : Colors.red,
                size: 40,
              ),
              SizedBox(height: 20),
              // Bouton de passage à la question suivante
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue.shade600,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 6,
                ),
                onPressed: nextQuestion,
                child: Text('السؤال التالي', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('اختبار'),
        backgroundColor:
            Colors.transparent, // AppBar transparent pour voir le fond
        centerTitle: true,
        elevation: 0, // Pas d'ombre pour AppBar
      ),
    );
  }
}
