import 'package:flutter/material.dart';

class CardClip extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    // print(size);
    // Path path = Path()
    //   ..addRRect(RRect.fromRectAndRadius(
    //       Rect.fromLTWH(10, size.height / 2 - 120, size.width - 20, 260), const Radius.circular(26)));

    double left = 5;
    double top = size.height / 2 - 110;
    double width = size.width - 10;
    double height = 220;

    Path path = Path();
    path.addRRect(RRect.fromRectAndRadius(
      Rect.fromLTWH(left, top, width, height),
      const Radius.circular(26),
    ));
    return path;
  }

  @override
  bool shouldReclip(oldClipper) {
    return true;
  }
}
