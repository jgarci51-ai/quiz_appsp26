import 'package:flutter/material.dart';
import 'package:quiz_appsp26/start_screen.dart';
import 'package:quiz_appsp26/questions_screen.dart';
import 'package:quiz_appsp26/results_screen.dart';
import 'package:quiz_appsp26/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);
    if(selectedAnswers.length == questions.length){
      //hey were done bro
      setState((){
        //This is going to change to deal with the answer screen
        // selectedAnswers = [];
        activeScreen = ResultsScreen(
          chooseAnswers: selectedAnswers,);
      });
    }
  }

  Widget? activeScreen;
  void switchScreen() {
    setState(() {
      activeScreen = 
      QuestionsScreen(
        onSelectedAnswer: chooseAnswer);
    });
  }

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 63, 8, 165),
                Color.fromARGB(255, 12, 1, 39),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
