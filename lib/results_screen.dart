import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.onPressFinishButton,
    required this.choosenAnswers,
  });

  final List<String> choosenAnswers;
  final void Function() onPressFinishButton;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final totalNumOfQuestions = questions.length;
    final totalNumOfCorrectAnswer = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "You answered $totalNumOfCorrectAnswer out of $totalNumOfQuestions questions correctly!",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color.fromARGB(255, 165, 165, 165),
          ),
          textAlign: TextAlign.center,
        ),
        QuestionsSummary(summaryData: summaryData),
        const SizedBox(
          height: 30,
        ),
        TextButton.icon(
          onPressed: onPressFinishButton,
          // child: const Text("Restart Quiz!"),
          style: TextButton.styleFrom(
            foregroundColor: Colors.white
          ),
          icon: const Icon(Icons.refresh),
          label: const Text("Restart Quiz!"),
        ),
      ],
    );
  }
}
