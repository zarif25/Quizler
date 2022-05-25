import 'package:flutter/material.dart';
import 'package:quizler/constants.dart';
import 'package:quizler/quiz_brain.dart';
import 'package:quizler/components/neubrutal_button.dart';
import 'package:quizler/components/option_button.dart';

class QuestionScreen extends StatefulWidget {
  final Question question;
  late final List<String> options;

  QuestionScreen({Key? key, required this.question}) : super(key: key) {
    options = question.getOptions();
  }

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  List<OptionStatus> optionStatuses = [
    OptionStatus.enabled,
    OptionStatus.enabled,
    OptionStatus.enabled,
    OptionStatus.enabled,
  ];
  bool isOptionSelected = false;

  void onOptionPress(int index) {
    setState(() {
      isOptionSelected = true;
      for (int i = 0; i < 4; i++) {
        optionStatuses[i] = OptionStatus.disabled;
      }
      int correctIndex = widget.options.indexOf(widget.question.correct);
      optionStatuses[correctIndex] = OptionStatus.correct;
      if (index != correctIndex) {
        optionStatuses[index] = OptionStatus.incorrect;
      }
    });
  }

  void onSkipPress() {
    setState(() {
      isOptionSelected = true;
      for (int i = 0; i < 4; i++) {
        optionStatuses[i] = OptionStatus.disabled;
      }
      int correctIndex = widget.options.indexOf(widget.question.correct);
      optionStatuses[correctIndex] = OptionStatus.correct;
    });
  }

  void onNextPress() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QUIZLER'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
            Text(
              'Q: ${widget.question.questionText}',
              style: const TextStyle(fontSize: 24),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  for (int i = 0; i < 4; i++)
                    OptionButton(
                      number: 'ABCD'[i],
                      option: widget.options[i],
                      onPress: () => isOptionSelected ? null : onOptionPress(i),
                      optionStatus: optionStatuses[i],
                    ),
                  NeubrutalButton(
                    onPress: isOptionSelected ? onNextPress : onSkipPress,
                    color: KColors.primary,
                    child: Center(
                      child: Text(
                        isOptionSelected ? 'Next' : 'Skip',
                        style: const TextStyle(color: KColors.pureWhite),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
