import 'package:app.rynest.aasi/common/widgets/logo/logo_initial.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import 'icon_button_mee.dart';
import 'image_mee.dart';
import 'logos.dart';

class AvatarMee extends StatelessWidget {
  const AvatarMee({
    super.key,
    this.image,
    this.initial,
    this.width,
    this.height,
    this.border,
    this.onTap,
    this.onTapCamera,
    this.showButtonCamera = true,
  });

  final String? image;
  final String? initial;
  final double? width;
  final double? height;
  final double? border;
  final Function()? onTap;
  final Function()? onTapCamera;
  final bool showButtonCamera;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Align(
        child: Container(
          width: width ?? 60,
          height: height ?? 60,
          padding: EdgeInsets.all(border ?? 6),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: image == null && initial == null
                      ? const ImageMee(image: 'assets/images/avatar.png')
                      : image != null
                          ? ImageMee(image: image)
                          : LogoInitial(initial: initial!),
                ),
              ),
              if (onTapCamera != null)
                Positioned(
                  bottom: -9,
                  right: -9,
                  child: IconButtonMee(
                    color: Colors.white,
                    icon: const Icon(Icons.edit, color: kcSecondaryColor),
                    onPressed: onTapCamera!,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
