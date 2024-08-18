import 'package:flutter/material.dart';

import '../colors.dart';
import 'gradient_mask.dart';
import 'icon_mee.dart';

class IconMask extends StatelessWidget {
  const IconMask(
    this.icon, {
    super.key,
    this.color,
    this.size,
  });

  final IconData? icon;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return GradientMask(
      gradientType: GradientType.linear,
      colors: colors1,
      isIcon: true,
      child: IconMee(
        icon,
        color: color ?? Colors.white,
        size: size,
      ),
    );
  }
}
