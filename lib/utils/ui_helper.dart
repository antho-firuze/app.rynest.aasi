import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:app.rynest.aasi/utils/orientation_utils.dart';
import 'package:app.rynest.aasi/utils/router.dart';
import 'package:app.rynest.aasi/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

extension EmptySpace on num {
  SizedBox get height => SizedBox(height: toDouble());

  SizedBox get width => SizedBox(width: toDouble());

  double? whenLandscape(double? val) => rootNavigatorKey.currentContext!.isLandscape() ? val : toDouble();
}

// final Image oImagePlaceholder = Image.asset(
//   'assets/images/im_photo_placeholder.gif',
//   fit: BoxFit.cover,
// );

// ===== Sizes Sections
// =========================
extension ScreenSize on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;

  /// Function to get screen width ratio
  ///
  /// screen_width * p => when portrait <br>
  /// screen_width * l => when landscape
  double screenWidthRatio([double portrait = 1, double landscape = 1]) {
    return isLandscape() ? MediaQuery.of(this).size.width * landscape : MediaQuery.of(this).size.width * portrait;
  }
}

Widget divider({
  EdgeInsets padding = EdgeInsets.zero,
  bool isHorizontal = true,
  double thick = 1,
  Color? color,
}) =>
    Padding(
      padding: padding,
      child: Container(
        width: isHorizontal ? null : thick,
        height: isHorizontal ? thick : null,
        color: color ?? Colors.grey.withOpacity(0.5),
      ),
    );

const TextStyle ts = TextStyle();

TextStyle tsHeadlineDL() => Theme.of(rootNavigatorKey.currentContext!).textTheme.displayLarge!;
TextStyle tsHeadlineDM() => Theme.of(rootNavigatorKey.currentContext!).textTheme.displayMedium!;
TextStyle tsHeadlineDS() => Theme.of(rootNavigatorKey.currentContext!).textTheme.displaySmall!;
TextStyle tsHeadlineL() => Theme.of(rootNavigatorKey.currentContext!).textTheme.headlineLarge!;
TextStyle tsHeadlineM() => Theme.of(rootNavigatorKey.currentContext!).textTheme.headlineMedium!;
TextStyle tsHeadlineS() => Theme.of(rootNavigatorKey.currentContext!).textTheme.headlineSmall!;
TextStyle tsTitleL() => Theme.of(rootNavigatorKey.currentContext!).textTheme.titleLarge!;
TextStyle tsTitleM() => Theme.of(rootNavigatorKey.currentContext!).textTheme.titleMedium!;
TextStyle tsTitleS() => Theme.of(rootNavigatorKey.currentContext!).textTheme.titleSmall!;
TextStyle tsBodyL() => Theme.of(rootNavigatorKey.currentContext!).textTheme.bodyLarge!;
TextStyle tsBodyM() => Theme.of(rootNavigatorKey.currentContext!).textTheme.bodyMedium!;
TextStyle tsBodyS() => Theme.of(rootNavigatorKey.currentContext!).textTheme.bodySmall!;
TextStyle tsLabelL() => Theme.of(rootNavigatorKey.currentContext!).textTheme.labelLarge!;
TextStyle tsLabelM() => Theme.of(rootNavigatorKey.currentContext!).textTheme.labelMedium!;
TextStyle tsLabelS() => Theme.of(rootNavigatorKey.currentContext!).textTheme.labelSmall!;
TextStyle tsButton() => Theme.of(rootNavigatorKey.currentContext!).textTheme.bodyMedium!;
TextStyle tsCaption() => Theme.of(rootNavigatorKey.currentContext!).textTheme.bodySmall!;

