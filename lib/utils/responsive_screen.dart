import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class ResponsiveScreen extends StatelessWidget {
  const ResponsiveScreen({super.key, required this.child, this.largeScreen});

  final Widget child;
  final Widget? largeScreen;

  @override
  Widget build(BuildContext context) {
    if (context.screenWidth < 1000 && context.screenHeight < 1000) {
      return child;
    } else {
      return largeScreen ?? Container();
    }
  }
}
