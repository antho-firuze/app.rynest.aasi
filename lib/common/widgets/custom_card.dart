import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    this.child,
    this.title,
    this.subTitle,
    this.margin,
    this.color = primaryLight,
  });

  final Widget? title;
  final Widget? subTitle;
  final Color color;
  final EdgeInsetsGeometry? margin;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: context.screenWidthRatio(.9, .6),
        child: Card(
          child: Column(
            children: [
              if (title != null) ...[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: title,
                ),
                10.height,
              ],
              if (subTitle != null) ...[
                subTitle!,
                10.height,
              ],
              if (child != null) ...[child!],
              10.height,
            ],
          ),
        ),
      ),
    );
  }
}
