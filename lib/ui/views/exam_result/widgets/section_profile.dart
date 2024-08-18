import 'package:app.rynest.aasi/ui/shared/widgets/avatar_mee.dart';
import 'package:app.rynest.aasi/ui/views/startup/widgets/logo_aasi.dart';
import 'package:flutter/material.dart';
import 'package:app.rynest.aasi/ui/shared/ui_helper.dart';

import '../../../../helpers/F.dart';
import '../../../shared/colors.dart';
import '../../../shared/widgets/logos.dart';

class SectionProfile extends StatelessWidget {
  const SectionProfile({
    super.key,
    this.photoUrl,
    this.name,
    this.idCardNo,
    this.qrCode,
  });

  final String? photoUrl;
  final String? name;
  final String? idCardNo;
  final String? qrCode;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Color(0x23000000),
            blurRadius: 3.0,
            offset: Offset(0.0, 1.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          vSpaceXSmall,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                AvatarMee(
                  image: photoUrl == null ? null : '$photoUrl?v=999',
                  initial: F.getInitial(name),
                  showButtonCamera: false,
                  border: 4,
                  width: screenProp(context, s: 60, m: 60, l: 70),
                  height: screenProp(context, s: 60, m: 60, l: 70),
                ),
                hSpaceXSmall,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name ?? '',
                        style: captionStyle(context).copyWith(
                          fontSize: screenProp(context, s: 18, m: 20, l: 23),
                        ),
                      ),
                      Text(
                        idCardNo ?? '',
                        style: bodyStyle(context).copyWith(
                          fontSize: screenProp(context, s: 13, m: 15, l: 18),
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          vSpaceXSmall,
          divider(),
          vSpaceXSmall,
          SizedBox(
            height: screenProp(context, s: 120, m: 120, l: 220),
            child: Stack(
              children: [
                // QrImage(
                //   data: qrCode,
                //   version: QrVersions.auto,
                // ),
                Align(
                  alignment: Alignment.center,
                  child: LogoAASI(
                    width: screenWidthPercentage(context, percentage: .4),
                  ),
                ),
                LogoArtWork(
                  color: kcPrimaryColor,
                  width: screenWidth(context),
                ),
              ],
            ),
          ),
          vSpaceXSmall,
        ],
      ),
    );
  }
}
