import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            //OPACITY 1
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          //OPACITY 2
          /*Opacity(
            opacity: 0.6,
            child: Image.asset(
              'assets/images/quiz-logo.png',
              width: 300,
            ),
          ),*/
          const SizedBox(
            height: 80,
          ),
          Text(
            'Learn FLutter the fun way!',
            style: TextStyle(color: Colors.deepPurple.shade100, fontSize: 24),
          ),
          const SizedBox(
            height: 40,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: BorderSide(width: 1.5, color: Colors.deepPurple.shade600),
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: Text(
              'Start Quiz',
              style: GoogleFonts.lato(
                color: Colors.deepPurple.shade100,
              ),
            ),
          )
        ],
      ),
    );
  }
}
