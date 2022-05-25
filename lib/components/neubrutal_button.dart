import 'package:flutter/material.dart';
import 'package:quizler/components/neubrutal_box_decoration.dart';
import 'package:quizler/constants.dart';

class NeubrutalButton extends StatelessWidget {
  final Widget child;
  final Color color, borderColor;
  final VoidCallback onPress;
  const NeubrutalButton({
    Key? key,
    required this.onPress,
    required this.child,
    this.color = KColors.pureWhite,
    this.borderColor = KColors.pureBlack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          decoration:
              neubrutalBoxDecoration(color: color, borderColor: borderColor),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
            child: child,
          ),
        ),
      ),
    );
  }
}
