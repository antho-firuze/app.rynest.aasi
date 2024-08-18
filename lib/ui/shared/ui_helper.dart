import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

const double spaceXS = 10.0;
const double spaceS = 20.0;
const double spaceM = 40.0;
const double spaceL = 80.0;
const double spaceXL = 120.0;

Widget hSpace(double val) => SizedBox(width: val);
const Widget hSpaceXSmall = SizedBox(width: spaceXS);
const Widget hSpaceSmall = SizedBox(width: spaceS);
const Widget hSpaceMedium = SizedBox(width: spaceM);
const Widget hSpaceLarge = SizedBox(width: spaceL);
const Widget hSpaceXLarge = SizedBox(width: spaceXL);

Widget vSpace(double val) => SizedBox(height: val);
const Widget vSpaceXSmall = SizedBox(height: spaceXS);
const Widget vSpaceSmall = SizedBox(height: spaceS);
const Widget vSpaceMedium = SizedBox(height: spaceM);
const Widget vSpaceLarge = SizedBox(height: spaceL);
const Widget vSpaceXLarge = SizedBox(height: spaceXL);

const TextStyle oStyle = TextStyle();
final Image oImagePlaceholder = Image.asset(
  'assets/images/im_photo_placeholder.gif',
  fit: BoxFit.cover,
);

// ===== Sizes Sections
// =========================

// S < 576            => 6-7" => W x H (360/500 x 640/1000)
// M >= 576 && <= 992 => 10"  => W x H (800 x 1232)
// L > 992            => 12"  => W x H (1024 x 1366)

// MediaQueryData MediaQuery.of(context) = MediaQuery.of(context);
double safeAreaH(BuildContext context) =>
    MediaQuery.of(context).padding.left + MediaQuery.of(context).padding.right;
double safeAreaV(BuildContext context) =>
    MediaQuery.of(context).padding.top + MediaQuery.of(context).padding.bottom;
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
double screenWidthPercentage(BuildContext context, {double percentage = 1}) =>
    screenWidth(context) * percentage;
double screenHeightPercentage(BuildContext context, {double percentage = 1}) =>
    screenHeight(context) * percentage;
double safeScreenWidth(BuildContext context) =>
    screenWidth(context) - safeAreaH(context);
double saveScreenHeight(BuildContext context) =>
    screenHeight(context) - safeAreaV(context);
double blockHorizontal(BuildContext context) => screenWidth(context) / 100;
double blockVertical(BuildContext context) => screenHeight(context) / 100;
double safeBlockHorizontal(BuildContext context) =>
    safeScreenWidth(context) / 100;
double safeBlockVertical(BuildContext context) =>
    saveScreenHeight(context) / 100;

bool isPortrait(BuildContext context) =>
    MediaQuery.of(context).orientation == Orientation.portrait;
bool isLandscape(BuildContext context) =>
    MediaQuery.of(context).orientation == Orientation.landscape;

double screenOrientation(Orientation orientation,
        {required double p, required double l}) =>
    orientation == Orientation.portrait ? p : l;

double screenProp(BuildContext context,
        {required double s, required double m, required double l}) =>
    screenWidth(context) < 576
        ? s
        : screenWidth(context) >= 576 && screenWidth(context) <= 992
            ? m
            : l;
// double screenHeightProp(BuildContext context,
//         {required double s, required double m, required double l}) =>
//     screenHeight(context) < 1000
//         ? s
//         : screenHeight(context) < 1350
//             ? m
//             : l;

Widget divider({
  Color? color,
  EdgeInsets padding = EdgeInsets.zero,
  isHorizontal = true,
  double thick = 2,
}) =>
    Padding(
      padding: padding,
      child: Container(
        width: isHorizontal ? null : thick,
        height: isHorizontal ? thick : null,
        color: color ?? Colors.grey[300],
      ),
    );

// ===== Styles Sections
// =========================

// Box Decorations
BoxDecoration bgADecoration = const BoxDecoration(
  color: Colors.white,
  // image: DecorationImage(
  //     image: AssetImage('assets/images/background_a.png'), fit: BoxFit.cover),
);

BoxDecoration bgBDecoration = const BoxDecoration(
  color: Colors.white,
  // image: DecorationImage(
  //     image: AssetImage('assets/images/background_b.png'), fit: BoxFit.cover),
);

BoxDecoration bgCDecoration = const BoxDecoration(
  color: Colors.white,
  // image: DecorationImage(
  //     image: AssetImage('assets/images/background_c.png'), fit: BoxFit.cover),
);

BoxDecoration bgDDecoration = const BoxDecoration(
  color: Colors.white,
  // image: DecorationImage(
  //     image: AssetImage('assets/images/background_d.png'), fit: BoxFit.cover),
);

BoxDecoration bgEDecoration = const BoxDecoration(
  color: Colors.white,
  // image: DecorationImage(
  //     image: AssetImage('assets/images/background_e.png'), fit: BoxFit.cover),
);

TextStyle heading1Style(BuildContext context) => GoogleFonts.poppins(
      fontSize: screenProp(context, s: 34.0, m: 44.0, l: 44.0),
      fontWeight: FontWeight.w400,
      color: kcFontColor,
    );

