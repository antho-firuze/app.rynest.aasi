import 'package:flutter/material.dart';

class TextButtonMee extends StatelessWidget {
  const TextButtonMee({
    super.key,
    required this.text,
    this.onPressed,
    this.color,
  });

  final String text;
  final Color? color;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          // minimumSize: Size(width ?? 150, height), // Set this
          padding: const EdgeInsets.symmetric(horizontal: 16), // and this
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            // side: const BorderSide(color: Colors.blue),
          ),
          backgroundColor: color ?? Colors.blue,
          // shadowColor: Colors.transparent,
          // elevation: 0,
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
