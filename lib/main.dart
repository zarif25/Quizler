import 'package:flutter/material.dart';
import 'package:quizler/constants.dart';
import 'package:quizler/quiz_brain.dart';
import 'package:quizler/screens/question_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            fontFamily: 'InriaSans',
            color: KColors.pureBlack,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: KColors.background,
          foregroundColor: KColors.pureBlack,
          elevation: 0,
          titleTextStyle: TextStyle(
            fontFamily: 'InriaSans',
            color: KColors.pureBlack,
            fontSize: 26,
            letterSpacing: 3,
          ),
        ),
        scaffoldBackgroundColor: KColors.background,
      ),
      home: QuestionScreen(
        question: Question(
          questionText: 'How many types of widgets are there in Flutter?',
          options: ['2', '1', '3', '4'],
        ),
        serial: 4,
        numberOfQuestions: 13,
      ),
    );
  }
}
