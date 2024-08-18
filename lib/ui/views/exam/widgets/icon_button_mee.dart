import 'package:flutter/material.dart';

class IconButtonMee extends StatelessWidget {
  const IconButtonMee({
    super.key,
    required this.onPressed,
    this.icon,
    this.iconData,
    this.onLongPressed,
    this.color,
    this.size,
  });

  final Icon? icon;
  final IconData? iconData;
  final Color? color;
  final double? size;
  final Function()? onPressed;
  final Function()? onLongPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size ?? 40,
      height: size ?? 40,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        // decoration: BoxDecoration(color: color ?? kcPrimaryColor),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            // minimumSize: Size(width ?? 150, height), // Set this
            padding: EdgeInsets.zero, // and this
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
              // side: BorderSide(color: Colors.white),
            ),
            backgroundColor: color ?? Colors.transparent,
            // shadowColor: Colors.transparent,
            // elevation: 0,
          ),
          onLongPress: onLongPressed,
          onPressed: onPressed,
          child: icon ??
              Icon(
                iconData ?? Icons.camera_alt_outlined,
              ),
        ),
      ),
    );
  }
}
