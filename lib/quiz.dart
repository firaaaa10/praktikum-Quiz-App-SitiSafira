import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/home_screen.dart';
import 'package:quiz_app/datas/questions.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/profile.dart'; // Import the profile.dart file

class Quiz extends StatefulWidget {
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen'; // Menyimpan layar aktif
  List<String> selectedAnswer = [];

  // Fungsi untuk mengubah layar dari 'start-screen' ke 'questions-screen'
  void switchScreen() {
    setState(() {
      selectedAnswer = []; // Clear selected answers when starting a new quiz
      activeScreen = 'questions-screen';
    });
  }

  // Fungsi untuk memilih jawaban dan melanjutkan ke layar hasil jika semua pertanyaan telah dijawab
  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  // Fungsi untuk mereset kuis
  void restartQuiz() { // Mengubah nama fungsi menjadi restartQuiz (huruf kecil di awal)
    setState(() {
      selectedAnswer = [];
      activeScreen = 'questions-screen'; // Memastikan kembali ke layar pertanyaan
    });
  }

  void profileScreen() {
    setState(() {
      // Clear selected answers when navigating to profile screen
      selectedAnswer = [];
      activeScreen = 'profile-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = HomeScreen(
      switchScreen, // Positional argument for startQuiz
      profile: profileScreen, // Named argument for profile
    );

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      ); // Tampilan pertanyaan
    }

    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        choosenAnswers: selectedAnswer,
        onRestart: restartQuiz, // Menggunakan nama fungsi yang sudah diperbaiki
      );
    }

  if (activeScreen == 'profile-screen'){
    screenWidget = Profile(onRestart: restartQuiz); // Pass onRestart to Profile
  }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple,
                Color.fromARGB(255, 148, 59, 219)
              ], // Mengubah warna kedua agar ada gradien
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ), // LinearGradient
          ),
          child: screenWidget, // Menampilkan widget berdasarkan activeScreen
        ),
      ),
    );
  }
}