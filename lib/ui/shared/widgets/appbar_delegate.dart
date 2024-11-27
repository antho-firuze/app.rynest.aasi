import 'dart:math';

import 'package:app.rynest.aasi/common/widgets/logo/logo_art_work.dart';
import 'package:app.rynest.aasi/ui/shared/colors.dart';
import 'package:flutter/material.dart';

import '../../../../helpers/F.dart';
import '../../views/startup/widgets/logo_aasi.dart';
import '../ui_helper.dart';
import 'appbar_backbtn.dart';
import 'logos.dart';

class AppBarDelegate extends SliverPersistentHeaderDelegate {
  const AppBarDelegate({
    required this.maxExtended,
    required this.minExtended,
    required this.size,
    required this.title,
  });

  final double maxExtended;
  final double minExtended;
  final Size size;
  final String title;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final percent = shrinkOffset / maxExtended;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AnimatedContainer(
          color:
              percent < 0.4 ? const Color(0xFFFFFFFF) : const Color(0xFFFFFFFF),
          duration: const Duration(milliseconds: 200),
        ),
        AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: 1 - pow(percent, 0.01).toDouble(),
          child: Center(
            child: LogoArtWork(
              color: kcPrimaryColor,
              width: screenWidth(context),
            ),
          ),
        ),
        Positioned.fill(
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: 1 - pow(percent, 0.01).toDouble(),
            child: Center(
                child: LogoAASI(
              width: screenWidthPercentage(context, percentage: 0.55),
            )),
          ),
        ),
        // AnimatedOpacity(
        //   duration: const Duration(milliseconds: 300),
        //   opacity: 1 - pow(percent, 0.01).toDouble(),
        //   child: Image.asset(
        //     'assets/images/tryout-header-1.png',
        //     width: size.width,
        //   ),
        // ),
        // Align(
        //   alignment: Alignment.bottomCenter,
        //   child: Container(
        //     width: double.infinity,
        //     height: screenProp(context, s: 70, m: 140, l: 140),
        //     // height: 115,
        //     decoration: const BoxDecoration(
        //       color: Color(0xFFE7E9FD),
        //       borderRadius: BorderRadius.only(
        //         topLeft: Radius.circular(20),
        //         topRight: Radius.circular(20),
        //       ),
        //     ),
        //   ),
        // ),
        Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 100),
            opacity: 1 - pow(percent, 0.01).toDouble(),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                'Apabila anda terkendala masalah seputar aplikasi ini',
                textAlign: TextAlign.center,
                style: bodyStyle(context),
              ),
            ),
          ),
        ),
        SafeArea(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: percent < 0.2
                      ? screenProp(context, s: 30, m: 30, l: 60)
                      : screenProp(context, s: 6, m: 6, l: 0)),
              // padding: EdgeInsets.symmetric(vertical: percent < 0.2 ? 60 : 0),
              child: Text(
                title,
                style: heading3Style(context).copyWith(color: kcPrimaryColor),
              ),
            ),
          ),
        ),
        SafeArea(
          child: AppBarBackButton(
            onPressed: () => F.back(),
          ),
        ),
        // SafeArea(child: Text('$percent')),
        // SafeArea(
        //     child: Padding(
        //   padding: const EdgeInsets.only(top: 20),
        //   child: Text('${pow(percent, 0.01)}'),
        // )),
        // SafeArea(
        //   child: Align(
        //     alignment: Alignment.topRight,
        //     child: AppBarButton(
        //       icon: const Icon(FontAwesomeIcons.circleInfo),
        //       onPressed: () => showModalBottomSheet(
        //         context: context,
        //         builder: (context) => const InfoSchedule(),
        //       ),
        //     ),
        //   ),
        // ),
        // SafeArea(
        //   bottom: false,
        //   child: Padding(
        //     padding: const EdgeInsets.only(top: 10.0),
        //     child: Align(
        //       alignment: Alignment.bottomCenter,
        //       child: Column(
        //         mainAxisSize: MainAxisSize.min,
        //         children: [
        //           Align(
        //             alignment: Alignment.bottomCenter,
        //             child: Container(
        //               width: size.width * 0.4,
        //               height: 40,
        //               decoration: BoxDecoration(
        //                 color: kcPrimaryColor,
        //                 borderRadius: BorderRadius.circular(15),
        //               ),
        //               child: Center(
        //                 child: Text(
        //                   title,
        //                   style: captionStyle(context).copyWith(color: oWhite),
        //                 ),
        //               ),
        //             ),
        //           ),
        //           vSpaceSmall,
        //           Padding(
        //             padding: const EdgeInsets.symmetric(horizontal: 20),
        //             child: Align(
        //               alignment: Alignment.bottomLeft,
        //               child: Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Text(
        //                     'Daftar Mata Pelajaran',
        //                     style: captionStyle(context),
        //                   ),
        //                   vSpaceXSmall,
        //                   Text(
        //                     'Silahkan pilih mata pelajaran yang ingin kamu kerjakan.',
        //                     style: bodyStyle(context),
        //                   ),
        //                   vSpace(5),
        //                   Text(
        //                     'Selamat Mengerjakan !',
        //                     style: bodyStyle(context),
        //                   ),
        //                   vSpaceXSmall,
        //                 ],
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }

  @override
  double get maxExtent => maxExtended;

  @override
  double get minExtent => minExtended;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
