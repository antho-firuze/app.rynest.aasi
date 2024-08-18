import 'package:app.rynest.aasi/ui/shared/widgets/gradient_mask.dart';
import 'package:flutter/material.dart';

/// A modal overlay that will show over your child widget (fullscreen) when the show value is true
///
/// Wrap your scaffold in this widget and set show value to model.isBusy to show a loading modal when
/// your model state is Busy
class ImageCard extends StatelessWidget {
  const ImageCard({
    this.image,
    this.width,
    this.height,
    this.fit,
    super.key,
  });

  final String? image;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return image == null
        ? Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(6),
            ),
            width: (width ?? 50) + 5,
            height: (height ?? 50) + 5,
            child: GradientMask(
                child: Image.asset(
              'assets/images/avatar-1.png',
              color: Colors.white,
            )),
          )
        : Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(6),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                image!,
                width: width,
                height: height,
                fit: fit ?? BoxFit.cover,
                key: key,
                gaplessPlayback: true,
                loadingBuilder: (
                  BuildContext context,
                  Widget child,
                  ImageChunkEvent? loadingProgress,
                ) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              ),
            ),
          );
  }
}
