import 'package:flutter/material.dart';

class cText extends StatelessWidget {
  final String text;
  final double size;
  final TextStyle style;
  final bool changeFont;

  const cText({
    Key? key,
    required this.text,
    this.size = 16.0,
    this.style = const TextStyle(),
    this.changeFont = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle updatedStyle = changeFont
        ? style.copyWith(fontFamily: 'OstrichSans', fontSize: size)
        : style.copyWith(fontSize: size);

    return Text(
      text,
      style: updatedStyle,
    );
  }
}
