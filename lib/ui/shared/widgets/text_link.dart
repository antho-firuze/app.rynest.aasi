import 'package:app.rynest.aasi/ui/shared/colors.dart';
import 'package:flutter/material.dart';

class TextLink extends StatelessWidget {
  const TextLink(this.text, {super.key, this.onPressed});

  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16,
          color: kcPrimaryColor,
          fontFamily: 'Roboto',
        ),
      ),
    );
  }
}
