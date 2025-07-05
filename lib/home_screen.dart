import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(this.startQuiz, {super.key, required this.profile});

  final void Function() startQuiz;
  final void Function() profile;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: 0.8,
            child: Image.asset('assets/images/quiz-logo.png', width: 200),
          ),
          const SizedBox(height: 30),
          const Text(
            'Quiz App',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          const SizedBox(height: 30),
          const Text(
            'praktikum mobile 6A',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.deepPurple,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'),
          ),
          const SizedBox(height: 10),
          TextButton.icon(
            onPressed: profile,
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.deepPurple,
            ),
            icon: const Icon(Icons.people_alt),
            label: const Text('Profile'),
          ),
        ],
      ),
    );
  }
}
