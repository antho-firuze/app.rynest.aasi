import 'package:app.rynest.aasi/localization/string_hardcoded.dart';
import 'package:app.rynest.aasi/ui/shared/app_colors.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:super_icons/super_icons.dart';

class DataFailed extends StatelessWidget {
  const DataFailed({
    super.key,
    this.message,
    this.onTap,
    this.padding,
  });

  final String? message;
  final EdgeInsetsGeometry? padding;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.only(top: context.screenWidthRatio(.15, 0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Image.asset(
              'assets/images/data-not-found.png',
              width: context.screenWidthRatio(.5, .3),
            ),
          ),
          Text(message ?? 'Data belum tersedia !'.hardcoded).tsTitleM().center(),
          if (onTap != null)
            GestureDetector(
              onTap: onTap,
              child: Opacity(
                opacity: .3,
                child: Column(
                  children: [const Icon(SuperIcons.is_refresh_2_bold, size: 35), const Text('Reload').size(10).clr(oBlack)],
                ),
              ),
            ),
          // CustomIconButton(
          //   onPressed: onTap,
          //   icon: const Icon(Iconsax.refresh_2, size: 35),
          // ),
        ],
      ),
    );
  }
}
