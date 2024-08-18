import 'package:app.rynest.aasi/ui/shared/widgets/image_mee.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../models/app_banner.dart';
import '../../../shared/app_colors.dart';

class CarouselMee extends StatefulWidget {
  const CarouselMee({super.key, this.appBanners});

  final List<AppBanner>? appBanners;

  @override
  State<CarouselMee> createState() => _CarouselMeeState();
}

class _CarouselMeeState extends State<CarouselMee> {
  int currentIdx1 = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            onPageChanged: (index, _) => setState(() => currentIdx1 = index),
          ),
          items: widget.appBanners == null
              ? [Container()]
              : widget.appBanners!.map(
                  (e) {
                    int index = widget.appBanners!.indexOf(e) + 7;
                    return AspectRatio(
                      aspectRatio: 14 / 9,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          color: Colors.primaries[index],
                          child: ImageMee(
                            image: e.imageUrl!,
                            fit: BoxFit.fill,
                            // onTap: () => launchUrl(Uri.parse(e.linkUrl!)),
                          ),
                        ),
                      ),
                    );
                  },
                ).toList(),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.appBanners == null
                  ? [Container()]
                  : widget.appBanners!.map(
                      (image) {
                        int index = widget.appBanners!.indexOf(image);
                        return Container(
                          width: 8,
                          height: 8,
                          margin: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 2.0,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: oWhite),
                            color: currentIdx1 == index
                                ? const Color(0xE4FFFFFF)
                                : const Color(0x66FFFFFF),
                          ),
                        );
                      },
                    ).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
