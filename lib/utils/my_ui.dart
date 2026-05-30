import 'package:app.rynest.aasi/common/views/connectivity_wrapper.dart';
import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:app.rynest.aasi/utils/system_ui_overlay.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Timer? _timer;

class MyUI extends StatelessWidget {
  const MyUI({
    super.key,
    required this.child,
    this.isDark = false,
    this.safeAreaTop = true,
    this.safeAreaBottom = true,
    this.customUiOverlayStyle,
    this.showScreenInfo = false,
    this.showConnectivityInfo = true,
    this.customStatusBarBackground,
    this.customAppBarBackground,
    this.customBackground,
  });

  final Widget child;
  final bool isDark;
  final bool safeAreaTop;
  final bool safeAreaBottom;
  final SystemUiOverlayStyle? customUiOverlayStyle;
  final bool showScreenInfo;
  final bool showConnectivityInfo;
  final Widget? customStatusBarBackground;
  final Widget? customAppBarBackground;
  final Widget? customBackground;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onPanCancel: () {
      //   debugPrint('My_UI: onPanCancel');
      //   _timer?.cancel();
      //   _timer = null;
      // },
      // onPanEnd: (details) {
      //   debugPrint('My_UI: onPanEnd');
      //   _timer?.cancel();
      //   _timer = null;
      // },
      // onPanDown: (details) async {
      //   debugPrint('My_UI: onPanDown');
      //   _timer?.cancel();
      //   _timer = null;
      //   _timer = Timer(Duration(seconds: 5), () {
      //     context.goto(page: DevInfoView());
      //     _timer?.cancel();
      //     _timer = null;
      //   });
      // },
      // onLongPress: () {
      //   // SnackBarService.show(message: 'it is a long press');
      //   showFlutterNotification(title: 'Ini title', message: 'Ini hanya sebuah pesan !');
      // },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: customUiOverlayStyle ?? (isDark ? SystemUIOverlay.darkColorOverlay : SystemUIOverlay.lightColorOverlay),
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(.8)),
          child: ConnectivityWrapper(
            enabled: showConnectivityInfo,
            child: Stack(
              children: [
                // BACKGROUND
                if (customBackground != null)
                  customBackground!
                else
                  Container(color: Theme.of(context).scaffoldBackgroundColor),
                // STATUS BAR
                if (customStatusBarBackground != null)
                  SizedBox(
                    width: context.screenWidth,
                    height: MediaQuery.of(context).viewPadding.top,
                    child: customStatusBarBackground!,
                  )
                else
                  Container(height: MediaQuery.of(context).viewPadding.top, color: primaryLight),
                // APP BAR
                if (customAppBarBackground != null)
                  SizedBox(
                    width: context.screenWidth,
                    height: MediaQuery.of(context).viewPadding.top + kToolbarHeight,
                    child: customAppBarBackground!,
                  ),
                SafeArea(
                  top: safeAreaTop,
                  bottom: safeAreaBottom,
                  child: child,
                ),
                if (showScreenInfo)
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      children: [
                        10.width,
                        Text("width | ${context.screenWidth.round()}"),
                        10.width,
                        Text("height | ${context.screenHeight.round()}"),
                        10.width,
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
