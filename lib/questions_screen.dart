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

@override
Widget build(BuildContext context){

  final currentQuestion = questions[0];
  // TODO: implement build
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(currentQuestion.question,
            style:const TextStyle(
              color: Colors.white,
              fontSize: 20
            )
          ),
        const SizedBox(height: 30),
       ...currentQuestion.answers.map((item){
        return AnswerButton(answerText: item,
        onTap:(){});
       } ),
        ],),
    );
  }
}