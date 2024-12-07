import 'package:app.rynest.aasi/common/widgets/custom_image.dart';
import 'package:app.rynest.aasi/common/widgets/custom_interactive_viewer.dart';
import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:app.rynest.aasi/utils/page_utils.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    this.image,
    this.width,
    this.height,
    this.fit,
    super.key,
    this.onTap,
  });

  final String? image;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(
          color: secondaryLight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: CustomImage(
          src: image,
          onTap: () => context.goto(page: CustomInteractiveViewer(child: CustomImage(src: image!))),
        ),
      ),
    );
  }
}
