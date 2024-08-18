import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'image_network.dart';

class ImageMee extends StatelessWidget {
  const ImageMee({super.key, required this.image, this.fit});

  final dynamic image;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return image == null
        ? Container()
        : (image is String)
            ? (image.substring(0, 4).toLowerCase() == 'http')
                ? imageNetwork()
                : (image.substring(0, 6).toLowerCase() == 'assets')
                    ? Image.asset(
                        image,
                        fit: fit ?? BoxFit.fill,
                      )
                    : imageEncoder()
            : imageFile();
  }

  Widget imageNetwork() {
    return ImageNetwork(
      image: image,
      fit: fit ?? BoxFit.cover,
    );
    // return FadeInImage.memoryNetwork(
    //   fit: BoxFit.cover,
    //   placeholder: kTransparentImage,
    //   image: image,
    //   imageErrorBuilder: (context, error, stackTrace) => Container(),
    // );
  }

  Widget imageFile() {
    return Image.file(
      image!,
      fit: fit ?? BoxFit.cover,
    );
  }

  Widget imageEncoder() {
    Uint8List bytes = base64.decode(image!);
    return Image.memory(
      bytes,
      fit: fit ?? BoxFit.cover,
    );
  }
}
