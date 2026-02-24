import 'package:flutter/material.dart';
import 'screens/quiz_screen.dart';

void main() {
  runApp(MathThinkApp());
}

class MathThinkApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Math Think",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.blue.shade50,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
        ),
      ),
      home: QuizScreen(),
    );
  }
}
