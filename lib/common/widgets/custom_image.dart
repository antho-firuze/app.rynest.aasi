import 'dart:convert';
import 'dart:io';
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
    this.fit = BoxFit.cover,
    this.errorTitle = "Foto belum tersedia !",
    this.color,
  });

  final dynamic src;
  final BoxFit fit;
  final Color? color;
  final String errorTitle;

  @override
  Widget build(BuildContext context) {
    if (src == null) {
      return ImageFailed(title: errorTitle);
    }

    if (src is String) {
      var type = src.substring(0, 4).toLowerCase();
      if (type == 'http') {
        return imageNetwork();
      } else {
        type = src.substring(0, 6).toLowerCase();
        if (type == 'assets') {
          return imageAsset();
        } else {
          type = src.substring(0, 5).toLowerCase();
          if (type == '/data') {
            return imageFile();
          }

          return imageEncoder();
        }
      }
    }

    return imageFile();
  }

  Widget imageNetwork() {
    return Image.network(
      src,
      color: color,
      fit: fit,
      loadingBuilder: (context, child, loadingProgress) => loadingProgress == null
          ? child
          : Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  5.height,
                  Text('loading...').center(),
                ],
              ),
            ),
      errorBuilder: (context, error, stackTrace) => ImageFailed(
        title: errorTitle,
      ),
    );
  }

  Widget imageFile() {
    final imageFile = File(src);
    final bytes = imageFile.readAsBytesSync();
    final imageMem = MemoryImage(bytes);
    // final image = Image.memory(bytes);

    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageMem,
            fit: fit,
            onError: (exception, stackTrace) => ImageFailed(
              title: errorTitle,
            ),
          ),
        ),
      );
  }

  // Widget imageFile() => Container(
  //       decoration: BoxDecoration(
  //         image: DecorationImage(
  //           image: FileImage(File(src)),
  //           fit: fit,
  //           onError: (exception, stackTrace) => ImageFailed(
  //             title: errorTitle,
  //           ),
  //         ),
  //       ),
  //     );

  Widget imageAsset() => Image.asset(
        src,
        color: color,
        fit: fit,
        errorBuilder: (context, error, stackTrace) => ImageFailed(
          title: errorTitle,
        ),
      );

  Widget imageEncoder() {
    Uint8List bytes = base64.decode(src);
    return Image.memory(bytes, fit: fit);
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
        Text(title).clr(oGrey70).center(),
      ],
    );
  }
}
