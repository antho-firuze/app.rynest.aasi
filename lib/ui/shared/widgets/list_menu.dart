import 'package:app.rynest.aasi/ui/shared/colors.dart';
import 'package:app.rynest.aasi/ui/shared/ui_helper.dart';
import 'package:flutter/material.dart';

class ListMenu extends StatelessWidget {
  const ListMenu({
    super.key,
    required this.text,
    this.iconData,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.iconColor,
  });

  final String text;
  final IconData? iconData;
  final Color? iconColor;
  final Function()? onPressed;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: screenProp(context, s: 5, m: 5, l: 15)),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Color(0x23000000),
            blurRadius: 3.0,
            offset: Offset(0.0, 1.0),
          ),
        ],
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          children: [
            iconData == null
                ? const SizedBox()
                : Icon(
                    iconData,
                    size: 30,
                    color: iconColor ?? kcSecondaryColor,
                  ),
            hSpaceXSmall,
            Expanded(
              child: Text(
                text,
                style: bodyStyle(context).copyWith(
                  color: textColor,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward,
              color: iconColor ?? kcSecondaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
