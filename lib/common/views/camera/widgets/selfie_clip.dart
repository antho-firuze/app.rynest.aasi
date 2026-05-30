import 'package:flutter/material.dart';

class SelfieClip extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    // print(size);
    Path path = Path()
      ..addOval(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2));
    return path;
  }

  @override
  bool shouldReclip(oldClipper) {
    return true;
  }
}
