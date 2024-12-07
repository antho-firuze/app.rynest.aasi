import 'package:app.rynest.aasi/common/widgets/custom_icon.dart';
import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:super_icons/super_icons.dart';

class WarningException extends StatelessWidget {
  const WarningException({super.key, this.title, this.child, this.subTitle});

  final String? title;
  final String? subTitle;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomIcon(size: 60, SuperIcons.is_warning_2_outline),
              20.whenLandscape(0)!.height,
              Text(title ?? '').tsTitleL().center().clr(oGrey70),
              if (subTitle != null) ...[
                10.height,
                Text(subTitle ?? '').tsTitleS().center().clr(oGrey70),
              ],
              20.height,
              child ?? Container(),
            ],
          ),
        ),
      ],
    );
  }
}
