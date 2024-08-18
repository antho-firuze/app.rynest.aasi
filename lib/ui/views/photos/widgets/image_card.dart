import 'package:app.rynest.aasi/ui/shared/colors.dart';
import 'package:flutter/material.dart';

import '../../../../helpers/F.dart';
import '../../../shared/widgets/image_view.dart';

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
          color: kcSecondaryColor,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap: () => image == null
              ? {}
              : F.navigate(ImageView(src: image!), force: true),
          child: image == null
              ? const ImageNotExist()
              : Image.network(
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
                  errorBuilder: (context, error, stackTrace) {
                    return const ImageNotExist();
                  },
                ),
        ),
      ),
    );
  }
}

class ImageNotExist extends StatelessWidget {
  const ImageNotExist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.error_outline, size: 50, color: Colors.grey[500]),
        Text(
          'Image does not exist',
          style: TextStyle(color: Colors.grey[500]),
        ),
      ],
    );
  }
}
