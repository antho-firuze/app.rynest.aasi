import 'package:flutter/material.dart';

class IconMee extends StatelessWidget {
  const IconMee(
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
    return Icon(
      icon,
      color: color ?? Colors.white,
      size: size ?? 25,
    );
  }
}
