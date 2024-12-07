import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.busy = false,
    this.enabled = true,
    this.color,
    this.width,
    this.tooltip,
    this.child,
    this.onPressed,
  });

  final bool busy;
  final bool enabled;
  final Color? color;
  final double? width;
  final String? tooltip;
  final Widget? child;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final onPressed = busy ? null : (enabled ? this.onPressed : null);
    return Tooltip(
      message: tooltip ?? "",
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
        ),
        child: busy
            ? const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: CircularProgressIndicator(
                  strokeWidth: 5,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              )
            : child,
      ),
    );
  }
}