extension TextStyleHelpers on TextStyle {
  TextStyle family(String family) => copyWith(fontFamily: family);
  TextStyle clr(Color color) => copyWith(color: color);
  TextStyle size(double size) => copyWith(fontSize: size);
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
  TextStyle get thin => copyWith(fontWeight: FontWeight.w100);
  TextStyle get extraLight => copyWith(fontWeight: FontWeight.w200);
  TextStyle get light => copyWith(fontWeight: FontWeight.w300);
  TextStyle space(double? ltrSpacing) => copyWith(letterSpacing: ltrSpacing);
  TextStyle letterSpace(double value) => copyWith(letterSpacing: value);
  TextStyle bold([FontWeight? fontWeight]) => copyWith(fontWeight: fontWeight ?? FontWeight.bold);
  TextStyle link() => copyWith(color: kcLinkColor.whenDark(oGold200)).italic;

  /// A method to underline a text with a customizable [distance] between the text
  /// and underline. The [color], [thickness] and [style] can be set
  /// as the decorations of a [TextStyle].
  TextStyle underline({
    Color? color,
    double distance = 1,
    double thickness = 1,
    TextDecorationStyle style = TextDecorationStyle.solid,
  }) {
    return copyWith(
      shadows: [
        Shadow(
          color: this.color ?? Colors.black,
          offset: Offset(0, -distance),
        )
      ],
      color: Colors.transparent,
      decoration: TextDecoration.underline,
      decorationThickness: thickness,
      decorationColor: color ?? this.color,
      decorationStyle: style,
    );
  }
}

extension AnotherTextStyleHelpers on Text {
  Text _text({
    TextStyle? newStyle,
    TextAlign? textAlign,
    TextOverflow? newOverflow,
    int? newMaxLines,
  }) =>
      Text(
        data!,
        style: newStyle ?? (style ?? ts),
        textAlign: (textAlign ?? this.textAlign),
        overflow: newOverflow ?? overflow,
        maxLines: newMaxLines,
        softWrap: softWrap,
      );
  Text tsHeadlineDL() => _text(newStyle: Theme.of(rootNavigatorKey.currentContext!).textTheme.displayLarge!);
  Text tsHeadlineDM() => _text(newStyle: Theme.of(rootNavigatorKey.currentContext!).textTheme.displayMedium!);
  Text tsHeadlineDS() => _text(newStyle: Theme.of(rootNavigatorKey.currentContext!).textTheme.displaySmall!);
  Text tsHeadlineL() => _text(newStyle: Theme.of(rootNavigatorKey.currentContext!).textTheme.headlineLarge!);
  Text tsHeadlineM() => _text(newStyle: Theme.of(rootNavigatorKey.currentContext!).textTheme.headlineMedium!);
  Text tsHeadlineS() => _text(newStyle: Theme.of(rootNavigatorKey.currentContext!).textTheme.headlineSmall!);
  Text tsTitleL() => _text(newStyle: Theme.of(rootNavigatorKey.currentContext!).textTheme.titleLarge!);
  Text tsTitleM() => _text(newStyle: Theme.of(rootNavigatorKey.currentContext!).textTheme.titleMedium!);
  Text tsTitleS() => _text(newStyle: Theme.of(rootNavigatorKey.currentContext!).textTheme.titleSmall!);
  Text tsBodyL() => _text(newStyle: Theme.of(rootNavigatorKey.currentContext!).textTheme.bodyLarge!);
  Text tsBodyM() => _text(newStyle: Theme.of(rootNavigatorKey.currentContext!).textTheme.bodyMedium!);
  Text tsBodyS() => _text(newStyle: Theme.of(rootNavigatorKey.currentContext!).textTheme.bodySmall!);
  Text tsLabelL() => _text(newStyle: Theme.of(rootNavigatorKey.currentContext!).textTheme.labelLarge!);
  Text tsLabelM() => _text(newStyle: Theme.of(rootNavigatorKey.currentContext!).textTheme.labelMedium!);
  Text tsLabelS() => _text(newStyle: Theme.of(rootNavigatorKey.currentContext!).textTheme.labelSmall!);
  Text tsButton() => _text(newStyle: Theme.of(rootNavigatorKey.currentContext!).textTheme.bodyMedium!);
  Text tsCaption() => _text(newStyle: Theme.of(rootNavigatorKey.currentContext!).textTheme.bodySmall!);

