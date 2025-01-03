import 'package:app.rynest.aasi/ui/shared/colors.dart';
import 'package:flutter/material.dart';

import '../../../helpers/F.dart';
import '../../views/about/about_view.dart';
import '../ui_helper.dart';
import 'circle_button.dart';
import 'image_mee.dart';

class LogoApp extends StatelessWidget {
  const LogoApp({super.key, this.width, this.height, this.color});

  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo_aasi.png',
      width: width,
      height: height,
      color: color,
    );
  }
}

class LogoAppWhite extends StatelessWidget {
  const LogoAppWhite({super.key, this.width, this.height, this.color});

  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo_aasi_white.png',
      width: width,
      height: height,
      color: color,
    );
  }
}

class LogoAppBar extends StatelessWidget {
  const LogoAppBar({
    super.key,
    this.width,
    this.height,
    this.image,
    this.onTap,
    this.initial,
  });

  final double? width;
  final double? height;
  final String? image;
  final String? initial;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: SizedBox(
          width: width,
          height: height,
          child: image == null && initial == null
              ? const ImageMee(image: 'assets/icons/profile-01.png')
              : image != null
                  ? ImageMee(image: image)
                  : LogoInitial(initial: initial!),
        ),
      ),
    );
  }
}

class LogoAbout extends StatelessWidget {
  const LogoAbout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth(context) < 1050 ? 8 : 25,
              vertical: screenWidth(context) < 1050 ? 8 : 25,
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: CircleButton(
                size: screenWidth(context) < 1050 ? 45 : 55,
                child: Image.asset('assets/images/ic_help.png'),
                onPressed: () => F.navigate(const AboutView()),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class LogoInitial extends StatelessWidget {
  const LogoInitial({
    super.key,
    required this.initial,
  });

  final String initial;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green.shade400,
        shape: BoxShape.rectangle,
      ),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(2, 1, 2, 2),
          child: Text(
            initial,
            textAlign: TextAlign.center,
            maxLines: 1,
            style: bodyStyle(context).copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class LogoYoutube extends StatelessWidget {
  const LogoYoutube({super.key, this.width, this.height, this.color, this.onTap});

  final double? width;
  final double? height;
  final Color? color;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        'assets/icons/ic_youtube.png',
        width: width ?? 40,
        height: height ?? 40,
        color: color ?? kcPrimaryColor,
      ),
    );
  }
}

class LogoInstagram extends StatelessWidget {
  const LogoInstagram(
      {super.key, this.width, this.height, this.color, this.onTap});

  final double? width;
  final double? height;
  final Color? color;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        'assets/icons/ic_instagram.png',
        width: width ?? 40,
        height: height ?? 40,
        color: color ?? kcPrimaryColor,
      ),
    );
  }
}

class LogoLinkedln extends StatelessWidget {
  const LogoLinkedln(
      {super.key, this.width, this.height, this.color, this.onTap});

  final double? width;
  final double? height;
  final Color? color;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        'assets/icons/ic_linkedln.png',
        width: width ?? 40,
        height: height ?? 40,
        color: color ?? kcPrimaryColor,
      ),
    );
  }
}

class LogoApp2 extends StatelessWidget {
  const LogoApp2({
    super.key,
    this.width,
  });

  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? screenProp(context, s: 150, m: 150, l: 250),
      child: Image.asset('assets/images/logo_aasi_2.png'),
    );
  }
}

class LogoArtWork extends StatelessWidget {
  const LogoArtWork({
    super.key,
    this.width,
    this.color,
  });

  final Color? color;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/artwork.png',
      fit: BoxFit.fill,
      color: color ?? Colors.white,
      width: width ?? screenProp(context, s: 150, m: 150, l: 250),
    );
  }
}

class LogoSignature extends StatelessWidget {
  const LogoSignature({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        LogoArtWork(
          width: screenWidth(context),
          color: kcPrimaryColor,
        ),
        Positioned.fill(
          child: Center(
            child: LogoApp(
              width: screenWidthPercentage(context, percentage: 0.55),
            ),
          ),
        ),
      ],
    );
  }
}

class LogoSignature2 extends StatelessWidget {
  const LogoSignature2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        LogoArtWork(width: screenWidth(context)),
        Positioned.fill(
          child: Center(
            child: LogoApp2(
              width: screenWidthPercentage(context, percentage: 0.55),
            ),
          ),
        ),
      ],
    );
  }
}

class LogoMari extends StatelessWidget {
  const LogoMari({super.key, this.width, this.height, this.color});

  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo_mari_berasuransi.png',
      width: width,
      height: height,
      color: color,
    );
  }
}
