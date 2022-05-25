import 'package:flutter/material.dart';
import 'package:quizler/components/neubrutal_box_decoration.dart';
import 'package:quizler/constants.dart';
import 'package:quizler/quiz_brain.dart';
import 'package:quizler/components/neubrutal_button.dart';
import 'package:quizler/components/option_button.dart';

class QuestionScreen extends StatefulWidget {
  final Question question;
  final int serial, numberOfQuestions;
  late final List<String> options;

  QuestionScreen({
    Key? key,
    required this.question,
    required this.serial,
    required this.numberOfQuestions,
  }) : super(key: key) {
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
            Container(
              decoration: neubrutalBoxDecoration(
                color: KColors.primary,
                borderColor: KColors.pureBlack,
              ),
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  const Text(
                    '# ',
                    style: TextStyle(color: KColors.pureWhite),
                  ),
                  Text(
                    widget.serial.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      color: KColors.pureWhite,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '/${widget.numberOfQuestions}',
                    style: const TextStyle(color: KColors.pureWhite),
                  ),
                ],
              ),
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
