import 'package:flutter/material.dart';
import 'dart:async';
import '../data/questions.dart';
import 'result_screen.dart';
import 'dart:math';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  late List shuffledQuestions;
  int currentIndex = 0;
  int score = 0;
  List<int> userAnswers = [];
  Timer? _timer;
  int timeLeft = 180;

  @override
  void initState() {
    super.initState();
    shuffledQuestions = List.from(questions);
    shuffledQuestions.shuffle(Random());
    shuffledQuestions = shuffledQuestions.take(20).toList();
    startTimer();
  }

  void startTimer() {
    timeLeft = 180;
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (timeLeft > 0) {
          timeLeft--;
        } else {
          answerQuestion(-1);
        }
      });
    });
  }

  void answerQuestion(int selectedIndex) {
    userAnswers.add(selectedIndex);

    if (selectedIndex == shuffledQuestions[currentIndex].correctIndex) {
      score++;
    }

    if (currentIndex < shuffledQuestions.length - 1) {
      setState(() {
        currentIndex++;
        startTimer();
      });
    } else {
      _timer?.cancel();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ResultScreen(
            score: score,
            questions: shuffledQuestions,
            userAnswers: userAnswers,
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final question = shuffledQuestions[currentIndex];

    return Scaffold(
      appBar: AppBar(title: Text("Math Think")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text("Soal ${currentIndex + 1}/20"),
            Text("Sisa waktu: $timeLeft detik",
                style: TextStyle(color: Colors.red)),
            SizedBox(height: 20),
            Text(question.questionText,
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ...List.generate(question.options.length, (index) {
              return ElevatedButton(
                onPressed: () => answerQuestion(index),
                child: Text(question.options[index]),
              );
            }),
          ],
        ),
      ),
    );
  }
}