TextStyle heading2Style(BuildContext context) => GoogleFonts.openSans(
      fontSize: screenProp(context, s: 28.0, m: 38.0, l: 38.0),
      fontWeight: FontWeight.w600,
      color: kcFontColor,
    );

TextStyle heading3Style(BuildContext context) => GoogleFonts.openSans(
      fontSize: screenProp(context, s: 24.0, m: 34.0, l: 34.0),
      fontWeight: FontWeight.w600,
      color: kcFontColor,
    );

TextStyle heading4Style(BuildContext context) => GoogleFonts.poppins(
      fontSize: screenProp(context, s: 20.0, m: 30.0, l: 30.0),
      fontWeight: FontWeight.w600,
      color: kcFontColor,
    );

TextStyle subheadingStyle(BuildContext context) => GoogleFonts.roboto(
      fontSize: screenProp(context, s: 18.0, m: 28.0, l: 28.0),
      fontWeight: FontWeight.w600,
      color: kcFontColor,
    );

TextStyle titleStyle(BuildContext context) => GoogleFonts.poppins(
      fontSize: screenProp(context, s: 30.0, m: 40.0, l: 40.0),
      fontWeight: FontWeight.w700,
      color: kcFontColor,
    );

TextStyle subtitleStyle(BuildContext context) => GoogleFonts.openSans(
      fontSize: screenProp(context, s: 18.0, m: 28.0, l: 28.0),
      fontWeight: FontWeight.w700,
      color: kcFontColor,
    );

TextStyle captionStyle(BuildContext context) => GoogleFonts.openSans(
      fontSize: screenProp(context, s: 14.0, m: 24.0, l: 24.0),
      fontWeight: FontWeight.w700,
      color: kcFontColor,
    );

TextStyle labelStyle(BuildContext context) => GoogleFonts.roboto(
      fontSize: screenProp(context, s: 12.0, m: 22.0, l: 22.0),
      fontWeight: FontWeight.w400,
      color: kcFontColor,
    );

TextStyle bodyStyle(BuildContext context) => GoogleFonts.openSans(
      fontSize: screenProp(context, s: 12, m: 22, l: 22),
      fontWeight: FontWeight.w400,
      color: kcFontColor,
    );

extension TextStyleHelpers on TextStyle {
  TextStyle family(String family) => copyWith(fontFamily: family);
  TextStyle clr(Color color) => copyWith(color: color);
  TextStyle size(double size) => copyWith(fontSize: size);
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
  TextStyle letterSpace(double value) => copyWith(letterSpacing: value);
}

// class UIHelper {
//   static MediaQueryData _mediaQueryData = MediaQuery.of(Get.key.currentContext);
//   static double screenWidth = _mediaQueryData.size.width;
//   static double screenHeight = _mediaQueryData.size.height;
//   static double blockSizeHorizontal = screenWidth / 100;
//   static double blockSizeVertical = screenHeight / 100;

//   static double _safeAreaHorizontal =
//       _mediaQueryData.padding.left + _mediaQueryData.padding.right;
//   static double _safeAreaVertical =
//       _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
//   static double safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
//   static double safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;

//   static double extraSmallSpace = 10;
//   static double smallSpace = 20;
//   static double mediumSpace = 40;
//   static double largeSpace = 80;
//   static double extraLargeSpace = 120;

//   static void init(BuildContext context) {
//     _mediaQueryData = MediaQuery.of(Get.key.currentContext);
//     screenWidth = _mediaQueryData.size.width;
//     screenHeight = _mediaQueryData.size.height;
//     blockSizeHorizontal = screenWidth / 100;
//     blockSizeVertical = screenHeight / 100;

//     _safeAreaHorizontal =
//         _mediaQueryData.padding.left + _mediaQueryData.padding.right;
//     _safeAreaVertical =
//         _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
//     safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
//     safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
//   }

//   static Widget hSpaceXSmall() => SizedBox(width: extraSmallSpace);
//   static Widget hSpaceSmall() => SizedBox(width: smallSpace);
//   static Widget hSpaceMedium() => SizedBox(width: mediumSpace);
//   static Widget hSpaceLarge() => SizedBox(width: largeSpace);
//   static Widget hSpaceXLarge() => SizedBox(width: extraLargeSpace);

//   static Widget vSpaceXSmall() => SizedBox(height: extraSmallSpace);
//   static Widget vSpaceSmall() => SizedBox(height: smallSpace);
//   static Widget vSpaceMedium() => SizedBox(height: mediumSpace);
//   static Widget vSpaceLarge() => SizedBox(height: largeSpace);
//   static Widget vSpaceXLarge() => SizedBox(height: extraLargeSpace);

//   static Widget divider(
//           {Color color,
//           EdgeInsets padding = EdgeInsets.zero,
//           isHorizontal = true}) =>
//       Padding(
//         padding: padding,
//         child: Container(
//           width: isHorizontal ? null : 2,
//           height: isHorizontal ? 2 : null,
//           color: color != null ? color : Colors.grey[300],
//         ),
//       );

//   static Color primaryColor = Colors.teal[300];
//   static Color secondaryColor = Colors.blue[300];
//   static Color shadowColor = Colors.grey;

//   static TextStyle get ts => TextStyle();
// }
