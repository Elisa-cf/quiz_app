import 'package:flutter/material.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:quizz_app/start_screen.dart';
import 'package:quizz_app/questions_screen.dart';

//LIFTING THE STATE UP, BEST WAYS THIRD AND FOURTH OPTION.

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  //FIRST / THIRD WAY TO LIFT THE STATE UP WITH TERNARY OPERATORS:
  var activeScreen = 'start-screen';

//METHODS:
  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    //use the selectedAnswers state to show a diferent screen once all the questions have been answered.
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        //Once all the questions have been answered, we need to reset the selected answers back to an empty list
        selectedAnswers = [];
        activeScreen = 'start-screen';
      });
    }
  }

  //SECOND WAY TO LIFT THE STATE UP WITH INITSTATE
  /*Widget? activeScreen;

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = const QuestionsScreen();
    });
  }
*/
  @override
  Widget build(BuildContext context) {
    //THIRD WAY TO LIFT THE STATE THE MOST READABLE:
    final screenWidget = activeScreen == 'start-screen'
        ? StartScreen(switchScreen)
        : QuestionsScreen(onSelectAnswer: chooseAnswer);

    /*FOURTH WAY USING IF STATEMENT INSTEAD OF TERNARY:
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'questions-screen') {
      screenWidget = const QuestionsScreen();
    }*/

    return MaterialApp(
        home: Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 78, 13, 151),
              Color.fromARGB(255, 106, 15, 168),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          //FIRST WAY TO LIFT THE STATE UP WITH TERNARY OPERATORS
          //child: activeScreen == 'start-screen'
          //  ? StartScreen(switchScreen)
          //  : const QuestionsScreen(),
          //SECOND WAY TO LIFT THE STATE UP WITH INITSTATE
          //child: activeScreen,
          //THIRD WAY TO LIFT THE STATE THE MOST READABLE//ALSO USED FOR THE 4TH WAY WITH IF STATEMENT
          child: screenWidget),
    ));
  }
}
