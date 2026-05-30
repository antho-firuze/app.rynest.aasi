import 'package:flutter/material.dart';

import 'custom_shimmer.dart';

class Skelton extends StatelessWidget {
  const Skelton({
    super.key,
    this.width,
    this.height = 12,
    this.radius = 4,
  });

  final double? width;
  final double? height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      width: width,
      height: height,
      radius: radius,
    );
  }
}
