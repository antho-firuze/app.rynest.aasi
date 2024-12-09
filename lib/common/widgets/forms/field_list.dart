import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class FieldList extends StatelessWidget {
  const FieldList({
    super.key,
    required this.caption,
    required this.value,
    this.width,
  });

  final Widget caption;
  final Widget value;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: caption),
        SizedBox(width: width ?? context.screenWidthRatio(.5, .35), child: value),
      ],
    );
  }
}
