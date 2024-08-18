import 'package:app.rynest.aasi/ui/shared/ui_helper.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({
    super.key,
    required this.title,
    this.imageSrc,
    this.onTap,
    this.color = Colors.white,
  });

  final String title;
  final String? imageSrc;
  final Function()? onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(13),
        boxShadow: const [
          BoxShadow(
            offset: Offset(2, 3),
            blurRadius: 10.0,
            spreadRadius: -3,
            color: kcShadowColor,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              child: Column(
                children: [
                  // SizedBox(height: 15,),
                  const Spacer(),
                  Image.asset(
                    imageSrc!,
                    height: screenProp(context, s: 60, m: 60, l: 90),
                  ),
                  const Spacer(),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: bodyStyle(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
