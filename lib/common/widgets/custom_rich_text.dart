import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    super.key,
    required this.text, this.textAlign,
  });

  final TextSpan text;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textScaler: const TextScaler.linear(.8),
      textAlign: textAlign ?? TextAlign.start,
      text: text,
    );
  }
}
