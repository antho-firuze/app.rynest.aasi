import 'package:flutter/material.dart';

import '../colors.dart';
import 'gradient_mask.dart';

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({
    super.key,
    required this.onPressed,
  });

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GradientMask(
      colors: colors1,
      child: BackButton(
        color: Colors.white,
        onPressed: onPressed,
      ),
    );
  }
}
