import 'package:flutter/material.dart';
import 'package:quizler/constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Q U I Z L E R'),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('4'),
                  Text('/13'),
                ],
              ),
              Text('How many types of widgets are there in Flutter?'),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    for (int i = 0; i < 5; i++)
                      GestureDetector(
                        onTap: () {},
                        child: Container(child: Text('1')),
                      ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
