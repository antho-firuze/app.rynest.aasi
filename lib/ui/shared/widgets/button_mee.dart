import 'package:flutter/material.dart';

import '../colors.dart';
import '../ui_helper.dart';

class ButtonMee extends StatelessWidget {
  const ButtonMee({
    super.key,
    required this.title,
    this.busy = false,
    this.onPressed,
    this.enabled = true,
    this.color,
    this.width,
    this.height,
    this.radius,
    this.gradient,
    this.isFlat,
  });

  final bool busy;
  final bool? isFlat;
  final String title;
  final void Function()? onPressed;
  final bool enabled;
  final Color? color;
  final Gradient? gradient;
  final double? width;
  final double? height;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(radius ?? 10);
    final height = this.height ?? 45;
    final isFlat = this.isFlat ?? false;
    Gradient defaultGradient =
        const LinearGradient(colors: [kcSecondaryColor, kcSecondaryColor]);
    Gradient? gradient =
        enabled ? (this.gradient ?? defaultGradient) : gradientDisabled;
    final onPressed = busy ? null : (enabled ? this.onPressed : null);
    gradient = color == null ? gradient : null;

    return Align(
      child: SizedBox(
        width: width ?? 150,
        child: Container(
          height: height,
          decoration: BoxDecoration(
            color: color,
            gradient: isFlat ? null : gradient,
            borderRadius: borderRadius,
          ),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              // minimumSize: Size(width ?? 150, height), // Set this
              // padding: const EdgeInsets.symmetric(horizontal: 40), // and this
              shape: RoundedRectangleBorder(
                borderRadius: borderRadius,
              ),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              elevation: 0,
            ),
            // style: ButtonStyle(
            //   shape: MaterialStateProperty.resolveWith(
            //     (states) => RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(5),
            //     ),
            //   ),
            //   backgroundColor: MaterialStateProperty.all(bgColor ?? Colors.red),
            // ),
            child: busy
                ? const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: CircularProgressIndicator(
                      strokeWidth: 5,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                    ),
                  )
                : Text(
                    title,
                    style: bodyStyle(context).copyWith(
                      color: enabled ? Colors.white : const Color(0xFFBEBEBE),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