  Text family(String family) => _text(newStyle: (style ?? ts).copyWith(fontFamily: family));
  Text clr(Color? color) => _text(newStyle: (style ?? ts).copyWith(color: color));
  Text size(double size) => _text(newStyle: (style ?? ts).copyWith(fontSize: size));
  Text get italic => _text(newStyle: (style ?? ts).copyWith(fontStyle: FontStyle.italic));
  Text get thin => _text(newStyle: (style ?? ts).copyWith(fontWeight: FontWeight.w100));
  Text get extraLight => _text(newStyle: (style ?? ts).copyWith(fontWeight: FontWeight.w200));
  Text get light => _text(newStyle: (style ?? ts).copyWith(fontWeight: FontWeight.w300));
  Text space(double? ltrSpacing) => _text(newStyle: (style ?? ts).copyWith(letterSpacing: ltrSpacing));
  Text letterSpace(double value) => _text(newStyle: (style ?? ts).copyWith(letterSpacing: value));
  Text bold([FontWeight? fontWeight]) =>
      _text(newStyle: (style ?? ts).copyWith(fontWeight: fontWeight ?? FontWeight.bold));

  Text ellipsis() => _text(newOverflow: TextOverflow.ellipsis);
  Text maxLn(int? lines) => _text(newMaxLines: lines);

  // Text Align
  Text right() => _text(textAlign: TextAlign.right);
  Text center() => _text(textAlign: TextAlign.center);
  Text left() => _text(textAlign: TextAlign.left);
  Text justify() => _text(textAlign: TextAlign.justify);

  InkWell link({bool isBold = false, bool isItalic = false, Color? color, Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: _text(
        newStyle: (style ?? ts).copyWith(
          color: color ?? kcLinkColor.whenDark(oGold),
          fontWeight: isBold ? FontWeight.bold : null,
          fontStyle: isItalic ? FontStyle.italic : null,
        ),
      ),
    );
  }

  /// A method to underline a text with a customizable [distance] between the text
  /// and underline. The [color], [thickness] and [style] can be set
  /// as the decorations of a [TextStyle].
  Text underline({
    Color? color,
    double distance = 1,
    double thickness = 1,
    TextDecorationStyle line = TextDecorationStyle.solid,
  }) {
    return _text(
      newStyle: (style ?? ts).copyWith(
        shadows: [
          Shadow(
            color: (style ?? ts).color ?? Colors.black,
            offset: Offset(0, -distance),
          )
        ],
        color: Colors.transparent,
        decoration: TextDecoration.underline,
        decorationThickness: thickness,
        decorationColor: color ?? (style ?? ts).color,
        decorationStyle: line,
      ),
    );
  }
}

extension IconExtensions on Icon {
  link({Function()? onTap, Color? color}) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(icon, color: color ?? oBlack.whenDark(oGold)),
    );
  }
}

Widget bumperBottom(BuildContext context) => SizedBox(
      height: MediaQuery.of(context).padding.bottom,
    );

Color getRandomColor() {
  return Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0);
}

String countryCodeToEmoji(String? countryCode) {
  // 0x41 is Letter A
  // 0x1F1E6 is Regional Indicator Symbol Letter A
  // Example :
  // firstLetter U => 20 + 0x1F1E6
  // secondLetter S => 18 + 0x1F1E6
  // See: https://en.wikipedia.org/wiki/Regional_Indicator_Symbol
  if (countryCode == null) return '';
  final int firstLetter = countryCode.toUpperCase().codeUnitAt(0) - 0x41 + 0x1F1E6;
  final int secondLetter = countryCode.toUpperCase().codeUnitAt(1) - 0x41 + 0x1F1E6;
  return String.fromCharCode(firstLetter) + String.fromCharCode(secondLetter);
}
