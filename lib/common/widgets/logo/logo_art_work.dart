import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class LogoArtWork extends StatelessWidget {
  const LogoArtWork({
    super.key,
    this.width,
    this.color,
    this.child,
    this.pressedOverflow = false,
  });

  final Color? color;
  final double? width;
  final Widget? child;
  final bool pressedOverflow;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Image.asset(
            'assets/images/artwork.png',
            fit: BoxFit.fill,
            color: color ?? primaryLight,
            width: width ?? context.screenWidthRatio(1, .65),
          ),
        ),
        if (child != null) ...[
          if (pressedOverflow)
            Center(
              child: child!,
            )
          else
            Positioned.fill(
              child: Center(
                child: child!,
              ),
            ),
        ],
      ],
    );
  }
}
