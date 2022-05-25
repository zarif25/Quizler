import 'package:flutter/material.dart';

BoxDecoration neubrutalBoxDecoration({
  required Color color,
  required Color borderColor,
}) {
  return BoxDecoration(
    color: color,
    boxShadow: [
      BoxShadow(
        color: borderColor,
        spreadRadius: 0,
        offset: const Offset(3, 3),
      ),
    ],
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(color: borderColor),
  );
}
