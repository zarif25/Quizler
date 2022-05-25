import 'package:flutter/material.dart';
import 'package:quizler/components/neubrutal_button.dart';
import 'package:quizler/constants.dart';

enum OptionStatus { enabled, correct, incorrect }

class OptionButton extends StatelessWidget {
  final String number, option;
  final VoidCallback onPress;
  final OptionStatus optionStatus;
  const OptionButton({
    Key? key,
    required this.onPress,
    required this.number,
    required this.option,
    this.optionStatus = OptionStatus.enabled,
  }) : super(key: key);

  Color getSerialColor() {
    switch (optionStatus) {
      case OptionStatus.correct:
        return KColors.correct;
      case OptionStatus.incorrect:
        return KColors.incorrect;
      case OptionStatus.enabled:
        return KColors.primary;
    }
  }

  Color getBorderColor() {
    switch (optionStatus) {
      case OptionStatus.correct:
        return KColors.correct;
      case OptionStatus.incorrect:
        return KColors.incorrect;
      case OptionStatus.enabled:
        return KColors.pureBlack;
    }
  }

  Color getBackgroundColor() {
    switch (optionStatus) {
      case OptionStatus.correct:
        return KColors.correctLight;
      case OptionStatus.incorrect:
        return KColors.incorrectLight;
      case OptionStatus.enabled:
        return KColors.pureWhite;
    }
  }

  @override
  Widget build(BuildContext context) {
    return NeubrutalButton(
      onPress: onPress,
      borderColor: getBorderColor(),
      color: getBackgroundColor(),
      child: Row(
        children: [
          Text(
            number,
            style: TextStyle(
              color: getSerialColor(),
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
