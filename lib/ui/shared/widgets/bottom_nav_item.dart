import 'package:flutter/material.dart';

import '../colors.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    super.key,
    this.title,
    this.imageSrc,
    required this.onTap,
    this.isActive = false,
  });

  final String? title;
  final String? imageSrc;
  final Function()? onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            imageSrc!,
            height: 35.0,
            color: isActive ? kcSecondaryColor : null,
          ),
          Text(
            title!,
            style: TextStyle(
              color: isActive ? kcSecondaryColor : null,
            ),
          )
        ],
      ),
    );
  }
}
