import 'package:flutter/material.dart';
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
          decoration: BoxDecoration(
            color: color,
            boxShadow: [
              BoxShadow(
                color: borderColor,
                spreadRadius: 2,
                offset: const Offset(1, 1),
              ),
            ],
            borderRadius: BorderRadius.circular(3.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
            child: child,
          ),
        ),
      ),
    );
  }
}
