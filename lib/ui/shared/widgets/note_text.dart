import 'package:flutter/material.dart';

class NoteText extends StatelessWidget {
  const NoteText(
    this.text, {
    super.key,
    this.textAlign,
    this.color,
  });

  final String text;
  final TextAlign? textAlign;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: color ?? Colors.grey[600],
      ),
    );
  }
}
