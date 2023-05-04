import 'package:flutter/material.dart';
import 'package:quizz_app/start_screen.dart';
import 'package:quizz_app/questions_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  //FIRST WAY TO LIFT THE STATE UP WITH TERNARY OPERATORS, ALSO NEEDS TO BE USE FOR HTE THIRD OPTION:
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
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
        : const QuestionsScreen();

    /*FOURTH WAY USINF IF STATEMENT INSTEAD OF TERNARY:
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
          //THIRD WAY TO LIFT THE STATE THE MOST READABLE:
          child: screenWidget),
    ));
  }
}
