import 'package:app.rynest.aasi/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final darkModeProvider = StateNotifierProvider<DarkModeNotifier, bool>(
//     (ref) => DarkModeNotifier(ref));

// class DarkModeNotifier extends StateNotifier<bool> {
//   DarkModeNotifier(this.ref) : super(false) {
//     _init();
//   }

//   final Ref ref;

//   final String _darkModeKey = 'DARK_MODE_KEY';

//   void _init() => state = _getDarkMode();

//   bool _getDarkMode() =>
//       ref.read(sharedPrefProvider).getBool(_darkModeKey) ?? false;

//   void _setDarkMode(bool isDarkMode) =>
//       ref.read(sharedPrefProvider).setBool(_darkModeKey, isDarkMode);

//   void toggle() {
//     state = !state;
//     _setDarkMode(state);
//   }
// }

final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.light);

extension DarkModeContext on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}

extension LightDark on Color {
  Color whenDark(Color dark) => Theme.of(rootNavigatorKey.currentContext!).brightness == Brightness.light ? this : dark;
}
