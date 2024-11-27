import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class LogoApp extends StatelessWidget {
  const LogoApp({
    super.key,
    this.width,
    this.height,
    this.color,
    this.onTap,
  });

  final double? width;
  final double? height;
  final Color? color;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        'assets/images/logo_aasi.png',
        width: width ?? context.screenWidthRatio(.55, .35),
        height: height,
        color: color,
      ),
    );
  }
}
