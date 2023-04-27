import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: Colors.deepPurple.shade300,
          ),
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
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: BorderSide(width: 1.5, color: Colors.deepPurple.shade600),
            ),
            child: Text(
              'Start Quiz',
              style: TextStyle(
                color: Colors.deepPurple.shade100,
              ),
            ),
          )
        ],
      ),
    );
  }
}
