import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';

extension OrientationContext on BuildContext {
  bool isLandscape({double width = 500, double aspectRatio = 0.5625}) {
    // large screen : width > 1000 & height > 1000
    final size = MediaQuery.of(this).size;
    width = (size.width < 1000 && size.height < 1000) ? 500 : 1100;
    aspectRatio = (size.width < 1000 && size.height < 1000) ? 0.5625 : 0.76;
    // print("aspectRatio | $aspectRatio");
    // print("size.width | ${size.width}");
    // print("size.height | ${size.height}");
    return MediaQuery.of(this).size.width > width
        ? true
        : MediaQuery.of(this).size.aspectRatio > aspectRatio
            ? true
            : false;
  }

  // double get aspectRatio => MediaQuery.of(this).size.aspectRatio;

  bool get isBigScreen => screenWidth < 1000 && screenHeight < 1000 ? false : true;
}
