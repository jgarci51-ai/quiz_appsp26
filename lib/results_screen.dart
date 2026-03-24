import 'package:flutter/material.dart';
import 'package:quiz_appsp26/data/questions.dart';
import 'package:quiz_appsp26/question_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chooseAnswers,
    required this.onRestart,
  });

  final List<String> chooseAnswers;
  final VoidCallback onRestart;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < chooseAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': chooseAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();

    final numTotalQuestions = questions.length;
    final numTotalCorrect = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          children: [
            Text(
              'You answered $numTotalCorrect out of $numTotalQuestions questions correctly!',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            // Scrollable summary (important for matching screenshot)
            Expanded(
              child: SingleChildScrollView(
                child: QuestionSummary(summaryData: summaryData),
              ),
            ),

            const SizedBox(height: 20),

            TextButton.icon(
              onPressed: onRestart,
              icon: const Icon(Icons.refresh, color: Colors.white),
              label: const Text(
                'Restart Quiz',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}