import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const primaryFont = 'diodrum';
  static const secondaryFont = 'uthmanic';

  static final ColorScheme lightColorScheme = ColorScheme.fromSeed(
    seedColor: primaryLight,
    secondary: secondaryLight,
    brightness: Brightness.light,
  );

  static final ColorScheme darkColorScheme = ColorScheme.fromSeed(
    seedColor: primaryDark,
    secondary: secondaryDark,
    brightness: Brightness.dark,
  );

  static ThemeData lightThemeData = themeData(lightColorScheme);
  static ThemeData darkThemeData = themeData(darkColorScheme);

  static ThemeData themeData(ColorScheme colorScheme) {
    // final onBg = colorScheme.onBackground;
    return ThemeData(
        // useMaterial3: true,
        colorScheme: colorScheme,
        fontFamily: primaryFont,
        primaryColor: colorScheme.primary,
        scaffoldBackgroundColor: colorScheme.scaffold,
        actionIconTheme: ActionIconThemeData(
          backButtonIconBuilder: (context) => const Icon(Icons.chevron_left, size: 35),
        ),
        appBarTheme: AppBarTheme(
          titleSpacing: 0,
          iconTheme: const IconThemeData(color: Colors.white),
          // toolbarHeight: 45,
          color: colorScheme.appBar,
          foregroundColor: Colors.white,
          titleTextStyle: _textTheme.headlineMedium!.copyWith(
            fontFamily: primaryFont,
            fontWeight: _semiBold,
          ),
          // elevation: 0,
        ),
        navigationBarTheme: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.selected)
                ? TextStyle(color: colorScheme.navigationBarSelected)
                : TextStyle(color: colorScheme.navigationBarUnSelected),
          ),
          iconTheme: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.selected)
                ? IconThemeData(color: colorScheme.navigationBarSelected, size: 30)
                : IconThemeData(color: colorScheme.navigationBarUnSelected),
          ),
        ),
        navigationRailTheme: NavigationRailThemeData(
          selectedIconTheme: IconThemeData(color: colorScheme.navigationRailSelected),
          selectedLabelTextStyle: TextStyle(color: colorScheme.navigationRailSelected),
          unselectedIconTheme: IconThemeData(color: colorScheme.navigationRailSelected),
          unselectedLabelTextStyle: TextStyle(color: colorScheme.navigationRailSelected),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: primaryLight,
              foregroundColor: oWhite,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              textStyle: _textTheme.bodyMedium),
        ),
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          alignLabelWithHint: true,
          contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          // labelStyle: tsBodyM(),
          // hintStyle: tsBodyM(),
          prefixIconColor: colorScheme.colorIcon,
          suffixIconColor: colorScheme.colorIcon,
          // TEXT COLOR
          border: OutlineInputBorder(
            borderSide: BorderSide(color: colorScheme.inputBorder),
            borderRadius: BorderRadius.circular(6),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorScheme.inputDisabledBorder),
            borderRadius: BorderRadius.circular(6),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorScheme.inputFocusedBorder),
            borderRadius: BorderRadius.circular(6),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorScheme.inputEnabledBorder),
            borderRadius: BorderRadius.circular(6),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorScheme.inputErrorBorder),
            borderRadius: BorderRadius.circular(6),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorScheme.inputFocusedErrorBorder),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        textTheme: TextTheme(
          bodyLarge: _textTheme.bodyLarge!.copyWith(color: colorScheme.textBody),
          bodyMedium: _textTheme.bodyLarge!.copyWith(color: colorScheme.textBody),
          titleSmall: _textTheme.titleSmall!.copyWith(color: colorScheme.textTitle),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            // titleTextStyle: _textTheme.headlineSmall!.copyWith(
            //   fontFamily: primaryFont,
            //   fontWeight: _semiBold,
            // ),
            textStyle: WidgetStatePropertyAll(
              _textTheme.titleLarge?.copyWith(
                fontFamily: primaryFont,
                fontSize: 18,
              ),
            ),
          ),
        ),
        iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(
            padding: WidgetStatePropertyAll(EdgeInsets.zero),
          ),
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Colors.grey,
          linearMinHeight: 10,
        ),
        listTileTheme: const ListTileThemeData(
          iconColor: secondaryLight,
        )
        // textTheme: TextTheme(
        //   displayLarge: TextStyle(fontWeight: _bold, fontSize: 48, color: onBg),
        //   displayMedium: TextStyle(fontWeight: _bold, fontSize: 38, color: onBg),
        //   displaySmall:
        //       TextStyle(fontWeight: _semiBold, fontSize: 32, color: onBg),
        //   headlineMedium:
        //       TextStyle(fontWeight: _semiBold, fontSize: 24, color: onBg),
        //   headlineSmall:
        //       TextStyle(fontWeight: _medium, fontSize: 20, color: onBg),
        //   titleLarge: TextStyle(fontWeight: _regular, fontSize: 18, color: onBg),
        //   //
        //   bodyLarge: const TextStyle(
        //       fontWeight: _regular, fontSize: 16, color: Colors.white),
        //   bodyMedium: const TextStyle(fontWeight: _bold, fontSize: 16),
        //   //
        //   bodySmall: const TextStyle(fontWeight: _semiBold, fontSize: 16),
        //   labelLarge: const TextStyle(fontWeight: _bold, fontSize: 18),
        //   //
        // ),
        );
  }

  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

  static const TextTheme _textTheme = TextTheme(
    displayLarge: TextStyle(fontWeight: _bold, fontSize: 72),
    displayMedium: TextStyle(fontWeight: _bold, fontSize: 48),
    displaySmall: TextStyle(fontWeight: _semiBold, fontSize: 32),
    headlineMedium: TextStyle(fontWeight: _semiBold, fontSize: 24),
    headlineSmall: TextStyle(fontWeight: _medium, fontSize: 18),
    titleLarge: TextStyle(fontWeight: _regular, fontSize: 16),
    //
    titleMedium: TextStyle(fontWeight: _medium, fontSize: 16.0),
    titleSmall: TextStyle(fontWeight: _medium, fontSize: 14.0),
    //
    bodyLarge: TextStyle(fontWeight: _regular, fontSize: 16),
    bodyMedium: TextStyle(fontWeight: _medium, fontSize: 16),
    //
    bodySmall: TextStyle(fontWeight: _semiBold, fontSize: 16),
    labelLarge: TextStyle(fontWeight: _semiBold, fontSize: 18.0),
  );
}
