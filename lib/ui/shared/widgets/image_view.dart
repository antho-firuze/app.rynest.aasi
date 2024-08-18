import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageView extends StatelessWidget {
  const ImageView({super.key, required this.src});

  final String src;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PhotoView(
              backgroundDecoration: const BoxDecoration(color: Colors.black),
              imageProvider: NetworkImage(src),
              heroAttributes: const PhotoViewHeroAttributes(
                tag: 'photo',
                transitionOnUserGestures: true,
              ),
              minScale: PhotoViewComputedScale.contained,
              maxScale: 5.0,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
