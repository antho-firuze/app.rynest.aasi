import 'package:flutter/material.dart';

const Color kcPrimaryColor = Color(0xFF078243);
const Color kcSecondaryColor = Color(0xFF40B5B5);
// const Color kcSecondaryColor = Color(0xFF57B7DD);
// const Color kcSecondaryColor = Color(0xFF64B5F6);
const Color kcTertiaryColor = Color(0xFF313131);
const Color kcQuaternaryColor = Color.fromARGB(255, 247, 0, 111);

const Color kcBackgroundColor = Color(0xFF1A1B1E);
const Color kcShadowColor = Colors.grey;
const Color kcHintColor = Color(0xA27A7A7A);
const Color kcLinkColor = Color.fromARGB(170, 75, 64, 224);
const Color kcButtonColor = kcSecondaryColor;
const Color kcIconColor = kcPrimaryColor;
const Color kcFontColor = Color(0xFF000000);
const Color kcInputColor = Color(0xCC000000);
const Color kcInputReadOnlyColor = Color(0x75FFFFFF);
const Color kcInputDisabledColor = Color(0x75FFFFFF);

List<Color> colors1 = [
  kcSecondaryColor,
  kcSecondaryColor,
];
List<Color> colors2 = [
  kcSecondaryColor,
  kcTertiaryColor,
  kcQuaternaryColor,
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
