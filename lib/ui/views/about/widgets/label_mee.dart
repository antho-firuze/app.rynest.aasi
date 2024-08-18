import 'package:flutter/material.dart';

import '../../../shared/colors.dart';
import '../../../shared/ui_helper.dart';
import '../../../shared/widgets/image_mee.dart';

class LabelMee extends StatelessWidget {
  const LabelMee({
    super.key,
    this.image,
    required this.text,
    this.onTap,
  });

  final String? image;
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: kcPrimaryColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ImageMee(image: image),
          ),
          hSpaceSmall,
          Expanded(
            child: Text(
              text,
              style: bodyStyle(context),
            ),
          ),
        ],
      ),
    );
  }
}
