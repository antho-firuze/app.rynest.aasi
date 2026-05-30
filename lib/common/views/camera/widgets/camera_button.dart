import 'package:flutter/material.dart';

class CameraButton extends StatelessWidget {
  const CameraButton({
    super.key,
    required this.onPressed,
    this.icon,
    this.onLongPressed,
    this.color,
    this.size,
    this.padding,
    this.busy = false,
    this.enabled = true,
  });

  final bool busy;
  final Icon? icon;
  final bool enabled;
  final Color? color;
  final double? size;
  final EdgeInsetsGeometry? padding;
  final Function()? onPressed;
  final Function()? onLongPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size ?? 40,
      height: size ?? 40,
      child: button(),
    );
  }

  Widget button() {
    final onPressed = busy ? null : (enabled ? this.onPressed : null);

    return Container(
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          backgroundColor: color ?? Colors.transparent,
        ),
        onLongPress: onLongPressed,
        onPressed: onPressed,
        child: Center(child: icon),
      ),
    );
  }
}
