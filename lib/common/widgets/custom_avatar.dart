import 'package:app.rynest.aasi/common/widgets/custom_icon.dart';
import 'package:app.rynest.aasi/common/widgets/custom_image.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_initial.dart';
import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:flutter/material.dart';
import 'package:super_icons/super_icons.dart';

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({
    super.key,
    this.image,
    this.initial,
    this.width = 60,
    this.height = 60,
    this.border,
    this.onTap,
    this.onTapUpdate,
  });

  final String? image;
  final String? initial;
  final double width;
  final double height;
  final double? border;
  final Function()? onTap;
  final Function()? onTapUpdate;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(border ?? 6),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: secondaryLight),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.passthrough,
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: image == null && initial == null
                    ? CustomImage(src: 'assets/images/avatar.png', onTap: onTap)
                    : image != null
                        ? CustomImage(src: image, onTap: onTap)
                        : LogoInitial(initial: initial!),
              ),
            ),
            if (onTapUpdate != null)
              Positioned(
                bottom: 0,
                right: 0,
                child: CustomIcon(
                  SuperIcons.is_camera_outline,
                  size: 30,
                  backgroundColor: Colors.black45,
                  onPressed: onTapUpdate!,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
