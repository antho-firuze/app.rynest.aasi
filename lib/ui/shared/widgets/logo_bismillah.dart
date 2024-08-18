import 'package:flutter/material.dart';

class LogoBismillah extends StatelessWidget {
  const LogoBismillah({
    super.key,
    this.height,
  });

  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/ic_bismillah.png',
      height: height ?? 35,
    );
  }
}
