import 'package:app.rynest.aasi/ui/shared/colors.dart';
import 'package:app.rynest.aasi/ui/shared/ui_helper.dart';
import 'package:flutter/material.dart';

class ListSwitch extends StatelessWidget {
  const ListSwitch({
    super.key,
    required this.text,
    this.iconData,
    this.value = false,
    this.onChanged,
  });

  final String text;
  final IconData? iconData;
  final bool value;
  final Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Color(0x23000000),
            blurRadius: 3.0,
            offset: Offset(0.0, 1.0),
          ),
        ],
      ),
      child: Row(
        children: [
          hSpace(5),
          iconData == null
              ? const SizedBox()
              : Icon(
                  iconData,
                  size: 33,
                  color: kcSecondaryColor,
                ),
          hSpaceXSmall,
          Expanded(
            child: Text(
              text,
              style: bodyStyle(context),
            ),
          ),
          Switch(value: value, onChanged: onChanged)
        ],
      ),
    );
  }
}
