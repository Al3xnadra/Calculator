import 'package:flutter/material.dart';

class CalculatorText extends StatelessWidget {
  const CalculatorText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.bottom,
    required this.textColor,
  });

  final String text;
  final double fontSize, bottom;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      margin: EdgeInsets.only(right: 10, bottom: bottom),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: textColor,
        ),
      ),
    );
  }
}
