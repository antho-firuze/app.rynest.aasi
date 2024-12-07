import 'package:app.rynest.aasi/common/widgets/custom_image.dart';
import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:flutter/material.dart';

class IconCertificate extends StatelessWidget {
  const IconCertificate({
    super.key,
    this.onTap,
  });

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: secondaryLight),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: SizedBox(
            width: 60,
            height: 40,
            child: CustomImage(
              src: 'assets/images/ic_certificate.png',
              onTap: onTap,
            ),
          ),
        ),
      ),
    );
  }
}
