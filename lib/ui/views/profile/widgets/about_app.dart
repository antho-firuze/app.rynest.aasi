import 'package:app.rynest.aasi/ui/views/startup/widgets/logo_aasi.dart';
import 'package:flutter/material.dart';

import '../../../../constants/string.dart';
import '../../../shared/colors.dart';
import '../../../shared/ui_helper.dart';
import '../../../shared/widgets/logos.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                vSpaceSmall,
                // Text(
                //   'v ${model.projectVersion}',
                //   style: oStyle.size(14).bold,
                // ),
                vSpaceXSmall,
                LogoAASI(width: screenWidthPercentage(context, percentage: .4)),
                vSpaceXSmall,
                Text(
                  kAppName,
                  style: captionStyle(context),
                  textAlign: TextAlign.center,
                ),
                vSpaceMedium,
                Text(
                  kAbout,
                  textAlign: TextAlign.center,
                  style: bodyStyle(context),
                ),
                vSpaceMedium,
                Text(
                  '\u00a9 2023 Rynest Technology Indomedia',
                  textAlign: TextAlign.center,
                  style: bodyStyle(context),
                ),
                Text(
                  'Kota Depok - Jawa Barat, Indonesia',
                  style: bodyStyle(context),
                ),
                vSpaceMedium,
              ],
            ),
          ),
        ),
        Center(
          child: LogoArtWork(
            color: kcPrimaryColor,
            width: screenWidth(context),
          ),
        ),
      ],
    );
  }
}
