import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class LogoInitial extends StatelessWidget {
  const LogoInitial({
    super.key,
    required this.initial,
  });

  final String initial;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green.shade400,
        shape: BoxShape.rectangle,
      ),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(2, 1, 2, 2),
          child: Text(initial).tsBodyL().center().maxLn(1).clr(Colors.white),
        ),
      ),
    );
  }
}
