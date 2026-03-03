import 'package:flutter/material.dart';
import 'package:quiz_appsp26/answer_button.dart';
import 'package:quiz_appsp26/data/questions.dart';

class QuestionsScreen extends StatefulWidget{
  const QuestionsScreen({super.key});

  State<QuestionsScreen> createState(){
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen>{
  var currentQuestionIndex = 0;
  void answerQuestion(){
  setState((){
    currentQuestionIndex++;
  });
}
@override
Widget build(BuildContext context) {

  final currentQuestion = questions[currentQuestionIndex];
  // TODO: implement build
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin:const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(currentQuestion.question,
              style:const TextStyle(
                color: Colors.white,
                fontSize: 20
              ),
              textAlign: TextAlign.center,
            ),
          const SizedBox(height: 30),
        ...currentQuestion.getShuffledAnswer().map((item) {
          return AnswerButton(answerText: item,
          onTap:answerQuestion);
         } ),
          ],),
      ),
    );
  }
}