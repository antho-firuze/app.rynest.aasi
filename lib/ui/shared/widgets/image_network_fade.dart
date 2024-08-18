import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

/// A modal overlay that will show over your child widget (fullscreen) when the show value is true
///
/// Wrap your scaffold in this widget and set show value to model.isBusy to show a loading modal when
/// your model state is Busy
class ImageNetworkFade extends StatelessWidget {
  const ImageNetworkFade(
    this.url, {
    this.placeholder,
    super.key,
  });

  final String? url;
  final String? placeholder;

  @override
  Widget build(BuildContext context) {
    return (url == null || url!.isEmpty)
        ? const ImageNotExists()
        : FadeInImage.memoryNetwork(
            key: key,
            image: url ?? '',
            fit: BoxFit.cover,
            fadeInDuration: const Duration(milliseconds: 300),
            placeholder: kTransparentImage,
            // placeholder: 'assets/images/im_image_loading.gif',
            imageErrorBuilder: (context, error, stackTrace) =>
                const ImageNotExists(),
          );
  }
}

class ImageNotExists extends StatelessWidget {
  const ImageNotExists({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 50,
            color: Colors.grey[500],
          ),
          Text(
            'Image does not exist',
            style: TextStyle(
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}
