import '../models/question.dart';

List<Question> questions = List.generate(50, (index) {
  return Question(
    questionText: "Soal OSN SMP nomor ${index + 1}: Jika x + ${index + 2} = ${index + 5}, nilai x adalah...",
    options: ["1", "2", "3", "4"],
    correctIndex: 0,
    explanation: "x = ${index + 5} - ${index + 2} = 1",
  );
});
