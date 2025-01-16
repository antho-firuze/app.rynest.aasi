import 'package:app.rynest.aasi/common/views/connectivity_wrapper.dart';
import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:app.rynest.aasi/utils/system_ui_overlay.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyUI extends StatelessWidget {
  const MyUI({
    super.key,
    this.decoration,
    required this.child,
    this.isDark = false,
    this.enabledSafeArea = true,
    this.customUiOverlayStyle,
    this.isTransparent = false,
    this.showScreenInfo = false,
    this.showConnectivityInfo = true,
  });

  final Decoration? decoration;
  final Widget child;
  final bool isDark;
  final bool enabledSafeArea;
  final SystemUiOverlayStyle? customUiOverlayStyle;
  final bool isTransparent;
  final bool showScreenInfo;
  final bool showConnectivityInfo;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: customUiOverlayStyle ?? (isDark ? SystemUIOverlay.darkColorOverlay : SystemUIOverlay.lightColorOverlay),
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(.8)),
        child: ConnectivityWrapper(
          enabled: showConnectivityInfo,
          child: Stack(
            children: [
              Container(
                decoration: decoration ?? BoxDecoration(color: isTransparent ? Colors.transparent : primaryLight),
                child: SafeArea(
                  top: enabledSafeArea,
                  bottom: false,
                  child: child,
                ),
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
    );
  }
}
