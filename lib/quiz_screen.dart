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
      appBar: AppBar(
        title: Text('اختبار'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Padding(
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
                    color: Colors.deepPurpleAccent,
                  ),
                  Center(
                    child: Text(
                      "${currentQuestionIndex + 1} / ${quizQuestions.length}",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Question Card
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
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
            // Answer Options
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
                          ? (isCorrect ? Colors.green[300] : Colors.red[300])
                          : Colors.white,
                      elevation: 4,
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
              Icon(
                isCorrect ? Icons.check_circle : Icons.error,
                color: isCorrect ? Colors.green : Colors.red,
                size: 40,
              ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: nextQuestion,
              child: Text('السؤال التالي', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
