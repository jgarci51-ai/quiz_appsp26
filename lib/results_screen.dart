import 'dart:nativewrappers/_internal/vm/lib/internal_patch.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quiz_appsp26/data/questions.dart';
class ResultsScreen extends StatelessWidget{
  const ResultsScreen({super.key,
   required this.chooseAnswers});

final List<String> chooseAnswers;

List<Map<String, Object>> getSummaryData(){
  List<Map<String, Object>> summary =[];
  for (var i =0;i < chooseAnswers.length;i++){
  summary.add({
    'questions_index':i,
    'questions':questions[i].question,
    'correct_answer':questions[i].answers[0],
    'user_answer':chooseAnswers[1]
  });
 }
  return summary;
}



@override
  Widget build(context)
  {
    final summaryData = getSummaryData();
    final numTotalQuestions = getSummaryData().length;
    final numTotalCorrect = summaryData.where(
      (data){
        return data['correct_answer'] == data['user_answer'];
      }
    );


    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const Text('You answered X out of Y questions Correctly'),
            const SizedBox(height:30,),
            const Text('List of Answers and Questions'),//loop through that summary object
            const SizedBox(height:30,),
            TextButton(
              onPressed: (){},
              child: const Text('Restart Quiz'),
            )
          ],
        ),
      ),
    );
  }
}
