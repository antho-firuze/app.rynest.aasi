import 'package:app.rynest.aasi/common/widgets/logo/logo.dart';
import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:app.rynest.aasi/features/user/controller/profile_ctrl.dart';
import 'package:app.rynest.aasi/helpers/extensions.dart';
import 'package:app.rynest.aasi/utils/orientation_utils.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'qrcode.dart';

class FrontCard extends ConsumerWidget {
  const FrontCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);
    final certificate = ref.watch(certificateProvider);

    double width = context.screenWidthRatio(.9, .65);
    bool isLandscape = context.isLandscape();

    String certNo = certificate?.certNo ?? '3321 0120 3938 3120';
    // String fullName = 'YUSWANTINI SPECIAL PAKE TELOR SEPULUH';
    String fullName = profile!.fullName ?? '';
    String companyName = profile.company?.name ?? 'PT. Amanah Asuransi';
    String releaseDate = certificate?.releaseDate!.asStringShort() ?? '07 Jun 2021';
    String expiredDate = certificate?.expiredDate!.asStringShort() ?? '07 Jun 2022';
    String checkUrl = 'https://lsp-ps.id/check_sertifikat/validate/${certificate?.certNo}';

    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        // side: BorderSide(width: 3),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: const DecorationImage(
            image: AssetImage('assets/images/certificate-front.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Logo(width: width * .2, src: 'assets/images/logo_aasi.png', color: oWhite),
                  isLandscape
                      ? const Text('KARTU TENAGA PEMASAR ASURANSI SYARIAH').tsLabelL().clr(oWhite)
                      : const Text('KARTU TENAGA PEMASAR ASURANSI SYARIAH').tsLabelM().clr(oWhite),
                ],
              ),
            ),
            Positioned(
              top: 60.whenLandscape(100),
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  isLandscape
                      ? FittedBox(child: Text(fullName.toUpperCase()).tsHeadlineL().clr(oWhite))
                      : FittedBox(child: Text(fullName.toUpperCase()).tsTitleL().clr(oWhite)),
                  3.height,
                  isLandscape
                      ? Text(companyName.toUpperCase()).tsTitleL().clr(oWhite)
                      : Text(companyName.toUpperCase()).tsTitleS().clr(oWhite),
                  20.height,
                  isLandscape
                      ? Text(certNo.formatCardNumber()).tsHeadlineM().clr(oWhite)
                      : Text(certNo.formatCardNumber()).tsTitleM().clr(oWhite),
                  5.height,
                ],
              ),
            ),
            Positioned(
              bottom: 35.whenLandscape(60),
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 80.whenLandscape(120),
                        child: isLandscape
                            ? const Text('Diterbitkan').tsButton().family('Roboto').clr(oWhite)
                            : const Text('Diterbitkan').tsCaption().family('Roboto').clr(oWhite),
                      ),
                      isLandscape
                          ? Text(": $releaseDate").tsButton().clr(oWhite).family('Roboto')
                          : Text(": $releaseDate").tsCaption().clr(oWhite).family('Roboto'),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 80.whenLandscape(120),
                        child: isLandscape
                            ? const Text('Berlaku sampai').tsButton().family('Roboto').clr(oWhite)
                            : const Text('Berlaku sampai').tsCaption().family('Roboto').clr(oWhite),
                      ),
                      isLandscape
                          ? Text(": $expiredDate").tsButton().clr(oWhite).family('Roboto')
                          : Text(": $expiredDate").tsCaption().clr(oWhite).family('Roboto'),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Logo(width: width * .1, src: 'assets/images/logo_mari_berasuransi.png'),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              right: 3,
              child: RotatedBox(
                quarterTurns: 3,
                child:
                    const Text('Asosiasi Asuransi Syariah Indonesia').tsCaption().family('Roboto').size(10).clr(oWhite),
              ),
            ),
            Positioned(
              left: width / 2,
              bottom: 5,
              child: QRCode(checkUrl: checkUrl),
            ),
          ],
        ),
      ),
    );
  }
}
