import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:app.rynest.aasi/main.dart';
import 'package:app.rynest.aasi/utils/router.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class SnackBarService {
  const SnackBarService({
    required this.message,
    this.duration = const Duration(seconds: 2),
    this.backgroundColor = Colors.black54,
  });
  final String message;
  final Duration duration;
  final Color backgroundColor;

  void confirm() {
    final context = rootNavigatorKey.currentContext!;
    scaffoldKey.currentState!.clearSnackBars();
    scaffoldKey.currentState!.showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(10)),
              child: Text(message).family('Roboto').clr(oWhite),
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        duration: duration,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(bottom: context.screenHeight / 3),
      ),
    );
  }

  void shown({double? bottom}) {
    final context = rootNavigatorKey.currentContext!;
    scaffoldKey.currentState!.clearSnackBars();
    scaffoldKey.currentState!.showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(10)),
                child: Text(message).family('Roboto').clr(oWhite),
              ),
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        duration: duration,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(bottom: bottom ?? context.screenHeight / 3),
      ),
    );
  }

  static void show({required String message, Duration? duration}) {
    scaffoldKey.currentState!.clearSnackBars();
    scaffoldKey.currentState!.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}

extension SnackBarExt on BuildContext {
  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
