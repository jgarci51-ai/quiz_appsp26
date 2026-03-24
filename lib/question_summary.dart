import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return Column(
      children: summaryData.map((data) {
        final isCorrect =
            data['user_answer'] == data['correct_answer'];

        //  Softer colors like screenshot
        final circleColor = isCorrect
            ? const Color.fromARGB(255, 78, 176, 255) // blue
            : const Color.fromARGB(255, 249, 133, 241); // pink

        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //  Number Circle
              Container(
                width: 35,
                height: 35,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: circleColor,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  ((data['question_index'] as int) + 1).toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(width: 12),

              //  Text Section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['question'] as String,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    // User Answer (neutral style like screenshot)
                    Text(
                      data['user_answer'] as String,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 200, 200, 255),
                        fontSize: 14,
                      ),
                    ),

                    // Correct Answer (slightly highlighted)
                    Text(
                      data['correct_answer'] as String,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 150, 200, 255),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}