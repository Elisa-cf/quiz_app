import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizz_app/answer_button.dart';
import 'package:quizz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion() {
    setState(() {
      currentQuestionIndex++; //increments index by 1
    });

    //currentQuestionIndex += 1; increments the index by the number you want
    //currentQuestionIndex = currentQuestionIndex + 1; increments the index by the number you want
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            //chain the map into the getShuffleAnswers method without changing the original list
            ...currentQuestion.getShuffleAnswers().map((answer) => AnswerButton(
                  answerText: answer,
                  onTap: answerQuestion,
                )),
          ],
        ),
      ),
    );
  }
}
