import 'package:flutter/material.dart';

import '../colors.dart';
import '../ui_helper.dart';

class TextFieldMee extends StatelessWidget {
  const TextFieldMee({
    super.key,
    required this.caption,
    required this.value,
    this.captionColor,
    this.valueColor,
    this.status,
    this.statusColor,
  });

  final String caption;
  final String value;
  final String? status;
  final Color? captionColor;
  final Color? valueColor;
  final Color? statusColor;

  @override
  Widget build(BuildContext context) {
    bool hasStatus = status != null && status!.isNotEmpty;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          caption,
          style: bodyStyle(context).copyWith(
            color: captionColor ?? Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: screenProp(context, s: 16, m: 16, l: 22),
          ),
        ),
        if (hasStatus)
          Text(
            value,
            textAlign: TextAlign.right,
            style: bodyStyle(context).copyWith(
              color: valueColor ?? Colors.black,
              fontSize: screenProp(context, s: 16, m: 16, l: 22),
            ),
          )
        else
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: bodyStyle(context).copyWith(
                color: valueColor ?? Colors.black,
                fontSize: screenProp(context, s: 16, m: 16, l: 22),
              ),
            ),
          ),
        if (hasStatus)
          Text(
            status!,
            textAlign: TextAlign.right,
            style: bodyStyle(context).copyWith(
              color: statusColor ?? kcPrimaryColor,
              fontSize: screenProp(context, s: 16, m: 16, l: 22),
            ),
          ),
      ],
    );
  }
}
