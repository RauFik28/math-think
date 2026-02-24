import 'package:flutter/material.dart';
import '../services/storage_service.dart';
import '../models/question.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final List<Question> questions;
  final List<int> userAnswers;

  ResultScreen({
    required this.score,
    required this.questions,
    required this.userAnswers,
  });

  @override
  Widget build(BuildContext context) {

    StorageService.saveResult({
      "score": score,
      "date": DateTime.now().toString(),
    });

    return Scaffold(
      appBar: AppBar(title: Text("Hasil")),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text("Skor: $score / 20",
              style: TextStyle(fontSize: 24)),
          Expanded(
            child: ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(8),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(questions[index].questionText),
                        Text("Jawaban Anda: ${userAnswers[index] == -1 ? "Tidak dijawab" : questions[index].options[userAnswers[index]]}"),
                        Text("Jawaban Benar: ${questions[index].options[questions[index].correctIndex]}"),
                        Text("Pembahasan: ${questions[index].explanation}",
                            style: TextStyle(color: Colors.blue)),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
