import 'package:flutter/material.dart';
import 'package:quizler/constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
          backgroundColor: KColors.pureWhite,
          foregroundColor: KColors.pureBlack,
          elevation: 0,
        ),
        scaffoldBackgroundColor: KColors.pureWhite,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Q U I Z L E R'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: const [
                  Text(
                    'QUESTION NO ',
                    style: TextStyle(
                      color: KColors.gray,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '4',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text('/13'),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                'How many types of widgets are there in Flutter?',
                style: TextStyle(fontSize: 24),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    OptionButton(number: 'A', option: '1'),
                    SizedBox(height: 12),
                    OptionButton(number: 'B', option: '2'),
                    SizedBox(height: 12),
                    OptionButton(number: 'C', option: '3'),
                    SizedBox(height: 12),
                    OptionButton(number: 'D', option: '4'),
                    SizedBox(height: 12),
                    NeubrutalButton(
                      color: KColors.primary,
                      child: Center(
                        child: Text(
                          'Skip',
                          style: TextStyle(color: KColors.pureWhite),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OptionButton extends StatelessWidget {
  final String number, option;
  const OptionButton({
    Key? key,
    required this.number,
    required this.option,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeubrutalButton(
      child: Row(
        children: [
          Text(
            number,
            style: const TextStyle(
              color: KColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            width: 24,
          ),
          Text(option),
        ],
      ),
    );
  }
}

class NeubrutalButton extends StatelessWidget {
  final Widget child;
  final Color color;
  const NeubrutalButton({
    Key? key,
    required this.child,
    this.color = KColors.pureWhite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: color,
          boxShadow: const [
            BoxShadow(
              color: KColors.pureBlack,
              spreadRadius: 2,
              offset: Offset(1, 1),
            ),
          ],
          borderRadius: BorderRadius.circular(3.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          child: child,
        ),
      ),
    );
  }
}
