import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:flutter/material.dart';

List<Color> colors1 = [
  oRed,
  oGrey,
];
List<Color> colors2 = [
  oRed,
  oGrey,
  oGreen,
];
List<Color> colors3 = [
  const Color(0xFF6ccfc4),
  const Color(0xFF59a9d7),
];
List<Color> colorsDisabled = [
  const Color(0xFF989898),
  const Color(0xFF859CA9),
];

Gradient gradientLinear = LinearGradient(colors: colors3);
Gradient gradientDisabled = LinearGradient(colors: colorsDisabled);

Gradient gradientRadial = RadialGradient(colors: colors2);
Gradient gradientGlass = const LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomCenter,
  colors: [
    Colors.white60,
    Colors.white10,
  ],
);
