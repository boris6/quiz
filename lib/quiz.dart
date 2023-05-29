import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/questions_screen.dart';
import 'package:quiz/results_screen.dart';
import 'package:quiz/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  final List<String> selectedAnswers = [];

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(onSelectAnswer: chooseAnswer);
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultsScreen(chosenAnswers: selectedAnswers);
        selectedAnswers.clear();
      });
    }
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purple],
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
