import 'package:flutter/material.dart';

import '../colors.dart';
import '../ui_helper.dart';

class CheckboxMee extends StatelessWidget {
  const CheckboxMee({
    super.key,
    required this.value,
    this.caption,
    required this.onChanged,
    this.captionW,
  });

  final bool value;
  final String? caption;
  final Widget? captionW;
  final Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: const Border.fromBorderSide(
              BorderSide(
                color: kcSecondaryColor,
                width: 1.5,
              ),
            ),
            borderRadius: BorderRadius.circular(3),
          ),
          child: Checkbox(
            value: value,
            activeColor: Colors.transparent,
            onChanged: (value) {
              onChanged!(value!);
            },
            side: const BorderSide(
              color: Colors.transparent,
            ),
            checkColor: kcSecondaryColor,
          ),
        ),
        hSpaceXSmall,
        Expanded(
          child: InkWell(
            onTap: () => onChanged!(!value),
            child: Align(
              alignment: Alignment.centerLeft,
              child: caption == null
                  ? captionW
                  : Text(
                      caption ?? '',
                      style: bodyStyle(context),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
