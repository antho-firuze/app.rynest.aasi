import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon(
    this.iconData, {
    super.key,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.size = 32,
    this.padding,
    this.busy = false,
    this.enabled = true, this.tooltip,
  });

  final bool busy;
  final bool enabled;
  final String? tooltip;
  final IconData? iconData;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double size;
  final EdgeInsetsGeometry? padding;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip ?? '',
      child: SizedBox(
        width: size,
        height: size,
        child: onPressed == null ? onlyIcon() : iconButton(),
      ),
    );
  }

  Widget iconButton() {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: const CircleBorder(),
        backgroundColor: backgroundColor ?? Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      child: onlyIcon(),
    );
  }

  Icon onlyIcon() {
    return Icon(
      iconData,
      size: size * .75,
      color: foregroundColor ?? secondaryLight,
    );
  }
}
