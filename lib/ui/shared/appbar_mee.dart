import 'package:app.rynest.aasi/ui/shared/colors.dart';
import 'package:app.rynest.aasi/ui/shared/ui_helper.dart';
import 'package:app.rynest.aasi/ui/shared/widgets/appbar_backbtn.dart';
import 'package:flutter/material.dart';

import '../../helpers/F.dart';
import '../../services/app_service.dart';

class AppBarMee extends StatelessWidget implements PreferredSizeWidget {
  const AppBarMee({
    super.key,
    required this.title,
    this.titleColor,
    this.backgroundColor,
    this.onBackPressed,
    this.actions,
    this.showBack = true,
    this.centerTitle = false,
    this.forBottomNavigationBar = false, this.foregroundColor,
  });

  final String title;
  final Color? titleColor;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Function()? onBackPressed;
  final List<Widget>? actions;
  final bool showBack;
  final bool centerTitle;
  final bool forBottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    final Function() onBackPressed = forBottomNavigationBar
        ? defaultOnTapBackBNB
        : (this.onBackPressed ?? defaultOnTapBack);

    return AppBar(
      title: Text(title,
          style: heading4Style(context).copyWith(
            color: kcPrimaryColor,
          )),
      backgroundColor: backgroundColor ?? kcPrimaryColor,
      foregroundColor: foregroundColor,
      elevation: 0.0,
      centerTitle: centerTitle,
      automaticallyImplyLeading: false,
      leading: showBack ? AppBarBackButton(onPressed: onBackPressed) : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55.0);
}

void defaultOnTapBack() => F.back(result: true);

void defaultOnTapBackBNB() {
  final BottomNavigationBar navigationBar =
      globalKey.currentWidget as BottomNavigationBar;
  navigationBar.onTap!(0);
}
