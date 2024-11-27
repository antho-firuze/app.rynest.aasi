import 'dart:convert';
import 'dart:typed_data';

import 'package:app.rynest.aasi/common/widgets/custom_icon.dart';
import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:super_icons/super_icons.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.src,
    this.fit,
    this.onTap,
    this.errorTitle = "Foto belum tersedia !",
    this.color,
  });

  final dynamic src;
  final BoxFit? fit;
  final Color? color;
  final String errorTitle;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return src == null
        ? ImageFailed(title: errorTitle)
        : (src is String)
            ? (src.substring(0, 4).toLowerCase() == 'http')
                ? imageNetwork()
                : (src.substring(0, 6).toLowerCase() == 'assets')
                    ? imageAsset()
                    : imageEncoder()
            : imageFile();
  }

  Widget imageNetwork() => GestureDetector(
        onTap: onTap,
        child: Image.network(
          src,
          color: color,
          fit: fit ?? BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => ImageFailed(
            title: errorTitle,
          ),
        ),
      );

  Widget imageFile() => GestureDetector(
        onTap: onTap,
        child: Image.file(
          src,
          color: color,
          fit: fit ?? BoxFit.cover,
        ),
      );

  Widget imageAsset() => GestureDetector(
        onTap: onTap,
        child: Image.asset(
          src,
          color: color,
          fit: fit ?? BoxFit.fill,
          errorBuilder: (context, error, stackTrace) => ImageFailed(
            title: errorTitle,
          ),
        ),
      );

  Widget imageEncoder() {
    Uint8List bytes = base64.decode(src);
    return Image.memory(
      bytes,
      fit: fit ?? BoxFit.cover,
    );
  }
}

class ImageFailed extends StatelessWidget {
  const ImageFailed({
    super.key,
    this.title = "Image does not exist",
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomIcon(SuperIcons.is_warning_2_outline, size: 50),
        Text(title).clr(oGrey70),
      ],
    );
  }
}
